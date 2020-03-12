<template>
    <div class=''>
        <el-container>
            <el-header>
                <el-row>
                  <el-col :span="6">
                      <h3>尊敬的：<span>{{uname}}</span>&nbsp;欢迎登录在线拍卖系统!</h3>
                  </el-col>
                  <el-col :span="2" :offset="16">
                      <el-button type="danger" @click="zx">注销登录</el-button>
                  </el-col>
                </el-row>
            </el-header>
            <el-container>
                <el-aside width="200px">
                    <el-menu :router="true" active-text-color="orange">
                      <el-menu-item index="/index/manager" v-if="sp">拍卖商品管理</el-menu-item>
                      <el-menu-item index="/index/auction" v-if="!sp">商品竞拍</el-menu-item>
                      <el-menu-item index="/index/adds" v-if="sp">添加拍卖商品</el-menu-item>
                      <el-menu-item index="/index/results" v-if="sp">拍卖商品信息</el-menu-item>
                      <div style="margin-top:10px"></div>
                    </el-menu>
                </el-aside>
                <el-main>
                    <router-view></router-view>
                </el-main>
            </el-container>
        </el-container>

    </div>
</template>

<script>
export default {
    data() {
        return {
            sp:false,
            uname:''
        };
    },
    methods: {
        zx(){
            this.$confirm('确认注销？','温馨提示',{
                type:'error'
            }).then(()=>{
                sessionStorage.removeItem("users");
                location.reload();
            });
            
        }
    },
    mounted(){
        let us= JSON.parse(sessionStorage.getItem("users"));
        this.uname=us.name;
        if(us.rid=='1'){
            this.sp=true;
        }
        
    }
}
</script>
<style  scoped>
/* 哔哩哔哩色 干杯！*/
.el-button--danger{
    background-color:#fb7299;
}
.el-button--danger:hover{
    background-color:#fb7299;
}
.el-button--danger:focus{
    background-color:#fb7299;
}
h3{
    margin:0;
    text-align: left;
}
span{
    color:red;
}
.el-header{
    border-bottom: 1px solid #55c3e4;
    line-height: 60px;
  }
  
  .el-aside {
    text-align: center;
  }
  .el-menu{
      border-right: 0;
  }
  .el-main{
      border-left: 1px solid #e6e6e6;
  }
</style>