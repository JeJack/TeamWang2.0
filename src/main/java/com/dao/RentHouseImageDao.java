package com.dao;

import com.entity.RentHouse;
import com.entity.RentHouseImage;
import com.util.DBHelper;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 * Created by qiuje on 2017/9/5.
 */
public class RentHouseImageDao {
    public ArrayList<RentHouseImage> getAllRentHouseImageNameByRentHouseId(int id) {
//        根据出租房id,获得他的所有信息
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        ArrayList<RentHouseImage> list = new ArrayList<RentHouseImage>();
        try {
            conn = DBHelper.getConnection();
            String sql = "select * from rentHouseImage where rentHouseId=?;"; // SQL语句
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1,id);
            rs = stmt.executeQuery();
            while (rs.next()) {
                RentHouseImage Rimg = new RentHouseImage();
                Rimg.setRentHouseImageId(rs.getInt("rentHouseImageId"));
                Rimg.setRentHouseId(rs.getInt("rentHouseId"));
                Rimg.setRentHouseImageName(rs.getString("rentHouseImageName"));
                list.add(Rimg);
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

    public boolean deleteRentHouseImageByRentHouseId(int id){
        boolean flag=false;
        Connection conn = null;
        PreparedStatement stmt = null;
        try{
            conn = DBHelper.getConnection();
            String sql = "delete from renthouseimage where renthouseId=?";
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

    public boolean createRentHouseImageInfoSql(RentHouseImage rentHouseImage){
        //将出租房信息插入数据库
        boolean flag=false;
        Connection conn = null;
        PreparedStatement stmt = null;
        try{
            conn = DBHelper.getConnection();
            String sql="insert into renthouseimage(rentHouseId,rentHouseImageName) values(?,?)";
            stmt = conn.prepareStatement(sql);//可以替换变量
            stmt.setInt(1,rentHouseImage.getRentHouseId());
            stmt.setString(2,rentHouseImage.getRentHouseImageName());
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


}
