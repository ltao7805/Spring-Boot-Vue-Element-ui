package com.my.pmai.action;

import com.github.pagehelper.PageInfo;
import com.my.pmai.biz.Biz;
import com.my.pmai.pojo.Auction;
import com.my.pmai.pojo.Record;
import com.my.pmai.pojo.User;
import com.my.pmai.vo.lg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/pm")
public class pmAction {

    @Autowired
    private Biz biz;

    @PostMapping("login")
    public List<lg> ckLogin(@RequestBody User user){
        return biz.ckLogin(user);
    }

    @PostMapping("add")
    public int addUser(@RequestBody User user){
        return biz.addUser(user);
    }

    @GetMapping("allau/{n}/{s}")
    public PageInfo<Auction> queryAll(@PathVariable Integer n,@PathVariable Integer s){
        return biz.queryAll(n,s);
    }

    @PostMapping("addp")
    public int addAuction(@RequestBody Auction auction){
        return biz.addAuction(auction);
    }

    @GetMapping("stime/{aid}")
    public Auction queryStime(@PathVariable Integer aid){
        return biz.queryStime(aid);
    }

    @GetMapping("dele/{aid}")
    public int deleteSp(@PathVariable Integer aid){
        return biz.deleteSp(aid);
    }

    @GetMapping("info/{aid}")
    public Auction queryByAid(@PathVariable Integer aid){
        return biz.queryByAid(aid);
    }

    @PostMapping("update")
    public int updateSp(@RequestBody Auction auction){
        return biz.updateSp(auction);
    }

    @GetMapping("record/{aid}")
    public List<Record> queryAllRecord(@PathVariable Integer aid){
        return biz.queryAllRecord(aid);
    }

    @GetMapping("top/{aid}")
    public Record queryTopPrice(@PathVariable Integer aid){
        return biz.queryTopPrice(aid);
    }

    @PostMapping("addsp")
    public int auctionSp(@RequestBody Record record){
        return biz.addAuctionSp(record);
    }




}
