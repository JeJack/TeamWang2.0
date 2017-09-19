<%--
  Created by IntelliJ IDEA.
  User: qiuje
  Date: 2017/9/15
  Time: 16:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="pragma" content="no-cache" />
    <base target="_self">
    <title>上传头像</title>
    <link rel="shortcut icon" href="../../images/logo.jpg" />
</head>
<body>
<%
    String UPinfo="";
    if (session.getAttribute("Info")!=null)
    {
        UPinfo=session.getAttribute("Info").toString();
    }
%>
<p><%=UPinfo%></p><P>请点击选择文件，选择图片上传</p>
<form method="post" action="../DoOperation/doUpdateUserPhoto.jsp" enctype="multipart/form-data">
    <input type="file" name="file" value="file">
    <input type="submit" value="确定">
</form>
<p><a href="userInfo.jsp">返回</a></p>
</body>
</html>
