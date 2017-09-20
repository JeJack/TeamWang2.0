package com.dao;

import com.entity.OwnerTopic;
import com.util.DBHelper;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

/**
 * Created by qiuje on 2017/9/8.
 */
public class OwnerTopicDao {

    public OwnerTopic getOwnerTopicByOwnerTopicId(int id) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        OwnerTopic ownerTopic = new OwnerTopic();
//        Users user=new Users();//users 表的主键
        try {
            conn = DBHelper.getConnection();
            String sql = "select * from ownertopic where ownerTopicId=?;"; // SQL语句
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1,id);
            rs = stmt.executeQuery();
            if (rs.next()) {

                ownerTopic.setOwnerTopicId(rs.getInt("ownerTopicId"));
                ownerTopic.setOwnerUserId(rs.getInt("userId"));
                ownerTopic.setOwnerTopicTheme(rs.getString("ownerTopicTheme"));
                ownerTopic.setOwnerTopic(rs.getString("ownerTopic"));
                ownerTopic.setCategory(rs.getString("category"));
                ownerTopic.setOwnerTopicTime(rs.getObject("ownerTopicTime"));
            }
            else{
                ownerTopic=null;
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
        if (ownerTopic!=null){
            return ownerTopic;
        }else{
            return null;
        }
    }

    public OwnerTopic getOwnerTopicByUserIdAndTopic(OwnerTopic ownerTopic) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
//        Users user=new Users();//users 表的主键
        try {
            conn = DBHelper.getConnection();
            String sql = "select * from ownertopic where userId=? and ownerTopic=?;"; // SQL语句
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1,ownerTopic.getOwnerUserId());
            stmt.setString(2,ownerTopic.getOwnerTopic());
            rs = stmt.executeQuery();
            if (rs.next()) {
                ownerTopic.setOwnerTopicId(rs.getInt("ownerTopicId"));
                ownerTopic.setOwnerUserId(rs.getInt("userId"));
                ownerTopic.setOwnerTopicTheme(rs.getString("ownerTopicTheme"));
                ownerTopic.setOwnerTopic(rs.getString("ownerTopic"));
                ownerTopic.setCategory(rs.getString("category"));
                ownerTopic.setOwnerTopicTime(rs.getObject("ownerTopicTime"));
            }
            else{
                ownerTopic=null;
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
        return ownerTopic;
    }

    public ArrayList<OwnerTopic> getAllOwnerTopic(String category) {//获得所有贴子信息
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        ArrayList<OwnerTopic> list = new ArrayList<OwnerTopic>();
        try{
            conn = DBHelper.getConnection();
            String sql = "select * from ownertopic where category=?;"; // SQL语句
            stmt = conn.prepareStatement(sql);
            stmt.setString(1,category);
            rs = stmt.executeQuery();
            while(rs.next())
            {
                OwnerTopic ownerTopic = new OwnerTopic();
                ownerTopic.setOwnerTopicId(rs.getInt("ownerTopicId"));
                ownerTopic.setOwnerUserId(rs.getInt("userId"));
                ownerTopic.setOwnerTopicTheme(rs.getString("ownerTopicTheme"));
                ownerTopic.setOwnerTopic(rs.getString("ownerTopic"));
                ownerTopic.setCategory(rs.getString("category"));
                ownerTopic.setOwnerTopicTime(rs.getObject("ownerTopicTime"));
                list.add(ownerTopic);
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

    public boolean deleteOwnerTopicByOwnerTopicId(int id){
        boolean flag=false;
        Connection conn = null;
        PreparedStatement stmt = null;
        try{
            conn = DBHelper.getConnection();
            String sql = "delete from ownertopic where ownerTopicId=?";
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

    public boolean createOwnerTopicInfoSql(OwnerTopic ownerTopic){
        //将评论信息插入数据库
        java.util.Date date=new java.util.Date();
        Timestamp nowdate2 = new Timestamp(date.getTime());
        ownerTopic.setOwnerTopicTime(nowdate2);
        boolean flag=false;
        Connection conn = null;
        PreparedStatement stmt = null;
        try{
            conn = DBHelper.getConnection();
            String sql="insert into ownertopic(userId,ownerTopicTheme,ownerTopic,category,ownerTopicTime) values(?,?,?,?,?)";
            stmt = conn.prepareStatement(sql);//可以替换变量
            stmt.setInt(1,ownerTopic.getOwnerUserId());
            stmt.setString(2,ownerTopic.getOwnerTopicTheme());
            stmt.setString(3,ownerTopic.getOwnerTopic());
            stmt.setString(4,ownerTopic.getCategory());
            stmt.setObject(5,ownerTopic.getOwnerTopicTime());
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
