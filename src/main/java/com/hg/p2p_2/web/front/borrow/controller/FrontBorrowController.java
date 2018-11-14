package com.hg.p2p_2.web.front.borrow.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hg.p2p_2.biz.base.util.BaseUtils;
import com.hg.p2p_2.biz.password.util.PasswordUtil;
import com.hg.p2p_2.biz.system.entity.PasswordEntity;
import com.hg.p2p_2.biz.system.entity.UserEntity;
import com.hg.p2p_2.biz.system.mapper.PasswordMapper;
import com.hg.p2p_2.biz.system.service.PasswordService;
import com.hg.p2p_2.biz.system.service.UserService;
import com.hg.p2p_2.biz.system.util.UserUtils;
import com.hg.p2p_2.biz.tender.entity.TenderEntity;
import com.hg.p2p_2.biz.tender.service.TenderService;
import com.hg.p2p_2.web.base.controller.BaseController;
import com.hg.p2p_2.web.base.security.LoginContextHolder;

/**
 * 申请借款 - controller
 * 
 * @author hanbao
 *
 */
@Controller
@RequestMapping(value = "/front/borrow")
public class FrontBorrowController extends BaseController<TenderEntity, TenderService> {

	@Autowired
	private UserService userService;
	@Autowired
	private PasswordMapper passwordMapper;
	/**
	 * 默认的跳转页面
	 */
	@Override
	public String index(Model model) {
		
		return "";
	}

	/**
	 * 跳转到
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/toBorrowPage")
	public String toBorrowPage(HttpSession session, Model model) {
		session.getAttribute(BaseUtils.KEY_USER);
		UserEntity user = (UserEntity) session.getAttribute(BaseUtils.KEY_USER);
		System.out.println(user.getEnable());
		//通过用户id和密码类型获取支付密码
		PasswordEntity ps=passwordMapper.findPasswordByUserId(user.getId(),PasswordUtil.PASSWORD_TYPE_1);
		//
		if (user.getEnable() == UserUtils.USER_ENABLE_2) {
			model.addAttribute("user", user);
			model.addAttribute("passwords", ps);
			// 如果user是未完善信息状态，不能进行申请，跳转到完善信息界面
			return "front/system/user_detail";
		}
		// 将用户添加到model中
		model.addAttribute("user", user);
		// 跳转到借款页面
		return "front/p2pborrow/borrow";
	}

	/**
	 * 对提交材料进行验证
	 * 
	 * @param t
	 * @param HttpServletResponse
	 * @return
	 */
	@RequestMapping("/apply")
	@ResponseBody
	public Map<String, Object> apply(TenderEntity t, HttpServletResponse response) throws Exception {
		Map<String, Object> result = new HashMap<String, Object>();
		result.put(BaseUtils.SYSTEM_MAP_SUCCESS, false);

		Long userid = LoginContextHolder.get().getUserId();
		UserEntity user = userService.findOne(userid);
		if (user.getEnable() != UserUtils.USER_ENABLE_0) {
			result.put(BaseUtils.SYSTEM_MAP_ERROR_MSG, "您没有发标的权限，请联系工作人员！");
			return result;
		}
		// 随机获取uuid
		t.setUuid(UUID.randomUUID().toString());
		// 标的创建时间
		t.setCreatetime(new Date());
		// 创建人的id
		t.setCreatebyid(LoginContextHolder.get().getUserId());
		// 保存标
		result = service.saveMap(t);

		return result;
	}
}
