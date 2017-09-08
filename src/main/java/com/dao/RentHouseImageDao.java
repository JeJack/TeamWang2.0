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
}
