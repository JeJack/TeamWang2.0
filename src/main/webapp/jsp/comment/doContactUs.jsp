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
<jsp:useBean id="contactUs" scope="page" class="com.entity.ContactUs"/>
<jsp:useBean id="contactUsDao" scope="page" class="com.dao.ContactUsDao"/>
<jsp:setProperty name="contactUs" property="*"/>

<%
    if (session.getAttribute("UserId")!=null){
        contactUs.setUserId(session.getAttribute("UserId").hashCode());
        if (contactUsDao.createContactUsSql(contactUs)){
            session.setAttribute("Info","提交成功，请耐心等待!!!");
        }
        response.sendRedirect("contactUs.jsp");
        return;
    }
    response.sendRedirect("../login.jsp");

%>
