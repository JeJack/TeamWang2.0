package com.dao;

import com.entity.T;
import com.util.DBHelper;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

/**
 * Created by qiuje on 2017/9/12.
 */
public class TDao {
    public static void main(String[] args){
//        System.out.println(new java.util.Date().getTime());
//        Date time= new java.sql.Date(new java.util.Date().getTime());
//        System.out.println(time);
        java.util.Date date=new java.util.Date();
        Timestamp nowdate2 = new Timestamp(date.getTime());
        System.out.println("new Date():"+nowdate2);

//        System.out.println(java.sql.Timestamp(date.getTime()));
    }
    public boolean createBuildingInfoSql(T t){
        //将用户信息插入数据库
        boolean flag=false;
        Connection conn = null;
        PreparedStatement stmt = null;
        java.util.Date date=new java.util.Date();
        Timestamp nowdate2 = new Timestamp(date.getTime());
        try{
            conn = DBHelper.getConnection();
            String sql="insert into buildinginfo(T) values(?)";
            stmt = conn.prepareStatement(sql);//可以替换变量
            stmt.setObject(1,nowdate2);
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
