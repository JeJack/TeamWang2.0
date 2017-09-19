package com.entity;

/**
 * Created by qiuje on 2017/9/14.
 */
public class UserApply {
    private int userApplyId;
    private String userName;
    private String userPhoneNum;
    private String applyCategory;
    private int categoryId;
    private Object applyTime;
    public UserApply(){}

    public int getUserApplyId() {
        return userApplyId;
    }

    public void setUserApplyId(int userApplyId) {
        this.userApplyId = userApplyId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserPhoneNum() {
        return userPhoneNum;
    }

    public void setUserPhoneNum(String userPhoneNum) {
        this.userPhoneNum = userPhoneNum;
    }

    public String getApplyCategory() {
        return applyCategory;
    }

    public void setApplyCategory(String applyCategory) {
        this.applyCategory = applyCategory;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public Object getApplyTime() {
        return applyTime;
    }

    public void setApplyTime(Object applyTime) {
        this.applyTime = applyTime;
    }
}
