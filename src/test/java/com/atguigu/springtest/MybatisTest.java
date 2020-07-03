package com.atguigu.springtest;


import com.atguigu.atcrowdfunding.mapper.TMenuMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@ContextConfiguration(locations = {"classpath:spring/spring-bean.xml","classpath:spring/spring-mybatis.xml","classpath:spring/spring-tx.xml"})
@RunWith(SpringJUnit4ClassRunner.class)
public class MybatisTest {

    @Autowired
    TMenuMapper tMenuMapper;

    @Test
    public void test1(){
        long l = tMenuMapper.countByExample(null);
        System.out.println("l = " + l);
    }
}
