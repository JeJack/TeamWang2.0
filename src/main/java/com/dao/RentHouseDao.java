package com.dao;

import com.entity.RentHouse;
import com.entity.Users;
import com.util.DBHelper;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
                renthouse.setRentHouseBuildTime(rs.getDate("rentHouseBuildTime"));
                renthouse.setRentHouseBedroom(rs.getInt("rentHouseBedroom"));
                renthouse.setRentHouseHall(rs.getInt("rentHouseHall"));
                renthouse.setRentHouseToilet(rs.getInt("rentHouseToilet"));
                renthouse.setRentHouseFloor(rs.getString("rentHouseFloor"));
                renthouse.setRentHouseAllFloor(rs.getInt("rentHouseAllFloor"));
                renthouse.setRentHousePrice(rs.getInt("rentHousePrice"));
                renthouse.setRentHouseCity(rs.getString("rentHouseCity"));
                renthouse.setRentHouseDistrict(rs.getString("rentHouseDistrict"));
                renthouse.setRentHousePublishTime(rs.getDate("rentHousePublishTime"));
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
                renthouse.setRentHouseBuildTime(rs.getDate("rentHouseBuildTime"));
                renthouse.setRentHouseBedroom(rs.getInt("rentHouseBedroom"));
                renthouse.setRentHouseHall(rs.getInt("rentHouseHall"));
                renthouse.setRentHouseToilet(rs.getInt("rentHouseToilet"));
                renthouse.setRentHouseFloor(rs.getString("rentHouseFloor"));
                renthouse.setRentHouseAllFloor(rs.getInt("rentHouseAllFloor"));
                renthouse.setRentHousePrice(rs.getInt("rentHousePrice"));
                renthouse.setRentHouseCity(rs.getString("rentHouseCity"));
                renthouse.setRentHouseDistrict(rs.getString("rentHouseDistrict"));
                renthouse.setRentHousePublishTime(rs.getDate("rentHousePublishTime"));
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
}
