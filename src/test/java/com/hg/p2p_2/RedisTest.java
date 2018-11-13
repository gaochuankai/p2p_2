package com.hg.p2p_2;

import redis.clients.jedis.Jedis;

import java.util.*;
import java.util.concurrent.ConcurrentLinkedQueue;

public class RedisTest {

    public void jjjj() {
        //连接本地的 Redis 服务
        Jedis jedis = new Jedis("localhost");
        System.out.println("连接成功");
        //查看服务是否运行
        System.out.println("服务正在运行: " + jedis.ping());


        Set set = new HashSet();
        List list = new ArrayList();
        LinkedList linkedList = new LinkedList();
        linkedList.pop();
        Map map = new HashMap();
        Queue queue = new ConcurrentLinkedQueue();
        Stack stack = new Stack();
        stack.pop();
        stack.push(111);
    }
}
