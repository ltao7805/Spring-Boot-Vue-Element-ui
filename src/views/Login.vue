<template>
  <div class="login">
    <router-view></router-view>
    <el-row>
      <el-col :span="9" :offset="7">
        <div style="margin-top:100px"></div>
        <el-card shadow="always">
          <div slot="header" style="text-align: center">
            <p>拍卖系统登录</p>
          </div>
          <div style="padding-left:20px">
            <el-form :model="user" :inline="true">
              <el-form-item label="用户名">
                <el-input class="mypt" v-model="user.name" placeholder="请输入用户名" style="width:217px"></el-input>
              </el-form-item>
              <br />
              <el-form-item label="密码：">
                <el-input class="mypt" v-model="user.pwd" type="password" show-password placeholder="请输入密码"></el-input>
              </el-form-item>
              <br />
              <el-form-item label="验证码">
                <el-input class="mypt" v-model="ym" style="width:117px">
                </el-input>
                <Code ref="cd" @yzm="getc"/>
              </el-form-item>
              <br>
              <el-form-item>
                  <el-button style="width:100px;margin-left:60px;" type="primary" @click="login">登录</el-button>
                  <el-button style="width:100px;margin-left:50px;" type="success" @click="register">注册</el-button>
              </el-form-item>
            </el-form>
          </div>
        </el-card>
      </el-col>
    </el-row>
  </div>
</template>

<script>
import Code from './verificationCode.vue'
export default {
    components:{
        Code
    },
    data() {
        return {
            user:{
                name:'',
                pwd:''
            },
            ver:'',
            ym:''
        };
    },
    methods: {
        getc(m){
            this.ver = m;
        },
        login(){
            let _this=this;
            //登录验证
            if(_this.user.name=="" || _this.user.pwd=="" || _this.ym==""){
                return;
            }

            if(_this.ver!=_this.ym){
                _this.rescd();
                return;
            }

            //Ajax
             _this.jquery.ajax({
                 url:'http://www.ltao7805.xyz:8888/api/pm/login',
                 type: 'post',
                 dataType: 'json',
                 contentType: 'application/json',
                 data: JSON.stringify(_this.user),
                 success:data=>{
                     if(data.length==0){
                        _this.$message({
                            message:'用户名或密码错误',
                            type:'error',
                        });
                        _this.rescd();
                        return;
                     };
                    //登录成功，保存到全局缓存 Vuex不适用于刷新页面
                    sessionStorage.setItem("users",JSON.stringify(data[0]))
                    //不同身份跳转不同页面
                    if(data[0].rid=='1'){
                       _this.$router.push("/index/manager");
                    }else{
                       _this.$router.push("/index/auction");
                    }
                    
                 }
             });
            
        },
        register(){
            this.$router.push("/register");
        },
        rescd(){
            this.ym='';
            this.$refs.cd.init();
        }
        
    },
    mounted(){
        //初始化验证码子组件
        this.$refs.cd.init();
    }
}
</script>
<style>
/* 自定义el-input样式 */
.mypt .el-input__inner{
  border-radius: 0;
  border-top: 0;
  border-left: 0;
  border-right: 0;
}

.mypt .el-input__inner:focus-within{
  color: #C640FF;
  border-bottom: 1px solid #C640FF;
}

</style>

<style  scoped>
p {
  font-size: 22px;
  font-weight: bold;
  margin: 0;
  font-style: italic;
  color:#C640FF;
}


</style>