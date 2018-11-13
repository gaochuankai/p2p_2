package com.hg.p2p_2.web.admin.tender.controller;

import cn.afterturn.easypoi.excel.ExcelExportUtil;
import cn.afterturn.easypoi.excel.entity.ExportParams;
import cn.afterturn.easypoi.excel.entity.enmus.ExcelType;
import com.hg.p2p_2.biz.base.util.BaseUtils;
import com.hg.p2p_2.biz.base.util.Page;
import com.hg.p2p_2.biz.tender.dto.TenderExcelDto;
import com.hg.p2p_2.biz.tender.entity.TenderEntity;
import com.hg.p2p_2.biz.tender.mapper.TenderMapper;
import com.hg.p2p_2.biz.tender.service.TenderService;
import com.hg.p2p_2.web.base.controller.BaseController;
import org.apache.commons.lang3.StringUtils;
import org.apache.poi.ss.formula.functions.T;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * 标 - controller层
 */
@Controller
@RequestMapping(value = "/admin/tender")
public class AdminTenderController extends BaseController<TenderEntity, TenderService> {

    @Autowired
    private TenderMapper tenderMapper;

    /**
     * 默认的跳转路径
     *
     * @param model
     * @return
     */
    @Override
    public String index(Model model) {
        return "admin/tender/tender_index";
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
            @RequestParam(name = "title", required = false) String title,
            @RequestParam(name = "description", required = false) String description,
            @RequestParam(name = "status", required = false, defaultValue = "-1") Integer status) throws Exception {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Map<String, Object> result = new ConcurrentHashMap<>();
        result.put(BaseUtils.SYSTEM_MAP_SUCCESS, true);
        Map<String, Object> searchParams = new ConcurrentHashMap<>();

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
        if (StringUtils.isNotBlank(title)) {
            searchParams.put("title", title);
        }
        if (StringUtils.isNotBlank(description)) {
            searchParams.put("description", description);
        }
        if (status != -1) {
            searchParams.put("status", status);
        }

        Long conut = tenderMapper.count(searchParams);

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
        List<TenderEntity> list = tenderMapper.findList(searchParams);
        page.setData(list);

        result.put(BaseUtils.SYSTEM_MAP_LIST, list);
        result.put("page", page);
        return result;
    }

    /**
     * 导出
     *
     * @param response
     * @throws Exception
     */
    @RequestMapping("/export")
    public void export(HttpServletResponse response,
                       @RequestParam(name = "startmoney", required = false) String startmoney,
                       @RequestParam(name = "endmoney", required = false) String endmoney,
                       @RequestParam(name = "starttime", required = false) String starttime,
                       @RequestParam(name = "endtime", required = false) String endtime,
                       @RequestParam(name = "title", required = false) String title,
                       @RequestParam(name = "description", required = false) String description,
                       @RequestParam(name = "status", required = false, defaultValue = "-1") Integer status) throws Exception {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Map<String, Object> result = new ConcurrentHashMap<>();
        result.put(BaseUtils.SYSTEM_MAP_SUCCESS, true);
        Map<String, Object> searchParams = new ConcurrentHashMap<>();

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
        if (StringUtils.isNotBlank(title)) {
            searchParams.put("title", title);
        }
        if (StringUtils.isNotBlank(description)) {
            searchParams.put("description", description);
        }
        if (status != -1) {
            searchParams.put("status", status);
        }

        //从数据库获取需要导出的数据
        List<TenderEntity> list = tenderMapper.findList(searchParams);
        // 处理成导出的dto
        List<TenderExcelDto> dtos = new ArrayList<>();

        for (TenderEntity t : list) {
            TenderExcelDto dto = new TenderExcelDto();
            dto.setAllmoney(t.getAllmoney());
            dto.setCreatetime(t.getCreatetime());
            dto.setDescription(t.getDescription());
            dto.setStatusWapper(t.getStatusWapper());
            dto.setTitle(t.getTitle());
            dtos.add(dto);
        }

        //导出操作
        ExportParams params = new ExportParams("信息", "信息");
        Workbook workbook = ExcelExportUtil.exportExcel(params, TenderExcelDto.class, dtos);

        OutputStream out = null;
        try {
            out = response.getOutputStream();
            String fileName = "信息.xls";// 文件名
            response.setContentType("application/octet-stream;charset=UTF-8");
            response.setHeader(
                    "Content-Disposition",
                    "attachment; filename="
                            + URLEncoder.encode(fileName, "UTF-8"));
            workbook.write(out);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                out.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

}
