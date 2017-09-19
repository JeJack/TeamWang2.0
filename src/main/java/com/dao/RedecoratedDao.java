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

    public ArrayList<Redecorated> getAllRedecorated(){//获得所有装修信息
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
    {//根据装修功能，获得该功能的所有装修信息
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

    public ArrayList<Redecorated> getRedecoratedByFunctionAndStyle(String function,String style)
    {//根据装修功能，获得该功能的所有装修信息
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        ArrayList<Redecorated> list = new ArrayList<Redecorated>();
        try{
            conn = DBHelper.getConnection();
            String sql = "select * from redecoratedinfo where redecoratedFunction=? and redecoratedStyle=?";//SQL语句
            stmt = conn.prepareStatement(sql);
//            stmt.setInt(1,id);
            stmt.setString(1,function);
            stmt.setString(2,style);
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
    {//根据装修风格，获得该风格所有装修信息
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

    public boolean createRedecoratedInfoSql(Redecorated redecorated){
        //将装修信息插入数据库
        redecorated.setRedecoratedCategory("redecorated");
        boolean flag=false;
        Connection conn = null;
        PreparedStatement stmt = null;
        try{
            conn = DBHelper.getConnection();
            String sql="insert into redecoratedinfo(redecoratedFunction,redecoratedStyle,redecoratedArea,redecoratedPrice,redecoratedImageName,redecoratedPhone,redecoratedDescribe,redecoratedCategory) values(?,?,?,?,?,?,?,?)";
            stmt = conn.prepareStatement(sql);//可以替换变量
            stmt.setString(1,redecorated.getRedecoratedFunction());//可以把?替换成变量。
            stmt.setString(2,redecorated.getRedecoratedStyle());
            stmt.setString(3,redecorated.getRedecoratedArea());
            stmt.setInt(4,redecorated.getRedecoratedPrice());
            stmt.setString(5,redecorated.getRedecoratedImageName());
            stmt.setString(6,redecorated.getRedecoratedPhone());
            stmt.setString(7,redecorated.getRedecoratedDescribe());
            stmt.setString(8,redecorated.getRedecoratedCategory());
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

    public boolean createRedecoratedImageSql(Redecorated redecorated){
        //将照片信息插入数据库
        boolean flag=false;
        Connection conn = null;
        PreparedStatement stmt = null;
        try{
            conn = DBHelper.getConnection();
            String sql = "update redecoratedinfo set redecoratedImageName=? where redecoratedId=?";
            stmt = conn.prepareStatement(sql);//可以替换变量
            stmt.setString(1,redecorated.getRedecoratedImageName());//可以把?替换成变量。
            stmt.setInt(2,redecorated.getRedecoratedId());
            if(stmt.executeUpdate()!=0){
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


    public boolean deleteRedecoratedByRedecoratedId(int id){
        boolean flag=false;
        Connection conn = null;
        PreparedStatement stmt = null;
        try{
            conn = DBHelper.getConnection();
            String sql = "delete from redecoratedinfo where redecoratedId=?";
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

    public Redecorated getRedecoratedByPriceDescribe(Redecorated r){
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Redecorated redecorated = new Redecorated();

//        ArrayList<Users> userlist = new ArrayList<Users>();
        try {
            conn = DBHelper.getConnection();
            String sql = "select * from redecoratedinfo where redecoratedPrice=? and redecoratedDescribe=?;"; // SQL语句
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1,r.getRedecoratedPrice());
            stmt.setString(2,r.getRedecoratedDescribe());
//            stmt.setString(1,username);
            rs = stmt.executeQuery();
            if (rs.next()) {
                redecorated.setRedecoratedId(rs.getInt("redecoratedId"));
                redecorated.setRedecoratedFunction(rs.getString("redecoratedFunction"));
                redecorated.setRedecoratedStyle(rs.getString("redecoratedStyle"));
                redecorated.setRedecoratedArea(rs.getString("redecoratedArea"));
                redecorated.setRedecoratedPrice(rs.getInt("redecoratedPrice"));
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
        return redecorated;
    }



}
