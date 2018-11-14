package com.hg.p2p_2.biz.system.entity;

import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.hg.p2p_2.biz.base.entity.BaseEntity;
import com.hg.p2p_2.biz.tender.util.TenderUtil;

/**
 * 密码实体类
 */
@Entity
@Table(name = "tr_user_password")
public class PasswordEntity extends BaseEntity<Long>{
	/**
	 * 密码
	 */
	private String password;
	/**
	 * 密码类型
	 */
	private Integer type;
	 @Transient
	private String typeWapper;
	 /**
	     * 密码类型，0登录密码，1.支付密码，2，上一次密码，3，已用过密码
	     */
    public String getTypeWapper() {
        if (this.type == TenderUtil.TENDER_STATUS_0) {
            typeWapper = "登录密码";
        } else if (this.type == TenderUtil.TENDER_STATUS_1) {
            typeWapper = "支付密码";
        } else if (this.type == TenderUtil.TENDER_STATUS_2) {
            typeWapper = "上一次密码";
        } else if (this.type == TenderUtil.TENDER_STATUS_3) {
            typeWapper = "以用过密码";
        }  else {
            typeWapper = "类型错误";
        }
        return typeWapper;
    }

    public void setTypeWapper(String typeWapper) {
        this.typeWapper = typeWapper;
    }
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	
	
}
