package com.hg.p2p_2.biz.system.entity;

import com.hg.p2p_2.biz.base.entity.BaseEntity;

import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * 实体类
 */
@Entity
@Table(name = "tc_wallet")
public class WalletEntity extends BaseEntity<Long> {

    /**
     * 可用金额
     */
    private Double availablemaney;

    /**
     * 冻结金额
     */
    private Double freezingmaney;

    /**
     * 信用积分
     */
    private Long creditvalue;

    public Double getAvailablemaney() {
        return availablemaney;
    }

    public void setAvailablemaney(Double availablemaney) {
        this.availablemaney = availablemaney;
    }

    public Double getFreezingmaney() {
        return freezingmaney;
    }

    public void setFreezingmaney(Double freezingmaney) {
        this.freezingmaney = freezingmaney;
    }

    public Long getCreditvalue() {
        return creditvalue;
    }

    public void setCreditvalue(Long creditvalue) {
        this.creditvalue = creditvalue;
    }
}
