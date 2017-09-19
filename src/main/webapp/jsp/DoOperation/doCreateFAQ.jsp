<%@ page import="com.dao.AdministratorDao" %>
<%@ page import="com.entity.Administrator" %><%--
  Created by IntelliJ IDEA.
  User: qiuje
  Date: 2017/9/19
  Time: 14:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="faq" class="com.entity.Faq" scope="page"/>
<jsp:useBean id="faqDao" class="com.dao.FaqDao" scope="page"/>
<jsp:setProperty name="faq" property="*"/>
<%
    AdministratorDao administratorDao = new AdministratorDao();
    if (session.getAttribute("administratorName")!=null) {
        Administrator administrator = administratorDao.getAdministratorsByName(session.getAttribute("administratorName").toString());

        if (faqDao.createFAQSql(faq)){
            session.setAttribute("InfoC","更新成功");
            response.sendRedirect("../admin/UpdateFAQ.jsp");
//            request.getRequestDispatcher("../admin/UpdateFAQ.jsp").forward(request,response);
        }else {
            session.setAttribute("InfoC","数据更新失败，请重试");
//            request.getRequestDispatcher("../admin/UpdateFAQ.jsp").forward(request,response);
            response.sendRedirect("../admin/UpdateFAQ.jsp");
        }
    }else {
        response.sendRedirect("AdminLogin.jsp");
    }
%>

