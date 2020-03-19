package com.my.pmai;

import com.alibaba.fastjson.JSON;
import com.my.pmai.dao.AuctionMapper;
import com.my.pmai.dao.RecordMapper;
import com.my.pmai.dao.UserMapper;
import com.my.pmai.pojo.Auction;
import com.my.pmai.pojo.Record;
import com.my.pmai.pojo.User;
import com.my.pmai.vo.lg;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest
class PmaiApplicationTests {

    @Autowired
    private RecordMapper queryAllRecord;

    @Test
    void contextLoads() {
        Record record = queryAllRecord.queryTopPrice(83);
        System.out.println(JSON.toJSONString(record));

    }

}
