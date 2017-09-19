package com.entity;

import java.sql.Date;

/**
 * Created by qiuje on 2017/9/8.
 */
public class OwnerTopicComment {
    private int ownerTopicCommentId;
    private int ownerTopicUserId;
    private int ownerTopicId;
    private String comment;
    private Object commentTime;

    public OwnerTopicComment(){}

    public int getOwnerTopicCommentId() {
        return ownerTopicCommentId;
    }

    public void setOwnerTopicCommentId(int ownerTopicCommentId) {
        this.ownerTopicCommentId = ownerTopicCommentId;
    }

    public int getOwnerTopicUserId() {
        return ownerTopicUserId;
    }

    public void setOwnerTopicUserId(int ownerTopicUserId) {
        this.ownerTopicUserId = ownerTopicUserId;
    }

    public int getOwnerTopicId() {
        return ownerTopicId;
    }

    public void setOwnerTopicId(int ownerTopicId) {
        this.ownerTopicId = ownerTopicId;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Object getCommentTime() {
        return commentTime;
    }
    public void setCommentTime(Object commentTime) {
        this.commentTime = commentTime;
    }
}
