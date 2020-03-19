package com.my.pmai.dao;

import com.my.pmai.pojo.User;
import com.my.pmai.vo.lg;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserMapper {
    //登录验证
    List<lg> ckLogin(@Param("user") User user);

    //新增用户
    int addUser(@Param("user") User user);

}