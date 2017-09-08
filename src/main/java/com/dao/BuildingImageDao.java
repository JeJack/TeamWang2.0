package com.dao;

import com.entity.BuildingImage;
import com.util.DBHelper;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 * Created by qiuje on 2017/9/6.
 */
public class BuildingImageDao {
    public ArrayList<BuildingImage> getAllBuildingImageNameByBuildingId(int id) {
//        根据出租房id,获得他的所有信息
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        ArrayList<BuildingImage> list = new ArrayList<BuildingImage>();
        try {
            conn = DBHelper.getConnection();
            String sql = "select * from buildingimage where buildingId=?;"; // SQL语句
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1,id);
            rs = stmt.executeQuery();
            while (rs.next()) {
//                RentHouseImage Rimg = new RentHouseImage();
                BuildingImage Bimg = new BuildingImage();
                Bimg.setBuildingImageId(rs.getInt("buildingImageId"));
                Bimg.setBuildingId(rs.getInt("buildingId"));
                Bimg.setBuildingImageName(rs.getString("buildingImageName"));
                list.add(Bimg);
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
