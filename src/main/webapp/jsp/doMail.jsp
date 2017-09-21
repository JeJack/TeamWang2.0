<%--
  Created by IntelliJ IDEA.
  User: qiuje
  Date: 2017/9/21
  Time: 17:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="user" class="com.entity.Users" scope="page"/>
<jsp:useBean id="userDao" class="com.dao.UsersDao" scope="page"/>
<jsp:useBean id="MailC" class="com.util.MailConfirm" scope="page"/>
<jsp:setProperty name="user" property="*"/>

<%
    if (user.getUserEmail()!=null){
        MailC.sendMail(user.getUserEmail());
        session.setAttribute("Email",user.getUserEmail());
        session.setAttribute("Code",MailC.icode);
        response.sendRedirect("MailCode.jsp");
    }
%>