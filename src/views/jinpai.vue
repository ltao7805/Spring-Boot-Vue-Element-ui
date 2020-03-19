<template>
    <div class=''>
        <el-row>
          <el-col :span="24">
              <div class="nv">商品竞拍</div>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="24" style="border:1px solid #ccc;padding:5px;">
              <div>
                  <div class="imgy">
                    <el-image v-if="auction.img" style="width:310px;height:238px" :src="'http://localhost:8080/image/'+auction.img" :preview-src-list="['http://localhost:8080/image/'+auction.img]" :fit="'cover'"></el-image>      
                    </div>
                    <div class="text">
                        <div>
                            <p class="tt">{{auction.aname}}</p>
                            <p class="dd">{{auction.describe}}</p>
                            <p class="dd">起拍价：{{auction.price}}元</p>
                            <!-- <p class="dd" v-if="!finish">当前价：<a>0</a>元</p> -->
                            <p class="dd" v-if="finish">成交价：<a>{{top.pricer}}</a>元</p>
                            <div v-if="!finish">
                                <p v-if="startsell" class="dd">距开始：<span>{{dhms.day}}</span>天<span>{{dhms.hour}}</span>时<span>{{dhms.min}}</span>分<span>{{dhms.second}}</span>秒</p>
                                <p v-if="!startsell" class="dd">距结束：<span>{{dhms.day}}</span>天<span>{{dhms.hour}}</span>时<span>{{dhms.min}}</span>分<span>{{dhms.second}}</span>秒</p>
                                <el-form class="myform" :model="presult" :inline="true">
                                    <el-form-item>
                                        <el-input size="small" :disabled="startsell" class="pce" v-model="presult.pricer" oninput="this.value=this.value.replace(/[^\d]/g,'')"></el-input>
                                    </el-form-item>
                                    <el-form-item>
                                        <el-button type="primary" :disabled="startsell"  size="small" @click="jp">我要竞拍</el-button>
                                    </el-form-item>
                                </el-form>
                            </div>
                            <p v-if="finish" style="color:red;font-size: 14px;margin-left:5px;">该商品已结束拍卖</p>

                        </div>
                    </div>
                    <div class="pmg">
                        <p>拍卖需知：</p>
                        <ol>
                            <li>竞价规则： 至少一人报名且出价不低于起拍价，方可成交</li>
                            <li>尾款支付方式： 查看竞买公告中的说明</li>
                            <li>尾款线上支付截止时间： 按竞买公告中的截止时间及时支付</li>
                            <li>拍卖成交后，买受人必须按照约定支付拍卖成交款</li>
                            <li>竞买活动属自愿行为，一切费用由竞买人自行承担</li>
                            <li>本拍卖规则及注意事项如有更改，以拍卖会现场宣布为准</li>
                            <li>最终解释权归广东物资拍卖行有限公司所有</li>
                            <li>客服电话：400-100-300-900</li>
                        </ol>
                    </div>
              </div>
          </el-col>
        </el-row>
        <br>
         <el-row>
            <el-col :span="24">
                <div class="nv">竞拍记录</div>
            </el-col>
        </el-row>
        <el-row>
            <el-col :span="24">
                <el-table :data="record">
                    <el-table-column align="center" v-for="temp in rs" :key="temp.name" :label="temp.name">
                        <template slot-scope="scope">
                            <div v-if="temp.value=='0'">
                                <!-- 领先者 -->
                                <span v-if="scope.$index=='0'" class="top">领先</span>
                                <span v-if="scope.$index!='0'" class="les">落后</span>
                            </div>
                            <span>{{scope.row[temp.value]}}</span>
                        </template>
                    </el-table-column>
                </el-table>
            </el-col>
        </el-row>
    </div>
</template>

