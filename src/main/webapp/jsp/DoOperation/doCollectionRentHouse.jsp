<%@ page import="com.dao.UserCollectionDao" %>
<%@ page import="com.entity.UserCollection" %>
<%@ page import="com.entity.RentHouse" %>
<%@ page import="com.dao.RentHouseDao" %><%--
  Created by IntelliJ IDEA.
  User: qiuje
  Date: 2017/9/13
  Time: 10:01
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

        RentHouseDao rentHouseDao = new RentHouseDao();
        RentHouse rentHouse=rentHouseDao.getRentHouseById(Integer.parseInt(request.getParameter("id")));
        if (rentHouse!=null){
            userCollection.setCollectionCategoryId(rentHouse.getRentHouseId());
            userCollection.setCollectionCategory(rentHouse.getRentHouseCategory());
            userCollectionDao.createCollectionSql(userCollection);
        }
        response.sendRedirect("../userCenter/collectionRentHouse.jsp");
    }else{
        response.sendRedirect("../login.jsp");
    }

%>
