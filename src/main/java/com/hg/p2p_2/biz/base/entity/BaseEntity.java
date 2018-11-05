package com.hg.p2p_2.biz.base.entity;


import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * 所有实体类的基础类
 *
 * @param <PK>
 */
@MappedSuperclass
public class BaseEntity<PK extends Serializable> extends IdEntity<PK> implements
        Serializable {

    /**
     * uuid
     */
    @Column(insertable = true, updatable = false)
    protected String uuid;

    /**
     * 创建时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+08:00")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Column(insertable = true, updatable = false)
    protected Date createtime = new Date();

    /**
     * 创建人ID
     */
    @Column(insertable = true, updatable = false)
    protected Long createbyid;

    public String getUuid() {
        return uuid;
    }

    public void setUuid(String uuid) {
        this.uuid = uuid;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public Long getCreatebyid() {
        return createbyid;
    }

    public void setCreatebyid(Long createbyid) {
        this.createbyid = createbyid;
    }
}
