package com.scu.fuzhuohang.bean;

/**
 * @Author Fuzhuoh
 * @Version 1.0
 * 对应数据库库中的 product 表，描述用户收货地址
 */
public class Product {
    private int Pid;
    private int Bid;
    private String Pname;
    private double Price;
    private int Pnum;
    private String Pdesc;
    private String Image;
    private int Csid;

    public int getPid() {
        return Pid;
    }

    public void setPid(int pid) {
        Pid = pid;
    }

    public int getBid() {
        return Bid;
    }

    public void setBid(int bid) {
        Bid = bid;
    }

    public String getPname() {
        return Pname;
    }

    public void setPname(String pname) {
        Pname = pname;
    }

    public double getPrice() {
        return Price;
    }

    public void setPrice(double price) {
        Price = price;
    }

    public int getPnum() {
        return Pnum;
    }

    public void setPnum(int pnum) {
        Pnum = pnum;
    }

    public String getPdesc() {
        return Pdesc;
    }

    public void setPdesc(String pdesc) {
        Pdesc = pdesc;
    }

    public String getImage() {
        return Image;
    }

    public void setImage(String image) {
        Image = image;
    }

    public int getCsid() {
        return Csid;
    }

    public void setCsid(int csid) {
        Csid = csid;
    }
}
