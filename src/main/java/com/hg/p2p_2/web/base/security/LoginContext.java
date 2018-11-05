package com.hg.p2p_2.web.base.security;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.io.Serializable;
import java.util.Date;
import java.util.Properties;

/**
 * 当前登录用户上下文信息
 */
public class LoginContext implements Serializable {

    /**
     * 用户id
     */
    private Long userId;
    /**
     * 用户名:idcard
     */
    private String userName;
    /**
     * 真名
     */
    private String realName;
    /**
     * 访问IP地址
     */
    private String ip;
    /**
     * 其他属性信息
     */
    private Properties properties = new Properties();
    /**
     * 客户端访问语言
     */
    private String language;
    /**
     * 密碼
     */
    private String password;
    /**
     * 可逆密碼
     */
    private String reversiblePassword;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+08:00")
    private Date createTime;

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public Properties getProperties() {
        return properties;
    }

    public void setProperties(Properties properties) {
        this.properties = properties;
    }

    public String getLanguage() {
        return language;
    }

    public void setLanguage(String language) {
        this.language = language;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getReversiblePassword() {
        return reversiblePassword;
    }

    public void setReversiblePassword(String reversiblePassword) {
        this.reversiblePassword = reversiblePassword;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}
