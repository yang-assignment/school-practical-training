<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="资产分类" prop="cateId">
         <treeselect v-model="queryParams.cateId" :options="categoryOptions" :normalizer="normalizer" placeholder="请选择分类"  style="width:240px"/>
       </el-form-item>
      <el-form-item label="资产编号" prop="num">
        <el-input
          v-model="queryParams.num"
          placeholder="请输入资产编号"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="产品名称" prop="name">
        <el-input
          v-model="queryParams.name"
          placeholder="请输入产品名称"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="归属部门" prop="deptId">
        <treeselect v-model="queryParams.deptId" :options="deptOptions" :show-count="true" placeholder="请选择归属部门" style="width:240px" />
      </el-form-item>
      <el-form-item label="仓库" prop="houseId">
        <el-select v-model="queryParams.houseId" filterable placeholder="请选择仓库">
          <el-option
            v-for="item in warehouseList"
            :key="item.id"
            :label="item.title"
            :value="item.id">
          </el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="资产状态" prop="status">
        <el-select v-model="queryParams.status" placeholder="请选择资产状态" clearable size="small">
          <el-option
            v-for="dict in statusOptions"
            :key="dict.dictValue"
            :label="dict.dictLabel"
            :value="dict.dictValue"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="IT设备" prop="isIt">
        <el-select v-model="queryParams.isIt" placeholder="请选择是否IT设备" clearable size="small">
          <el-option
            v-for="dict in yesnoOptions"
            :key="dict.dictValue"
            :label="dict.dictLabel"
            :value="dict.dictValue"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="使用人" prop="useUserId">
        <el-select v-model="queryParams.useUserId" filterable placeholder="请输入姓名选择" :loading="loading">
          <el-option
            v-for="item in userList"
            :key="item.userId"
            :label="item.nickName"
            :value="item.userId">
          </el-option>
        </el-select>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['asset:info:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-top-right"
          size="mini"
          :disabled="multiple"
          @click="handleMove"
          v-hasPermi="['asset:info:edit']"
        >调拨</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-scissors"
          size="mini"
          :disabled="multiple"
          @click="handleScrap"
          v-hasPermi="['asset:info:edit']"
        >报废</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="info"
          icon="el-icon-upload2"
          size="mini"
          @click="handleImport"
          v-hasPermi="['asset:book:import']"
        >导入</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['asset:info:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="infoList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="资产分类" align="center" prop="cate.title" />
      <el-table-column label="资产编号" align="center" prop="num" />
      <el-table-column label="产品名称" align="center" prop="name" />
      <el-table-column label="厂商" align="center" prop="factory" />
      <el-table-column label="所属部门" align="center" prop="deptName" />
      <el-table-column label="当前价值" align="center" prop="price" />
      <el-table-column label="购买价格" align="center" prop="price2" />
      <el-table-column label="仓库" align="center" prop="house.title" />
      <el-table-column label="资产状态" align="center" prop="status" :formatter="statusFormat" />
      <el-table-column label="IT设备" align="center" prop="isIT" :formatter="isItFormat" />
      <el-table-column label="报废时间" align="center" prop="scrapTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.scrapTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="使用人" align="center" prop="userName" />
      <el-table-column label="预计归还时间" align="center" prop="finishTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.finishTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['asset:info:edit']"
          >修改</el-button>
          <el-button v-if="scope.row.status == '5'"
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['asset:info:remove']"
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

    <!-- 添加或修改资产信息对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="120px">
       <el-tabs type="card" v-model="tab">
        <el-tab-pane label="基本信息" name="base">
        <el-form-item label="资产分类" prop="cateId">
           <treeselect v-model="form.cateId" :options="categoryOptions" :normalizer="normalizer" placeholder="请选择分类"  style="width:240px"/>
         </el-form-item>
        <el-form-item label="资产编号" prop="num">
          <el-input v-model="form.num" placeholder="请输入资产编号" />
        </el-form-item>
        <el-form-item label="产品名称" prop="name">
          <el-input v-model="form.name" placeholder="请输入产品名称" />
        </el-form-item>
        <el-form-item label="厂商" prop="factory">
          <el-input v-model="form.factory" placeholder="请输入厂商" />
        </el-form-item>
        <el-form-item label="当前价值" prop="price">
          <el-input-number v-model="form.price" placeholder="请输入当前价值" />
        </el-form-item>
        <el-form-item label="资产状态">
          <el-select v-model="form.status" placeholder="请选择资产状态" clearable size="small">
            <el-option
              v-for="dict in statusOptions"
              :key="dict.dictValue"
              :label="dict.dictLabel"
              :value="dict.dictValue"
            />
          </el-select>
        </el-form-item>
        <el-form-item label="IT设备">
          <el-radio-group v-model="form.isIt">
            <el-radio
              v-for="dict in yesnoOptions"
              :key="dict.dictValue"
              :label="dict.dictValue"
            >{{dict.dictLabel}}</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="报废时间" prop="scrapTime" v-if="form.status == '5'">
          <el-date-picker clearable size="small"
            v-model="form.scrapTime"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="选择报废时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="生成盘点记录" v-if="form.id">
          <el-checkbox @change="recordTaking">是</el-checkbox>
        </el-form-item>
  
        </el-tab-pane>
        <el-tab-pane label="使用信息" name="use">
        <el-form-item label="归属部门" prop="deptId">
          <treeselect v-model="form.deptId" :options="deptOptions" :show-count="true" placeholder="请选择归属部门" style="heigth:300px"/>
        </el-form-item>
        <el-form-item label="仓库" prop="houseId">
          <el-select v-model="form.houseId" filterable placeholder="请选择仓库">
            <el-option
              v-for="item in warehouseList"
              :key="item.id"
              :label="item.title"
              :value="item.id">
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="使用人" prop="useUserId" v-if="form.status == '2'">
          <el-select v-model="form.useUserId" filterable placeholder="请输入姓名选择" :loading="loading">
            <el-option
              v-for="item in userList"
              :key="item.userId"
              :label="item.nickName"
              :value="item.userId">
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="归还时间" prop="finishTime" v-if="form.status == '2'">
          <el-date-picker clearable size="small"
            v-model="form.finishTime"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="选择预计归还时间">
          </el-date-picker>
        </el-form-item>
        </el-tab-pane>
        <el-tab-pane label="详细信息" name="detail">
        <el-form-item label="参数" prop="param">
          <el-input v-model="form.param" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="购买渠道" prop="proxy">
          <el-input v-model="form.proxy" placeholder="请输入购买渠道" />
        </el-form-item>
        <el-form-item label="市场价格" prop="price1">
          <el-input-number v-model="form.price1" placeholder="请输入市场价格" />
        </el-form-item>
        <el-form-item label="购买价格" prop="price2">
          <el-input-number v-model="form.price2" placeholder="请输入购买价格" />
        </el-form-item>
        <el-form-item label="资产说明" prop="comment">
          <el-input v-model="form.comment" placeholder="请输入资产说明" />
        </el-form-item>
        <el-form-item label="图例">
          <imageUpload v-model="form.imgId" :file="form.img"/>
        </el-form-item>
        </el-tab-pane>
        <el-tab-pane label="条码" v-if="form.id" name="qr">
          <vue-barcode :value="qr.text" :text="qr.name">            
          </vue-barcode>
          <a href="javascript:void(0)" @click="downBarcode">下载条码</a>
        </el-tab-pane>
      </el-tabs>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>

    <!-- 调拨资产信息对话框 -->
    <el-dialog title="资产调拨" :visible.sync="move.open" width="500px" append-to-body>
      <el-form ref="form" :model="moveForm" :rules="moveRules" label-width="80px">
        <el-form-item label="归属部门" prop="deptId">
          <treeselect v-model="moveForm.deptId" :options="deptOptions" :show-count="true" placeholder="请选择归属部门" />
        </el-form-item>
        <el-form-item label="仓库" prop="houseId">
          <el-select v-model="moveForm.houseId" filterable placeholder="请选择仓库">
            <el-option
              v-for="item in warehouseList"
              :key="item.id"
              :label="item.title"
              :value="item.id">
            </el-option>
          </el-select>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitMoveForm">确 定</el-button>
        <el-button @click="cancelMove">取 消</el-button>
      </div>
    </el-dialog>

    <!-- 导入对话框 -->
    <el-dialog :title="upload.title" :visible.sync="upload.open" width="400px" append-to-body>
      <el-upload
        ref="upload"
        :limit="1"
        accept=".xlsx, .xls"
        :headers="upload.headers"
        :action="upload.url + '?updateSupport=' + upload.updateSupport"
        :disabled="upload.isUploading"
        :on-progress="handleFileUploadProgress"
        :on-success="handleFileSuccess"
        :auto-upload="false"
        drag
      >
        <i class="el-icon-upload"></i>
        <div class="el-upload__text">
          将文件拖到此处，或
          <em>点击上传</em>
        </div>
        <div class="el-upload__tip" slot="tip">
          <el-checkbox v-model="upload.updateSupport" />是否更新已经存在的资产数据
          <el-link type="info" style="font-size:12px" @click="importTemplate">下载模板</el-link>
        </div>
        <div class="el-upload__tip" style="color:red" slot="tip">提示：仅允许导入“xls”或“xlsx”格式文件！</div>
      </el-upload>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitFileForm">确 定</el-button>
        <el-button @click="upload.open = false">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listInfo, getInfo, delInfo, addInfo, updateInfo, exportInfo, importTemplate, scrapInfo, moveInfo } from "@/api/asset/info";
import { selectWarehouse } from "@/api/asset/warehouse";
import { listCategory } from "@/api/asset/category";
import { selectUser } from "@/api/sys/public";
import { treeselect } from "@/api/system/dept";
import { getToken } from "@/utils/auth";
import Treeselect from "@riophae/vue-treeselect";
import ImageUpload from '@/components/ImageUpload';
import "@riophae/vue-treeselect/dist/vue-treeselect.css";
import VueBarcode from "vue-barcode";

export default {
  name: "Info",
  components: {
    ImageUpload,Treeselect, VueBarcode
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
      // 资产信息表格数据
      infoList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      tab:'base',
      // 资产状态字典
      statusOptions: [],
      yesnoOptions:[],
      // 资产分类树选项
      categoryOptions: [],
      warehouseList: [],
      deptOptions:[],
      // 用户数据
      userList: [],
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        cateId: null,
        num: null,
        name: null,
        houseId: null,
        status: null,
        deptId: null,
        useUserId: null,
        orderByColumn:"t.id",
        isAsc:"DESC"
      },
      // 表单参数
      form: {},
      // 导入参数
      upload: {
        // 是否显示弹出层
        open: false,
        // 弹出层标题
        title: "",
        // 是否禁用上传
        isUploading: false,
        // 是否更新已经存在的数据
        updateSupport: 0,
        // 设置上传的请求头部
        headers: { Authorization: "Bearer " + getToken() },
        // 上传的地址
        url: process.env.VUE_APP_BASE_API + "/asset/info/importData"
      },
      //二维码
      qr:{
        text: null,
        name: null
      },
      move: {
        open: false,
      },
      moveForm: {
        ids: null,
        houseId: null,
        deptId: null,
      },
      moveRules: {
        houseId: [
          { required: true, message: "仓库不能为空", trigger: "blur" }
        ],
        deptId: [
          { required: true, message: "所属部门不能为空", trigger: "blur" }
        ],
      },
      // 表单校验
      rules: {
        cateId: [
          { required: true, message: "资产分类不能为空", trigger: "blur" }
        ],
        houseId: [
          { required: true, message: "仓库不能为空", trigger: "blur" }
        ],
        num: [
          { required: true, message: "资产编号不能为空", trigger: "blur" }
        ],
        name: [
          { required: true, message: "产品名称不能为空", trigger: "blur" }
        ],
        status: [
          { required: true, message: "状态不能为空", trigger: "blur" }
        ],
        price: [
          { required: true, message: "当前价值不能为空", trigger: "blur" }
        ]
      }
    };
  },
  created() {
    this.getList();
    this.getDicts("asset_status").then(response => {
      this.statusOptions = response.data;
    });
    this.getDicts("sys_yes_no").then(response => {
      this.yesnoOptions = response.data;
    });
    selectUser({status:'0'}).then(response => {
      this.userList = response.rows;
    });
    selectWarehouse({status:'1'}).then(response => {
      this.warehouseList = response.rows;
    });
    this.getTreeselect();
    treeselect().then(response => {
      this.deptOptions = response.data;
    });
  },
  methods: {
    /** 查询资产信息列表 */
    getList() {
      this.loading = true;
      listInfo(this.queryParams).then(response => {
        this.infoList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 资产状态字典翻译
    statusFormat(row, column) {
      return this.selectDictLabel(this.statusOptions, row.status);
    },
    isItFormat(row, column) {
      return this.selectDictLabel(this.yesnoOptions, row.isIt);
    },
    /** 转换资产分类数据结构 */
    normalizer(node) {
      if (node.children && !node.children.length) {
        delete node.children;
      }
      return {
        id: node.id,
        label: node.title,
        children: node.children
      };
    },
    /** 查询部门下拉树结构 */
    getTreeselect() {
      listCategory({'type':'1'}).then(response => {
        this.categoryOptions = [];
        const data = { id: 0, title: '顶级节点', children: [] };
        data.children = this.handleTree(response.data, "id", "pid");
        this.categoryOptions.push(data);
      });
    },
    recordTaking(v) {
      this.form.params.taking = v;
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        id: null,
        cateId: null,
        num: null,
        name: null,
        param: null,
        factory: null,
        proxy: null,
        price: null,
        price1: null,
        price2: null,
        houseId: null,
        imgId: null,
        comment: null,
        status: "1",
        useUserId: null,
        finishTime: null
      };
      this.resetForm("form");
      this.tab = 'base';
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.id)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加资产信息";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getInfo(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改资产信息";

        this.qr.text = "asset://"+response.data.num;
        this.qr.name = response.data.name + ' ' + response.data.num;
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateInfo(this.form).then(response => {
              this.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addInfo(this.form).then(response => {
              this.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    // 取消按钮
    cancelMove() {
      this.move.open = false;
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      this.$confirm('是否确认删除选中的资产信息?', "警告", {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning"
        }).then(function() {
          return delInfo(row.id);
        }).then(() => {
          this.getList();
          this.msgSuccess("删除成功");
        })
    },
    /** 报废按钮操作 */
    handleScrap(row) {
      const ids = row.id || this.ids;
      this.$confirm('是否确认报废选中的资产信息?', "警告", {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning"
        }).then(function() {
          return scrapInfo({ids:ids});
        }).then(() => {
          this.getList();
          this.msgSuccess("删除成功");
        })
    },
    /** 调拨按钮操作 */
    handleMove(row) {
      this.reset();
      this.moveForm.ids = row.id || this.ids
      this.move.open = true;
    },
    /** 提交按钮 */
    submitMoveForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          moveInfo(this.moveForm).then(response => {
            this.msgSuccess("操作成功");
            this.move.open = false;
            this.getList();
          });
        }
      });
    },
    /** 导出按钮操作 */
    handleExport() {
      const queryParams = this.queryParams;
      this.$confirm('是否确认导出所有资产信息数据项?', "警告", {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning"
        }).then(function() {
          return exportInfo(queryParams);
        }).then(response => {
          this.download(response.msg);
        })
    },
    /** 导入按钮操作 */
    handleImport() {
      this.upload.title = "资产导入";
      this.upload.open = true;
    },
    /** 下载模板操作 */
    importTemplate() {
      importTemplate().then(response => {
        this.download(response.msg);
      });
    },
    // 文件上传中处理
    handleFileUploadProgress(event, file, fileList) {
      this.upload.isUploading = true;
    },
    // 文件上传成功处理
    handleFileSuccess(response, file, fileList) {
      this.upload.open = false;
      this.upload.isUploading = false;
      this.$refs.upload.clearFiles();
      this.$alert(response.msg, "导入结果", { dangerouslyUseHTMLString: true });
      this.getList();
    },
    // 提交上传文件
    submitFileForm() {
      this.$refs.upload.submit();
    },
    downBarcode() {
      let that =this;
      var svgXml = document.querySelector('.vue-barcode-element').outerHTML;
      
      var DOMURL = window.URL || window.webkitURL || window; 
      var svg = new Blob([svgXml], {type: 'image/svg+xml'}); 
      var url = DOMURL.createObjectURL(svg);

      var image = new Image();
      //image.src = url;// 'data:image/svg+xml;base64,' + window.btoa(unescape(encodeURIComponent(svgXml))); //给图片对象写入base64编码的svg流

      var canvas = document.createElement('canvas');  //准备空画布
      canvas.width = 420;
      canvas.height = 140;

      var context = canvas.getContext('2d');  //取得画布的2d绘图上下文
      //context.drawImage(image, 0, 0);
      image.onload = function() { 
          context.drawImage(image, 0, 0); 
          DOMURL.revokeObjectURL(url); 
          //var png_img = canvas.toDataURL("image/png"); 
          
        var a = document.createElement('a');
        a.href = canvas.toDataURL('image/png');  //将画布内的信息导出为png图片数据
        a.download = that.qr.name;  //设定下载名称
        a.click(); //点击触发下载
      } 
       image.src = url;
    }
  }
};
</script>
<style>
.el-tab-pane {
  min-height: 300px;
}
</style>