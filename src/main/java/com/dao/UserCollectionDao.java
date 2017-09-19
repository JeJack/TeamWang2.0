package com.dao;

import com.entity.UserCollection;
import com.util.DBHelper;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

/**
 * Created by qiuje on 2017/9/8.
 */
public class UserCollectionDao {

    public ArrayList<UserCollection> getUserCollectionByUserId(int id) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        ArrayList<UserCollection> userCollectionArrayList = new ArrayList<UserCollection>();
//        UserCollection userCollection = new UserCollection();
//        Users user=new Users();//users 表的主键
//        ArrayList<Users> userlist = new ArrayList<Users>();
        try {
            conn = DBHelper.getConnection();
            String sql = "select * from usercollection where userId=?;"; // SQL语句
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1,id);
            rs = stmt.executeQuery();
            while (rs.next()) {
                UserCollection userCollection = new UserCollection();
                userCollection.setUserId(id);
                userCollection.setUserCollectionId(rs.getInt("userCollectionId"));
                userCollection.setCollectionCategory(rs.getString("collectionCategory"));
                userCollection.setCollectionCategoryId(rs.getInt("collectionCategoryId"));
                userCollectionArrayList.add(userCollection);
            }
            return userCollectionArrayList;
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

    public boolean deleteUserCollectionByUserCollectionId(int id){
        boolean flag=false;
        Connection conn = null;
        PreparedStatement stmt = null;
        try{
            conn = DBHelper.getConnection();
            String sql = "delete from usercollection where userCollectionId=?";
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

    public boolean deleteUserCollectionByRentHouseId(int id){
        boolean flag=false;
        Connection conn = null;
        PreparedStatement stmt = null;
        try{
            conn = DBHelper.getConnection();
            String sql = "delete from usercollection where collectionCategory=? and collectionCategoryId=?";
            stmt = conn.prepareStatement(sql);//可以替换变量
            stmt.setString(1,"renthouse");
            stmt.setInt(2,id);
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

    public boolean deleteUserCollectionByBuildingId(int id){
        boolean flag=false;
        Connection conn = null;
        PreparedStatement stmt = null;
        try{
            conn = DBHelper.getConnection();
            String sql = "delete from usercollection where collectionCategory=? and collectionCategoryId=?";
            stmt = conn.prepareStatement(sql);//可以替换变量
            stmt.setString(1,"building");
            stmt.setInt(2,id);
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

    public boolean deleteUserCollectionByRedecoratedId(int id){
        boolean flag=false;
        Connection conn = null;
        PreparedStatement stmt = null;
        try{
            conn = DBHelper.getConnection();
            String sql = "delete from usercollection where collectionCategory=? and collectionCategoryId=?";
            stmt = conn.prepareStatement(sql);//可以替换变量
            stmt.setString(1,"redecorated");
            stmt.setInt(2,id);
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

    public boolean createCollectionSql(UserCollection userCollection){
        //将用户收藏信息插入数据库
        boolean flag=false;
        Connection conn = null;
        PreparedStatement stmt = null;
        try{
            conn = DBHelper.getConnection();
            String sql="insert into usercollection(userId,collectionCategory,collectionCategoryId) values(?,?,?)";
            stmt = conn.prepareStatement(sql);//可以替换变量
            stmt.setInt(1,userCollection.getUserId());
            stmt.setString(2,userCollection.getCollectionCategory());
            stmt.setInt(3,userCollection.getCollectionCategoryId());
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
