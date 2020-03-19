package com.my.pmai.biz;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.my.pmai.dao.AuctionMapper;
import com.my.pmai.dao.RecordMapper;
import com.my.pmai.dao.UserMapper;
import com.my.pmai.pojo.Auction;
import com.my.pmai.pojo.Record;
import com.my.pmai.pojo.User;
import com.my.pmai.vo.lg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class Biz {

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private AuctionMapper auctionMapper;

    @Autowired
    private RecordMapper recordMapper;

    public List<lg> ckLogin(User user){
        return userMapper.ckLogin(user);
    }

    public int addUser(User user){
        return userMapper.addUser(user);
    }

    public PageInfo<Auction> queryAll(Integer n,Integer s){
        PageHelper.startPage(n,s);
        return new PageInfo<Auction>(auctionMapper.queryAll());
    }

    public int addAuction(Auction auction){
        return auctionMapper.addAuction(auction);
    }

    public Auction queryStime(Integer aid){
        return auctionMapper.queryStime(aid);
    }

    public int deleteSp(Integer aid){
        return auctionMapper.deleteSp(aid);
    }

    public Auction queryByAid(Integer aid){
        return auctionMapper.queryByAid(aid);
    }

    public int updateSp(Auction auction){
        return auctionMapper.updateSp(auction);
    }

    public List<Record> queryAllRecord(Integer aid){
        return auctionMapper.queryAllRecord(aid);
    }

    public Record queryTopPrice(Integer aid){
        return recordMapper.queryTopPrice(aid);
    }

    public int addAuctionSp(Record record){
        return recordMapper.addAuctionSp(record);
    }





}
