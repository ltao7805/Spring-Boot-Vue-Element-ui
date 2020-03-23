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
                              <el-link type="success" :underline="false" @click="oper('1',scope.row.aid)">修改</el-link>
                              <a style="margin-left:10px"></a>
                              <el-link type="danger" :underline="false" @click="oper('2',scope.row.aid)">删除</el-link>
                          </span>
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
            {name:'结束时间',values:'endtime'},{name:'起拍价',values:'price'},{name:'操作',values:'0'}],
            pm:true,
        };
    },
    methods: {
        gotop(n,s){
                this.jquery.getJSON(`http://www.ltao7805.xyz:8888/api/pm/allau/${n}/${s}`,data=>{
                this.ass=data;
            });
        },
        change(num){
            this.gotop(num,this.ass.pageSize);
        },

        oper(p,aid){
            let _this=this;
            _this.jquery.ajaxSettings.async=false;
            //判断是否可操作
            let ns= new Date().toLocaleString('chinese',{hour12:false});
            let now= new Date(Date.parse(ns))
            _this.jquery.getJSON(`http://www.ltao7805.xyz:8888/api/pm/stime/${aid}`,data=>{
                let end= new Date(Date.parse(data.endtime));
                let start= new Date(Date.parse(data.starttime));
                if(start<now){
                    _this.pm=false;
                }else{
                     _this.pm=true;
                }
            });
            if(p=='1'){
                //修改
                if(_this.pm){
                    _this.$router.push(`/index/upd/${aid}`);
                }else{
                    _this.$message({
                        message:'已拍卖商品不可修改！',
                        type:'warning'
                    });
                    return;
                }
            }else{
                //删除
                if(_this.pm){
                    _this.$confirm('确认删除该商品？','温馨提示',{
                        type:'error'
                    }).then(()=>{
                        _this.jquery.getJSON(`http://www.ltao7805.xyz:8888/api/pm/dele/${aid}`,data=>{
                            _this.$message({
                                message:'删除成功！',
                                type:'success'
                            });
                            location.reload();
                        })
                    })
                }else{
                    _this.$message({
                        message:'已拍卖商品不可删除！',
                        type:'warning'
                    });
                    return;
                }
            }
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
    font-weight:500;
    margin-bottom:10px;
    padding-top:8px;
    padding-bottom:8px;
    border-left: 3px solid rgb(38, 187, 38);
    color:rgb(66, 199, 84);
    padding-left:10px;
    background:transparent;
    background-color:rgb(255, 255, 255,0.15);
    text-align:left;
    box-shadow: 0 0 5px 0;
}
</style>
<style  scoped>
.lf{
    margin-left: 5px;
}
</style>