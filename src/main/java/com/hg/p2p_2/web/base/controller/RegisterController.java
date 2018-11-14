package com.hg.p2p_2.web.base.controller;

import com.hg.p2p_2.biz.base.util.BaseUtils;
import com.hg.p2p_2.biz.system.entity.UserEntity;
import com.hg.p2p_2.biz.system.mapper.UserMapper;
import com.hg.p2p_2.biz.system.service.UserService;
import com.hg.p2p_2.biz.system.util.UserUtils;
import com.hg.p2p_2.web.base.verify.MD5Util;
import org.apache.commons.lang3.StringUtils;
import org.omg.PortableInterceptor.USER_EXCEPTION;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.util.Date;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.ConcurrentHashMap;

/**
 * 注册的controller
 */
@Controller
@RequestMapping(value = "/register")
public class RegisterController {

    @Autowired
    private UserService userService;

    @Autowired
    private UserMapper userMapper;

    /**
     * 跳转到注册页面
     *
     * @return 页面路径
     */
    public String toRegisterPage() {
        return "register";
    }

    /**
     * 通过电话号注册
     */
    @RequestMapping(value = "/register")
    @ResponseBody
    public Map<String, Object> registerByTel(HttpServletRequest request, HttpSession session) {
        Map<String, Object> result = new ConcurrentHashMap<>();
        result.put(BaseUtils.SYSTEM_MAP_SUCCESS, false);
        //获取用户信息
        String username=request.getParameter("username");
        String telphone=request.getParameter("telephone");
        String password0=request.getParameter("password");

        if (StringUtils.isBlank(telphone)) {
            result.put(BaseUtils.SYSTEM_MAP_ERROR_MSG, "电话不能为空！");
            return result;
        }
        if (StringUtils.isBlank(username)) {
            result.put(BaseUtils.SYSTEM_MAP_ERROR_MSG, "用户名不能为空！");
            return result;
        }
        if (StringUtils.isBlank(password0)) {
            result.put(BaseUtils.SYSTEM_MAP_ERROR_MSG, "用户密码不能为空！");
            return result;
        }
//        if (StringUtils.isBlank(code)) {
//            result.put(BaseUtils.SYSTEM_MAP_ERROR_MSG, "验证码不能为空！");
//            return result;
//        }

//        String testcode = (String) session.getAttribute("verCode");
//        if (StringUtils.equalsIgnoreCase(testcode, code)) {
//            result.put(BaseUtils.SYSTEM_MAP_ERROR_MSG, "验证码不正确！");
//            return result;
//        }

        Map<String, Object> searchParameters = new ConcurrentHashMap<>();
        searchParameters.put("telephone", telphone);
        UserEntity registerUser = userService.findOneByTelphone(searchParameters);

        // 判断用户是否存在
        if (registerUser != null) {
            result.put(BaseUtils.SYSTEM_MAP_ERROR_MSG, "该用户已存在！");
            return result;
        }
       

        registerUser = new UserEntity();
        registerUser.setUuid(UUID.randomUUID().toString());
        registerUser.setCreatetime(new Date());
        registerUser.setUsername(username);// 默认为空
        registerUser.setPassword(MD5Util.md5(password0));//初始密码赋值123456789
        registerUser.setEmail("");// 邮箱设置为空
        registerUser.setAge(0);//默认为空
        registerUser.setEnable(UserUtils.USER_ENABLE_2);//设置为可用
        registerUser.setTelephone(telphone);//设置电话号码


        //插入用户
        registerUser = userService.save(registerUser);

        if (registerUser != null && registerUser.getId() != null) {
        	//注册成功后，将对象保存在sesssion中
        	session.setAttribute(BaseUtils.KEY_USER, registerUser);
        	session.setAttribute(BaseUtils.KEY_USER_ID,
        			registerUser.getId());
        	session.setAttribute(BaseUtils.KEY_LOGIN_NAME,
        			registerUser.getUsername());
            result.put(BaseUtils.SYSTEM_MAP_SUCCESS, true);
        } else {
            result.put(BaseUtils.SYSTEM_MAP_ERROR_MSG, "业务繁忙，请稍后尝试！");
        }

        return result;
    }

    /**
     * 验证验证码
     */
    @RequestMapping(value = "/checkCode")
    @ResponseBody
    public Map<String, Object> checkCode(HttpServletRequest request, HttpSession session) {
        Map<String, Object> result = new ConcurrentHashMap<>();
        result.put(BaseUtils.SYSTEM_MAP_SUCCESS, false);
        String code = request.getParameter("code");
        String testcode = (String) session.getAttribute("testcode");
        if (!StringUtils.equalsIgnoreCase(testcode, code)) {
            result.put(BaseUtils.SYSTEM_MAP_ERROR_MSG, "验证码不正确！");
        } else {
            result.put(BaseUtils.SYSTEM_MAP_SUCCESS, true);
        }
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
            result.put(BaseUtils.SYSTEM_MAP_SUCCESS, true);
        } else {
            result.put(BaseUtils.SYSTEM_MAP_ERROR_MSG, "该手机号已注册！");
        }

        return result;
    }
}
