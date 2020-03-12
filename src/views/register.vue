<template>
    <div class=''>
        <el-row>
      <el-col :span="9" :offset="7">
        <div style="margin-top:100px"></div>
        <el-card shadow="always">
          <div slot="header" style="text-align: center">
            <p>拍卖系统注册</p>
          </div>
          
            <el-form :model="user" :inline="true" :rules="rules" ref="regist">
                <div style="padding-left:15px">
              <el-form-item label="用户名">
                <el-input class="mypts" v-model="user.name" placeholder="请输入用户名" style="width:217px"></el-input>
              </el-form-item>
              <br />
              <el-form-item label="密码：">
                <el-input class="mypts" v-model="user.pwd" type="password" show-password placeholder="请输入密码"></el-input>
              </el-form-item>
                </div>
              <el-form-item prop="qwd" label="确认密码">
                <el-input class="mypts" v-model="rpwd" type="password" show-password placeholder="请输入密码"></el-input>
              </el-form-item>
              <br>
              <el-form-item>
                  <el-button type="primary" style="margin-left:130px;width:120px" @click="zc">注册</el-button>
              </el-form-item>
            </el-form>
        </el-card>
      </el-col>
    </el-row>
    </div>
</template>

<script>
export default {
    data() {
        //二次密码确认验证
        var ckpwd=(rule,value,callback)=>{
          if(this.user.pwd!=this.rpwd){
            callback(new Error("两次密码不一致"));
          }else{
            callback();
          }
        };
        return {
            user:{
                name: '',
                pwd:''
            },
            rpwd:'',
            rules:{
              qwd:[{validator:ckpwd}]
            }
        };

    },
    methods: {
        zc(){
            let _this=this;
            if(_this.user.name=='' || _this.user.pwd=='' || _this.rpwd==''){
                return;
            }
            _this.$refs['regist'].validate((valid)=>{
              if(valid) {
                _this.jquery.ajax({
                  url:'http://localhost:8080/api/pm/add',
                  type: 'post',
                  dataType: 'json',
                  contentType: 'application/json',
                  data: JSON.stringify(_this.user),
                  success(){
                    _this.$message({
                      message: '注册成功！',
                      type: 'success'
                    });
                    _this.$router.push("/");
                  }
                });
              }else{
                return false;
              }
            });
        }
    }
}
</script>
<style>
.mypts .el-input__inner{
  border-radius: 0;
  border-top: 0;
  border-left: 0;
  border-right: 0;
}

.mypts .el-input__inner:focus-within{
  color: #5e96ef;
  border-bottom: 1px solid #5e96ef;
}
</style>
<style  scoped>
p {
  font-size: 22px;
  font-weight: bold;
  margin: 0;
  font-style: italic;
  color:#5e96ef;
}
.el-button{
    border: 1px solid #5e96ef;
    background-color: #5e96ef;
    color: white;
}
</style>