package com.hg.p2p_2.biz.base.util;

import java.util.List;

public class Page<T> {
    //pageNum当前页
    private long pageNum;
    //size每页条数
    private long size;
    //end最大页数
    private long end;
    //total总条数
    private long total;
    //data
    private List<T> data;

    public long getPageNum() {
        return pageNum;
    }

    public void setPageNum(long pageNum) {
        this.pageNum = pageNum;
    }

    public long getSize() {
        return size;
    }

    public void setSize(long size) {
        this.size = size;
    }

    public long getEnd() {
        return end;
    }

    public void setEnd(long end) {
        this.end = end;
    }

    public long getTotal() {
        return total;
    }

    public void setTotal(long total) {
        this.total = total;
    }

    public List<T> getData() {
        return data;
    }

    public void setData(List<T> data) {
        this.data = data;
    }
}
