package com.dao;

import com.entity.ContactUs;
import com.util.DBHelper;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

/**
 * Created by qiuje on 2017/9/18.
 */
public class ContactUsDao {
    public ArrayList<ContactUs> getAllContactUs() {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        ArrayList<ContactUs> contactUses = new ArrayList<ContactUs>();
        try {
            conn = DBHelper.getConnection();
            String sql = "select * from contactus order by Ctime desc;"; // SQL语句
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();
            while (rs.next()) {
                ContactUs contactUs = new ContactUs();
                contactUs.setContactUsId(rs.getInt("contactUsId"));
                contactUs.setUserId(rs.getInt("userId"));
                contactUs.setTheme(rs.getString("theme"));
                contactUs.setFaq(rs.getString("faq"));
                contactUs.setCtime(rs.getObject("Ctime"));
                contactUses.add(contactUs);
            }
            return contactUses;
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

    public ArrayList<ContactUs> getContactUsByUserId(int id) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        ArrayList<ContactUs> contactUses = new ArrayList<ContactUs>();
        try {
            conn = DBHelper.getConnection();
            String sql = "select * from contactus where userId=?;"; // SQL语句
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1,id);
            rs = stmt.executeQuery();
            while (rs.next()) {
                ContactUs contactUs = new ContactUs();
                contactUs.setContactUsId(rs.getInt("contactUsId"));
                contactUs.setUserId(rs.getInt("userId"));
                contactUs.setTheme(rs.getString("theme"));
                contactUs.setFaq(rs.getString("faq"));
                contactUs.setCtime(rs.getObject("Ctime"));
                contactUses.add(contactUs);
            }
            return contactUses;
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


    public ContactUs getContactUsById(int id) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        ContactUs contactUs = new ContactUs();
        try {
            conn = DBHelper.getConnection();
            String sql = "select * from contactus where contactUsId=?;"; // SQL语句
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1,id);
            rs = stmt.executeQuery();
            if (rs.next()) {
                contactUs.setContactUsId(rs.getInt("contactUsId"));
                contactUs.setUserId(rs.getInt("userId"));
                contactUs.setTheme(rs.getString("theme"));
                contactUs.setFaq(rs.getString("faq"));
                contactUs.setCtime(rs.getObject("Ctime"));
            }else{
                contactUs=null;
            }
            return contactUs;
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

    public boolean createContactUsSql(ContactUs contactUs){
        //将用户反馈信息插入数据库
        java.util.Date date=new java.util.Date();
        Timestamp nowdate2 = new Timestamp(date.getTime());
        contactUs.setCtime(nowdate2);
        boolean flag=false;
        Connection conn = null;
        PreparedStatement stmt = null;
        try{
            conn = DBHelper.getConnection();
            String sql="insert into contactus(userId,theme,faq,Ctime) values(?,?,?,?)";
            stmt = conn.prepareStatement(sql);//可以替换变量
            stmt.setInt(1,contactUs.getUserId());
            stmt.setString(2,contactUs.getTheme());
            stmt.setString(3,contactUs.getFaq());
            stmt.setObject(4,contactUs.getCtime());
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
