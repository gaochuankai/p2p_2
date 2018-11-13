package com.hg.p2p_2.biz.tender.dto;

import cn.afterturn.easypoi.excel.annotation.Excel;

import javax.persistence.Transient;
import java.util.Date;

/**
 * Excel导入导出dto
 */
public class TenderExcelDto {

    /**
     * 贷款总金额
     */
    @Excel(name = "贷款总金额", orderNum = "1")
    private Double allmoney;

    /**
     * 标题
     */
    @Excel(name = "标题", orderNum = "2")
    private String title;

    /**
     * 描述
     */
    @Excel(name = "描述", orderNum = "3")
    private String description;

    /**
     * 标状态，0未发标，1.投标中，2，未完成投标、流标，3还款中，4完成、结束
     */
    @Excel(name = "标状态", orderNum = "4")
    private String statusWapper;

    /**
     * 创建时间
     */
    @Excel(name = "发标时间", orderNum = "5", exportFormat = "yyyy-MM-dd")
    private Date createtime;

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

    public String getStatusWapper() {
        return statusWapper;
    }

    public void setStatusWapper(String statusWapper) {
        this.statusWapper = statusWapper;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }
}
