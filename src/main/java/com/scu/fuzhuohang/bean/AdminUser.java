package com.scu.fuzhuohang.bean;

/**
 * @Author Fuzhuoh
 * @Version 1.0
 * 对应数据库库中的 adminuser 表，描述用户收货地址
 */
public class AdminUser {
    private int Aid;
    private String Ausername;
    private String Apassword;

    public int getAid() {
        return Aid;
    }

    public void setAid(int aid) {
        Aid = aid;
    }

    public String getAusername() {
        return Ausername;
    }

    public void setAusername(String ausername) {
        Ausername = ausername;
    }

    public String getApassword() {
        return Apassword;
    }

    public void setApassword(String apassword) {
        Apassword = apassword;
    }
}
