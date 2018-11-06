package com.hg.p2p_2.web.admin.system.controller;

import com.hg.p2p_2.biz.system.entity.UserEntity;
import com.hg.p2p_2.biz.system.service.UserService;
import com.hg.p2p_2.web.base.controller.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 前台user-controller
 */
@Controller
@RequestMapping(value = "/admin/user")
public class AdminUserController extends BaseController<UserEntity, UserService> {

    @Override
    public String index(Model model) {
        return "";
    }
}
