package com.scu.fuzhuohang.bean;

/**
 * @Author Fuzhuoh
 * @Version 1.0
 * 对应数据库库中的 categorysecond 表，描述用户收货地址
 */
public class CategorySecond {
    private int CSid;
    private String CSname;
    private int Cateid;

    public int getCSid() {
        return CSid;
    }

    public void setCSid(int cSid) {
        this.CSid = cSid;
    }

    public String getCSname() {
        return CSname;
    }

    public void setCSname(String cSname) {
        this.CSname = cSname;
    }

    public int getCateid() {
        return Cateid;
    }

    public void setCateid(int cateid) {
        Cateid = cateid;
    }
}
