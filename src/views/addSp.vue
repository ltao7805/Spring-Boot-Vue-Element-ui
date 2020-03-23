<template>
    <div class=''>
        <el-row>
          <el-col :span="24">
              <div class="nv">添加商品</div>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="21" :offset="1">
              <el-form :model="auction" :inline="true" label-width="100px" ref="auc">
                <el-form-item label="名称：">
                    <el-input placeholder="请输入商品名称，23字以内" style="width:400px" v-model="auction.aname"  maxlength="23" show-word-limit></el-input>
                </el-form-item>
                <br>
                <el-form-item label="起拍价:">
                    <el-input placeholder="请输入起拍价格，不超过5位数" style="width:400px" oninput="this.value=this.value.replace(/[^\d]/g,'')"  v-model="auction.price" maxlength="5" show-word-limit></el-input>
                </el-form-item>
                <br>
                <el-form-item label="拍卖时间:">
                    <el-date-picker value-format="yyyy-MM-dd HH:mm:ss" v-model="sdtime" type="datetimerange" range-separator="至" start-placeholder="起始日期" end-placeholder="结束日期" align="right">
                    </el-date-picker>
                </el-form-item>
                <br>
                <el-form-item label="商品图片:">
                    <el-upload action="#" list-type="picture-card" :auto-upload="false" :on-change="cge">
                        <i slot="default" class="el-icon-plus"></i>
                        <div slot="file" slot-scope="{file}">
                            <img class="el-upload-list__item-thumbnail" :src="file.url" alt="">
                            <span class="el-upload-list__item-actions">
                                <span class="el-upload-list__item-preview" @click="amp(file)"><i class="el-icon-zoom-in"></i></span>
                                <span  class="el-upload-list__item-delete" @click="rem(file)"><i class="el-icon-delete"></i></span>
                            </span>
                        </div>
                    </el-upload>
                    <el-dialog :visible.sync="dy">
                        <img width="100%" :src="auction.img" alt="">
                    </el-dialog>
                </el-form-item>
                <br>
                <el-form-item label="商品描述:">
                    <el-input placeholder="请输入商品描述，23字以内" style="width:400px" v-model="auction.describe"  maxlength="23" show-word-limit></el-input>
                </el-form-item>
                <br>
                <br>
                <el-form-item>
                    <span style="margin-left: 200px"></span>
                    <el-button style="width:120px" type="success" @click="add">添加</el-button>
                </el-form-item>
              </el-form>
          </el-col>
        </el-row>
    </div>
</template>

<script>
export default {
    data() {
        return {
            auction:{
                aname:'',
                price:'',
                starttime:'',
                endtime:'',
                describe:'',
                img:''
            },
            sdtime:'',
            dy:false,
            filelist:[]
        };
    },
    methods: {
        amp(file){
            this.auction.img =file.url;
            this.dy=true;
        },
        cge(f,li){
            this.filelist=li;
            //实现添加一张图片隐藏上传控件
            this.jquery('.el-upload--picture-card').css('display','none');
        },
        rem(file){
            let _this=this;
            let list=_this.filelist;
            //通过数组对比删除指定图片
            for(let i=0;i<list.length;i++){
                if(list[i].uid==file.uid){
                    _this.filelist.splice(i,1);
                }
            }
             _this.jquery('.el-upload--picture-card').css('display','inline-block');
        },
        add(){
            let _this=this;
            //基础非空验证
            if(this.sdtime=='' || this.auction.aname=='' || this.auction.price=='' || this.auction.describe=='' || this.filelist.length==0){
                return;
            }
            //组装数据
            this.auction.img=this.filelist[0].name;
            this.auction.starttime=this.sdtime[0];
            this.auction.endtime=this.sdtime[1];

            this.jquery.ajax({
                url:'http://www.ltao7805.xyz:8888/api/pm/addp',
                type: 'post',
                dataType: 'json',
                contentType: 'application/json',
                data: JSON.stringify(_this.auction),
                success:()=>{
                    _this.$message({
                        message:'添加成功！',
                        type:'success'
                    });
                    //刷新页面，相当于重置表单
                    location.reload();
                }
            })
            
        }
    }
}
</script>
<style  scoped>

</style>