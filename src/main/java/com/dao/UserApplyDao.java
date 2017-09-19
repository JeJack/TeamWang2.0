package com.dao;

import com.entity.UserApply;
import com.entity.Users;
import com.util.DBHelper;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

/**
 * Created by qiuje on 2017/9/14.
 */
public class UserApplyDao {
    public ArrayList<UserApply> getAllUserApply() {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        ArrayList<UserApply> userApplies = new ArrayList<UserApply>();
        try {
            conn = DBHelper.getConnection();
            String sql = "select * from userapply"; // SQL语句
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();
            while (rs.next()) {
                UserApply userApply = new UserApply();
                userApply.setUserApplyId(rs.getInt("userApplyId"));
                userApply.setUserName(rs.getString("userName"));
                userApply.setUserPhoneNum(rs.getString("userPhoneNum"));
                userApply.setApplyCategory(rs.getString("applyCategory"));
                userApply.setCategoryId(rs.getInt("categoryId"));
                userApply.setApplyTime(rs.getObject("applyTime"));
                userApplies.add(userApply);
            }
            return userApplies;
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
    public ArrayList<UserApply> getAllApplyBuilding() {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        ArrayList<UserApply> userApplies = new ArrayList<UserApply>();
        try {
            conn = DBHelper.getConnection();
            String sql = "select * from userapply where applyCategory=?"; // SQL语句
            stmt = conn.prepareStatement(sql);
            stmt.setString(1,"building");
            rs = stmt.executeQuery();
            while (rs.next()) {
                UserApply userApply = new UserApply();
                userApply.setUserApplyId(rs.getInt("userApplyId"));
                userApply.setUserName(rs.getString("userName"));
                userApply.setUserPhoneNum(rs.getString("userPhoneNum"));
                userApply.setApplyCategory(rs.getString("applyCategory"));
                userApply.setCategoryId(rs.getInt("categoryId"));
                userApply.setApplyTime(rs.getObject("applyTime"));
                userApplies.add(userApply);
            }
            return userApplies;
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
    public ArrayList<UserApply> getAllApplyRentHouse() {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        ArrayList<UserApply> userApplies = new ArrayList<UserApply>();
        try {
            conn = DBHelper.getConnection();
            String sql = "select * from userapply where applyCategory=?"; // SQL语句
            stmt = conn.prepareStatement(sql);
            stmt.setString(1,"renthouse");
            rs = stmt.executeQuery();
            while (rs.next()) {
                UserApply userApply = new UserApply();
                userApply.setUserApplyId(rs.getInt("userApplyId"));
                userApply.setUserName(rs.getString("userName"));
                userApply.setUserPhoneNum(rs.getString("userPhoneNum"));
                userApply.setApplyCategory(rs.getString("applyCategory"));
                userApply.setCategoryId(rs.getInt("categoryId"));
                userApply.setApplyTime(rs.getObject("applyTime"));
                userApplies.add(userApply);
            }
            return userApplies;
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
    public ArrayList<UserApply> getAllApplyRedecorated() {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        ArrayList<UserApply> userApplies = new ArrayList<UserApply>();
        try {
            conn = DBHelper.getConnection();
            String sql = "select * from userapply where applyCategory=?"; // SQL语句
            stmt = conn.prepareStatement(sql);
            stmt.setString(1,"redecorated");
            rs = stmt.executeQuery();
            while (rs.next()) {
                UserApply userApply = new UserApply();
                userApply.setUserApplyId(rs.getInt("userApplyId"));
                userApply.setUserName(rs.getString("userName"));
                userApply.setUserPhoneNum(rs.getString("userPhoneNum"));
                userApply.setApplyCategory(rs.getString("applyCategory"));
                userApply.setCategoryId(rs.getInt("categoryId"));
                userApply.setApplyTime(rs.getObject("applyTime"));
                userApplies.add(userApply);
            }
            return userApplies;
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

    public ArrayList<UserApply> getUserApplyByBuildingId(int id) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        ArrayList<UserApply> userApplies = new ArrayList<UserApply>();
        try {
            conn = DBHelper.getConnection();
            String sql = "select * from userapply where applyCategory=? and categoryId=?;"; // SQL语句
            stmt = conn.prepareStatement(sql);
            stmt.setString(1,"building");
            stmt.setInt(2,id);
            rs = stmt.executeQuery();
            while (rs.next()) {
                UserApply userApply = new UserApply();
                userApply.setUserApplyId(rs.getInt("userApplyId"));
                userApply.setUserName(rs.getString("userName"));
                userApply.setUserPhoneNum(rs.getString("userPhoneNum"));
                userApply.setApplyCategory(rs.getString("applyCategory"));
                userApply.setCategoryId(rs.getInt("categoryId"));
                userApply.setApplyTime(rs.getObject("applyTime"));
                userApplies.add(userApply);
            }
            return userApplies;
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

    public ArrayList<UserApply> getUserApplyByRentHouseId(int id) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        ArrayList<UserApply> userApplies = new ArrayList<UserApply>();
        try {
            conn = DBHelper.getConnection();
            String sql = "select * from userapply where applyCategory=? and categoryId=?;"; // SQL语句
            stmt = conn.prepareStatement(sql);
            stmt.setString(1,"renthouse");
            stmt.setInt(2,id);
            rs = stmt.executeQuery();
            while (rs.next()) {
                UserApply userApply = new UserApply();
                userApply.setUserApplyId(rs.getInt("userApplyId"));
                userApply.setUserName(rs.getString("userName"));
                userApply.setUserPhoneNum(rs.getString("userPhoneNum"));
                userApply.setApplyCategory(rs.getString("applyCategory"));
                userApply.setCategoryId(rs.getInt("categoryId"));
                userApply.setApplyTime(rs.getObject("applyTime"));
                userApplies.add(userApply);
            }
            return userApplies;
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

    public ArrayList<UserApply> getUserApplyByRedecoratedId(int id) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        ArrayList<UserApply> userApplies = new ArrayList<UserApply>();
        try {
            conn = DBHelper.getConnection();
            String sql = "select * from userapply where applyCategory=? and categoryId=?;"; // SQL语句
            stmt = conn.prepareStatement(sql);
            stmt.setString(1,"redecorated");
            stmt.setInt(2,id);
            rs = stmt.executeQuery();
            while (rs.next()) {
                UserApply userApply = new UserApply();
                userApply.setUserApplyId(rs.getInt("userApplyId"));
                userApply.setUserName(rs.getString("userName"));
                userApply.setUserPhoneNum(rs.getString("userPhoneNum"));
                userApply.setApplyCategory(rs.getString("applyCategory"));
                userApply.setCategoryId(rs.getInt("categoryId"));
                userApply.setApplyTime(rs.getObject("applyTime"));
                userApplies.add(userApply);
            }
            return userApplies;
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

    public ArrayList<UserApply> getUserApplyByUserId(int id,String category) {
        UsersDao usersDao = new UsersDao();
        Users users = usersDao.getUsersById(id);
        if (users.getUserName()==null){
            return null;
        }
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        ArrayList<UserApply> userApplies = new ArrayList<UserApply>();
        try {
            conn = DBHelper.getConnection();
            String sql = "select * from userapply where userName=? and applyCategory=?;"; // SQL语句
            stmt = conn.prepareStatement(sql);
            stmt.setString(1,users.getUserName());
            stmt.setString(2,category);
            rs = stmt.executeQuery();
            while (rs.next()) {
                UserApply userApply = new UserApply();
                userApply.setUserApplyId(rs.getInt("userApplyId"));
                userApply.setUserName(rs.getString("userName"));
                userApply.setUserPhoneNum(rs.getString("userPhoneNum"));
                userApply.setApplyCategory(rs.getString("applyCategory"));
                userApply.setCategoryId(rs.getInt("categoryId"));
                userApply.setApplyTime(rs.getObject("applyTime"));
                userApplies.add(userApply);
            }
            return userApplies;
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

    public boolean createApplySql(UserApply userApply){
        //将用户收藏信息插入数据库
        java.util.Date date=new java.util.Date();
        Timestamp nowdate2 = new Timestamp(date.getTime());
        userApply.setApplyTime(nowdate2);
        boolean flag=false;
        Connection conn = null;
        PreparedStatement stmt = null;
        try{
            conn = DBHelper.getConnection();
            String sql="insert into userapply(userName,userPhoneNum,applyCategory,categoryId,applyTime) values(?,?,?,?,?)";
            stmt = conn.prepareStatement(sql);//可以替换变量
            stmt.setString(1,userApply.getUserName());
            stmt.setString(2,userApply.getUserPhoneNum());
            stmt.setString(3,userApply.getApplyCategory());
            stmt.setInt(4,userApply.getCategoryId());
            stmt.setObject(5,userApply.getApplyTime());
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
