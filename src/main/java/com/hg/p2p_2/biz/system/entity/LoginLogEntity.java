package com.hg.p2p_2.biz.system.entity;

import com.hg.p2p_2.biz.base.entity.BaseEntity;

import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * 登录日志表
 */
@Entity
@Table(name = "tc_login_log")
public class LoginLogEntity extends BaseEntity<Long> {

    /**
     * 登录方式
     */
    private String loginmode;

    /**
     * 登录设备的ip
     */
    private String ipaddress;

    /**
     * 登录设备名
     */
    private String osname;

    /**
     * 登录设备版本
     */
    private String osversion;

    /**
     * 登录设备
     */
    private String osarch;

    /**
     * 登录设备标识
     */
    private String osuuid;

    /**
     * 登录设备
     */
    private String remotehost;

    /**
     * 登录设备
     */
    private String useragent;

    public String getLoginmode() {
        return loginmode;
    }

    public void setLoginmode(String loginmode) {
        this.loginmode = loginmode;
    }

    public String getIpaddress() {
        return ipaddress;
    }

    public void setIpaddress(String ipaddress) {
        this.ipaddress = ipaddress;
    }

    public String getOsname() {
        return osname;
    }

    public void setOsname(String osname) {
        this.osname = osname;
    }

    public String getOsversion() {
        return osversion;
    }

    public void setOsversion(String osversion) {
        this.osversion = osversion;
    }

    public String getOsarch() {
        return osarch;
    }

    public void setOsarch(String osarch) {
        this.osarch = osarch;
    }

    public String getOsuuid() {
        return osuuid;
    }

    public void setOsuuid(String osuuid) {
        this.osuuid = osuuid;
    }

    public String getRemotehost() {
        return remotehost;
    }

    public void setRemotehost(String remotehost) {
        this.remotehost = remotehost;
    }

    public String getUseragent() {
        return useragent;
    }

    public void setUseragent(String useragent) {
        this.useragent = useragent;
    }
}
