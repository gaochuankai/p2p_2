package com.hg.p2p_2.biz.tender.mapper;

import com.hg.p2p_2.biz.tender.entity.TenderDetailEntity;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * mybatis-dao层
 */
@Repository
public interface TenderDetailMapper {

    /**
     * 分页查询-条件查询-每页list
     *
     * @param searchParams
     * @return list
     */
    List<TenderDetailEntity> findList(Map<String, Object> searchParams);

    /**
     * 分页查询-条件查询-总共数量
     *
     * @param searchParams
     * @return list
     */
    Long count(Map<String, Object> searchParams);

}
