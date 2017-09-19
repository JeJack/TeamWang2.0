<%@ page import="com.dao.OwnerTopicDao" %>
<%@ page import="com.entity.OwnerTopic" %>
<%@ page import="com.dao.OwnerTopicCommentDao" %>
<%@ page import="com.dao.FaqDao" %>
<%@ page import="com.entity.Faq" %><%--
  Created by IntelliJ IDEA.
  User: qiuje
  Date: 2017/9/19
  Time: 13:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("utf-8");
%>

<%
    FaqDao faqDao = new FaqDao();
    Faq faq = faqDao.getFaqByFaqId(Integer.parseInt(request.getParameter("id")));
    if (faq!=null){
        if (faqDao.deleteFAQByFAQId(faq.getFaqId())){
            session.setAttribute("Info","数据删除成功");
            response.sendRedirect("../admin/UpdateFAQ.jsp");
        }
        else{
            session.setAttribute("Info","数据删除失败，请重试");
            response.sendRedirect("../admin/UpdateFAQ.jsp");
        }
    }
%>
