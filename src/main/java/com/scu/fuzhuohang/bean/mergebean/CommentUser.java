package com.scu.fuzhuohang.bean.mergebean;

/**
 * @Author Fuzhuoh
 * @Date 2021/4/13 17:20
 * @Version 1.0
 */
public class CommentUser {
    private int Cid;
    private int Pid;
    private double Score;
    private String Comm;
    private String Username;
    private String Pname;
    private String Bname;

    public int getCid() {
        return Cid;
    }

    public void setCid(int cid) {
        Cid = cid;
    }

    public int getPid() {
        return Pid;
    }

    public void setPid(int pid) {
        Pid = pid;
    }

    public double getScore() {
        return Score;
    }

    public void setScore(double score) {
        this.Score = score;
    }

    public String getComm() {
        return Comm;
    }

    public void setComm(String comm) {
        Comm = comm;
    }

    public String getUsername() {
        return Username;
    }

    public void setUsername(String username) {
        Username = username;
    }

    public String getPname() {
        return Pname;
    }

    public void setPname(String pname) {
        Pname = pname;
    }

    public String getBname() {
        return Bname;
    }

    public void setBname(String bname) {
        Bname = bname;
    }
}
