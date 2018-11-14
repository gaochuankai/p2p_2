package com.hg.p2p_2.web.base.controller;

import com.hg.p2p_2.biz.base.entity.BaseEntity;
import com.hg.p2p_2.biz.base.service.BaseService;
import com.hg.p2p_2.biz.base.util.BaseUtils;
import com.hg.p2p_2.web.base.security.LoginContextHolder;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.ConstraintViolation;
import javax.validation.ValidatorFactory;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

/**
 * 基础Controller
 *
 * @param <T>
 * @param <Service>
 */
public abstract class BaseController<T extends BaseEntity<Long>, Service extends BaseService<T, ?>> {

    @Autowired
    protected Service service;
    /**
     * hibernate验证器
     */
    @Autowired
    protected ValidatorFactory validator;

    /**
     * 默认主页方法
     *
     * @param model
     * @return
     */
    @RequestMapping()
    public abstract String index(Model model);

    /**
     * 保存更新方法<br>
     * 带验证
     *
     * @param t
     * @param model
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/save")
    @ResponseBody
    public Map<String, Object> save(@ModelAttribute("T") T t, Model model,
                                    HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        if (t.getId() != null) {
            T temp = service.findOne(t.getId());
            BeanUtils.copyProperties(t, temp);
            t = temp;
        } else {
        	t.setUuid(UUID.randomUUID().toString());
            t.setCreatetime(new Date());
            t.setCreatebyid(LoginContextHolder.get().getUserId());
        }
        // 验证实体类
        Set<ConstraintViolation<T>> constraintViolations = validator
                .getValidator().validate(t);
        // 如果大于0，说明有验证未通过信息
        if (constraintViolations.size() > 0) {
            Map<String, Object> result = new HashMap<String, Object>();
            result.put("success", false);
            result.put("msg", constraintViolations.iterator().next()
                    .getMessage());
            return result;
        }

        Map<String, Object> result = service.saveMap(t);
        return result;
    }


    /**
     * 查询明细
     *
     * @param id
     * @param model
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/detail")
    @ResponseBody
    public Map<String, Object> detail(@RequestParam("id") long id, Model model,
                                      HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        Map<String, Object> result = service.findOneMap(id);
        return result;
    }

    /**
     * 删除一条记录
     *
     * @param id
     * @param model
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/delete")
    @ResponseBody
    public Map<String, Object> delete(@RequestParam("ids") long id,
                                      Model model, HttpServletRequest request,
                                      HttpServletResponse response) throws Exception {
        service.delete(id);
        Map<String, Object> result = new HashMap<String, Object>();
        result.put(BaseUtils.SYSTEM_MAP_SUCCESS, true);
        return result;
    }

    /**
     * 批量删除
     *
     * @param ids
     * @param model
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/batchDelete")
    @ResponseBody
    public Map<String, Object> batchDelete(@RequestParam("ids") Long[] ids,
                                           Model model, HttpServletRequest request,
                                           HttpServletResponse response) throws Exception {
        for (Long id : ids) {
            service.delete(id);
        }
        Map<String, Object> result = new HashMap<String, Object>();
        result.put(BaseUtils.SYSTEM_MAP_SUCCESS, true);
        return result;
    }

}
