package com.dao;

import com.entity.OwnerTopicComment;
import com.util.DBHelper;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

/**
 * Created by qiuje on 2017/9/8.
 */
public class OwnerTopicCommentDao {

    public OwnerTopicComment getOwnerTopicCommentByOwnerTopicCommentId(int id) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        OwnerTopicComment ownerTopicComment = new OwnerTopicComment();
//        OwnerTopic ownerTopic = new OwnerTopic();
//        Users user=new Users();//users 表的主键
        try {
            conn = DBHelper.getConnection();
            String sql = "select * from ownertopiccomment where ownerTopicCommentId=?;"; // SQL语句
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1,id);
            rs = stmt.executeQuery();
            if (rs.next()) {
                ownerTopicComment.setOwnerTopicCommentId(rs.getInt("ownerTopicCommentId"));
                ownerTopicComment.setOwnerTopicId(rs.getInt("ownerTopicId"));
                ownerTopicComment.setOwnerTopicUserId(rs.getInt("userId"));
                ownerTopicComment.setComment(rs.getString("comment"));
                ownerTopicComment.setCommentTime(rs.getObject("commentTime"));
            }
            else{
                ownerTopicComment=null;
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
        if (ownerTopicComment!=null){
            return ownerTopicComment;
        }else{
            return null;
        }
    }

    public ArrayList<OwnerTopicComment> getAllOwnerTopicCommentByOwnerTopicId(int id) {//获得贴子对应的所有评论信息
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        ArrayList<OwnerTopicComment> list = new ArrayList<OwnerTopicComment>();
        try{
            conn = DBHelper.getConnection();
            String sql = "select * from ownertopiccomment where ownerTopicId=?;"; // SQL语句
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1,id);
            rs = stmt.executeQuery();
            while(rs.next())
            {
                OwnerTopicComment ownerTopicComment = new OwnerTopicComment();
                ownerTopicComment.setOwnerTopicCommentId(rs.getInt("ownerTopicCommentId"));
                ownerTopicComment.setOwnerTopicUserId(rs.getInt("userId"));
                ownerTopicComment.setOwnerTopicId(rs.getInt("ownerTopicId"));
                ownerTopicComment.setCommentTime(rs.getObject("commentTime"));
                ownerTopicComment.setComment(rs.getString("comment"));

                list.add(ownerTopicComment);
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

    public boolean deleteOwnerTopicCommentByOwnerTopicId(int id){
        boolean flag=false;
        Connection conn = null;
        PreparedStatement stmt = null;
        try{
            conn = DBHelper.getConnection();
            String sql = "delete from ownertopiccomment where ownerTopicId=?;";
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

    public boolean createOwnerTopicCommentInfoSql(OwnerTopicComment ownerTopicComment){
        //将评论信息插入数据库
        java.util.Date date=new java.util.Date();
        Timestamp nowdate2 = new Timestamp(date.getTime());
        ownerTopicComment.setCommentTime(nowdate2);
        boolean flag=false;
        Connection conn = null;
        PreparedStatement stmt = null;
        try{
            conn = DBHelper.getConnection();
            String sql="insert into ownertopiccomment(userId,ownerTopicId,comment,commentTime) values(?,?,?,?)";
            stmt = conn.prepareStatement(sql);//可以替换变量
            stmt.setInt(1,ownerTopicComment.getOwnerTopicUserId());
            stmt.setInt(2,ownerTopicComment.getOwnerTopicId());
            stmt.setString(3,ownerTopicComment.getComment());
            stmt.setObject(4,ownerTopicComment.getCommentTime());
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
