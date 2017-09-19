package com.dao;

import com.entity.Administrator;
import com.util.DBHelper;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * Created by qiuje on 2017/9/11.
 */
public class AdministratorDao {
    public  boolean AdministratorLogin(Administrator admin)
    {
        if (admin.getAdministratorName()!=null &&admin.getAdministratorPassword()!=null){
            if (null!=getAdministratorsByName(admin.getAdministratorName())){
                if (admin.getAdministratorPassword().equals(getAdministratorsByName(admin.getAdministratorName()).getAdministratorPassword())){
                    return true;
                }
            }
        }
        return false;
    }

    public Administrator getAdministratorsByName(String adminname) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Administrator administrator = new Administrator();
        try {
            conn = DBHelper.getConnection();
            String sql = "select * from administrator where administratorName=?;"; // SQL语句
            stmt = conn.prepareStatement(sql);
            stmt.setString(1,adminname);
            rs = stmt.executeQuery();
            if (rs.next()) {
                administrator.setAdministratorId(rs.getInt("administratorId"));
                administrator.setAdministratorName(rs.getString("administratorName"));
                administrator.setAdministratorPassword(rs.getString("administratorPassword"));
                administrator.setAdministratorPowerInfo(rs.getString("administratorPowerInfo"));
                administrator.setAdministratorEmail(rs.getString("administratorEmail"));
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
        return administrator;
    }


}
