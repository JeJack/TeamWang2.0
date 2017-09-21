<%@ page import="com.entity.RentHouse" %>
<%@ page import="com.entity.Administrator" %>
<%@ page import="com.dao.AdministratorDao" %><%--
  Created by IntelliJ IDEA.
  User: qiuje
  Date: 2017/9/11
  Time: 17:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("utf-8");
%>
<%
    AdministratorDao administratorDao = new AdministratorDao();
    if (session.getAttribute("administratorName")!=null){
        Administrator administrator = administratorDao.getAdministratorsByName(session.getAttribute("administratorName").toString());
%>

<jsp:useBean id="rentHouseInfo" class="com.entity.RentHouse" scope="page"/>
<jsp:useBean id="rentHouseDao" class="com.dao.RentHouseDao" scope="page"/>
<jsp:setProperty name="rentHouseInfo" property="*"/>

<%
    if(rentHouseDao.createRentHouseInfoSql(rentHouseInfo)){
        RentHouse rentHouse = rentHouseDao.getRentHouseByNamePhone(rentHouseInfo);
        session.setAttribute("rentHouseId",rentHouse.getRentHouseId());
        response.sendRedirect("../admin/UpdatePhoto.jsp");
        return;
    }
    else{
        session.setAttribute("Info","数据上传失败,请重试！！！");
        response.sendRedirect("../admin/UpdataApart.jsp");
    }
%>

<%
    }else{
        response.sendRedirect("AdminLogin.jsp");
    }
%>