package com.hg.p2p_2;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

/**
 * spring boot 的启动类
 */
@SpringBootApplication
@MapperScan("com.hg.p2p_2.biz.*.mapper")
public class P2p2Application extends SpringBootServletInitializer {

    public static void main(String[] args) {
        SpringApplication.run(P2p2Application.class, args);
    }
}
