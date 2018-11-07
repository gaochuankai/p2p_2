package com.hg.p2p_2.web.base.controller;

import com.hg.p2p_2.biz.base.util.BaseUtils;
import com.hg.p2p_2.biz.system.entity.UserEntity;
import com.hg.p2p_2.biz.system.mapper.UserMapper;
import com.hg.p2p_2.biz.system.service.UserService;
import com.hg.p2p_2.web.base.verify.MD5Util;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Map;
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

        String telphone = request.getParameter("telphone");// 可能是登录名，也可能是email
        String code = request.getParameter("code");

        if (StringUtils.isBlank(telphone)) {
            result.put(BaseUtils.SYSTEM_MAP_ERROR_MSG, "电话不能为空！");
            return result;
        }
        if (StringUtils.isBlank(code)) {
            result.put(BaseUtils.SYSTEM_MAP_ERROR_MSG, "验证码不能为空！");
            return result;
        }

        String testcode = (String) session.getAttribute("verCode");
        if (StringUtils.equalsIgnoreCase(testcode, code)) {
            result.put(BaseUtils.SYSTEM_MAP_ERROR_MSG, "验证码不正确！");
            return result;
        }

        Map<String, Object> searchParameters = new ConcurrentHashMap<>();
        searchParameters.put("telephone", telphone);
        UserEntity registerUser = userService.findOneByTelphone(searchParameters);

        // 判断用户是否存在
        if (registerUser != null) {
            result.put(BaseUtils.SYSTEM_MAP_ERROR_MSG, "该电话已存在！");
            return result;
        }

        registerUser = new UserEntity();
        registerUser.setUsername("");// 默认为空
        registerUser.setPassword(MD5Util.md5("123456789"));//初始密码赋值123456789
        registerUser.setEmail("");// 邮箱设置为空
        registerUser.setAge(0);//默认为空
        registerUser.setEnable(0);//设置为可用
        registerUser.setTelephone(telphone);//设置电话号码


        //插入用户
        registerUser = userService.save(registerUser);

        if (registerUser != null && registerUser.getId() != null) {
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
