package com.my.pmai.dao;

import com.my.pmai.pojo.Auction;
import com.my.pmai.pojo.Record;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AuctionMapper {

    //查询全部拍卖品
    List<Auction> queryAll();

    //新增商品
    int addAuction(@Param("auction") Auction auction);

    //查询拍卖开始时间
    Auction queryStime(@Param("aid") Integer aid);

    //删除商品
    int deleteSp(@Param("aid") Integer aid);

    //查询单个商品信息
    Auction queryByAid(@Param("aid") Integer aid);

    //修改商品信息
    int updateSp(@Param("auction") Auction auction);

    //商品竞拍记录
    List<Record> queryAllRecord(@Param("aid") Integer aid);
}