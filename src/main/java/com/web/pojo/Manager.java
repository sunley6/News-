package com.web.pojo;

public class Manager {
   private int Mid;

    private String Mname;

    private String Mpassword;

    private String imgurl;

    public String getMname() {
        return Mname;
    }

    public void setMname(String mname) {
        Mname = mname;
    }

    public String getMpassword() {
        return Mpassword;
    }

    public void setMpassword(String mpassword) {
        Mpassword = mpassword;
    }

    public int getMid() {
        return Mid;
    }

    public void setMid(int mid) {
        Mid = mid;
    }

    public String getImgurl() {
        return imgurl;
    }

    public void setImgurl(String imgurl) {
        this.imgurl = imgurl;
    }
}
