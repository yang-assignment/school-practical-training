
<template>
  <div class="app-container">
    <el-table v-loading="loading" :data="dataList">
      <el-table-column type="number" width="55" align="center" />
      <el-table-column label="表名称" align="center" prop="name" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <router-link :to="'/xdata/client/data/' + clientId+'_'+scope.row.name" class="link-type">
            <span>数据预览</span>
          </router-link>
        </template>
      </el-table-column>
    </el-table>
  </div>
</template>

<script>
import { listTable } from "@/api/xdata/client";

export default {
  name: "ClientTable",
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
      clientId: null
    };
  },
  created() {
    this.clientId = this.$route.params && this.$route.params.clientId;
    this.getList();
  },
  methods: {
    /** 查询数据集列表 */
    getList() {
      this.loading = true;
      
      listTable(this.clientId).then(response => {
        this.dataList = response.data;
        this.loading = false;
      });
    }
  }
};
</script>
