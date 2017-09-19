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
            session.setAttribute("Info","reho数据删除成功");
            request.getRequestDispatcher("test.jsp").forward(request,response);
        }
        else{
            session.setAttribute("Info","reho数据删除失败");
            request.getRequestDispatcher("test.jsp").forward(request,response);
        }
    }
%>
