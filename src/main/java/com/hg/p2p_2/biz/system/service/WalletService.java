package com.hg.p2p_2.biz.system.service;

import com.hg.p2p_2.biz.base.datapermission.DataPermission;
import com.hg.p2p_2.biz.base.log.BusinessLog;
import com.hg.p2p_2.biz.base.service.BaseService;
import com.hg.p2p_2.biz.system.dao.WalletDao;
import com.hg.p2p_2.biz.system.entity.WalletEntity;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

/**
 * 钱包service层
 */
@Component
@Transactional
@BusinessLog(service = "钱包信息")
@DataPermission
public class WalletService extends BaseService<WalletEntity, WalletDao> {
}
