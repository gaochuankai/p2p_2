package com.hg.p2p_2.web.front.system.controller;

import com.hg.p2p_2.biz.system.entity.UserEntity;
import com.hg.p2p_2.biz.system.service.UserService;
import com.hg.p2p_2.web.base.controller.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 前台user-controller
 */
@Controller
@RequestMapping(value = "/front/user")
public class FrontUserController extends BaseController<UserEntity, UserService> {

    @Override
    public String index(Model model) {
        return "front/system/user_index";
    }
}
