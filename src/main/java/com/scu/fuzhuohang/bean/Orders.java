package com.scu.fuzhuohang.bean;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.sql.Date;

/**
 * @Author Fuzhuoh
 * @Version 1.0
 * 对应数据库库中的 orders 表，描述用户收货地址
 * Ostate:
 *      0: 草稿
 *      1: 下单
 *      2: 运输中
 *      3: 确认收货
 */
public class Orders {
    private int Oid;
    private int Uid;
    private int Bid;
    private int Pid;
    private int Pnum;
    private double Money;
    private int Ostate;
    private int AddrId;
    private double Total;

    @JsonFormat(pattern = "yyyy-MM-dd",timezone = "GMT+8")
    private Date Time;

    public int getOid() {
        return Oid;
    }

    public void setOid(int oid) {
        Oid = oid;
    }

    public int getUid() {
        return Uid;
    }

    public void setUid(int uid) {
        Uid = uid;
    }

    public int getBid() {
        return Bid;
    }

    public void setBid(int bid) {
        Bid = bid;
    }

    public int getPid() {
        return Pid;
    }

    public void setPid(int pid) {
        Pid = pid;
    }

    public int getPnum() {
        return Pnum;
    }

    public void setPnum(int pnum) {
        Pnum = pnum;
    }

    public double getMoney() {
        return Money;
    }

    public void setMoney(double money) {
        Money = money;
    }

    public int getOstate() {
        return Ostate;
    }

    public void setOstate(int ostate) {
        Ostate = ostate;
    }

    public int getAddrId() {
        return AddrId;
    }

    public void setAddrId(int addrId) {
        AddrId = addrId;
    }

    public Date getTime() {
        return Time;
    }

    public void setTime(Date time) {
        Time = time;
    }

    public double getTotal() {
        return Total;
    }

    public void setTotal(double total) {
        Total = total;
    }
}
