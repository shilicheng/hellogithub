package com.atguigu.atcrowdfunding.listener;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class ContextPathListener implements ServletContextListener {
    @Override
    public void contextInitialized(ServletContextEvent servletContextEvent) {
        //获取上下文对象
        ServletContext servletContext = servletContextEvent.getServletContext();
        //将到工程路径保存到application域中
        servletContext.setAttribute("PATH",servletContext.getContextPath());

    }

    @Override
    public void contextDestroyed(ServletContextEvent servletContextEvent) {

    }
}
