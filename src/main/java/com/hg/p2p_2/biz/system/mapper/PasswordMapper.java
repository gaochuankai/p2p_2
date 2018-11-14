package com.hg.p2p_2.biz.system.mapper;

import org.springframework.stereotype.Repository;

import com.hg.p2p_2.biz.system.entity.PasswordEntity;

/**
 * mybatis-dao层
 */
@Repository
public interface PasswordMapper {
	//根据用户id和支付密码类型获取支付密码
	PasswordEntity findPasswordByUserId(Long id, Integer passwordType1);

}
