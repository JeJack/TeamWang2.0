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
    if (session.getAttribute("UserId")!=null){
        int Uid = session.getAttribute("UserId").hashCode();//获得用户ID
        if (null==userInfo.getUserLoginPassword()||userInfo.getUserLoginPassword().length()<=0)
        {
            session.setAttribute("InfoM","修改密码失败，有必填字段为空，请重试!");
            response.sendRedirect("../userCenter/modifyPassword.jsp");
        }else{
            String NewP = userInfo.getUserNickname();
            if (NewP!=null){
                Users users = usersDao.getUsersById(Uid);
                if (users.getUserLoginPassword().equals(userInfo.getUserLoginPassword())){
                    userInfo.setUserLoginPassword(NewP);
                    userInfo.setUserId(Uid);
                    if (usersDao.modifyPasswordSql(userInfo)){
                        session.setAttribute("Info","密码修改成功，请重新登录");
                        response.sendRedirect("../login.jsp");
                        return ;
                    }
                    session.setAttribute("InfoM","修改密码失败，请重试!");
                    response.sendRedirect("../userCenter/modifyPassword.jsp");
                }
            }
        }
        session.setAttribute("InfoM","密码修改失败，请重试！！");
        response.sendRedirect("../userCenter/modifyPassword.jsp");
        return;

    }else{
        response.sendRedirect("../login.jsp");
    }


%>
