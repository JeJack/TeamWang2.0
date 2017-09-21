<%@ page import="com.entity.Users" %>
<%@ page import="com.dao.UsersDao" %><%--
  Created by IntelliJ IDEA.
  User: qiuje
  Date: 2017/9/12
  Time: 10:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("utf-8");
%>

<%
    UsersDao usersDao = new UsersDao();
    Users users = usersDao.getUsersByName(request.getParameter("username"));
    if (users!=null){
        if (usersDao.deleteUserByUserName(users.getUserName())){
            session.setAttribute("Info","用户数据删除成功");
            response.sendRedirect("../admin/DeleteUser.jsp");
            return;
        }
        else{
            session.setAttribute("Info","用户数据删除失败，请重试！！！");
            response.sendRedirect("../admin/DeleteUser.jsp");
        }
    }
%>
