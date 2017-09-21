<%@ page import="com.entity.Users" %><%--
  Created by IntelliJ IDEA.
  User: qiuje
  Date: 2017/9/4
  Time: 14:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="loginUser" class="com.entity.Users" scope="page" />
<jsp:useBean id="usersDao" class="com.dao.UsersDao" scope="page" />
<jsp:setProperty name="loginUser" property="*" />

<%
    if (usersDao.usersLogin(loginUser))
    {
        Users u=usersDao.getUsersByName(loginUser.getUserName());
        session.setAttribute("UserId",u.getUserId());
        response.sendRedirect("../homePage.jsp");
    }
    else
    {
        session.setAttribute("Info","账号 或密码错误");
        response.sendRedirect("../login.jsp");
    }
%>
