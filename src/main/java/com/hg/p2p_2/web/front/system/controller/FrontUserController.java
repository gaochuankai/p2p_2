package com.hg.p2p_2.web.front.system.controller;

import com.hg.p2p_2.biz.base.util.BaseUtils;
import com.hg.p2p_2.biz.base.util.Page;
import com.hg.p2p_2.biz.system.entity.UserEntity;
import com.hg.p2p_2.biz.system.mapper.UserMapper;
import com.hg.p2p_2.biz.system.service.UserService;
import com.hg.p2p_2.web.base.controller.BaseController;
import org.apache.catalina.User;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * 前台user-controller
 */
@Controller
@RequestMapping(value = "/front/user")
public class FrontUserController extends BaseController<UserEntity, UserService> {

    @Autowired
    private UserMapper userMapper;

    /**
     * 重写
     *
     * @param model
     * @return
     */
    @Override
    public String index(Model model) {
        return "front/system/user_index";
    }

    /**
     * 带筛选条件
     * 带分页的list
     *
     * @return
     */
    @RequestMapping(value = "/list")
    @ResponseBody
    public Map<String, Object> list(
            @RequestParam(name = "page", defaultValue = "1") long pageNum,
            @RequestParam(name = "username", required = false) String username,
            @RequestParam(name = "email", required = false) String email,
            @RequestParam(name = "telephone", required = false) String telephone) {
        Map<String, Object> result = new ConcurrentHashMap<>();
        result.put(BaseUtils.SYSTEM_MAP_SUCCESS, true);
        Map<String, Object> searchParams = new ConcurrentHashMap<>();

        if (StringUtils.isNotBlank(username)) {
            searchParams.put("username", username);
        }

        if (StringUtils.isNotBlank(email)) {
            searchParams.put("email", email);
        }

        if (StringUtils.isNotBlank(telephone)) {
            searchParams.put("telephone", telephone);
        }

        Long conut = service.count();

        Page page = new Page();
        page.setTotal(conut);

        Long end = conut % BaseUtils.PAGE_SIZE;
        end = end == 0 ? conut / BaseUtils.PAGE_SIZE : conut / BaseUtils.PAGE_SIZE + 1;
        page.setEnd(end);
        page.setSize(BaseUtils.PAGE_SIZE);

        if (pageNum <= 0) {
            pageNum = 1;
        } else if (pageNum > end) {
            pageNum = end;
        }
        page.setPageNum(pageNum);

        searchParams.put("limitStart", (pageNum - 1) * BaseUtils.PAGE_SIZE);
        searchParams.put("limitEnd", BaseUtils.PAGE_SIZE);
        List<UserEntity> list = userMapper.findList(searchParams);
        page.setData(list);

        result.put(BaseUtils.SYSTEM_MAP_LIST, list);
        result.put("page", page);
        return result;
    }

}
