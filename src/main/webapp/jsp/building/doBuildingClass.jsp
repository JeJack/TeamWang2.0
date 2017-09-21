<%@ page import="java.util.ArrayList" %>
<%@ page import="com.entity.Building" %><%--
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
<jsp:useBean id="building" class="com.entity.Building" scope="page"/>
<jsp:useBean id="buildingDao" class="com.dao.BuildingDao" scope="page"/>
<jsp:setProperty name="building" property="*"/>
<%
    ArrayList<Building> buildings = new ArrayList<Building>();
    if (building.getBuildingDistrict().equals("不限")&&building.getBuildingFloor().equals("不限")){
        buildings=buildingDao.getClassDouble(building);
    }else if (building.getBuildingDistrict().equals("不限")){
        buildings=buildingDao.getClassDis(building);
        System.out.println("我是进来的出去");
    }else if (building.getBuildingFloor().equals("不限")){
        buildings=buildingDao.getClassFloor(building);
        System.out.println("我是进来的");
    }else{
        buildings=buildingDao.getClass(building);
    }
    session.setAttribute("buildings",buildings);
    response.sendRedirect("building.jsp");
%>
