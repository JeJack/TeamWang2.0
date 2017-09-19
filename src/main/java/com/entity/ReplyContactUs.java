package com.entity;

/**
 * Created by qiuje on 2017/9/18.
 */
public class ReplyContactUs {
    private int replyContactUsId;
    private String adminName;
    private int  contactUsId;
    private String reply;
    private Object replyTime;
    public ReplyContactUs(){}

    public int getReplyContactUsId() {
        return replyContactUsId;
    }

    public void setReplyContactUsId(int replyContactUsId) {
        this.replyContactUsId = replyContactUsId;
    }

    public String getAdminName() {
        return adminName;
    }

    public void setAdminName(String adminName) {
        this.adminName = adminName;
    }

    public int getContactUsId() {
        return contactUsId;
    }

    public void setContactUsId(int contactUsId) {
        this.contactUsId = contactUsId;
    }

    public String getReply() {
        return reply;
    }

    public void setReply(String reply) {
        this.reply = reply;
    }

    public Object getReplyTime() {
        return replyTime;
    }

    public void setReplyTime(Object replyTime) {
        this.replyTime = replyTime;
    }
}
