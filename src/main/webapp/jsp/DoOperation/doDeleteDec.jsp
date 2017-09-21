<%@ page import="com.dao.RedecoratedDao" %>
<%@ page import="com.entity.Redecorated" %>
<%@ page import="com.dao.UserCollectionDao" %><%--
  Created by IntelliJ IDEA.
  User: qiuje
  Date: 2017/9/12
  Time: 11:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("utf-8");
%>

<%
    RedecoratedDao redecoratedDao = new RedecoratedDao();
    UserCollectionDao userCollectionDao = new UserCollectionDao();
    Redecorated redecorated = redecoratedDao.getRedecoratedById(Integer.parseInt(request.getParameter("id")));
    if (redecorated!=null){
        if (redecoratedDao.deleteRedecoratedByRedecoratedId(redecorated.getRedecoratedId())){
            userCollectionDao.deleteUserCollectionByRedecoratedId(redecorated.getRedecoratedId());
            session.setAttribute("Info","装修数据删除成功");
            response.sendRedirect("../admin/DeleteDec.jsp");
            return;
        }
        else{
            session.setAttribute("Info","装修数据删除失败，请重试");
            response.sendRedirect("../admin/DeleteDec.jsp");
//            return;
        }
    }
%>
