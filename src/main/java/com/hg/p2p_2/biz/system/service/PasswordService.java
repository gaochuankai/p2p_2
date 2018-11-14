package com.hg.p2p_2.biz.system.service;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.hg.p2p_2.biz.base.datapermission.DataPermission;
import com.hg.p2p_2.biz.base.log.BusinessLog;
import com.hg.p2p_2.biz.base.service.BaseService;
import com.hg.p2p_2.biz.system.dao.PasswordDao;
import com.hg.p2p_2.biz.system.entity.PasswordEntity;

/**
 * 密码service层
 */
@Component
@Transactional
@BusinessLog(service = "密码相关信息")
@DataPermission
public class PasswordService extends BaseService<PasswordEntity, PasswordDao>{
}
