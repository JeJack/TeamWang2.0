package com.dao;

import com.entity.Redecorated;
import com.util.DBHelper;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 * Created by qiuje on 2017/9/6.
 */
public class RedecoratedDao {

    public Redecorated getRedecoratedById(int id) {
//        根据装修id,获得它的所有信息
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Redecorated redecorated = new Redecorated();
        try {
            conn = DBHelper.getConnection();
            String sql = "select * from redecoratedinfo where redecoratedId=?;"; // SQL语句
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1,id);
            rs = stmt.executeQuery();
            if (rs.next()) {
                redecorated.setRedecoratedId(rs.getInt("redecoratedId"));
                redecorated.setRedecoratedFunction(rs.getString("redecoratedFunction"));
                redecorated.setRedecoratedStyle(rs.getString("redecoratedStyle"));
                redecorated.setRedecoratedArea(rs.getString("redecoratedArea"));
                redecorated.setRedecoratedPrice(rs.getInt("redecoratedPrice"));
                redecorated.setRedecoratedImageName(rs.getString("redecoratedImageName"));
                redecorated.setRedecoratedPhone(rs.getString("redecoratedPhone"));
                redecorated.setRedecoratedDescribe(rs.getString("redecoratedDescribe"));
                redecorated.setRedecoratedCategory(rs.getString("redecoratedCategory"));
            }
            else{
                redecorated=null;
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
        if (redecorated!=null){
            return redecorated;
        }else{
            return null;
        }
    }

    public ArrayList<Redecorated> getAllRedecorated()
    {//获得所装修信息
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        ArrayList<Redecorated> list = new ArrayList<Redecorated>();
        try{
            conn = DBHelper.getConnection();
            String sql = "select * from redecoratedinfo";//SQL语句
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();
            while(rs.next())
            {
                Redecorated redecorated = new Redecorated();
                redecorated.setRedecoratedId(rs.getInt("redecoratedId"));
                redecorated.setRedecoratedFunction(rs.getString("redecoratedFunction"));
                redecorated.setRedecoratedStyle(rs.getString("redecoratedStyle"));
                redecorated.setRedecoratedArea(rs.getString("redecoratedArea"));
                redecorated.setRedecoratedPrice(rs.getInt("redecoratedPrice"));
                redecorated.setRedecoratedImageName(rs.getString("redecoratedImageName"));
                redecorated.setRedecoratedPhone(rs.getString("redecoratedPhone"));
                redecorated.setRedecoratedDescribe(rs.getString("redecoratedDescribe"));
                redecorated.setRedecoratedCategory(rs.getString("redecoratedCategory"));
                list.add(redecorated);
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
    public ArrayList<Redecorated> getRedecoratedByFunction(String function)
    {//获得所装修信息
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        ArrayList<Redecorated> list = new ArrayList<Redecorated>();
        try{
            conn = DBHelper.getConnection();
            String sql = "select * from redecoratedinfo where redecoratedFunction=?";//SQL语句
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();
            stmt = conn.prepareStatement(sql);
//            stmt.setInt(1,id);
            stmt.setString(1,function);
            rs = stmt.executeQuery();
            while(rs.next())
            {
                Redecorated redecorated = new Redecorated();
                redecorated.setRedecoratedId(rs.getInt("redecoratedId"));
                redecorated.setRedecoratedFunction(rs.getString("redecoratedFunction"));
                redecorated.setRedecoratedStyle(rs.getString("redecoratedStyle"));
                redecorated.setRedecoratedArea(rs.getString("redecoratedArea"));
                redecorated.setRedecoratedPrice(rs.getInt("redecoratedPrice"));
                redecorated.setRedecoratedImageName(rs.getString("redecoratedImageName"));
                redecorated.setRedecoratedPhone(rs.getString("redecoratedPhone"));
                redecorated.setRedecoratedDescribe(rs.getString("redecoratedDescribe"));
                redecorated.setRedecoratedCategory(rs.getString("redecoratedCategory"));
                list.add(redecorated);
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
    public ArrayList<Redecorated> getRedecoratedByStyle(String style)
    {//获得所装修信息
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        ArrayList<Redecorated> list = new ArrayList<Redecorated>();
        try{
            conn = DBHelper.getConnection();
            String sql = "select * from redecoratedinfo where redecoratedStyle=?";//SQL语句
            stmt = conn.prepareStatement(sql);
            stmt.setString(1,style);
            rs = stmt.executeQuery();
            while(rs.next())
            {
                Redecorated redecorated = new Redecorated();
                redecorated.setRedecoratedId(rs.getInt("redecoratedId"));
                redecorated.setRedecoratedFunction(rs.getString("redecoratedFunction"));
                redecorated.setRedecoratedStyle(rs.getString("redecoratedStyle"));
                redecorated.setRedecoratedArea(rs.getString("redecoratedArea"));
                redecorated.setRedecoratedPrice(rs.getInt("redecoratedPrice"));
                redecorated.setRedecoratedImageName(rs.getString("redecoratedImageName"));
                redecorated.setRedecoratedPhone(rs.getString("redecoratedPhone"));
                redecorated.setRedecoratedDescribe(rs.getString("redecoratedDescribe"));
                redecorated.setRedecoratedCategory(rs.getString("redecoratedCategory"));
                list.add(redecorated);
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