<script>
export default {
    data() {
        return {
            auction:{},
            startsell:null,
            finish:false,
            top:{
                pricer:'',
                ruser:''
            },
            dhms:{
                day:'0',
                hour:'0',
                min:'0',
                second:'0'
            },
            timer:null,
            presult:{
                raid:'',
                pricer:'',
                ruser:'',
            },
            record:[],
            rs:[{name:'状态',value:'0'},{name:'商品编号',value:'raid'},{name:'出价',value:'pricer'},{name:'时间',value:'timer'},{name:'出价者',value:'ruser'}]
        };
    },
    
    methods: {
        datediffer(){
            let ss=null;
            let _this=this;
            if(this.startsell){
                ss=new Date(_this.auction.starttime).getTime()-new Date().getTime();
            }else{
                ss=new Date(_this.auction.endtime).getTime()-new Date().getTime();
            }
            this.dhms.day= Math.abs(Math.floor(ss/(24*3600*1000))); //天数
			let lv1=ss%(24*3600*1000);//天数后剩余 的毫秒数
			this.dhms.hour=Math.floor(lv1/(3600*1000));//小时
			let lv2=lv1%(3600*1000);//小时后剩余的毫秒数
			this.dhms.min=Math.floor(lv2/(60*1000));//分钟
			let lv3=lv2%(60*1000);//分钟剩余毫秒数
            this.dhms.second=Math.round(lv3/1000);//秒
        },
        jp(){
            let _this=this;
            if(this.presult.pricer=='') return;

            let us= JSON.parse(sessionStorage.getItem("users"));
            this.presult.ruser=us.name;
            //判断最高价用户
            if(us.name==this.top.ruser){
                _this.$message({
                    message:'最高价已是您本人，无需再次竞拍',
                    type:'info'
                });
                return;
            }

            //判断最高价
            if(this.top.pricer>this.presult.pricer){
                 _this.$message({
                    message:'竞拍价需高于最高价！',
                    type:'error',
                });
                return;
            }

            //成功
            this.jquery.ajax({
                url:'http://localhost:8080/api/pm/addsp',
                type: 'post',
                dataType: 'json',
                contentType: 'application/json',
                data: JSON.stringify(_this.presult),
                success:data=>{
                    this.$message({
                        message:'竞拍成功！',
                        type:'success'
                    });
                    this.presult.pricer='';
                    location.reload();
                } 
            })
        }
    },
    mounted(){
        let _this=this;
        let ss=null;
        let now=(new Date().toLocaleString('chinese',{hour12:false})).replace(/\//g,'-');
        this.startsell=new Date(this.auction.starttime)>new Date(now);
        this.finish=new Date(this.auction.endtime)<new Date(now);

        //触发每秒计时
        this.timer=setInterval(()=>{
            this.datediffer();
        },1000);
        
    },
    created(){
        let aid= this.$route.params.aid;
        this.presult.raid=aid;
        this.jquery.ajaxSettings.async=false;
        this.jquery.getJSON(`http://localhost:8080/api/pm/info/${aid}`,data=>{
            this.auction=data;
        });

        this.jquery.getJSON(`http://localhost:8080/api/pm/record/${aid}`,data=>{
            this.record=data;
        });

        this.jquery.getJSON(`http://localhost:8080/api/pm/top/${aid}`,data=>{
            this.top=data;
        })

        // this.toprice='100';

        //商品竞拍记录
    },
    //组件销毁时销毁计时器
    beforeDestroy(){
        clearInterval(this.timer);
    }
}
</script>
<style>
.pce .el-input__inner{
    width:150px;
}
.myform .el-form-item{
    margin-bottom: 10px;
}
</style>
<style  scoped>
p{
    margin-top:0;
    margin-bottom:18px;
}
.tt{
    font-weight: 700;
    font-size: 18px;
}
.dd{
    font-size: 14px;
    margin-left:5px;
}
.dd span{
    font-size:24px;
    font-weight:bold;
    margin:0 5px;
}
.dd a{
    font-size:24px;
    font-weight:bold;
    margin:0 5px;
    color:red;
}
.imgy{
    padding:10px 10px 8px 10px;
    background-color:#c0c4cc;
    display: inline-block;
}
.text{
    display: inline-block;
    vertical-align: top;
    padding: 10px 0 0 10px;
}
.pmg{
    display: inline-block;
    vertical-align: top;
    padding: 10px 0 0 20px;
    
}
ol li{
    font-size:14px;
    font-weight:400;
    margin-bottom: 10px;
    color:#606266;
}
.top{
    background-color:red;
    padding:5px;
    color:#fff;
    font-weight: 400;
}
.les{
    background-color:#c0c4cc;
    padding:5px;
    font-weight: 400;
}
</style>