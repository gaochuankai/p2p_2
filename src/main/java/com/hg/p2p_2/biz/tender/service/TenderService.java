package com.hg.p2p_2.biz.tender.service;

import com.hg.p2p_2.biz.base.datapermission.DataPermission;
import com.hg.p2p_2.biz.base.log.BusinessLog;
import com.hg.p2p_2.biz.base.service.BaseService;
import com.hg.p2p_2.biz.tender.dao.TenderDao;
import com.hg.p2p_2.biz.tender.entity.TenderEntity;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

/**
 * 标 - service层
 */
@Component
@Transactional
@BusinessLog(service = "标管理")
@DataPermission
public class TenderService extends BaseService<TenderEntity, TenderDao> {
}
