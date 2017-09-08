package com.dao;

import com.entity.Building;
import com.util.DBHelper;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 * Created by qiuje on 2017/9/6.
 */
public class BuildingDao {

    public Building getBuildingById(int id) {
//        根据楼盘id,获得它的所有信息
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Building building = new Building();
        try {
            conn = DBHelper.getConnection();
            String sql = "select * from buildinginfo where buildingId=?;"; // SQL语句
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1,id);
            rs = stmt.executeQuery();
            if (rs.next()) {
                building.setBuildingId(id);
                building.setBuildingName(rs.getString("buildingName"));
                building.setBuildingAddress(rs.getString("buildingAddress"));
                building.setBuildingArea(rs.getInt("buildingArea"));
                building.setBuildingBedroom(rs.getInt("buildingBedroom"));
                building.setBuildingHall(rs.getInt("buildingHall"));
                building.setBuildingToilet(rs.getInt("buildingToilet"));
                building.setBuildingFloor(rs.getString("buildingFloor"));
                building.setBuildingAllFloor(rs.getInt("buildingAllFloor"));
                building.setBuildingPrice(rs.getInt("buildingPrice"));
                building.setBuildingCity(rs.getString("buildingCity"));
                building.setBuildingDistrict(rs.getString("buildingDistrict"));
                building.setBuildingRedecorated(rs.getString("buildingRedecorated"));
                building.setBuildingPhone(rs.getString("buildingPhone"));
                building.setBuildingDescribe(rs.getString("buildingDescribe"));
                building.setBuildingTimeHanded(rs.getDate("buildingTimeHanded"));
                building.setBuildingTrafficInfo(rs.getString("buildingTrafficInfo"));
                building.setBuildingProjectMatching(rs.getString("buildingProjectMatching"));
                building.setBuildingProjectBrief(rs.getString("buildingProjectBrief"));
                building.setBuildingCharacteristic(rs.getString("buildingCharacteristic"));
                building.setBuildingCategory(rs.getString("buildingCategory"));
                building.setBuildingGreeningRate(rs.getString("buildingGreeningRate"));
                building.setBuildingPlotRatio(rs.getString("buildingPlotRatio"));
                building.setBuildingSumNum(rs.getInt("buildingSumNum"));
                building.setBuildingPropertyCompany(rs.getString("buildingPropertyCompany"));
                building.setBuildingHousehold(rs.getString("buildingHousehold"));
                building.setBuildingPark(rs.getString("buildingPark"));


            }
            else{
                building=null;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            // 释放数据集对象
            if (rs != null) {
                try {
                    rs.close();
                    rs = null;
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            }
            // 释放语句对象
            if (stmt != null) {
                try {
                    stmt.close();
                    stmt = null;
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            }
        }
        if (building!=null){
            return building;
        }else{
            return null;
        }
    }
    public ArrayList<Building> getAllBuilding() {//获得所楼盘信息
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        ArrayList<Building> list = new ArrayList<Building>();
        try{
            conn = DBHelper.getConnection();
            String sql = "select * from buildinginfo";//SQL语句
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();
            while(rs.next())
            {
                Building building = new Building();
                building.setBuildingId(rs.getInt("buildingId"));
                building.setBuildingName(rs.getString("buildingName"));
                building.setBuildingAddress(rs.getString("buildingAddress"));
                building.setBuildingArea(rs.getInt("buildingArea"));
                building.setBuildingBedroom(rs.getInt("buildingBedroom"));
                building.setBuildingHall(rs.getInt("buildingHall"));
                building.setBuildingToilet(rs.getInt("buildingToilet"));
                building.setBuildingFloor(rs.getString("buildingFloor"));
                building.setBuildingAllFloor(rs.getInt("buildingAllFloor"));
                building.setBuildingPrice(rs.getInt("buildingPrice"));
                building.setBuildingCity(rs.getString("buildingCity"));
                building.setBuildingDistrict(rs.getString("buildingDistrict"));
                building.setBuildingRedecorated(rs.getString("buildingRedecorated"));
                building.setBuildingPhone(rs.getString("buildingPhone"));
                building.setBuildingDescribe(rs.getString("buildingDescribe"));
                building.setBuildingTimeHanded(rs.getDate("buildingTimeHanded"));
                building.setBuildingTrafficInfo(rs.getString("buildingTrafficInfo"));
                building.setBuildingProjectMatching(rs.getString("buildingProjectMatching"));
                building.setBuildingProjectBrief(rs.getString("buildingProjectBrief"));
                building.setBuildingCharacteristic(rs.getString("buildingCharacteristic"));
                building.setBuildingCategory(rs.getString("buildingCategory"));
                building.setBuildingGreeningRate(rs.getString("buildingGreeningRate"));
                building.setBuildingPlotRatio(rs.getString("buildingPlotRatio"));
                building.setBuildingSumNum(rs.getInt("buildingSumNum"));
                building.setBuildingPropertyCompany(rs.getString("buildingPropertyCompany"));
                building.setBuildingHousehold(rs.getString("buildingHousehold"));
                building.setBuildingPark(rs.getString("buildingPark"));
                list.add(building);
            }
            return list;

        }catch (Exception ex){
            ex.printStackTrace();
            return null;
        }finally {
            //释放数据集对象
            if(rs!=null){
                try{
                    rs.close();
                    rs = null;
                }catch(Exception ex){
                    ex.printStackTrace();
                }
            }
            if(stmt!=null){
                try{
                    stmt.close();
                    stmt = null;
                }catch(Exception ex){
                    ex.printStackTrace();
                }
            }
        }
    }
}
