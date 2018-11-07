package com.hg.p2p_2.biz.system.service;

import com.hg.p2p_2.biz.base.datapermission.DataPermission;
import com.hg.p2p_2.biz.base.log.BusinessLog;
import com.hg.p2p_2.biz.base.service.BaseService;
import com.hg.p2p_2.biz.system.dao.LoginLogDao;
import com.hg.p2p_2.biz.system.entity.LoginLogEntity;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

/**
 * 登录日志的service
 */
@Component
@Transactional
@BusinessLog(service = "用户信息")
@DataPermission
public class LoginLogService extends BaseService<LoginLogEntity, LoginLogDao> {
}
