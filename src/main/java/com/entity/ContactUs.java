package com.entity;

/**
 * Created by qiuje on 2017/9/18.
 */
public class ContactUs {
    private int  contactUsId;
    private int userId;
    private String theme;
    private String faq;
    private Object Ctime;
    public ContactUs(){}

    public int getContactUsId() {
        return contactUsId;
    }

    public void setContactUsId(int contactUsId) {
        this.contactUsId = contactUsId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getTheme() {
        return theme;
    }

    public void setTheme(String theme) {
        this.theme = theme;
    }

    public String getFaq() {
        return faq;
    }

    public void setFaq(String faq) {
        this.faq = faq;
    }

    public Object getCtime() {
        return Ctime;
    }

    public void setCtime(Object ctime) {
        Ctime = ctime;
    }
}
