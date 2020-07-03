package com.atguigu.atcrowdfunding.controller;

import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DispatcherController {
    @Bean
    public BCryptPasswordEncoder getBCryptPasswordEncoder(){
        return new BCryptPasswordEncoder();
    }


    //主界面
    @RequestMapping(value={"/index","/"})
    public String toIndexPage(){
        return "index";
    }

    //跳转到登录页面
    @RequestMapping(value={"/login.html"})
    public String toLoginPage(){
        return "login";
    }


}
