<%@ page import="com.entity.Redecorated" %><%--
  Created by IntelliJ IDEA.
  User: qiuje
  Date: 2017/9/11
  Time: 21:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="redecoratedInfo" class="com.entity.Redecorated" scope="page"/>
<jsp:useBean id="redecoratedDao" class="com.dao.RedecoratedDao" scope="page"/>
<jsp:setProperty name="redecoratedInfo" property="*"/>

<%
    if (redecoratedDao.createRedecoratedInfoSql(redecoratedInfo)){
        Redecorated redecorated = redecoratedDao.getRedecoratedByPriceDescribe(redecoratedInfo);
        session.setAttribute("redecoratedId",redecorated.getRedecoratedId());
        response.sendRedirect("../admin/UpdatePhoto.jsp");
        return;
    }
    else{
        session.setAttribute("Info","数据上传失败,请重试！！！");
        response.sendRedirect("../admin/UpdataDec.jsp");
    }
%>
