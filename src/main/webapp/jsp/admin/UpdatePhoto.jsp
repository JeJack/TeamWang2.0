<%--
  Created by IntelliJ IDEA.
  User: qiuje
  Date: 2017/9/13
  Time: 10:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="pragma" content="no-cache" />
    <base target="_self">
    <title>上传图片</title>
</head>
<body>
<h2>上传的信息已经保存，请上传源信息对应的图</h2>
<%
    String UPinfo="";
    if (session.getAttribute("Info")!=null)
    {
        UPinfo=session.getAttribute("Info").toString();
        session.removeAttribute("Info");
    }
%>
<p><%=UPinfo%></p><P>请点击选择文件，选择图片上传</p>
<form method="post" action="doUpPhoto.jsp" enctype="multipart/form-data">
    <input type="file" name="file" value="file">
    <input type="submit" value="确定">
</form>
<p><a href="AdminIndex.jsp">返回</a></p>
</body>
</html>