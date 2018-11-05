package com.hg.p2p_2.web.base.security;

import javax.servlet.http.HttpServletRequest;

/**
 * 将当期登录者信息保存到线程上下文中
 */
public final class LoginContextHolder {
    private static final ThreadLocal<HttpServletRequest> REQUESTLOCAL = new ThreadLocal<HttpServletRequest>();
    private static final ThreadLocal<LoginContext> CONTEXT = new ThreadLocal<LoginContext>();

    private LoginContextHolder() {
    }

    public static void put(LoginContext context, HttpServletRequest request) {
        CONTEXT.set(context);
        REQUESTLOCAL.set(request);
    }

    public static LoginContext get() {
        return CONTEXT.get();
    }

    public static void clear() {
        CONTEXT.remove();
        REQUESTLOCAL.remove();
    }
}
