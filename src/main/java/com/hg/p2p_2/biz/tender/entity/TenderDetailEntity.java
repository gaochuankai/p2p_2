package com.hg.p2p_2.biz.tender.entity;

import com.hg.p2p_2.biz.base.entity.BaseEntity;
import org.hibernate.annotations.Formula;

import javax.persistence.*;

/**
 * 标-详情 - entity
 */
@Entity
@Table(name = "tc_tender_detail")
public class TenderDetailEntity extends BaseEntity<Long> {

    /**
     * 主表信息 tender
     */
    @ManyToOne
    @JoinColumn(name = "tenderid")
    private TenderEntity tenderEntity;

    /**
     * 状态
     */
    private Integer status;
    @Transient
    private String statusWapper;

    /**
     * 交易金额
     */
    private Double dealmoney;

    /**
     * 交易人姓名
     */
    @Formula(value = "(select t.name from tr_system_user t  where t.id = createbyid)")
    private String createUserName;

    public TenderEntity getTenderEntity() {
        return tenderEntity;
    }

    public void setTenderEntity(TenderEntity tenderEntity) {
        this.tenderEntity = tenderEntity;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getStatusWapper() {
        return statusWapper;
    }

    public void setStatusWapper(String statusWapper) {
        this.statusWapper = statusWapper;
    }

    public Double getDealmoney() {
        return dealmoney;
    }

    public void setDealmoney(Double dealmoney) {
        this.dealmoney = dealmoney;
    }

    public String getCreateUserName() {
        return createUserName;
    }

    public void setCreateUserName(String createUserName) {
        this.createUserName = createUserName;
    }
}
