<template>
    <div class=''>
        <el-row>
          <el-col :span="24">
              <div class="nv">拍卖商品信息</div>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="24">
              
          </el-col>
        </el-row>
        <br>
        <el-row>
          <el-col :span="24">
              <el-card class="mycd" shadow="hover">
                  <div slot="header">
                      <el-select class="mys" v-model="pm">
                        <el-option label="拍卖中的商品" value="1"></el-option>
                        <el-option label="拍卖结束商品" value="2"></el-option>
                        </el-select>
                  </div>
                  <div v-if="pm=='1'">
                      拍卖中
                  </div>
                  <div v-if="pm=='2'">
                      已结束
                  </div>
              </el-card>
          </el-col>
        </el-row>
    </div>
</template>

<script>
export default {
    data() {
        return {
            pm:'1',
        };
    },
    methods: {

    }
}
</script>
<style>
.mys .el-input__inner{
    border-top:0;
    border-left:0;
    border-right:0;
    border-radius: 0;
    width: 130px;
    border-bottom: 1px solid #409eff;
}
.mys .el-input__inner:hover{
    border-bottom: 1px solid #409eff !important;
}
.el-card__header{
    padding:15px 10px !important;
}
</style>