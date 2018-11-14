package com.hg.p2p_2.web.admin.tender.controller;

import com.hg.p2p_2.biz.base.util.BaseUtils;
import com.hg.p2p_2.biz.base.util.Page;
import com.hg.p2p_2.biz.tender.entity.TenderDetailEntity;
import com.hg.p2p_2.biz.tender.mapper.TenderDetailMapper;
import com.hg.p2p_2.biz.tender.service.TenderDetailService;
import com.hg.p2p_2.web.base.controller.BaseController;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * 标的详情信息 - controller
 */
@Controller
@RequestMapping(value = "/admin/tender/details")
public class AdminTenderDetailController extends BaseController<TenderDetailEntity, TenderDetailService> {

    @Autowired
    private TenderDetailMapper tenderDetailMapper;

    /**
     * 默认的跳转页面
     *
     * @param model
     * @return
     */
    @Override
    public String index(Model model) {
        model.addAttribute("tenderid", 0);
        return "admin/tender/tender_detail_index";
    }

    /**
     * 跳转详情页
     *
     * @param model
     * @return
     */
    @RequestMapping(value = "/toDetailPage")
    public String toDetailPage(Model model, @RequestParam(name = "tenderid") Long tenderid) {
        model.addAttribute("tenderid", tenderid);
        return "admin/tender/tender_detail_index";
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
            @RequestParam(name = "startmoney", required = false) String startmoney,
            @RequestParam(name = "endmoney", required = false) String endmoney,
            @RequestParam(name = "starttime", required = false) String starttime,
            @RequestParam(name = "endtime", required = false) String endtime,
            @RequestParam(name = "createUserName", required = false) String createUserName,
            @RequestParam(name = "status", required = false, defaultValue = "-1") Integer status,
            @RequestParam(name = "tenderid") Long tenderid) throws Exception {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Map<String, Object> result = new ConcurrentHashMap<>();
        result.put(BaseUtils.SYSTEM_MAP_SUCCESS, true);
        Map<String, Object> searchParams = new ConcurrentHashMap<>();
        searchParams.put("tenderid", tenderid);

        if (StringUtils.isNotBlank(startmoney)) {
            searchParams.put("startmoney", startmoney);
        }
        if (StringUtils.isNotBlank(endmoney)) {
            searchParams.put("endmoney", endmoney);
        }
        if (StringUtils.isNotBlank(starttime)) {
            searchParams.put("starttime", (Date) simpleDateFormat.parse(starttime));
        }
        if (StringUtils.isNotBlank(endtime)) {
            searchParams.put("endtime", (Date) simpleDateFormat.parse(endtime));
        }
        if (StringUtils.isNotBlank(createUserName)) {
            searchParams.put("createUserName", createUserName);
        }
        if (status != -1) {
            searchParams.put("status", status);
        }

        Long conut = tenderDetailMapper.count(searchParams);

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
        List<TenderDetailEntity> list = tenderDetailMapper.findList(searchParams);
        page.setData(list);

        result.put(BaseUtils.SYSTEM_MAP_LIST, list);
        result.put("page", page);
        return result;
    }

}
