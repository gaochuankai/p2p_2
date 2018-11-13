package com.hg.p2p_2.web.admin.system.controller;

import cn.afterturn.easypoi.entity.vo.NormalExcelConstants;
import cn.afterturn.easypoi.excel.ExcelExportUtil;
import cn.afterturn.easypoi.excel.entity.ExportParams;
import cn.afterturn.easypoi.excel.entity.enmus.ExcelType;
import com.hg.p2p_2.biz.base.exception.NormalException;
import com.hg.p2p_2.biz.base.util.BaseUtils;
import com.hg.p2p_2.biz.base.util.ExcelUtils;
import com.hg.p2p_2.biz.base.util.Page;
import com.hg.p2p_2.biz.system.dto.UserExcelDto;
import com.hg.p2p_2.biz.system.entity.UserEntity;
import com.hg.p2p_2.biz.system.mapper.UserMapper;
import com.hg.p2p_2.biz.system.service.UserService;
import com.hg.p2p_2.web.base.controller.BaseController;
import org.apache.commons.lang3.StringUtils;
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
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * 前台user-controller
 */
@Controller
@RequestMapping(value = "/admin/user")
public class AdminUserController extends BaseController<UserEntity, UserService> {

    @Autowired
    private UserMapper userMapper;

    /**
     * 默认跳转路径
     *
     * @param model
     * @return
     */
    @Override
    public String index(Model model) {
        return "admin/system/user_index";
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

    /**
     * 导出
     *
     * @param response
     * @throws NormalException
     */
    @RequestMapping("/export")
    public void export(HttpServletResponse response,
                       @RequestParam(name = "username", required = false) String username,
                       @RequestParam(name = "email", required = false) String email,
                       @RequestParam(name = "telephone", required = false) String telephone) throws NormalException {
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

        //从数据库获取需要导出的数据
        List<UserEntity> list = userMapper.findList(searchParams);
        // 处理成导出的dto
        List<UserExcelDto> dtos = new ArrayList<>();

        for (UserEntity t : list) {
            UserExcelDto dto = new UserExcelDto();
            dto.setAge(t.getAge().toString());
            dto.setEmail(t.getEmail());
            dto.setEnableWapper(t.getEnableWapper());
            dto.setTelephone(t.getTelephone());
            dto.setUsername(t.getUsername());
            dtos.add(dto);
        }

        //导出操作
        //ExcelUtils.exportExcel(list, "花名册", "草帽一伙", UserEntity.class, "海贼王.xls", response);
        Map<String, Object> map1 = getDtoMap(dtos, 1, "信息");

        Map<String, Object> map2 = getDtoMap(dtos, 2, "详情信息");

        List<Map<String, Object>> list4 = new ArrayList<Map<String, Object>>();
        list4.add(map1);
        list4.add(map2);
        Workbook workbook = ExcelExportUtil.exportExcel(list4, ExcelType.HSSF);

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

    private Map<String, Object> getDtoMap(List<?> data, Integer type,
                                          String sheetName) {

        Map<String, Object> map = new HashMap<String, Object>();
        if (type == 1) {
            map.put(NormalExcelConstants.CLASS, UserExcelDto.class);
            map.put(NormalExcelConstants.FILE_NAME, "信息");
        } else if (type == 2) {
            map.put(NormalExcelConstants.CLASS, UserExcelDto.class);
            map.put(NormalExcelConstants.FILE_NAME, "信息");
        }

        map.put("title", new ExportParams(sheetName, sheetName));
        map.put(NormalExcelConstants.DATA_LIST, data);
        return map;
    }

    /**
     * 导入
     *
     * @throws NormalException
     */
    @RequestMapping("/importExcel")
    public void importExcel() throws NormalException {
        String filePath = "F:\\海贼王.xls";
        //解析excel，
        List<UserEntity> personList = ExcelUtils.importExcel(filePath, 1, 1, UserEntity.class);
        //也可以使用MultipartFile,使用 FileUtil.importExcel(MultipartFile file, Integer titleRows, Integer headerRows, Class<T> pojoClass)导入
        System.out.println("导入数据一共【" + personList.size() + "】行");

        //TODO 保存数据库
    }
}
