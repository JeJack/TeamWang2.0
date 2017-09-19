<%@ page import="com.entity.Building" %>
<%@ page import="com.dao.BuildingDao" %>
<%@ page import="com.dao.UserCollectionDao" %>
<%@ page import="com.entity.UserCollection" %><%--
  Created by IntelliJ IDEA.
  User: qiuje
  Date: 2017/9/13
  Time: 9:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("utf-8");
%>
<%
    UserCollectionDao userCollectionDao = new UserCollectionDao();
    UserCollection userCollection = new UserCollection();
    if (session.getAttribute("UserId")!=null){
        userCollection.setUserId(session.getAttribute("UserId").hashCode());
        BuildingDao BDao=new BuildingDao();
        Building Build=BDao.getBuildingById(Integer.parseInt(request.getParameter("id")));
        if (Build!=null){
            userCollection.setCollectionCategoryId(Build.getBuildingId());
            userCollection.setCollectionCategory(Build.getBuildingCategory());
            userCollectionDao.createCollectionSql(userCollection);
        }
        response.sendRedirect("../userCenter/collectionBuilding.jsp");
    }else{
        response.sendRedirect("../login.jsp");
    }

%>
