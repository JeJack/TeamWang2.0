package com.dao;

import com.entity.RentHouse;
import com.entity.Users;
import com.util.DBHelper;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

/**
 * Created by qiuje on 2017/9/5.
 */
public class RentHouseDao {


    public RentHouse getRentHouseById(int id) {
//        根据出租房id,获得他的所有信息
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
//        Users user=new Users();//users 表的主键
        RentHouse renthouse = new RentHouse();
//        ArrayList<Users> userlist = new ArrayList<Users>();
        try {
            conn = DBHelper.getConnection();
            String sql = "select * from renthouseinfo where rentHouseId=?;"; // SQL语句
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1,id);
//            stmt.setString(1,username);
            rs = stmt.executeQuery();
            if (rs.next()) {
                renthouse.setRentHouseId(id);
                renthouse.setRentHouseName(rs.getString("rentHouseName"));
                renthouse.setRentHouseAddress(rs.getString("rentHouseAddress"));
                renthouse.setRentHouseArea(rs.getInt("rentHouseArea"));
                renthouse.setRentHouseBuildTime(rs.getString("rentHouseBuildTime"));
                renthouse.setRentHouseBedroom(rs.getInt("rentHouseBedroom"));
                renthouse.setRentHouseHall(rs.getInt("rentHouseHall"));
                renthouse.setRentHouseToilet(rs.getInt("rentHouseToilet"));
                renthouse.setRentHouseFloor(rs.getString("rentHouseFloor"));
                renthouse.setRentHouseAllFloor(rs.getInt("rentHouseAllFloor"));
                renthouse.setRentHousePrice(rs.getInt("rentHousePrice"));
                renthouse.setRentHouseCity(rs.getString("rentHouseCity"));
                renthouse.setRentHouseDistrict(rs.getString("rentHouseDistrict"));
                renthouse.setRentHousePublishTime(rs.getObject("rentHousePublishTime"));
                renthouse.setRentHouseRedecorated(rs.getString("rentHouseRedecorated"));
                renthouse.setRentHousePhone(rs.getString("rentHousePhone"));
                renthouse.setRentHouseDescribe(rs.getString("rentHouseDescribe"));
                renthouse.setRentHouseCategory(rs.getString("rentHouseCategory"));
            }
            else{
                renthouse=null;
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
        if (renthouse!=null){
            return renthouse;
        }else{
            return null;
        }
    }
    public ArrayList<RentHouse> getAllRentHouse()
    {//获得所有出租房信息
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        ArrayList<RentHouse> list = new ArrayList<RentHouse>();
        try{
            conn = DBHelper.getConnection();
            String sql = "select * from renthouseinfo";//SQL语句
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();
            while(rs.next())
            {
                RentHouse renthouse = new RentHouse();
                renthouse.setRentHouseId(rs.getInt("rentHouseId"));
                renthouse.setRentHouseName(rs.getString("rentHouseName"));
                renthouse.setRentHouseAddress(rs.getString("rentHouseAddress"));
                renthouse.setRentHouseArea(rs.getInt("rentHouseArea"));
                renthouse.setRentHouseBuildTime(rs.getString("rentHouseBuildTime"));
                renthouse.setRentHouseBedroom(rs.getInt("rentHouseBedroom"));
                renthouse.setRentHouseHall(rs.getInt("rentHouseHall"));
                renthouse.setRentHouseToilet(rs.getInt("rentHouseToilet"));
                renthouse.setRentHouseFloor(rs.getString("rentHouseFloor"));
                renthouse.setRentHouseAllFloor(rs.getInt("rentHouseAllFloor"));
                renthouse.setRentHousePrice(rs.getInt("rentHousePrice"));
                renthouse.setRentHouseCity(rs.getString("rentHouseCity"));
                renthouse.setRentHouseDistrict(rs.getString("rentHouseDistrict"));
                renthouse.setRentHousePublishTime(rs.getObject("rentHousePublishTime"));
                renthouse.setRentHouseRedecorated(rs.getString("rentHouseRedecorated"));
                renthouse.setRentHousePhone(rs.getString("rentHousePhone"));
                renthouse.setRentHouseDescribe(rs.getString("rentHouseDescribe"));
                renthouse.setRentHouseCategory(rs.getString("rentHouseCategory"));
                list.add(renthouse);
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

    public RentHouse getRentHouseByNamePhone(RentHouse rentHouse){
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
//        Users user=new Users();//users 表的主键
        RentHouse renthouse = new RentHouse();
//        ArrayList<Users> userlist = new ArrayList<Users>();
        try {
            conn = DBHelper.getConnection();
            String sql = "select * from renthouseinfo where rentHouseName=? and rentHousePhone=?;"; // SQL语句
            stmt = conn.prepareStatement(sql);
            stmt.setString(1,rentHouse.getRentHouseName());
            stmt.setString(2,rentHouse.getRentHousePhone());
//            stmt.setString(1,username);
            rs = stmt.executeQuery();
            if (rs.next()) {
                renthouse.setRentHouseId(rs.getInt("rentHouseId"));
                renthouse.setRentHouseName(rs.getString("rentHouseName"));
                renthouse.setRentHouseAddress(rs.getString("rentHouseAddress"));
                renthouse.setRentHouseArea(rs.getInt("rentHouseArea"));
                renthouse.setRentHouseBuildTime(rs.getString("rentHouseBuildTime"));
                renthouse.setRentHouseBedroom(rs.getInt("rentHouseBedroom"));
                renthouse.setRentHouseHall(rs.getInt("rentHouseHall"));
                renthouse.setRentHouseToilet(rs.getInt("rentHouseToilet"));
                renthouse.setRentHouseFloor(rs.getString("rentHouseFloor"));
                renthouse.setRentHouseAllFloor(rs.getInt("rentHouseAllFloor"));
                renthouse.setRentHousePrice(rs.getInt("rentHousePrice"));
                renthouse.setRentHouseCity(rs.getString("rentHouseCity"));
                renthouse.setRentHouseDistrict(rs.getString("rentHouseDistrict"));
                renthouse.setRentHousePublishTime(rs.getObject("rentHousePublishTime"));
                renthouse.setRentHouseRedecorated(rs.getString("rentHouseRedecorated"));
                renthouse.setRentHousePhone(rs.getString("rentHousePhone"));
                renthouse.setRentHouseDescribe(rs.getString("rentHouseDescribe"));
                renthouse.setRentHouseCategory(rs.getString("rentHouseCategory"));
            }
            else{
                renthouse=null;
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
        if (renthouse!=null){
            return renthouse;
        }else{
            return null;
        }
    }

    public boolean createRentHouseInfoSql(RentHouse rentHouse){
        //将出租房信息插入数据库
        rentHouse.setRentHouseCategory("renthouse");
        java.util.Date date=new java.util.Date();
        Timestamp nowdate2 = new Timestamp(date.getTime());
        rentHouse.setRentHousePublishTime(nowdate2);
        boolean flag=false;
        Connection conn = null;
        PreparedStatement stmt = null;
        try{
            conn = DBHelper.getConnection();
            String sql="insert into renthouseinfo(rentHouseName,rentHouseAddress,rentHouseArea,rentHouseBuildTime,rentHouseHall,rentHouseBedroom,rentHouseToilet,rentHouseFloor,rentHouseAllFloor,rentHousePrice,rentHouseCity,rentHouseDistrict,rentHousePublishTime,rentHouseRedecorated,rentHousePhone,rentHouseDescribe,rentHouseCategory) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            stmt = conn.prepareStatement(sql);//可以替换变量
            stmt.setString(1,rentHouse.getRentHouseName());
            stmt.setString(2,rentHouse.getRentHouseAddress());
            stmt.setInt(3,rentHouse.getRentHouseArea());
            stmt.setString(4,rentHouse.getRentHouseBuildTime());
            stmt.setInt(5,rentHouse.getRentHouseHall());
            stmt.setInt(6,rentHouse.getRentHouseBedroom());
            stmt.setInt(7,rentHouse.getRentHouseToilet());
            stmt.setString(8,rentHouse.getRentHouseFloor());
            stmt.setInt(9,rentHouse.getRentHouseAllFloor());
            stmt.setInt(10,rentHouse.getRentHousePrice());
            stmt.setString(11,rentHouse.getRentHouseCity());
            stmt.setString(12,rentHouse.getRentHouseDistrict());
            stmt.setObject(13,rentHouse.getRentHousePublishTime());
            stmt.setString(14,rentHouse.getRentHouseRedecorated());
            stmt.setString(15,rentHouse.getRentHousePhone());
            stmt.setString(16,rentHouse.getRentHouseDescribe());
            stmt.setString(17,rentHouse.getRentHouseCategory());
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

    public boolean deleteRentHouseByRentHouseId(int id){
        boolean flag=false;
        Connection conn = null;
        PreparedStatement stmt = null;
        try{
            conn = DBHelper.getConnection();
            String sql = "delete from renthouseinfo where renthouseId=?";
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

    public ArrayList<RentHouse> getClass(RentHouse rentHouse){
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        ArrayList<RentHouse> rentHouses = new ArrayList<RentHouse>();
        try {
            conn = DBHelper.getConnection();
            String sql = "select * from renthouseinfo where rentHouseDistrict=? and rentHousePrice>? and rentHousePrice<? and rentHouseFloor=? and rentHouseBedroom>? and rentHouseBedroom<?;";//SQL语句
            stmt = conn.prepareStatement(sql);
            stmt.setString(1,rentHouse.getRentHouseDistrict());
            if (rentHouse.getRentHousePrice()>5000){
                stmt.setInt(2,rentHouse.getRentHousePrice());
                stmt.setInt(3,rentHouse.getRentHousePrice()+500000);
            }else if (rentHouse.getRentHousePrice()<1){
                stmt.setInt(2,rentHouse.getRentHousePrice());
                stmt.setInt(3,rentHouse.getRentHousePrice()+500000);
            }else{
                stmt.setInt(2,rentHouse.getRentHousePrice()-1000);
                stmt.setInt(3,rentHouse.getRentHousePrice());
            }
            stmt.setString(4,rentHouse.getRentHouseFloor());
            if (rentHouse.getRentHouseBedroom()>5){
                stmt.setInt(5,rentHouse.getRentHouseBedroom()-1);
                stmt.setInt(6,rentHouse.getRentHouseBedroom()+100);
            }else if (rentHouse.getRentHouseBedroom()>0){
                stmt.setInt(5,rentHouse.getRentHouseBedroom()-1);
                stmt.setInt(6,rentHouse.getRentHouseBedroom()+1);
            }else {
                stmt.setInt(5,rentHouse.getRentHouseBedroom());
                stmt.setInt(6,rentHouse.getRentHouseBedroom()+100);
            }
//            stmt.setString(1,username);
            rs = stmt.executeQuery();
            while (rs.next()) {
                RentHouse renthouse = new RentHouse();
                renthouse.setRentHouseId(rs.getInt("rentHouseId"));
                renthouse.setRentHouseName(rs.getString("rentHouseName"));
                renthouse.setRentHouseAddress(rs.getString("rentHouseAddress"));
                renthouse.setRentHouseArea(rs.getInt("rentHouseArea"));
                renthouse.setRentHouseBuildTime(rs.getString("rentHouseBuildTime"));
                renthouse.setRentHouseBedroom(rs.getInt("rentHouseBedroom"));
                renthouse.setRentHouseHall(rs.getInt("rentHouseHall"));
                renthouse.setRentHouseToilet(rs.getInt("rentHouseToilet"));
                renthouse.setRentHouseFloor(rs.getString("rentHouseFloor"));
                renthouse.setRentHouseAllFloor(rs.getInt("rentHouseAllFloor"));
                renthouse.setRentHousePrice(rs.getInt("rentHousePrice"));
                renthouse.setRentHouseCity(rs.getString("rentHouseCity"));
                renthouse.setRentHouseDistrict(rs.getString("rentHouseDistrict"));
                renthouse.setRentHousePublishTime(rs.getObject("rentHousePublishTime"));
                renthouse.setRentHouseRedecorated(rs.getString("rentHouseRedecorated"));
                renthouse.setRentHousePhone(rs.getString("rentHousePhone"));
                renthouse.setRentHouseDescribe(rs.getString("rentHouseDescribe"));
                renthouse.setRentHouseCategory(rs.getString("rentHouseCategory"));
                rentHouses.add(renthouse);
            }
            return rentHouses;
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

    public ArrayList<RentHouse> getClassDouble(RentHouse rentHouse){
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        ArrayList<RentHouse> rentHouses = new ArrayList<RentHouse>();
        try {
            conn = DBHelper.getConnection();
            String sql = "select * from renthouseinfo where rentHousePrice>? and rentHousePrice<?  and rentHouseBedroom>? and rentHouseBedroom<?;";//SQL语句
            stmt = conn.prepareStatement(sql);
            if (rentHouse.getRentHousePrice()>5000){
                stmt.setInt(1,rentHouse.getRentHousePrice());
                stmt.setInt(2,rentHouse.getRentHousePrice()+500000);
            }else if (rentHouse.getRentHousePrice()<1){
                stmt.setInt(1,rentHouse.getRentHousePrice());
                stmt.setInt(2,rentHouse.getRentHousePrice()+500000);
            }else{
                stmt.setInt(1,rentHouse.getRentHousePrice()-1000);
                stmt.setInt(2,rentHouse.getRentHousePrice());
            }
            if (rentHouse.getRentHouseBedroom()>5){
                stmt.setInt(3,rentHouse.getRentHouseBedroom()-1);
                stmt.setInt(4,rentHouse.getRentHouseBedroom()+100);
            }else if (rentHouse.getRentHouseBedroom()>0){
                stmt.setInt(3,rentHouse.getRentHouseBedroom()-1);
                stmt.setInt(4,rentHouse.getRentHouseBedroom()+1);
            }else {
                stmt.setInt(3,rentHouse.getRentHouseBedroom());
                stmt.setInt(4,rentHouse.getRentHouseBedroom()+100);
            }
//            stmt.setString(1,username);
            rs = stmt.executeQuery();
            while (rs.next()) {
                RentHouse renthouse = new RentHouse();
                renthouse.setRentHouseId(rs.getInt("rentHouseId"));
                renthouse.setRentHouseName(rs.getString("rentHouseName"));
                renthouse.setRentHouseAddress(rs.getString("rentHouseAddress"));
                renthouse.setRentHouseArea(rs.getInt("rentHouseArea"));
                renthouse.setRentHouseBuildTime(rs.getString("rentHouseBuildTime"));
                renthouse.setRentHouseBedroom(rs.getInt("rentHouseBedroom"));
                renthouse.setRentHouseHall(rs.getInt("rentHouseHall"));
                renthouse.setRentHouseToilet(rs.getInt("rentHouseToilet"));
                renthouse.setRentHouseFloor(rs.getString("rentHouseFloor"));
                renthouse.setRentHouseAllFloor(rs.getInt("rentHouseAllFloor"));
                renthouse.setRentHousePrice(rs.getInt("rentHousePrice"));
                renthouse.setRentHouseCity(rs.getString("rentHouseCity"));
                renthouse.setRentHouseDistrict(rs.getString("rentHouseDistrict"));
                renthouse.setRentHousePublishTime(rs.getObject("rentHousePublishTime"));
                renthouse.setRentHouseRedecorated(rs.getString("rentHouseRedecorated"));
                renthouse.setRentHousePhone(rs.getString("rentHousePhone"));
                renthouse.setRentHouseDescribe(rs.getString("rentHouseDescribe"));
                renthouse.setRentHouseCategory(rs.getString("rentHouseCategory"));
                rentHouses.add(renthouse);
            }
            return rentHouses;
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

    public ArrayList<RentHouse> getClassDis(RentHouse rentHouse){
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        ArrayList<RentHouse> rentHouses = new ArrayList<RentHouse>();
        try {
            conn = DBHelper.getConnection();
            String sql = "select * from renthouseinfo where rentHousePrice>? and rentHousePrice<? and rentHouseFloor=? and rentHouseBedroom>? and rentHouseBedroom<?;";//SQL语句
            stmt = conn.prepareStatement(sql);
            if (rentHouse.getRentHousePrice()>5000){
                stmt.setInt(1,rentHouse.getRentHousePrice());
                stmt.setInt(2,rentHouse.getRentHousePrice()+500000);
            }else if (rentHouse.getRentHousePrice()<1){
                stmt.setInt(1,rentHouse.getRentHousePrice());
                stmt.setInt(2,rentHouse.getRentHousePrice()+500000);
            }else{
                stmt.setInt(1,rentHouse.getRentHousePrice()-1000);
                stmt.setInt(2,rentHouse.getRentHousePrice());
            }
            stmt.setString(3,rentHouse.getRentHouseFloor());
            if (rentHouse.getRentHouseBedroom()>5){
                stmt.setInt(4,rentHouse.getRentHouseBedroom()-1);
                stmt.setInt(5,rentHouse.getRentHouseBedroom()+100);
            }else if (rentHouse.getRentHouseBedroom()>0){
                stmt.setInt(4,rentHouse.getRentHouseBedroom()-1);
                stmt.setInt(5,rentHouse.getRentHouseBedroom()+1);
            }else {
                stmt.setInt(4,rentHouse.getRentHouseBedroom());
                stmt.setInt(5,rentHouse.getRentHouseBedroom()+100);
            }
            rs = stmt.executeQuery();
            while (rs.next()) {
                RentHouse renthouse = new RentHouse();
                renthouse.setRentHouseId(rs.getInt("rentHouseId"));
                renthouse.setRentHouseName(rs.getString("rentHouseName"));
                renthouse.setRentHouseAddress(rs.getString("rentHouseAddress"));
                renthouse.setRentHouseArea(rs.getInt("rentHouseArea"));
                renthouse.setRentHouseBuildTime(rs.getString("rentHouseBuildTime"));
                renthouse.setRentHouseBedroom(rs.getInt("rentHouseBedroom"));
                renthouse.setRentHouseHall(rs.getInt("rentHouseHall"));
                renthouse.setRentHouseToilet(rs.getInt("rentHouseToilet"));
                renthouse.setRentHouseFloor(rs.getString("rentHouseFloor"));
                renthouse.setRentHouseAllFloor(rs.getInt("rentHouseAllFloor"));
                renthouse.setRentHousePrice(rs.getInt("rentHousePrice"));
                renthouse.setRentHouseCity(rs.getString("rentHouseCity"));
                renthouse.setRentHouseDistrict(rs.getString("rentHouseDistrict"));
                renthouse.setRentHousePublishTime(rs.getObject("rentHousePublishTime"));
                renthouse.setRentHouseRedecorated(rs.getString("rentHouseRedecorated"));
                renthouse.setRentHousePhone(rs.getString("rentHousePhone"));
                renthouse.setRentHouseDescribe(rs.getString("rentHouseDescribe"));
                renthouse.setRentHouseCategory(rs.getString("rentHouseCategory"));
                rentHouses.add(renthouse);
            }
            return rentHouses;
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

    public ArrayList<RentHouse> getClassFloor(RentHouse rentHouse){
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        ArrayList<RentHouse> rentHouses = new ArrayList<RentHouse>();
        try {
            conn = DBHelper.getConnection();
            String sql = "select * from renthouseinfo where rentHouseDistrict=? and rentHousePrice>? and rentHousePrice<? and rentHouseBedroom>? and rentHouseBedroom<?;";//SQL语句
            stmt = conn.prepareStatement(sql);
            stmt.setString(1,rentHouse.getRentHouseDistrict());
            if (rentHouse.getRentHousePrice()>5000){
                stmt.setInt(2,rentHouse.getRentHousePrice());
                stmt.setInt(3,rentHouse.getRentHousePrice()+500000);
            }else if (rentHouse.getRentHousePrice()<1){
                stmt.setInt(2,rentHouse.getRentHousePrice());
                stmt.setInt(3,rentHouse.getRentHousePrice()+500000);
            }else{
                stmt.setInt(2,rentHouse.getRentHousePrice()-1000);
                stmt.setInt(3,rentHouse.getRentHousePrice());
            }
            if (rentHouse.getRentHouseBedroom()>5){
                stmt.setInt(4,rentHouse.getRentHouseBedroom()-1);
                stmt.setInt(5,rentHouse.getRentHouseBedroom()+100);
            }else if (rentHouse.getRentHouseBedroom()>0){
                stmt.setInt(4,rentHouse.getRentHouseBedroom()-1);
                stmt.setInt(5,rentHouse.getRentHouseBedroom()+1);
            }else {
                stmt.setInt(4,rentHouse.getRentHouseBedroom());
                stmt.setInt(5,rentHouse.getRentHouseBedroom()+100);
            }
            rs = stmt.executeQuery();
            while (rs.next()) {
                RentHouse renthouse = new RentHouse();
                renthouse.setRentHouseId(rs.getInt("rentHouseId"));
                renthouse.setRentHouseName(rs.getString("rentHouseName"));
                renthouse.setRentHouseAddress(rs.getString("rentHouseAddress"));
                renthouse.setRentHouseArea(rs.getInt("rentHouseArea"));
                renthouse.setRentHouseBuildTime(rs.getString("rentHouseBuildTime"));
                renthouse.setRentHouseBedroom(rs.getInt("rentHouseBedroom"));
                renthouse.setRentHouseHall(rs.getInt("rentHouseHall"));
                renthouse.setRentHouseToilet(rs.getInt("rentHouseToilet"));
                renthouse.setRentHouseFloor(rs.getString("rentHouseFloor"));
                renthouse.setRentHouseAllFloor(rs.getInt("rentHouseAllFloor"));
                renthouse.setRentHousePrice(rs.getInt("rentHousePrice"));
                renthouse.setRentHouseCity(rs.getString("rentHouseCity"));
                renthouse.setRentHouseDistrict(rs.getString("rentHouseDistrict"));
                renthouse.setRentHousePublishTime(rs.getObject("rentHousePublishTime"));
                renthouse.setRentHouseRedecorated(rs.getString("rentHouseRedecorated"));
                renthouse.setRentHousePhone(rs.getString("rentHousePhone"));
                renthouse.setRentHouseDescribe(rs.getString("rentHouseDescribe"));
                renthouse.setRentHouseCategory(rs.getString("rentHouseCategory"));
                rentHouses.add(renthouse);
            }
            return rentHouses;
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
