package com.hg.p2p_2.web.front.system.controller;

import com.hg.p2p_2.biz.system.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 前台user-controller
 */
@Controller
@RequestMapping(value = "/front/user")
public class FrontUserController {

    @Autowired
    private UserService userService;

    @RequestMapping
    public String index() {
        return "front/system/user_index";
    }

}
