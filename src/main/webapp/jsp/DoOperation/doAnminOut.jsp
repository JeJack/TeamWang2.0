<%@ page import="com.entity.Users" %><%--
  Created by IntelliJ IDEA.
  User: qiuje
  Date: 2017/9/12
  Time: 16:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("utf-8");
%>
<%
    if (session.getAttribute("administratorName")!=null){
        session.removeAttribute("administratorName");
        response.sendRedirect("../homePage.jsp");
    }else{
        response.sendRedirect("../homePage.jsp");
    }
%>
