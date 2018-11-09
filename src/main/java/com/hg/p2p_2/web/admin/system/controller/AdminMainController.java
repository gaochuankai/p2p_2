package com.hg.p2p_2.web.admin.system.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 后台的main - controller
 */
@Controller
@RequestMapping(value = "/admin/main")
public class AdminMainController {

    /**
     * 跳转到后台的主页面
     *
     * @return
     */
    @RequestMapping
    public String index() {
        return "admin/main_index";
    }
}
