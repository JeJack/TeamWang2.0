package com.entity;

/**
 * Created by qiuje on 2017/9/6.
 */
public class BuildingImage {
    private int BuildingImageId;
    private int BuildingId;
    private String BuildingImageName;
    public BuildingImage(){}

    public int getBuildingImageId() {
        return BuildingImageId;
    }

    public void setBuildingImageId(int buildingImageId) {
        BuildingImageId = buildingImageId;
    }

    public int getBuildingId() {
        return BuildingId;
    }

    public void setBuildingId(int buildingId) {
        BuildingId = buildingId;
    }

    public String getBuildingImageName() {
        return BuildingImageName;
    }

    public void setBuildingImageName(String buildingImageName) {
        BuildingImageName = buildingImageName;
    }
}
