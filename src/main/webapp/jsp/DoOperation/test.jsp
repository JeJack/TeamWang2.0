<%--
  Created by IntelliJ IDEA.
  User: qiuje
  Date: 2017/9/4
  Time: 15:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录成功</title>
    <link rel="shortcut icon" href="../../images/logo.jpg" />
</head>
<body>
<%
    String loginUser="";
    if (session.getAttribute("Info")!=null)
    {
        loginUser=session.getAttribute("Info").toString();
    }
%>
<h1>欢迎  <font style="color: red"><%=loginUser%></font>，登录成功!!!</h1>
<h2><%=loginUser%></h2>
</body>
</html>