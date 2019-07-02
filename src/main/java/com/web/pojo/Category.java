package com.web.pojo;

public class Category {
    private int categoryId;

    private String categoryName;

    private  String categoryImgurl;

    private String categoryUrl;

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public String getCategoryImgurl() {
        return categoryImgurl;
    }

    public void setCategoryImgurl(String categoryImgurl) {
        this.categoryImgurl = categoryImgurl;
    }

    public String getCategoryUrl() {
        return categoryUrl;
    }

    public void setCategoryUrl(String categoryUrl) {
        this.categoryUrl = categoryUrl;
    }
}
