package com.hg.p2p_2.web.interceptor;

import com.hg.p2p_2.biz.base.util.BaseUtils;
import com.hg.p2p_2.biz.system.entity.UserEntity;
import org.springframework.lang.Nullable;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SessionHandleInterceptor implements HandlerInterceptor {

    public boolean preHandle(
            HttpServletRequest request,
            HttpServletResponse response,
            Object handler) throws Exception {
        String path = request.getServletPath();
        Object loginUser = request.getSession().getAttribute(BaseUtils.KEY_USER);
        if (path.indexOf("/front") >= 0) {
            if (!(loginUser instanceof UserEntity) || loginUser == null) {
                // 如果没有登录，重定向到login页面
                response.sendRedirect("/login");
                return false;
            }
        }

        return true;
    }

    public void postHandle(
            HttpServletRequest request,
            HttpServletResponse response,
            Object handler,
            @Nullable ModelAndView modelAndView) throws Exception {
        // controller方法调用完毕后，调用此方法
    }

    public void afterCompletion(
            HttpServletRequest request,
            HttpServletResponse response,
            Object handler,
            @Nullable Exception ex) throws Exception {
        // 页面渲染完毕后调用此方法，通常用来清除某些资源，类似于Java语句的finally
    }
}
