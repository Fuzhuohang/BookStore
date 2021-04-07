package com.scu.fuzhuohang.bean;

/**
 * @Author Fuzhuoh
 * @Version 1.0
 * 对应数据库库中的 user 表，描述用户收货地址
 */
public class User {
    private int Uid;
    private String Account;
    private String Password;
    private String Username;
    private String Tel;
    private String Email;
    private int IsBusiness;

    public int getUid() {
        return Uid;
    }

    public void setUid(int uid) {
        this.Uid = uid;
    }

    public String getAccount() {
        return Account;
    }

    public void setAccount(String account) {
        this.Account = account;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String password) {
        this.Password = password;
    }

    public String getUsername() {
        return Username;
    }

    public void setUsername(String username) {
        this.Username = username;
    }

    public String getTel() {
        return Tel;
    }

    public void setTel(String tel) {
        this.Tel = tel;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String email) {
        this.Email = email;
    }

    public int getIsBusiness() {
        return IsBusiness;
    }

    public void setIsBusiness(int isBusiness) {
        this.IsBusiness = isBusiness;
    }
}
