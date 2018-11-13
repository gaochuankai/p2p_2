package com.hg.p2p_2.biz.tender.entity;

import com.hg.p2p_2.biz.base.entity.BaseEntity;
import com.hg.p2p_2.biz.tender.util.TenderUtil;

import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Transient;

/**
 * 标 entity
 */
@Entity
@Table(name = "tr_tender")
public class TenderEntity extends BaseEntity<Long> {

    /**
     * 贷款总金额
     */
    private Double allmoney;

    /**
     * 标题
     */
    private String title;

    /**
     * 描述
     */
    private String description;

    /**
     * 标状态，0未发标，1.投标中，2，未完成投标、流标，3还款中，4完成、结束
     */
    private Integer status;
    @Transient
    private String statusWapper;

    public Double getAllmoney() {
        return allmoney;
    }

    public void setAllmoney(Double allmoney) {
        this.allmoney = allmoney;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    /**
     * 标状态，0未发标，1.投标中，2，未完成投标、流标，3还款中，4完成、结束
     */
    public String getStatusWapper() {
        if (this.status == TenderUtil.TENDER_STATUS_0) {
            statusWapper = "未发标";
        } else if (this.status == TenderUtil.TENDER_STATUS_1) {
            statusWapper = "投标中";
        } else if (this.status == TenderUtil.TENDER_STATUS_2) {
            statusWapper = "流标";
        } else if (this.status == TenderUtil.TENDER_STATUS_3) {
            statusWapper = "还款中";
        } else if (this.status == TenderUtil.TENDER_STATUS_4) {
            statusWapper = "完成";
        } else {
            statusWapper = "状态错误";
        }
        return statusWapper;
    }

    public void setStatusWapper(String statusWapper) {
        this.statusWapper = statusWapper;
    }
}
