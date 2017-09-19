package com.entity;

/**
 * Created by qiuje on 2017/9/8.
 */
public class UserCollection {
    private int userCollectionId;
    private int userId;
    private String collectionCategory;
    private int collectionCategoryId;

    public UserCollection(){}

    public int getUserCollectionId() {
        return userCollectionId;
    }

    public void setUserCollectionId(int userCollectionId) {
        this.userCollectionId = userCollectionId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getCollectionCategory() {
        return collectionCategory;
    }

    public void setCollectionCategory(String collectionCategory) {
        this.collectionCategory = collectionCategory;
    }

    public int getCollectionCategoryId() {
        return collectionCategoryId;
    }

    public void setCollectionCategoryId(int collectionCategoryId) {
        this.collectionCategoryId = collectionCategoryId;
    }
}
