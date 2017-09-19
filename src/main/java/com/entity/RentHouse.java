package com.entity;


import java.sql.Date;

/**
 * Created by qiuje on 2017/9/4.
 */
public class RentHouse {
    private int rentHouseId;
    private String rentHouseName;
    private String rentHouseAddress;
    private int rentHouseArea;
    private String rentHouseBuildTime;//房子修建时间
    private int rentHouseHall;//厅，卧，卫
    private int rentHouseBedroom;
    private int rentHouseToilet;
    private String rentHouseFloor;
    private int rentHouseAllFloor;
    private int rentHousePrice;//每月租金
    private String rentHouseCity;//市
    private String rentHouseDistrict;//区
    private Object rentHousePublishTime;//发布出租的时间
    private String rentHouseRedecorated;
    private String rentHousePhone;
    private String rentHouseDescribe;
    private String rentHouseCategory;//显示自己的类别

    public RentHouse(){}

    public int getRentHouseId() {
        return rentHouseId;
    }

    public void setRentHouseId(int rentHouseId) {
        this.rentHouseId = rentHouseId;
    }

    public String getRentHouseName() {
        return rentHouseName;
    }

    public void setRentHouseName(String rentHouseName) {
        this.rentHouseName = rentHouseName;
    }

    public String getRentHouseAddress() {
        return rentHouseAddress;
    }

    public void setRentHouseAddress(String rentHouseAddress) {
        this.rentHouseAddress = rentHouseAddress;
    }

    public int getRentHouseArea() {
        return rentHouseArea;
    }

    public void setRentHouseArea(int rentHouseArea) {
        this.rentHouseArea = rentHouseArea;
    }

    public String getRentHouseBuildTime() {
        return rentHouseBuildTime;
    }

    public void setRentHouseBuildTime(String rentHouseBuildTime) {
        this.rentHouseBuildTime = rentHouseBuildTime;
    }

    public int getRentHouseHall() {
        return rentHouseHall;
    }

    public void setRentHouseHall(int rentHouseHall) {
        this.rentHouseHall = rentHouseHall;
    }

    public int getRentHouseBedroom() {
        return rentHouseBedroom;
    }

    public void setRentHouseBedroom(int rentHouseBedroom) {
        this.rentHouseBedroom = rentHouseBedroom;
    }

    public int getRentHouseToilet() {
        return rentHouseToilet;
    }

    public void setRentHouseToilet(int rentHouseToilet) {
        this.rentHouseToilet = rentHouseToilet;
    }

    public String getRentHouseFloor() {
        return rentHouseFloor;
    }

    public void setRentHouseFloor(String rentHouseFloor) {
        this.rentHouseFloor = rentHouseFloor;
    }

    public int getRentHouseAllFloor() {
        return rentHouseAllFloor;
    }

    public void setRentHouseAllFloor(int rentHouseAllFloor) {
        this.rentHouseAllFloor = rentHouseAllFloor;
    }

    public int getRentHousePrice() {
        return rentHousePrice;
    }

    public void setRentHousePrice(int rentHousePrice) {
        this.rentHousePrice = rentHousePrice;
    }

    public String getRentHouseCity() {
        return rentHouseCity;
    }

    public void setRentHouseCity(String rentHouseCity) {
        this.rentHouseCity = rentHouseCity;
    }

    public String getRentHouseDistrict() {
        return rentHouseDistrict;
    }

    public void setRentHouseDistrict(String rentHouseDistrict) {
        this.rentHouseDistrict = rentHouseDistrict;
    }

    public Object getRentHousePublishTime() {
        return rentHousePublishTime;
    }

    public void setRentHousePublishTime(Object rentHousePublishTime) {
        this.rentHousePublishTime = rentHousePublishTime;
    }

    public String getRentHouseRedecorated() {
        return rentHouseRedecorated;
    }

    public void setRentHouseRedecorated(String rentHouseRedecorated) {
        this.rentHouseRedecorated = rentHouseRedecorated;
    }

    public String getRentHousePhone() {
        return rentHousePhone;
    }

    public void setRentHousePhone(String rentHousePhone) {
        this.rentHousePhone = rentHousePhone;
    }

    public String getRentHouseDescribe() {
        return rentHouseDescribe;
    }

    public void setRentHouseDescribe(String rentHouseDescribe) {
        this.rentHouseDescribe = rentHouseDescribe;
    }

    public String getRentHouseCategory() {
        return rentHouseCategory;
    }

    public void setRentHouseCategory(String rentHouseCategory) {
        this.rentHouseCategory = rentHouseCategory;
    }
}
