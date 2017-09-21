<%@ page import="com.entity.Users" %><%--
  Created by IntelliJ IDEA.
  User: qiuje
  Date: 2017/9/15
  Time: 8:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="userInfo" class="com.entity.Users" scope="page" />
<jsp:useBean id="usersDao" class="com.dao.UsersDao" scope="page" />
<jsp:setProperty name="userInfo" property="*" />

<%
    session.removeAttribute("InfoM");
    session.removeAttribute("Info");
    if (session.getAttribute("Email")!=null){
        if (userInfo.getUserLoginPassword()!=null&&userInfo.getUserLoginPassword().length()>0){
            Users users = usersDao.getUsersByEmail(session.getAttribute("Email").toString());
            users.setUserLoginPassword(userInfo.getUserLoginPassword());
            if (usersDao.modifyPasswordSql(users)){
                session.setAttribute("Info","密码修改成功，请登录");
                response.sendRedirect("../login.jsp");
                return;
            }
        }
    }
    session.setAttribute("Info","您填写的信息有误，请重试");
    response.sendRedirect("../settingPassword.jsp");

%>
