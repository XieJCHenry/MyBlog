package com.jchenry.myblog.interceptor;

import com.jchenry.myblog.util.JwtUtil;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * TokenInterceptor
 *
 * @Description TODO
 * @Author jc-henry
 * @Date 2019/09/01 13:58
 * @Version 1.0
 **/
public class TokenInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
                             Object handler) throws Exception {
        response.setCharacterEncoding("UTF-8");
        String token = (String) request.getSession().getAttribute("accessToken");
        System.out.println("interceptor : " + token);
        if (null != token) {
            boolean result = JwtUtil.verify(token);
            return result;
        }
        response.sendRedirect(request.getContextPath() + "/login");
        return false;
    }
}
