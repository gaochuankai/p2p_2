package com.hg.p2p_2.biz.system.mapper;

import com.hg.p2p_2.biz.system.entity.UserEntity;
import org.springframework.stereotype.Repository;

import java.util.Map;

/**
 * mybatis-dao层
 */
@Repository
public interface UserMapper {

    /**
     * 依据telphone查询
     *
     * @param searchParameters
     * @return
     */
    UserEntity findOneByTelphone(Map<String, Object> searchParameters);
}
