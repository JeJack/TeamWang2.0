package com.dao;

import com.entity.Building;
import com.util.DBHelper;

import java.sql.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
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
                building.setBuildingPublishTime(rs.getObject("buildingPublishTime"));
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
                building.setBuildingTimeHanded(rs.getString("buildingTimeHanded"));


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
                building.setBuildingPublishTime(rs.getObject("buildingPublishTime"));
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
                building.setBuildingTimeHanded(rs.getString("buildingTimeHanded"));
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

    public boolean createBuildingInfoSql(Building building){
        //将楼盘信息插入数据库
        building.setBuildingCategory("building");
        java.util.Date date=new java.util.Date();
        Timestamp nowdate2 = new Timestamp(date.getTime());
        building.setBuildingPublishTime(nowdate2);
        boolean flag=false;
        Connection conn = null;
        PreparedStatement stmt = null;
        try{
            conn = DBHelper.getConnection();
            String sql="insert into buildinginfo(buildingName,buildingAddress,buildingArea,buildingHall,buildingBedroom,buildingToilet,buildingFloor,buildingAllFloor,buildingPrice,buildingCity,buildingDistrict,buildingRedecorated,buildingPhone, buildingTrafficInfo,buildingProjectMatching,buildingCharacteristic,buildingProjectBrief,buildingCategory,buildingGreeningRate,buildingPlotRatio,buildingSumNum,buildingPropertyCompany,buildingHousehold,buildingPark,buildingPublishTime,buildingTimeHanded) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            stmt = conn.prepareStatement(sql);//可以替换变量
            stmt.setString(1,building.getBuildingName());//可以把?替换成变量。
            stmt.setString(2,building.getBuildingAddress());
            stmt.setInt(3,building.getBuildingArea());
            stmt.setInt(4,building.getBuildingHall());
            stmt.setInt(5,building.getBuildingBedroom());
            stmt.setInt(6,building.getBuildingToilet());
            stmt.setString(7,building.getBuildingFloor());
            stmt.setInt(8,building.getBuildingAllFloor());
            stmt.setInt(9,building.getBuildingPrice());
            stmt.setString(10,building.getBuildingCity());
            stmt.setString(11,building.getBuildingDistrict());
            stmt.setString(12,building.getBuildingRedecorated());
            stmt.setString(13,building.getBuildingPhone());

            stmt.setString(14,building.getBuildingTrafficInfo());
            stmt.setString(15,building.getBuildingProjectMatching());
            stmt.setString(16,building.getBuildingCharacteristic());
            stmt.setString(17,building.getBuildingProjectBrief());
            stmt.setString(18,building.getBuildingCategory());
            stmt.setString(19,building.getBuildingGreeningRate());
            stmt.setString(20,building.getBuildingPlotRatio());
            stmt.setInt(21,building.getBuildingSumNum());
            stmt.setString(22,building.getBuildingPropertyCompany());
            stmt.setString(23,building.getBuildingHousehold());
            stmt.setString(24,building.getBuildingPark());
            stmt.setObject(25,building.getBuildingPublishTime());
            stmt.setString(26,building.getBuildingTimeHanded());
            if(!stmt.execute()){
                flag=true;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }finally {
            if (stmt != null) {//释放语句对象
                try {
                    stmt.close();
                    stmt = null;
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            }
        }
        return flag;

    }

    public boolean deleteBuildingByBuildingId(int id){
        boolean flag=false;
        Connection conn = null;
        PreparedStatement stmt = null;
        try{
            conn = DBHelper.getConnection();
            String sql = "delete from buildinginfo where buildingId=?";
            stmt = conn.prepareStatement(sql);//可以替换变量
            stmt.setInt(1,id);
            if(!stmt.execute()){
                flag=true;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }finally {
            if (stmt != null) {//释放语句对象
                try {
                    stmt.close();
                    stmt = null;
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            }
        }
        return flag;
    }

    public Building getBuildingByPhoneCharacteristic(Building b){
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Building building = new Building();

//        ArrayList<Users> userlist = new ArrayList<Users>();
        try {
            conn = DBHelper.getConnection();
            String sql = "select * from buildinginfo where buildingPhone=? and buildingCharacteristic=?;"; // SQL语句
            stmt = conn.prepareStatement(sql);
            stmt.setString(1,b.getBuildingPhone());
            stmt.setString(2,b.getBuildingCharacteristic());
//            stmt.setString(1,username);
            rs = stmt.executeQuery();
            if (rs.next()) {
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
                building.setBuildingPublishTime(rs.getObject("buildingPublishTime"));
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
                building.setBuildingTimeHanded(rs.getString("buildingTimeHanded"));
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
        return building;
    }

    public ArrayList<Building> getClass(Building buildingX){
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        ArrayList<Building> list = new ArrayList<Building>();
        try{
            conn = DBHelper.getConnection();
            String sql = "select * from buildinginfo where buildingDistrict=? and buildingPrice>? and buildingPrice<? and buildingFloor=? and buildingBedroom>? and buildingBedroom<?;";//SQL语句
            stmt = conn.prepareStatement(sql);
            stmt.setString(1,buildingX.getBuildingDistrict());
            if (buildingX.getBuildingPrice()>10000){
                stmt.setInt(2,buildingX.getBuildingPrice());
                stmt.setInt(3,buildingX.getBuildingPrice()+100000);
            }else if (buildingX.getBuildingPrice()<1){
                stmt.setInt(2,buildingX.getBuildingPrice());
                stmt.setInt(3,buildingX.getBuildingPrice()+500000);
            }else{
                stmt.setInt(2,buildingX.getBuildingPrice()-2000);
                stmt.setInt(3,buildingX.getBuildingPrice());
            }
            stmt.setString(4,buildingX.getBuildingFloor());
            if (buildingX.getBuildingBedroom()>5){
                stmt.setInt(5,buildingX.getBuildingBedroom()-1);
                stmt.setInt(6,buildingX.getBuildingBedroom()+100);
            }else if (buildingX.getBuildingBedroom()>0){
                stmt.setInt(5,buildingX.getBuildingBedroom()-1);
                stmt.setInt(6,buildingX.getBuildingBedroom()+1);
            }else {
                stmt.setInt(5,buildingX.getBuildingBedroom());
                stmt.setInt(6,buildingX.getBuildingBedroom()+100);
            }
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
                building.setBuildingPublishTime(rs.getObject("buildingPublishTime"));
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
                building.setBuildingTimeHanded(rs.getString("buildingTimeHanded"));
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

    public ArrayList<Building> getClassDouble(Building buildingX){
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        ArrayList<Building> list = new ArrayList<Building>();
        try{
            conn = DBHelper.getConnection();
            String sql = "select * from buildinginfo where buildingPrice>? and buildingPrice<? and buildingBedroom>? and buildingBedroom<?;";//SQL语句
            stmt = conn.prepareStatement(sql);
            if (buildingX.getBuildingPrice()>10000){
                stmt.setInt(1,buildingX.getBuildingPrice());
                stmt.setInt(2,buildingX.getBuildingPrice()+100000);
            }else if (buildingX.getBuildingPrice()<1){
                stmt.setInt(1,buildingX.getBuildingPrice());
                stmt.setInt(2,buildingX.getBuildingPrice()+500000);
            }else{
                stmt.setInt(1,buildingX.getBuildingPrice()-2000);
                stmt.setInt(2,buildingX.getBuildingPrice());
            }
            if (buildingX.getBuildingBedroom()>5){
                stmt.setInt(3,buildingX.getBuildingBedroom()-1);
                stmt.setInt(4,buildingX.getBuildingBedroom()+100);
            }else if (buildingX.getBuildingBedroom()>0){
                stmt.setInt(3,buildingX.getBuildingBedroom()-1);
                stmt.setInt(4,buildingX.getBuildingBedroom()+1);
            }else {
                stmt.setInt(3,buildingX.getBuildingBedroom());
                stmt.setInt(4,buildingX.getBuildingBedroom()+100);
            }
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
                building.setBuildingPublishTime(rs.getObject("buildingPublishTime"));
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
                building.setBuildingTimeHanded(rs.getString("buildingTimeHanded"));
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

    public ArrayList<Building> getClassDis(Building buildingX){
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        ArrayList<Building> list = new ArrayList<Building>();
        try{
            conn = DBHelper.getConnection();
            String sql = "select * from buildinginfo where buildingPrice>? and buildingPrice<? and buildingFloor=? and buildingBedroom>? and buildingBedroom<?;";//SQL语句
            stmt = conn.prepareStatement(sql);
            if (buildingX.getBuildingPrice()>10000){
                stmt.setInt(1,buildingX.getBuildingPrice());
                stmt.setInt(2,buildingX.getBuildingPrice()+100000);
            }else if (buildingX.getBuildingPrice()<1){
                stmt.setInt(1,buildingX.getBuildingPrice());
                stmt.setInt(2,buildingX.getBuildingPrice()+500000);
            }else{
                stmt.setInt(1,buildingX.getBuildingPrice()-2000);
                stmt.setInt(2,buildingX.getBuildingPrice());
            }
            stmt.setString(3,buildingX.getBuildingFloor());
            if (buildingX.getBuildingBedroom()>5){
                stmt.setInt(4,buildingX.getBuildingBedroom()-1);
                stmt.setInt(5,buildingX.getBuildingBedroom()+100);
            }else if (buildingX.getBuildingBedroom()>0){
                stmt.setInt(4,buildingX.getBuildingBedroom()-1);
                stmt.setInt(5,buildingX.getBuildingBedroom()+1);
            }else {
                stmt.setInt(4,buildingX.getBuildingBedroom());
                stmt.setInt(5,buildingX.getBuildingBedroom()+100);
            }
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
                building.setBuildingPublishTime(rs.getObject("buildingPublishTime"));
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
                building.setBuildingTimeHanded(rs.getString("buildingTimeHanded"));
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

    public ArrayList<Building> getClassFloor(Building buildingX){
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        ArrayList<Building> list = new ArrayList<Building>();
        try{
            conn = DBHelper.getConnection();
            String sql = "select * from buildinginfo where buildingDistrict=? and buildingPrice>? and buildingPrice<? and buildingBedroom>? and buildingBedroom<?;";//SQL语句
            stmt = conn.prepareStatement(sql);
            stmt.setString(1,buildingX.getBuildingDistrict());
            if (buildingX.getBuildingPrice()>10000){
                stmt.setInt(2,buildingX.getBuildingPrice());
                stmt.setInt(3,buildingX.getBuildingPrice()+100000);
            }else if (buildingX.getBuildingPrice()<1){
                stmt.setInt(2,buildingX.getBuildingPrice());
                stmt.setInt(3,buildingX.getBuildingPrice()+500000);
            }else{
                stmt.setInt(2,buildingX.getBuildingPrice()-2000);
                stmt.setInt(3,buildingX.getBuildingPrice());
            }
            if (buildingX.getBuildingBedroom()>5){
                stmt.setInt(4,buildingX.getBuildingBedroom()-1);
                stmt.setInt(5,buildingX.getBuildingBedroom()+100);
            }else if (buildingX.getBuildingBedroom()>0){
                stmt.setInt(4,buildingX.getBuildingBedroom()-1);
                stmt.setInt(5,buildingX.getBuildingBedroom()+1);
            }else {
                stmt.setInt(4,buildingX.getBuildingBedroom());
                stmt.setInt(5,buildingX.getBuildingBedroom()+100);
            }
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
                building.setBuildingPublishTime(rs.getObject("buildingPublishTime"));
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
                building.setBuildingTimeHanded(rs.getString("buildingTimeHanded"));
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
