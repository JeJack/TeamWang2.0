package com.entity;


import java.sql.Date;

/**
 * Created by qiuje on 2017/9/6.
 */
public class Building {
    private int buildingId;
    private String buildingName;
    private String buildingAddress;
    private int buildingArea;
    private int buildingHall;//厅，卧，卫
    private int buildingBedroom;
    private int buildingToilet;
    private String buildingFloor;
    private int buildingAllFloor;
    private int buildingPrice;//每平米 价格
    private String buildingCity;//市
    private String buildingDistrict;//区
    private String buildingRedecorated;
    private String buildingPhone;
    private Object buildingPublishTime;//登记出卖时间
    private String buildingTrafficInfo;
    private String buildingProjectMatching;
    private String buildingCharacteristic;
    private String buildingProjectBrief;
    private String buildingCategory;
    private String buildingGreeningRate;
    private String buildingPlotRatio;//容积率
    private int buildingSumNum;
    private String buildingPropertyCompany;
    private String buildingHousehold;
    private String buildingPark;
    private String buildingTimeHanded;


    public Building(){}

    public int getBuildingId() {
        return buildingId;
    }

    public void setBuildingId(int buildingId) {
        this.buildingId = buildingId;
    }

    public String getBuildingName() {
        return buildingName;
    }

    public void setBuildingName(String buildingName) {
        this.buildingName = buildingName;
    }

    public String getBuildingAddress() {
        return buildingAddress;
    }

    public void setBuildingAddress(String buildingAddress) {
        this.buildingAddress = buildingAddress;
    }

    public int getBuildingArea() {
        return buildingArea;
    }

    public void setBuildingArea(int buildingArea) {
        this.buildingArea = buildingArea;
    }

    public int getBuildingHall() {
        return buildingHall;
    }

    public void setBuildingHall(int buildingHall) {
        this.buildingHall = buildingHall;
    }

    public int getBuildingBedroom() {
        return buildingBedroom;
    }

    public void setBuildingBedroom(int buildingBedroom) {
        this.buildingBedroom = buildingBedroom;
    }

    public int getBuildingToilet() {
        return buildingToilet;
    }

    public void setBuildingToilet(int buildingToilet) {
        this.buildingToilet = buildingToilet;
    }

    public String getBuildingFloor() {
        return buildingFloor;
    }

    public void setBuildingFloor(String buildingFloor) {
        this.buildingFloor = buildingFloor;
    }

    public int getBuildingAllFloor() {
        return buildingAllFloor;
    }

    public void setBuildingAllFloor(int buildingAllFloor) {
        this.buildingAllFloor = buildingAllFloor;
    }

    public int getBuildingPrice() {
        return buildingPrice;
    }

    public void setBuildingPrice(int buildingPrice) {
        this.buildingPrice = buildingPrice;
    }

    public String getBuildingCity() {
        return buildingCity;
    }

    public void setBuildingCity(String buildingCity) {
        this.buildingCity = buildingCity;
    }

    public String getBuildingDistrict() {
        return buildingDistrict;
    }

    public void setBuildingDistrict(String buildingDistrict) {
        this.buildingDistrict = buildingDistrict;
    }

    public String getBuildingRedecorated() {
        return buildingRedecorated;
    }

    public void setBuildingRedecorated(String buildingRedecorated) {
        this.buildingRedecorated = buildingRedecorated;
    }

    public String getBuildingPhone() {
        return buildingPhone;
    }

    public void setBuildingPhone(String buildingPhone) {
        this.buildingPhone = buildingPhone;
    }

    public Object getBuildingPublishTime() {
        return buildingPublishTime;
    }

    public void setBuildingPublishTime(Object buildingPublishTime) {
        this.buildingPublishTime = buildingPublishTime;
    }

    public String getBuildingCategory() {
        return buildingCategory;
    }

    public String getBuildingTrafficInfo() {
        return buildingTrafficInfo;
    }

    public void setBuildingTrafficInfo(String buildingTrafficInfo) {
        this.buildingTrafficInfo = buildingTrafficInfo;
    }

    public String getBuildingProjectMatching() {
        return buildingProjectMatching;
    }

    public void setBuildingProjectMatching(String buildingProjectMatching) {
        this.buildingProjectMatching = buildingProjectMatching;
    }

    public String getBuildingCharacteristic() {
        return buildingCharacteristic;
    }

    public void setBuildingCharacteristic(String buildingCharacteristic) {
        this.buildingCharacteristic = buildingCharacteristic;
    }

    public String getBuildingProjectBrief() {
        return buildingProjectBrief;
    }

    public void setBuildingProjectBrief(String buildingProjectBrief) {
        this.buildingProjectBrief = buildingProjectBrief;
    }

    public String getBuildingGreeningRate() {
        return buildingGreeningRate;
    }

    public void setBuildingGreeningRate(String buildingGreeningRate) {
        this.buildingGreeningRate = buildingGreeningRate;
    }

    public String getBuildingPlotRatio() {
        return buildingPlotRatio;
    }

    public void setBuildingPlotRatio(String buildingPlotRatio) {
        this.buildingPlotRatio = buildingPlotRatio;
    }

    public int getBuildingSumNum() {
        return buildingSumNum;
    }

    public void setBuildingSumNum(int buildingSumNum) {
        this.buildingSumNum = buildingSumNum;
    }

    public String getBuildingPropertyCompany() {
        return buildingPropertyCompany;
    }

    public void setBuildingPropertyCompany(String buildingPropertyCompany) {
        this.buildingPropertyCompany = buildingPropertyCompany;
    }

    public String getBuildingHousehold() {
        return buildingHousehold;
    }

    public void setBuildingHousehold(String buildingHousehold) {
        this.buildingHousehold = buildingHousehold;
    }

    public String getBuildingPark() {
        return buildingPark;
    }

    public void setBuildingPark(String buildingPark) {
        this.buildingPark = buildingPark;
    }

    public void setBuildingCategory(String buildingCategory) {
        this.buildingCategory = buildingCategory;
    }

    public String getBuildingTimeHanded() {
        return buildingTimeHanded;
    }

    public void setBuildingTimeHanded(String buildingTimeHanded) {
        this.buildingTimeHanded = buildingTimeHanded;
    }
}
