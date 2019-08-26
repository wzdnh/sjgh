package com.sjgh.global;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/*
 *前台页面之
 *登录拦截器
 *
 * */

public class ReceptionLoginInterceptor implements HandlerInterceptor {
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {

        //获取用户请求路径
        String url = httpServletRequest.getRequestURI();
        //如果有登录或注册或者首页的这个信息，放行
        //tolowerCase(全部小写，)
        if(url.toLowerCase().indexOf("login")>=0 || url.toLowerCase().indexOf("register") >= 0 || url.toLowerCase().indexOf("index") >= 0){
            return true;
        }

        HttpSession session = httpServletRequest.getSession();
        if(session.getAttribute("user")!=null){
            return true;
        }
        //既不是登录相关路径，又没有session信息，则拦截，并去tologin界面
        httpServletResponse.sendRedirect("/reception/to_login");
        return false;
    }

    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
