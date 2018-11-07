package com.hg.p2p_2.biz.system.entity;

import com.hg.p2p_2.biz.base.entity.BaseEntity;
import com.hg.p2p_2.biz.system.util.UserUtils;

import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Transient;

/**
 * user实体类
 */
@Entity
@Table(name = "tr_system_user")
public class UserEntity extends BaseEntity<Long> {

    /**
     * 登录名
     */
    private String username;

    /**
     * 密码
     */
    private String password;

    /**
     * 年龄
     */
    private Integer age = 0;

    /**
     * 邮箱
     */
    private String email;

    /**
     * 手机号
     */
    private String telephone;

    /**
     * 账户状态可不可用
     */
    private Integer enable;
    @Transient
    private String enableWapper;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public Integer getEnable() {
        return enable;
    }

    public void setEnable(Integer enable) {
        this.enable = enable;
    }

    public String getEnableWapper() {
        if (this.enable == UserUtils.USER_ENABLE_0) {
            enableWapper = "可用";
        } else if (this.enable == UserUtils.USER_ENABLE_1) {
            enableWapper = "禁用";
        } else if (this.enable == UserUtils.USER_ENABLE_2) {
            enableWapper = "未完善信息";
        } else {
            enableWapper = "禁用";
        }
        return enableWapper;
    }

    public void setEnableWapper(String enableWapper) {
        this.enableWapper = enableWapper;
    }
}
