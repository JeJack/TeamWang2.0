package com.dao;

import java.sql.*;

import com.entity.Users;
import com.util.DBHelper;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


/**
 * Created by qiuje on 2017/9/4.
 */

public class UsersDao {
    //用户登陆方法
    public  boolean usersLogin(Users u)
    {
        if (u.getUserName()!=null && u.getUserLoginPassword()!=null){

            if (null!=getUsersByName(u.getUserName())){
                if (u.getUserLoginPassword().equals(getUsersByName(u.getUserName()).getUserLoginPassword()))
                {
                    return true;
                }
            }
        }
        return false;

    }

    public String usersCreate(Users u){//判断传过来的用户信息，是否创建用户
        if (null==u.getUserName()||u.getUserName().length()<=0||
                null==u.getUserLoginPassword()|| u.getUserLoginPassword().length()<=0
                || null==u.getUserPhoneNum()||u.getUserPhoneNum().length()<=0) {

            return "dd";//"有必填字段为空，请检查";
        }
        else {
            Users check = getUsersByName(u.getUserName());
            if (check==null){
                if (createUserSql(u)){
                    return "success";// "注册成功，请登录";
                }else {
                    return "cc";//"注册失败，请重试";
                }
            }//check
            else{
                return "rename";  //"用户名已存在，请重新输入一个用户名";
            }
        }

    }

    public String usersCreateInfo(Users u){//判断传过来的用户信息，是否创建用户
        u.setUserName("1222");
        if (null==u.getUserName()||u.getUserName().length()<=0) {
            return "dd";//"有必填字段为空，请检查";
        }
        else {
            Users check = getUsersByName(u.getUserName());
//            check=null;
            if (check!=null){
                if (createUserInfoSql(u)){
                    return "success";// "注册成功，请登录";
                }else {
                    return "cc";//"注册失败，请重试";
                }
            }//check
            else{
                return "rename";  //"用户名不存在，请重新输入用户名";
            }
        }
    }

    public Users getUsersById(int id) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Users user=new Users();//users 表的主键
        try {
            conn = DBHelper.getConnection();
            String sql = "select * from UserInfo where userId=?;"; // SQL语句
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1,id);
            rs = stmt.executeQuery();
            if (rs.next()) {
                user.setUserId(rs.getInt("userId"));
                user.setUserName(rs.getString("userName"));
                user.setUserNickname(rs.getString("userNickname"));
                user.setUserLoginPassword(rs.getString("userLoginPassword"));
                user.setUserPhoneNum(rs.getString("userPhoneNum"));
                user.setUserSex(rs.getString("userSex"));
                user.setUserEmail(rs.getString("userEmail"));
                user.setUserPhoto(rs.getString("userPhoto"));
//                userlist.add(user);
//                return user;
            }
            else{
                user=null;
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
        if (user!=null){
            return user;
        }else{
            return null;
        }
    }

    public Users getUsersByName(String username) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Users user=new Users();//users 表的主键
//        ArrayList<Users> userlist = new ArrayList<Users>();
        try {
            conn = DBHelper.getConnection();
            String sql = "select * from UserInfo where userName=?;"; // SQL语句
            stmt = conn.prepareStatement(sql);
            stmt.setString(1,username);
            rs = stmt.executeQuery();
            if (rs.next()) {
                user.setUserId(rs.getInt("userId"));
                user.setUserName(rs.getString("userName"));
                user.setUserNickname(rs.getString("userNickname"));
                user.setUserLoginPassword(rs.getString("userLoginPassword"));
                user.setUserPhoneNum(rs.getString("userPhoneNum"));
                user.setUserSex(rs.getString("userSex"));
                user.setUserEmail(rs.getString("userEmail"));
                user.setUserPhoto(rs.getString("userPhoto"));

            }
            else{
                user=null;
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
        if (user!=null){
            return user;
        }else{
            return null;
        }
    }

    public ArrayList<Users> getAllUsers(){
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        ArrayList<Users> usersArrayList = new ArrayList<Users>();

//        ArrayList<Users> userlist = new ArrayList<Users>();
        try {
            conn = DBHelper.getConnection();
            String sql = "select * from UserInfo"; // SQL语句
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();
            while(rs.next()) {
                Users user=new Users();//users 表的主键
                user.setUserId(rs.getInt("userId"));
                user.setUserName(rs.getString("userName"));
                user.setUserNickname(rs.getString("userNickname"));
                user.setUserLoginPassword(rs.getString("userLoginPassword"));
                user.setUserPhoneNum(rs.getString("userPhoneNum"));
                user.setUserSex(rs.getString("userSex"));
                user.setUserEmail(rs.getString("userEmail"));
                user.setUserPhoto(rs.getString("userPhoto"));
                usersArrayList.add(user);
            }
            return usersArrayList;
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

    public boolean deleteUserByUserName(String username){
        boolean flag=false;
        Connection conn = null;
        PreparedStatement stmt = null;
        try{
            conn = DBHelper.getConnection();
            String sql = "delete from userinfo where userName=?";
            stmt = conn.prepareStatement(sql);//可以替换变量
            stmt.setString(1,username);
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

    public boolean createUserSql(Users u){
        //将用户信息插入数据库
        boolean flag=false;
        Connection conn = null;
        PreparedStatement stmt = null;
        try{
            conn = DBHelper.getConnection();
            String sql="insert into UserInfo(userName,userLoginPassword,userPhoneNum) values(?,?,?)";
            stmt = conn.prepareStatement(sql);//可以替换变量
            stmt.setString(1,u.getUserName());//可以把?替换成变量。
            stmt.setString(2,u.getUserLoginPassword());
            stmt.setString(3,u.getUserPhoneNum());
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

    public boolean createUserInfoSql(Users u){
        //将用户信息插入数据库
        boolean flag=false;
        Connection conn = null;
        PreparedStatement stmt = null;
        try{
            conn = DBHelper.getConnection();
            String sql = "update UserInfo set userNickname=?,userSex=?,userEmail=? where userId=?";
            stmt = conn.prepareStatement(sql);//可以替换变量
            stmt.setString(1,u.getUserNickname());//可以把?替换成变量。
            stmt.setString(2,u.getUserSex());
            stmt.setString(3,u.getUserEmail());
            stmt.setInt(4,u.getUserId());
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

    public boolean modifyPasswordSql(Users u){
        //将用户信息插入数据库
        boolean flag=false;
        Connection conn = null;
        PreparedStatement stmt = null;
        try{
            conn = DBHelper.getConnection();
            String sql = "update UserInfo set userLoginPassword=? where userId=?";
            stmt = conn.prepareStatement(sql);//可以替换变量
            stmt.setString(1,u.getUserLoginPassword());//可以把?替换成变量。
            stmt.setInt(2,u.getUserId());
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

    public boolean createUserPhotoSql(Users users){
        //将用户信息插入数据库
        boolean flag=false;
        Connection conn = null;
        PreparedStatement stmt = null;
        try{
            conn = DBHelper.getConnection();
            String sql = "update UserInfo set userPhoto=? where userId=?";
            stmt = conn.prepareStatement(sql);//可以替换变量
            stmt.setString(1,users.getUserPhoto());//可以把?替换成变量。
            stmt.setInt(2,users.getUserId());
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
}
