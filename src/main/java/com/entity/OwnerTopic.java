package com.entity;

import java.sql.Date;

/**
 * Created by qiuje on 2017/9/8.
 */
public class OwnerTopic {
    private int ownerTopicId;
    private int ownerUserId;
    private String ownerTopicTheme;
    private String ownerTopic;
    private Object ownerTopicTime;

    public OwnerTopic(){}

    public int getOwnerTopicId() {
        return ownerTopicId;
    }

    public void setOwnerTopicId(int ownerTopicId) {
        this.ownerTopicId = ownerTopicId;
    }

    public int getOwnerUserId() {
        return ownerUserId;
    }
    public void setOwnerUserId(int ownerUserId) {
        this.ownerUserId = ownerUserId;
    }

    public String getOwnerTopicTheme() {
        return ownerTopicTheme;
    }

    public void setOwnerTopicTheme(String ownerTopicTheme) {
        this.ownerTopicTheme = ownerTopicTheme;
    }

    public String getOwnerTopic() {
        return ownerTopic;
    }

    public void setOwnerTopic(String ownerTopic) {
        this.ownerTopic = ownerTopic;
    }

    public Object getOwnerTopicTime() {
        return ownerTopicTime;
    }

    public void setOwnerTopicTime(Object ownerTopicTime) {
        this.ownerTopicTime = ownerTopicTime;
    }
}
