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
    session.removeAttribute("UserName");

    if (userInfo.getUserName()!=null&&userInfo.getUserName().length()>0&&userInfo.getUserPhoneNum()!=null&&userInfo.getUserPhoneNum().length()>0){
        if (null!=usersDao.getUsersByName(userInfo.getUserName())&&userInfo.getUserPhoneNum().equals(usersDao.getUsersByName(userInfo.getUserName()).getUserPhoneNum())){
            session.setAttribute("UserName",userInfo.getUserName());
            session.setAttribute("Info","验证成功，请重置密码");
            response.sendRedirect("../settingPassword.jsp");
            return;
        }
        session.setAttribute("Info","您填写的信息有误，请重试");
        response.sendRedirect("../forgetPassword.jsp");
    }
%>
