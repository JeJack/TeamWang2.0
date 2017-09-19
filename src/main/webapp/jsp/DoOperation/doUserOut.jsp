
<%@ page import="com.entity.Users" %><%--
<%--
  Created by IntelliJ IDEA.
  User: qiuje
  Date: 2017/9/13
  Time: 8:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("utf-8");
%>
<%
    if (session.getAttribute("UserId")!=null){
        session.removeAttribute("UserId");
        response.sendRedirect("../login.jsp");
    }else{
        response.sendRedirect("../login.jsp");
    }
%>

