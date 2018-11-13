package com.hg.p2p_2.web.admin.tender.controller;

import com.hg.p2p_2.biz.tender.entity.TenderEntity;
import com.hg.p2p_2.biz.tender.service.TenderService;
import com.hg.p2p_2.web.base.controller.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 统计图表类
 */
@Controller
@RequestMapping(value = "/admin/tender/information")
public class AdminTenderInformationController extends BaseController<TenderEntity, TenderService> {

    /**
     * 默认的跳转页面
     *
     * @param model
     * @return
     */
    @Override
    public String index(Model model) {
        return "/admin/tender/information_index";
    }
}
