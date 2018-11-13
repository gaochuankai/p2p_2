package com.hg.p2p_2.web.front.borrow.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hg.p2p_2.biz.system.entity.UserEntity;
import com.hg.p2p_2.biz.system.service.UserService;
import com.hg.p2p_2.web.base.controller.BaseController;
@Controller
@RequestMapping(value = "/front/borrow")
public class FrontBorrowController extends BaseController<UserEntity, UserService>{

	@Override
	public String index(Model model) {
		return "front/p2pborrow/borrow";
	}


}
