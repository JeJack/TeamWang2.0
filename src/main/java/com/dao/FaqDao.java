package com.dao;

import com.entity.Faq;
import com.util.DBHelper;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

/**
 * Created by qiuje on 2017/9/18.
 */
public class FaqDao {
    public Faq getFaqByFaqId(int id) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Faq faq = new Faq();
        try {
            conn = DBHelper.getConnection();
            String sql = "select * from faq where faqId=?;"; // SQL语句
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1,id);
            rs = stmt.executeQuery();
            if (rs.next()) {
                faq.setFaqTheme(rs.getString("faqTheme"));
                faq.setFaq(rs.getString("faq"));
                faq.setFaqId(rs.getInt("faqId"));
                faq.setFaqTime(rs.getObject("faqTime"));
            }
            else{
                faq=null;
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
        return faq;
    }

    public ArrayList<Faq> getAllFaq() {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        ArrayList<Faq> faqs = new ArrayList<Faq>();
        try {
            conn = DBHelper.getConnection();
            String sql = "select * from faq;"; // SQL语句
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();
            while (rs.next()) {
                Faq faq = new Faq();
                faq.setFaqTheme(rs.getString("faqTheme"));
                faq.setFaq(rs.getString("faq"));
                faq.setFaqId(rs.getInt("faqId"));
                faq.setFaqTime(rs.getObject("faqTime"));
                faqs.add(faq);
            }
            return faqs;
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

    public boolean deleteFAQByFAQId(int id){
        boolean flag=false;
        Connection conn = null;
        PreparedStatement stmt = null;
        try{
            conn = DBHelper.getConnection();
            String sql = "delete from faq where faqId=?";
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

    public boolean createFAQSql(Faq faq){
        //将用户反馈信息插入数据库
        java.util.Date date=new java.util.Date();
        Timestamp nowdate2 = new Timestamp(date.getTime());
        faq.setFaqTime(nowdate2);
        boolean flag=false;
        Connection conn = null;
        PreparedStatement stmt = null;
        try{
            conn = DBHelper.getConnection();
            String sql="insert into faq(faqTheme,faq,faqTime) values(?,?,?);";
            stmt = conn.prepareStatement(sql);//可以替换变量
            stmt.setString(1,faq.getFaqTheme());
            stmt.setString(2,faq.getFaq());
            stmt.setObject(3,faq.getFaqTime());
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
