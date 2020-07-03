package com.atguigu.atcrowdfunding.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.MessageDigestPasswordEncoder;
import org.springframework.security.web.access.AccessDeniedHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class AppSecurityConfig extends WebSecurityConfigurerAdapter {
    @Autowired
    UserDetailsService userDetailsService;

    @Autowired
    BCryptPasswordEncoder bCryptPasswordEncoder;
    //授权方法
    @Override
    protected void configure(HttpSecurity http) throws Exception {
//        super.configure(http);
        http.authorizeRequests()
                .antMatchers("/index","/","/static/**","/login.html").permitAll()
                //.antMatchers("/admin/deleteAdmin").hasAnyAuthority("ROLE_SE - 软件工程师")
                .anyRequest().authenticated();

        //配置浏览器提交主体创建的登录请求表单[配置浏览器如何提交登录请求，接收到后再交给主体创建的方法处理]
        http.formLogin()
                .loginPage("/login.html")  //登录页面
                .loginProcessingUrl("/dologin")  //浏览器提交的
                .usernameParameter("loginacct")  //提交的用户名参数名是loginacct
                .passwordParameter("userpswd")    //提交的密码参数名是userpswd
                .defaultSuccessUrl("/admin/main.html"); //登录成功重定向的地址

        //禁用csrf功能
        http.csrf().disable();

        //配置注销请求
        http.logout()
                .logoutUrl("/admin/logout") //请求注销的地址，请求必须改为post
                .logoutSuccessUrl("/");  //注销成功后重定向的页面

        //配置异常处理
        http.exceptionHandling().accessDeniedHandler(new AccessDeniedHandler() {
            @Override
            public void handle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, AccessDeniedException e) throws IOException, ServletException {
                //判断是否是异步请求
                if("XMLHttpRequest".equals(httpServletRequest.getHeader("X-Requested-With"))){
                    httpServletResponse.getWriter().write("403");
                }else{
                    //获取异常信息
                    String message = e.getMessage();
                    //设置请求的错误信息
                    httpServletRequest.setAttribute("errorMsg",message);
                    //转发到错误页面
                    httpServletRequest.getRequestDispatcher("/WEB-INF/pages/error/403.jsp").forward(httpServletRequest,httpServletResponse);

                }

            }
        });
    }

    //主体创建
    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userDetailsService).passwordEncoder(bCryptPasswordEncoder);
    }
}
