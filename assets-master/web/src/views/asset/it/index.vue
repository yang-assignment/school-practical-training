<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="关键字" prop="searchValue">
        <el-input
          v-model="queryParams.searchValue"
          placeholder="请输入IP/MAC/网关地址"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="是否在线" prop="isOnline">
        <el-select v-model="queryParams.isOnline" placeholder="请选择是否在线" clearable size="small">
          <el-option
            v-for="dict in isOnlineOptions"
            :key="dict.dictValue"
            :label="dict.dictLabel"
            :value="dict.dictValue"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="在线时间" prop="lastTime">
        <el-date-picker
          v-model="dateRange"
          size="small"
          style="width: 240px"
          value-format="yyyy-MM-dd"
          type="daterange"
          range-separator="-"
          start-placeholder="开始日期"
          end-placeholder="结束日期"
        ></el-date-picker>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-table v-loading="loading" :data="itList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="资产编号" align="center" prop="asset.num" />
      <el-table-column label="资产名称" align="center" prop="asset.name" />
      <el-table-column label="厂商" align="center" prop="asset.factory" />
      <el-table-column label="参数" align="center" prop="asset.param" />
      <el-table-column label="是否在线" align="center" prop="isOnline" :formatter="isOnlineFormat" />
      <el-table-column label="IP地址" align="center" prop="ip" />
      <el-table-column label="MAC地址" align="center" prop="mac" width="180"/>
      <el-table-column label="网关" align="center" prop="gateway" />
      <el-table-column label="最后在线时间" align="center" prop="lastTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.lastTime) }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['asset:it:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['asset:it:remove']"
          >删除</el-button>
        </template>
      </el-table-column>
    </el-table>
    
    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改IT设备对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="是否在线">
          <el-radio-group v-model="form.isOnline">
            <el-radio
              v-for="dict in isOnlineOptions"
              :key="dict.dictValue"
              :label="dict.dictValue"
            >{{dict.dictLabel}}</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="IP地址" prop="ip">
          <el-input v-model="form.ip" placeholder="请输入IP地址" />
        </el-form-item>
        <el-form-item label="MAC地址" prop="mac">
          <el-date-picker clearable size="small"
            v-model="form.mac"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="选择MAC地址">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="网关" prop="gateway">
          <el-input v-model="form.gateway" placeholder="请输入网关" />
        </el-form-item>
        <el-form-item label="在线时间" prop="lastTime">
          <el-date-picker clearable size="small"
            v-model="form.lastTime"
            type="datetime"
            value-format="yyyy-MM-dd HH:mm:ss"
            placeholder="选择最后在线时间">
          </el-date-picker>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listIt, getIt, delIt, addIt, updateIt, exportIt } from "@/api/asset/it";

export default {
  name: "It",
  components: {
  },
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // IT设备表格数据
      itList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 是否在线字典
      isOnlineOptions: [],
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        isOnline: null,
        searchValue: null,
        lastTime: null,
        orderByColumn:"t.last_time",
        isAsc:"DESC"
      },
      // 表单参数
      form: {},
      dateRange:[],
      // 表单校验
      rules: {
        isOnline: [
          { required: true, message: "是否在线不能为空", trigger: "blur" }
        ]
      }
    };
  },
  created() {
    this.getList();
    this.getDicts("sys_yes_no").then(response => {
      this.isOnlineOptions = response.data;
    });
  },
  methods: {
    /** 查询IT设备列表 */
    getList() {
      this.loading = true;
      listIt(this.addDateRange(this.queryParams, this.dateRange)).then(response => {
        this.itList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 是否在线字典翻译
    isOnlineFormat(row, column) {
      return this.selectDictLabel(this.isOnlineOptions, row.isOnline);
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        assetId: null,
        isOnline: "0",
        ip: null,
        mac: null,
        gateway: null,
        lastTime: null
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.dateRange = [];
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.assetId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加IT设备";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const assetId = row.assetId || this.ids
      getIt(assetId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改IT设备";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.assetId != null) {
            updateIt(this.form).then(response => {
              this.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addIt(this.form).then(response => {
              this.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const assetIds = row.assetId || this.ids;
      this.$confirm('是否确认删除IT设备编号为"' + assetIds + '"的数据项?', "警告", {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning"
        }).then(function() {
          return delIt(assetIds);
        }).then(() => {
          this.getList();
          this.msgSuccess("删除成功");
        })
    },
    /** 导出按钮操作 */
    handleExport() {
      const queryParams = this.queryParams;
      this.$confirm('是否确认导出所有IT设备数据项?', "警告", {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning"
        }).then(function() {
          return exportIt(queryParams);
        }).then(response => {
          this.download(response.msg);
        })
    }
  }
};
</script>
