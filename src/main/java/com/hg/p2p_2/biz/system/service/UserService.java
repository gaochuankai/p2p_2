package com.hg.p2p_2.biz.system.service;

import com.hg.p2p_2.biz.base.datapermission.DataPermission;
import com.hg.p2p_2.biz.base.log.BusinessLog;
import com.hg.p2p_2.biz.base.service.BaseService;
import com.hg.p2p_2.biz.system.dao.UserDao;
import com.hg.p2p_2.biz.system.entity.UserEntity;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

@Component
@Transactional
@BusinessLog(service = "会议纪要")
@DataPermission
public class UserService extends BaseService<UserEntity, UserDao> {
}
