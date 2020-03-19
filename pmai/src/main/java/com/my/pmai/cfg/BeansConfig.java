package com.my.pmai.cfg;


import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Configuration;


@Configuration
@MapperScan(basePackages = { "com.my.pmai.dao" })
public class BeansConfig {
	

}
