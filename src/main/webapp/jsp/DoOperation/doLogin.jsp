<%--
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

//        session.setAttribute("Info",loginUser.getUserName());
//        request.getRequestDispatcher("test.jsp").forward(request,response);
        response.sendRedirect("../homePage.jsp");
    }
    else
    {
        response.sendRedirect("../login.jsp");
//        session.setAttribute("Info","账号 或密码错误");
//        request.getRequestDispatcher("../login.jsp").forward(request,response);
    }
%>
