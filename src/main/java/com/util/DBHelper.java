package com.util;

import com.entity.OwnerTopicComment;

import java.sql.*;

public class DBHelper {

    private static final String driver = "com.mysql.jdbc.Driver"; //数据库驱动
    //连接数据库的URL地址
    private static final String url="jdbc:mysql://localhost:3306/easypurchase?characterEncoding=utf8&useSSL=true";
    private static final String username="root";//数据库的用户名
    private static final String password="000000";//数据库的密码

    private static Connection conn=null;

    //静态代码块负责加载驱动
    static
    {
        try
        {
            Class.forName(driver);
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
    }

    //单例模式返回数据库连接对象
    public static Connection getConnection() throws Exception
    {
        if(conn==null)
        {
            conn = DriverManager.getConnection(url, username, password);
            return conn;
        }
        return conn;
    }

    public static void main(String[] args) {
        PreparedStatement stmt = null;
        ResultSet rs = null;
        int id=1;
        try
        {
            Connection conn = DBHelper.getConnection();
            String sql = "select * from ownertopiccomment where ownerTopicId=?;"; // SQL语句
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1,id);
            rs = stmt.executeQuery();
            if (rs.next()) {
//                Date date = rs.getObject("commentTime");
                Object date = rs.getObject("commentTime");
                System.out.println(date);
//                System.out.println(rs.getObject("commentTime"));
                System.out.println(rs.getString("comment"));
            }
            if(conn!=null)
            {
                System.out.println("数据库连接正常！");
            }
            else
            {
                System.out.println("数据库连接异常！");
            }
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }

    }
}
