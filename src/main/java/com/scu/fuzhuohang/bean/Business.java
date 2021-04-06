package com.scu.fuzhuohang.bean;

/**
 * @Author Fuzhuoh
 * @Version 1.0
 * 对应数据库库中的 business 表，描述用户收货地址
 */
public class Business {
    private int Bid;
    private int Uid;
    private String Bname;
    private String BAddr;

    public int getBid() {
        return Bid;
    }

    public void setBid(int bid) {
        Bid = bid;
    }

    public int getUid() {
        return Uid;
    }

    public void setUid(int uid) {
        Uid = uid;
    }

    public String getBname() {
        return Bname;
    }

    public void setBname(String bname) {
        Bname = bname;
    }

    public String getBAddr() {
        return BAddr;
    }

    public void setBAddr(String bAddr) {
        this.BAddr = bAddr;
    }
}
