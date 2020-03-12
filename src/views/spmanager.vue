<template>
    <div class=''>
        <el-row>
          <el-col :span="24">
              <div class="nv">商品管理</div>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="24">
               <el-table :data="ass.list" :header-cell-style="{backgroundColor:'#696969',color:'#fff',fontWeight:'800'}" :cell-style="{borderLeft:'1px solid #e6e6e6'}">
                  <el-table-column align="center" v-for="temp in pms" :label="temp.name" :key="temp.name">
                      <template slot-scope="scope">
                          <span v-if="temp.values==0">
                              <el-link type="success" :underline="false">修改</el-link>
                              <a style="margin-left:10px"></a>
                              <el-link type="danger" :underline="false">删除</el-link>
                          </span>
                              <!-- <img :src="'http://localhost:8080/image/'+scope.row[temp.values]" style="width:30px;height:30px"/> -->
                          <span>{{scope.row[temp.values]}}</span>
                      </template>
                  </el-table-column>
                </el-table>
          </el-col>
        </el-row>
        <el-row>
        <br>
          <el-col :span="16" :offset="8">
              	<el-pagination  prev-text="上一页" next-text="下一页"  @current-change="change" layout="total,prev, next, jumper,slot" :total="ass.total" :page-size="ass.pageSize">
                      <span style="margin-left: 10px;font-weight: 400">第<a class="lf">{{ass.pageNum}}</a>/{{ass.pages}}<a class="lf">页</a></span>
				</el-pagination>
          </el-col>
        </el-row>
        
    </div>
</template>

<script>
export default {
    data() {
        return {
            ass:[],
            pms:[{name:'名称',values:'aname'},{name:'描述',values:'describe'},{name:'开始时间',values:'starttime'},
            {name:'结束时间',values:'endtime'},{name:'起拍价',values:'price'},{name:'操作',values:'0'}]
        };
    },
    methods: {
        gotop(n,s){
                this.jquery.getJSON(`http://localhost:8080/api/pm/allau/${n}/${s}`,(data)=>{
                this.ass=data;
            });
        },
        change(num){
            this.gotop(num,this.ass.pageSize);
        }
    },
    mounted(){
         this.gotop(1,5);
    }
}
</script>
<style>
/* 简易面包屑 */
.nv{
    color: #606266;
    font-size:14px;
    font-weight:400;
    margin-bottom:10px;
    border-left: 3px solid rgb(33, 218, 33);
    padding-left:1px;
}
</style>
<style  scoped>
.lf{
    margin-left: 5px;
}
</style>