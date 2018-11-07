package com.hg.p2p_2.biz.system.service;

import com.hg.p2p_2.biz.base.datapermission.DataPermission;
import com.hg.p2p_2.biz.base.log.BusinessLog;
import com.hg.p2p_2.biz.base.service.BaseService;
import com.hg.p2p_2.biz.system.dao.UserDao;
import com.hg.p2p_2.biz.system.entity.UserEntity;
import com.hg.p2p_2.biz.system.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.Map;

/**
 * 用户service层
 */
@Component
@Transactional
@BusinessLog(service = "用户信息")
@DataPermission
public class UserService extends BaseService<UserEntity, UserDao> {

    @Autowired
    private UserMapper userMapper;

    /**
     * 依据电话查询用户
     *
     * @param searchParameters
     * @return user
     */
    public UserEntity findOneByTelphone(Map<String, Object> searchParameters) {
        return userMapper.findOneByTelphone(searchParameters);
    }
}
