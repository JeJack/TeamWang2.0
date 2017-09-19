package com.dao;

import com.entity.ReplyContactUs;
import com.util.DBHelper;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

/**
 * Created by qiuje on 2017/9/18.
 */
public class ReplyContactUsDao {
    public ArrayList<ReplyContactUs> getAllReplyContactUs() {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        ArrayList<ReplyContactUs> replyContactUses = new ArrayList<ReplyContactUs>();
        try {
            conn = DBHelper.getConnection();
            String sql = "select * from replycontactus;"; // SQL语句
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();
            while (rs.next()) {
                ReplyContactUs replyContactUs = new ReplyContactUs();
                replyContactUs.setReplyContactUsId(rs.getInt("replyContactUsId"));
                replyContactUs.setAdminName(rs.getString("adminName"));
                replyContactUs.setContactUsId(rs.getInt("contactUsId"));
                replyContactUs.setReply(rs.getString("reply"));
                replyContactUs.setReplyTime(rs.getObject("replyTime"));
               replyContactUses.add(replyContactUs);
            }
            return replyContactUses;
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

    public ReplyContactUs getReplyContactUsByContactUsId(int id) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        ReplyContactUs replyContactUs = new ReplyContactUs();
        try {
            conn = DBHelper.getConnection();
            String sql = "select * from replycontactus where contactUsId=?;"; // SQL语句
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1,id);
            rs = stmt.executeQuery();
            if (rs.next()) {
                replyContactUs.setReplyContactUsId(rs.getInt("replyContactUsId"));
                replyContactUs.setAdminName(rs.getString("adminName"));
                replyContactUs.setContactUsId(rs.getInt("contactUsId"));
                replyContactUs.setReply(rs.getString("reply"));
                replyContactUs.setReplyTime(rs.getObject("replyTime"));
            }
            return replyContactUs;
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

    public boolean createReplyContactUsSql(ReplyContactUs replyContactUs){
        //将FAQ信息插入数据库
        java.util.Date date=new java.util.Date();
        Timestamp nowdate2 = new Timestamp(date.getTime());
        replyContactUs.setReplyTime(nowdate2);
        boolean flag=false;
        Connection conn = null;
        PreparedStatement stmt = null;
        try{
            conn = DBHelper.getConnection();
            String sql="insert into replycontactus(adminName,contactUsId,reply,replyTime) values(?,?,?,?)";
            stmt = conn.prepareStatement(sql);//可以替换变量
            stmt.setString(1,replyContactUs.getAdminName());
            stmt.setInt(2,replyContactUs.getContactUsId());
            stmt.setString(3,replyContactUs.getReply());
            stmt.setObject(4,replyContactUs.getReplyTime());
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
