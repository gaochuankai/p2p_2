package com.hg.p2p_2.biz.system.dto;

import cn.afterturn.easypoi.excel.annotation.Excel;

import java.util.Date;

/**
 * Excel导入导出dto
 */
public class UserExcelDto {

    @Excel(name = "登录名", orderNum = "0")
    private String username;

    @Excel(name = "年龄", orderNum = "1")
    private String age;

    @Excel(name = "邮箱", orderNum = "2")
    private String email;

    @Excel(name = "手机号", orderNum = "3")
    private String telephone;

    @Excel(name = "状态", orderNum = "4")
    private String enableWapper;

    @Excel(name = "注册时间", exportFormat = "yyyy-MM-dd", orderNum = "5")
    private Date createtime;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
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

    public String getEnableWapper() {
        return enableWapper;
    }

    public void setEnableWapper(String enableWapper) {
        this.enableWapper = enableWapper;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }
}
