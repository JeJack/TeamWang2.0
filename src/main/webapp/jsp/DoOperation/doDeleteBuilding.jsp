<%@ page import="com.entity.Building" %>
<%@ page import="com.dao.BuildingDao" %>
<%@ page import="com.dao.BuildingImageDao" %>
<%@ page import="com.dao.UserCollectionDao" %><%--
  Created by IntelliJ IDEA.
  User: qiuje
  Date: 2017/9/12
  Time: 9:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("utf-8");
%>

<%
    BuildingDao buildingDao=new BuildingDao();
    BuildingImageDao buildingImageDao = new BuildingImageDao();
    UserCollectionDao userCollectionDao = new UserCollectionDao();
    Building building=buildingDao.getBuildingById(Integer.parseInt(request.getParameter("id")));
    if (building!=null){
       if (buildingDao.deleteBuildingByBuildingId(building.getBuildingId())){

           buildingImageDao.deleteBuildingImageByBuildingId(building.getBuildingId());
           userCollectionDao.deleteUserCollectionByBuildingId(building.getBuildingId());
           session.setAttribute("Info","reho数据删除成功");
           request.getRequestDispatcher("test.jsp").forward(request,response);
       }
       else{
           session.setAttribute("Info","reho数据删除失败");
           request.getRequestDispatcher("test.jsp").forward(request,response);
       }
    }
%>
