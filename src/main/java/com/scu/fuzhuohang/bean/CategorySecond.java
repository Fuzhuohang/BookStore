package com.scu.fuzhuohang.bean;

/**
 * @Author Fuzhuoh
 * @Version 1.0
 * 对应数据库库中的 categorysecond 表，描述用户收货地址
 */
public class CategorySecond {
    private int Csid;
    private String Csname;
    private int Cateid;

    public int getCsid() {
        return Csid;
    }

    public void setCsid(int csid) {
        this.Csid = csid;
    }

    public String getCsname() {
        return Csname;
    }

    public void setCsname(String csname) {
        this.Csname = csname;
    }

    public int getCateid() {
        return Cateid;
    }

    public void setCateid(int cateid) {
        Cateid = cateid;
    }
}
