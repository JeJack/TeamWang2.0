<%--
  Created by IntelliJ IDEA.
  User: qiuje
  Date: 2017/9/14
  Time: 15:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.entity.UserApply" %>
<%@ page import="com.dao.UserApplyDao" %>
<%@ page import="com.entity.Users" %>
<%@ page import="com.dao.UsersDao" %>

<%
    request.setCharacterEncoding("utf-8");
%>
<%
    UserApplyDao userApplyDao = new UserApplyDao();
    UserApply userApply = new UserApply();
    if (session.getAttribute("UserId")!=null){
        UsersDao usersDao = new UsersDao();
        Users users = usersDao.getUsersById(session.getAttribute("UserId").hashCode());
        userApply.setUserName(users.getUserName());
        userApply.setUserPhoneNum(users.getUserPhoneNum());
        userApply.setApplyCategory("renthouse");
        userApply.setCategoryId(Integer.parseInt(request.getParameter("id")));
        userApplyDao.createApplySql(userApply);
        response.sendRedirect("../userCenter/userApplyRentHouse.jsp");
    }else{
        response.sendRedirect("../login.jsp");
    }

%>

