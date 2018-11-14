package com.hg.p2p_2.biz.tender.service;

import com.hg.p2p_2.biz.base.datapermission.DataPermission;
import com.hg.p2p_2.biz.base.log.BusinessLog;
import com.hg.p2p_2.biz.base.service.BaseService;
import com.hg.p2p_2.biz.tender.dao.TenderDetailDao;
import com.hg.p2p_2.biz.tender.entity.TenderDetailEntity;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

/**
 * 标 - 详情 - service层
 */
@Component
@Transactional
@BusinessLog(service = "标详情管理")
@DataPermission
public class TenderDetailService extends BaseService<TenderDetailEntity, TenderDetailDao> {
}
