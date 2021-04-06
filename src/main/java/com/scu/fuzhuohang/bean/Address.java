package com.scu.fuzhuohang.bean;

/**
 * @Author Fuzhuoh
 * @Version 1.0
 * 对应数据库库中的 address 表，描述用户收货地址
 */
public class Address {
    private int AddrId;
    private int Uid;
    private String Name;
    private String Tel;
    private String Addr;

    public int getAddrId() {
        return AddrId;
    }

    public void setAddrId(int addrId) {
        AddrId = addrId;
    }

    public int getUid() {
        return Uid;
    }

    public void setUid(int uid) {
        Uid = uid;
    }

    public String getName() {
        return Name;
    }

    public void setName(String name) {
        Name = name;
    }

    public String getTel() {
        return Tel;
    }

    public void setTel(String tel) {
        Tel = tel;
    }

    public String getAddr() {
        return Addr;
    }

    public void setAddr(String addr) {
        Addr = addr;
    }
}
