package com.hg.p2p_2.biz.base.service;

import com.hg.p2p_2.biz.base.dao.BaseDao;
import com.hg.p2p_2.biz.base.datapermission.DataPermission;
import com.hg.p2p_2.biz.base.log.BusinessLog;
import com.hg.p2p_2.biz.base.util.BaseUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;

import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public abstract class BaseService<T, DAO extends BaseDao<T>> {

    @Autowired
    protected DAO dao;

    private Class clazz = null;

    public BaseService() {
        // 获取泛型class
        Type genType = getClass().getGenericSuperclass();
        Type[] params = ((ParameterizedType) genType).getActualTypeArguments();
        clazz = (Class) params[0];
    }

    /**
     * 保存方法
     *
     * @param t
     * @return t
     */
    @BusinessLog(operation = "保存")
    public T save(T t) {
        return dao.save(t);
    }

    /**
     * 保存方法，返回map数据
     *
     * @param t
     * @return Map
     */
    @BusinessLog(operation = "保存")
    public Map<String, Object> saveMap(T t) {
        t = dao.save(t);
        Map<String, Object> result = new HashMap<String, Object>();
        result.put(BaseUtils.SYSTEM_MAP_SUCCESS, true);
        result.put(BaseUtils.SYSTEM_MAP_ENTITY, t);
        return result;
    }

    /**
     * 不保存日志
     *
     * @param t
     * @return t
     */
    public T noLogSave(T t) {
        t = dao.save(t);
        return t;
    }

    /**
     * 不保存日志
     *
     * @param list
     * @return list
     */
    public List<T> noLogSave(List<T> list) {
        list = (List<T>) dao.saveAll(list);
        return list;
    }

    /**
     * 批量保存并且返回Map
     *
     * @param list
     * @return Map<String                                                               ,                                                                                                                               Object>
     */
    @BusinessLog(operation = "保存")
    public Map<String, Object> saveMap(List<T> list) {
        list = (List<T>) dao.saveAll(list);
        Map<String, Object> result = new HashMap<String, Object>();
        result.put(BaseUtils.SYSTEM_MAP_SUCCESS, true);
        result.put(BaseUtils.SYSTEM_MAP_LIST, list);
        return result;
    }

    /**
     * 依据主键id删除
     *
     * @param id
     */
    @BusinessLog(operation = "删除")
    public void delete(Long id) {
        dao.deleteById(id);
    }

    /**
     * 根据实体进行删除
     *
     * @param t
     */
    @BusinessLog(operation = "删除")
    public void delete(T t) {
        dao.delete(t);
    }

    /**
     * 根据实体进行删除
     *
     * @param t
     */
    @BusinessLog(operation = "删除")
    public void delete(List<T> t) {
        dao.deleteAll(t);
    }

    /**
     * 根据ID查找
     *
     * @param id
     * @return T
     */
    public T findOne(long id) {
        return (T) dao.findById(id);
    }

    /**
     * 根据ID查找
     *
     * @param id
     * @return T
     */
    public Map<String, Object> findOneMap(long id) {
        T t = (T) dao.findById(id);
        Map<String, Object> result = new HashMap<String, Object>();
        result.put(BaseUtils.SYSTEM_MAP_SUCCESS, true);
        result.put(BaseUtils.SYSTEM_MAP_ENTITY, t);
        return result;
    }

    /**
     * 查找全部,禁止使用
     *
     * @return List<T>
     */
    @Deprecated
    public List<T> findAll() {
        return (List<T>) dao.findAll();
    }

    /**
     * 按页面传来的查询条件查询用户. 没有分页参数
     *
     * @param searchParams
     * @return
     */
    @DataPermission
    public T findOneByParams(Map<String, Object> searchParams) {
        //TODO:按照条件插叙
        return null;
//        Map<String, SearchFilter> filters = SearchFilter.parse(searchParams);
//        Specification<T> spec = DynamicSpecifications.bySearchFilter(
//                filters.values(), clazz);
//        T t = dao.findOne(spec);
//        return t;
    }

    /**
     * 按页面传来的查询条件查询用户. 没有分页参数
     *
     * @param searchParams
     * @param sort
     * @return
     */
    @DataPermission
    public List<T> findByParams(Map<String, Object> searchParams, Sort sort) {
        //TODO:
        return null;
//        Map<String, SearchFilter> filters = SearchFilter.parse(searchParams);
//        Specification<T> spec = DynamicSpecifications.bySearchFilter(
//                filters.values(), clazz);
//        List<T> list = dao.findAll(spec, sort);
//        return list;
    }

    /**
     * 按页面传来的查询条件查询用户. 没有分页参数
     *
     * @param searchParams
     * @return
     */
    @DataPermission
    public List<T> findByParams(Map<String, Object> searchParams) {
        //TODO:
        return null;
//        Map<String, SearchFilter> filters = SearchFilter.parse(searchParams);
//        Specification<T> spec = DynamicSpecifications.bySearchFilter(
//                filters.values(), clazz);
//        List<T> list = dao.findAll(spec);
//        return list;
    }

    /**
     * 按页面传来的查询条件查询用户. 有分页参数
     *
     * @param searchParams
     * @param pageRequest
     * @return
     */
    @DataPermission
    public Page<T> findByParams(Map<String, Object> searchParams,
                                PageRequest pageRequest) {
        //TODO:
        return null;
//        Map<String, SearchFilter> filters = SearchFilter.parse(searchParams);
//        Specification<T> spec = DynamicSpecifications.bySearchFilter(
//                filters.values(), clazz);
//        Page<T> list = dao.findAll(spec, pageRequest);
//        return list;
    }

    /**
     * 按页面传来的查询条件查询用户. 有分页参数
     *
     * @param searchParams
     * @param pageRequest
     * @return
     */
    @SuppressWarnings("unchecked")
    @DataPermission
    public Map<String, Object> findByParamsMap(
            Map<String, Object> searchParams, PageRequest pageRequest) {
        //TODO:
        return null;
//        Map<String, SearchFilter> filters = SearchFilter.parse(searchParams);
//        Specification<T> spec = DynamicSpecifications.bySearchFilter(
//                filters.values(), clazz);
//        Page<T> list = dao.findAll(spec, pageRequest);
//        Map<String, Object> result = new HashMap<String, Object>();
//        result.put("total", list.getTotalElements());
//        result.put("rows", list.getContent());
//        return result;
    }

    /**
     * 根据条件做count统计
     *
     * @param searchParams
     * @return
     */
    @DataPermission
    public long count(Map<String, Object> searchParams) {
        //TODO:
        return 0l;
//        Map<String, SearchFilter> filters = SearchFilter.parse(searchParams);
//        Specification<T> spec = DynamicSpecifications.bySearchFilter(
//                filters.values(), clazz);
//        return dao.count(spec);
    }

}
