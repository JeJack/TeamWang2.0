package com.entity;

/**
 * Created by qiuje on 2017/9/11.
 */
public class Administrator {
    private int administratorId;
    private String administratorName;
    private String administratorPassword;
    private String administratorPowerInfo;
    private String administratorEmail;
    public Administrator(){}

    public int getAdministratorId() {
        return administratorId;
    }

    public void setAdministratorId(int administratorId) {
        this.administratorId = administratorId;
    }

    public String getAdministratorName() {
        return administratorName;
    }

    public void setAdministratorName(String administratorName) {
        this.administratorName = administratorName;
    }

    public String getAdministratorPassword() {
        return administratorPassword;
    }

    public void setAdministratorPassword(String administratorPassword) {
        this.administratorPassword = administratorPassword;
    }

    public String getAdministratorPowerInfo() {
        return administratorPowerInfo;
    }

    public void setAdministratorPowerInfo(String administratorPowerInfo) {
        this.administratorPowerInfo = administratorPowerInfo;
    }

    public String getAdministratorEmail() {
        return administratorEmail;
    }

    public void setAdministratorEmail(String administratorEmail) {
        this.administratorEmail = administratorEmail;
    }
}
