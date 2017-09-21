<%@ page import="java.util.ArrayList" %>
<%@ page import="com.entity.RentHouse" %><%--
  Created by IntelliJ IDEA.
  User: qiuje
  Date: 2017/9/20
  Time: 11:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="rentHouseInfo" class="com.entity.RentHouse" scope="page"/>
<jsp:useBean id="rentHouseDao" class="com.dao.RentHouseDao" scope="page"/>
<jsp:setProperty name="rentHouseInfo" property="*"/>

<%
    ArrayList<RentHouse> rentHouses = new ArrayList<>();

    if (rentHouseInfo.getRentHouseDistrict().equals("不限")&&rentHouseInfo.getRentHouseFloor().equals("不限")){
        rentHouses=rentHouseDao.getClassDouble(rentHouseInfo);
    }else if (rentHouseInfo.getRentHouseDistrict().equals("不限")){
        rentHouses=rentHouseDao.getClassDis(rentHouseInfo);
    }else if (rentHouseInfo.getRentHouseFloor().equals("不限")){
        rentHouses=rentHouseDao.getClassFloor(rentHouseInfo);
    }else{
        rentHouses=rentHouseDao.getClass(rentHouseInfo);
    }
    session.setAttribute("rentHouses",rentHouses);
    response.sendRedirect("rentHouse.jsp");
%>
