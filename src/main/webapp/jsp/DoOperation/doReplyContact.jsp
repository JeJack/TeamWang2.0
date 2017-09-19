<%--
  Created by IntelliJ IDEA.
  User: qiuje
  Date: 2017/9/18
  Time: 16:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="replyContact" class="com.entity.ReplyContactUs" scope="page"/>
<jsp:useBean id="replyContactDao" class="com.dao.ReplyContactUsDao" scope="page"/>
<jsp:setProperty name="replyContact" property="*"/>

<%
    if (session.getAttribute("administratorName")!=null){
        replyContact.setAdminName(session.getAttribute("administratorName").toString());
        if (replyContactDao.createReplyContactUsSql(replyContact)){
            session.setAttribute("Info","回复成功!!!");
        }
        response.sendRedirect("../admin/ReplyContact.jsp");
        return;
    }
    session.setAttribute("Info","尚未登录，请登录");
    response.sendRedirect("../admin/AdminLogin.jsp");

%>
