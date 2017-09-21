<%--
  Created by IntelliJ IDEA.
  User: qiuje
  Date: 2017/9/7
  Time: 16:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="userCreateInfo" class="com.entity.Users" scope="page" />
<jsp:useBean id="usersDao" class="com.dao.UsersDao" scope="page" />
<jsp:setProperty name="userCreateInfo" property="*" />

<%
    if (session.getAttribute("UserId")!=null){
        userCreateInfo.setUserId(session.getAttribute("UserId").hashCode());
    }
    if (null==userCreateInfo.getUserNickname()||userCreateInfo.getUserNickname().length()<=0)
    {
        session.setAttribute("Info","修改失败，有必填字段为空，请重试.");
        response.sendRedirect("../userCenter/modifyuserInfo.jsp");
    }else{

        if (usersDao.createUserInfoSql(userCreateInfo)){
            session.setAttribute("Info","修改成功");
            response.sendRedirect("../userCenter/modifyuserInfo.jsp");
        }
        else{
            session.setAttribute("Info","修改失败，请重试");
            response.sendRedirect("../userCenter/modifyuserInfo.jsp");
        }
    }
%>
