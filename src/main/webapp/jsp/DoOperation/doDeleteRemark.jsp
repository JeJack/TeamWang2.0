<%@ page import="com.dao.OwnerTopicDao" %>
<%@ page import="com.entity.OwnerTopic" %>
<%@ page import="com.dao.OwnerTopicCommentDao" %><%--
  Created by IntelliJ IDEA.
  User: qiuje
  Date: 2017/9/12
  Time: 13:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("utf-8");
%>

<%
    OwnerTopicDao ownerTopicDao=new OwnerTopicDao();
    OwnerTopic ownerTopic = ownerTopicDao.getOwnerTopicByOwnerTopicId(Integer.parseInt(request.getParameter("id")));
    OwnerTopicCommentDao ownerTopicCommentDao = new OwnerTopicCommentDao();
    if (ownerTopic!=null){
        if (ownerTopicDao.deleteOwnerTopicByOwnerTopicId(ownerTopic.getOwnerTopicId())&&ownerTopicCommentDao.deleteOwnerTopicCommentByOwnerTopicId(ownerTopic.getOwnerTopicId())){
            session.setAttribute("Info","论坛数据删除成功");
            response.sendRedirect("../admin/DeleteRemark.jsp");
            return;
        }
        else{
            session.setAttribute("Info","论坛数据删除失败，请重试！！");
            response.sendRedirect("../admin/DeleteRemark.jsp");
        }
    }
%>
