<%@ page import="com.entity.Administrator" %><%--
  Created by IntelliJ IDEA.
  User: qiuje
  Date: 2017/9/11
  Time: 14:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="adminLogin" class="com.entity.Administrator" scope="page"/>
<jsp:useBean id="adminDao" class="com.dao.AdministratorDao" scope="page"/>
<jsp:setProperty name="adminLogin" property="*"/>

<%
    if (adminDao.AdministratorLogin(adminLogin))
    {
        Administrator administrator = adminDao.getAdministratorsByName(adminLogin.getAdministratorName());
        session.setAttribute("administratorName",administrator.getAdministratorName());
        response.sendRedirect("AdminIndex.jsp");
    }
    else
    {
        session.setAttribute("Info","用户名或密码错误，请重试");
        request.getRequestDispatcher("AdminLogin.jsp").forward(request,response);
    }
%>

