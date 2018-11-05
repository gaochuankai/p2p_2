package com.hg.p2p_2.web.admin.system.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 前台user-controller
 */
@Controller
@RequestMapping(value = "/admin/user")
public class AdminUserController {

    public String index() {
        return "admin/system/user_index";
    }
}
