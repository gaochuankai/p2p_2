package com.hg.p2p_2.web.base.controller;

import com.hg.p2p_2.biz.base.util.HttpUtils;
import com.hg.p2p_2.biz.system.entity.LoginLogEntity;
import com.hg.p2p_2.biz.system.entity.UserEntity;
import com.hg.p2p_2.biz.base.util.BaseUtils;
import com.hg.p2p_2.biz.system.service.LoginLogService;
import com.hg.p2p_2.biz.system.service.UserService;
import com.hg.p2p_2.biz.system.util.UserUtils;
import com.hg.p2p_2.web.base.verify.MD5Util;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Date;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * 登录、登出controller
 */
@Controller
@RequestMapping("/login")
public class LoginController {

    @Autowired
    private UserService userService;

    @Autowired
    private LoginLogService loginLogService;

    /**
     * 跳转到登录页面
     *
     * @return 页面路径
     */
    @RequestMapping
    public String toLoginPage() {
        return "main_index";
    }

    /**
     * 登录方法
     *
     * @return
     */
    @RequestMapping(value = "/login")
    @ResponseBody
    public Map<String, Object> login(HttpServletRequest request) {
        Map<String, Object> result = new ConcurrentHashMap<>();
        result.put(BaseUtils.SYSTEM_MAP_SUCCESS, false);

        //因为LoginContextInterceptor不拦截/login，判断session用户登录情况
        HttpSession httpSession = request.getSession();

        String telephone = request.getParameter("username");
        String password = request.getParameter("password");

        if (StringUtils.isBlank(telephone) || StringUtils.isBlank(password)) {
            result.put(BaseUtils.SYSTEM_MAP_ERROR_MSG, "请填写手机号或者密码！");
            return result;
        }

        Map<String, Object> searchParams = new ConcurrentHashMap<>();
        searchParams.put("EQ_telephone", telephone);
        UserEntity userEntity = userService.findOneByTelphone(searchParams);
        if (userEntity == null) {
            result.put(BaseUtils.SYSTEM_MAP_ERROR_MSG, "手机号错误，请重新输入！");
            return result;
        } else if (userEntity.getEnable() == UserUtils.USER_ENABLE_1) {
            result.put(BaseUtils.SYSTEM_MAP_ERROR_MSG, "您的账号出现问题，请联系工作人员！");
            return result;
        } else if (StringUtils.equals(userEntity.getPassword(), MD5Util.md5(password))) {
            result.put(BaseUtils.SYSTEM_MAP_ERROR_MSG, "密码错误，请重新输入！");
            return result;
        }

        // 记录用户登录日志
        String agent = request.getHeader("User-Agent");
        String requestIp = null;
        try {
            requestIp = HttpUtils.getIpAddress(request);
        } catch (IOException e) {
            e.printStackTrace();
        }
        LoginLogEntity loginLog = new LoginLogEntity();
        loginLog.setIpaddress(requestIp);
        loginLog.setRemotehost(request.getRemoteHost());
        loginLog.setUseragent(agent);
        loginLog.setCreatebyid(userEntity.getId());
        loginLog.setCreatetime(new Date());
        //TODO:更改数据库字段！！！！！！！
        //loginLogService.noLogSave(loginLog);

        httpSession.setAttribute(BaseUtils.KEY_USER, userEntity);
        httpSession.setAttribute(BaseUtils.KEY_USER_ID,
                userEntity.getId());
        httpSession.setAttribute(BaseUtils.KEY_LOGIN_NAME,
                userEntity.getUsername());

        // 加载用户资源信息
        searchParams = new ConcurrentHashMap<>();
        searchParams.put("userId", userEntity.getId());
        // 0后台菜单，1前台菜单
//        searchParams.put("resourceFlag", 0);
//        List<UserRoleResourceDto> resourcesEntities = userRoleResourceService
//                .findUserRoleResourceByMap(searchParams);
//        httpSession.setAttribute(SessionSecurityConstants.KEY_USER_RESOURCES,
//                resourcesEntities);


        // 前台菜单
        searchParams = new ConcurrentHashMap<>();
        searchParams.put("userId", userEntity.getId());
        // 0后台菜单，1前台菜单
        searchParams.put("resourceFlag", 1);
//        List<UserRoleResourceDto> portalResourcesEntities = userRoleResourceService
//                .findUserRoleResourceByMap(searchParams);
//        httpSession.setAttribute(
//                SessionSecurityConstants.KEY_USER_FRONT_RESOURCES,
//                portalResourcesEntities);

        result.put(BaseUtils.SYSTEM_MAP_SUCCESS, true);
        return result;
    }

    /**
     * 验证手机号
     */
    @RequestMapping(value = "/checkTel")
    @ResponseBody
    public Map<String, Object> checkTel(HttpServletRequest request, HttpSession session) {
        Map<String, Object> result = new ConcurrentHashMap<>();
        result.put(BaseUtils.SYSTEM_MAP_SUCCESS, false);
        String tel = request.getParameter("telphone");

        Map<String, Object> searchParameters = new ConcurrentHashMap<>();
        searchParameters.put("telephone", tel);
        UserEntity user = userService.findOneByTelphone(searchParameters);
        // 判断用户名是否存在
        if (user == null) {
            result.put(BaseUtils.SYSTEM_MAP_ERROR_MSG, "该手机号未注册！");
        } else {
            result.put(BaseUtils.SYSTEM_MAP_SUCCESS, true);
        }

        return result;
    }

}
