package com.entity;

/**
 * Created by qiuje on 2017/9/5.
 */
public class RentHouseImage {
    private int rentHouseImageId;
    private int rentHouseId;
    private String rentHouseImageName;
    public RentHouseImage(){}

    public int getRentHouseImageId() {
        return rentHouseImageId;
    }

    public void setRentHouseImageId(int rentHouseImageId) {
        this.rentHouseImageId = rentHouseImageId;
    }

    public int getRentHouseId() {
        return rentHouseId;
    }

    public void setRentHouseId(int rentHouseId) {
        this.rentHouseId = rentHouseId;
    }

    public String getRentHouseImageName() {
        return rentHouseImageName;
    }

    public void setRentHouseImageName(String rentHouseImageName) {
        this.rentHouseImageName = rentHouseImageName;
    }
}
