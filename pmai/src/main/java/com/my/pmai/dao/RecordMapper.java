package com.my.pmai.dao;


import com.my.pmai.pojo.Record;
import org.apache.ibatis.annotations.Param;

public interface RecordMapper {

    //查询最高价
    Record queryTopPrice(@Param("aid") Integer aid);

    //竞拍商品
    int addAuctionSp(@Param("record") Record record);

}