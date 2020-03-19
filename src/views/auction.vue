<template>
    <div class=''>
        <el-row>
          <el-col :span="24">
              <div class="nv">竞拍商品列表</div>
          </el-col>
        </el-row>
        <el-row>
            <el-col :span="24">
                <el-table :data="as.list" :header-cell-style="{backgroundColor:'#696969',color:'#fff'}">
                  <el-table-column align="center" v-for="temp in pms" :label="temp.name" :key="temp.name">
                      <template slot-scope="scope">
                          <span v-if="temp.values==0">
                              <el-link type="danger" :underline="false" @click="jp(scope.row.aid)">竞拍</el-link>
                          </span>
                          <span v-if="temp.values=='aname'|| temp.values=='describe'">{{scope.row[temp.values] | scpe}}</span>
                          <span v-else>{{scope.row[temp.values]}}</span>
                      </template>
                  </el-table-column>
                </el-table>
            </el-col>
        </el-row>
        <el-row>
        <br>
          <el-col :span="16" :offset="7">
              	<el-pagination  prev-text="上一页" next-text="下一页"  @current-change="change" layout="total,prev, next, jumper,slot" :total="as.total" :page-size="as.pageSize">
				    <span style="margin-left: 10px;font-weight: 400">第<a class="lf">{{as.pageNum}}</a>/{{as.pages}}<a class="lf">页</a></span>
                </el-pagination>
          </el-col>
        </el-row>
    </div>
</template>

<script>
export default {
    data() {
        return {
            as:[],
            pms:[{name:'名称',values:'aname'},{name:'描述',values:'describe'},{name:'开始时间',values:'starttime'},
            {name:'结束时间',values:'endtime'},{name:'起拍价',values:'price'},{name:'操作',values:'0'}]
        };
    },
    methods: {
        gotop(n,s){
                this.jquery.getJSON(`http://localhost:8080/api/pm/allau/${n}/${s}`,data=>{
                this.as=data;
            });
        },
        change(num){
            this.gotop(num,this.as.pageSize);
        },
        jp(aid){
            this.$router.push(`/index/jpai/${aid}`);
        }
    },
    mounted(){
        this.gotop(1,5);
    }
}
</script>
<style  scoped>
.el-link.el-link--danger{
    color:red;
}
.lf{
    margin-left: 5px;
}
</style>