<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="过滤条件" prop="searchValue">
        <el-input
          v-model="queryParams.searchValue"
          placeholder="请输入过滤条件"
          clearable
          @keyup.enter.native="getList"
          size="small"
           style="width:600px"
        />
      </el-form-item>
      <el-form-item>
        <el-button type="cyan" icon="el-icon-search" size="mini" @click="getList">搜索</el-button>
      </el-form-item>
    </el-form>
    <el-table v-loading="loading" :data="dataList" @cell-dblclick="editData">
      <el-table-column type="number" width="55" align="center" />
      <el-table-column :label="c.title" align="center" :prop="c.field" v-for="c in cols" />
    </el-table>
    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />
  </div>
</template>

<script>
import { listModelData, updateModelData } from "@/api/xdata/model";

export default {
  name: "ModelData",
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
      // 数据集表格数据
      dataList: [],
      // 表单参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        searchValue: null,
        id: null,
      },
      cols: []
    };
  },
  created() {
    let modelId = this.$route.params && this.$route.params.modelId;

    this.queryParams.id = modelId;
    this.getList();
  },
  methods: {
    /** 查询数据集列表 */
    getList() {
      this.loading = true;     

      listModelData(this.queryParams).then(response => {
        if(response.rows != null && response.rows.length > 0){
            var d = response.rows[0];
            var cols = [];
            for(var k in d){
                cols.push({field:k,title:k});
            }
            cols.sort();
            this.cols = cols;
        }
        this.dataList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    updateData(data) {
      updateModelData({id:this.queryParams.id,params:data}).then(response => {
        this.msgSuccess("修改成功");
        this.getList();
      });
    },
    editData(row, column, cell, event) {
      let that = this;
      this.$prompt('请输入你要设置的值:', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          inputValue: row[column.property],
        }).then(({ value }) => {
          that.updateData({field:column.property, value:value, id: row['id']});
        }).catch((e) => {
          console.log(e);
        });
    }
  }
};
</script>

