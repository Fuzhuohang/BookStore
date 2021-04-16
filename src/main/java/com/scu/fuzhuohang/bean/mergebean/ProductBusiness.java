package com.scu.fuzhuohang.bean.mergebean;

/**
 * @Author Fuzhuoh
 * @Date 2021/4/13 10:43
 * @Version 1.0
 */
public class ProductBusiness {
    private int Pid;
    private String Pname;
    private double Price;
    private String Image;
    private int Csid;
    private String Bname;
    private int Bid;

    public int getPid() {
        return Pid;
    }

    public void setPid(int pid) {
        Pid = pid;
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

    public String getBname() {
        return Bname;
    }

    public void setBname(String bname) {
        Bname = bname;
    }

    public int getBid() {
        return Bid;
    }

    public void setBid(int bid) {
        Bid = bid;
    }
}
