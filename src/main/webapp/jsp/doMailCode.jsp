<%--
  Created by IntelliJ IDEA.
  User: qiuje
  Date: 2017/9/21
  Time: 17:27
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="user" class="com.entity.Users" scope="page"/>
<jsp:useBean id="userDao" class="com.dao.UsersDao" scope="page"/>
<jsp:setProperty name="user" property="*"/>

<%
    if (session.getAttribute("Code")!=null&&session.getAttribute("Email")!=null){
        if (session.getAttribute("Code").equals(user.getUserLoginPassword())){

            user.setUserEmail(session.getAttribute("Email").toString());
            user.setUserName(user.getUserEmail());
            System.out.println(user.getUserEmail());
            session.removeAttribute("Code");
            if (userDao.createUserByEmailSql(user)){
                user = userDao.getUsersByName(user.getUserEmail());
                session.setAttribute("UserId",user.getUserId());
                session.removeAttribute("Email");
                response.sendRedirect("homePage.jsp");
                return;
            }
            session.setAttribute("Info","验证码错误，请重试！！！");
            response.sendRedirect("MailCode.jsp");
            return;
        }
        session.setAttribute("Info","验证码错误，请重试！！！");
        response.sendRedirect("MailCode.jsp");
        return;
    }
%>

