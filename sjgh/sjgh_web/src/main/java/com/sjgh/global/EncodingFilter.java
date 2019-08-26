package com.sjgh.global;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/*
 *网站字符编码过滤器
 *
 * */

public class EncodingFilter implements Filter {
    private String encoding = "utf-8";
    //初始化方法，读取初始化参数，以encoding为键给他指定一个编码
    public void init(FilterConfig filterConfig) throws ServletException {
        if(filterConfig.getInitParameter("encoding")!=null){
            //将encoding设置为指定的编码
            encoding = filterConfig.getInitParameter("encoding");
        }
    }

    //响应时
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest)servletRequest;
        HttpServletResponse response = (HttpServletResponse)servletResponse;
        request.setCharacterEncoding(encoding);
        response.setCharacterEncoding(encoding);
        //调用连接器链，让他继续执行
        filterChain.doFilter(request,response);
    }

    public void destroy() {
    }
}

