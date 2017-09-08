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
    if (null==userCreateInfo.getUserNickname()||userCreateInfo.getUserNickname().length()<=0)
    {
        session.setAttribute("Info","注册失败，有必填字段为空，请重试.JSP363");
        request.getRequestDispatcher("test.jsp").forward(request,response);
    }else{
        String  recheck = usersDao.usersCreateInfo(userCreateInfo);
        if (null!=recheck&&recheck.length()>0){
            if ("rename".equals(recheck))
            {
                session.setAttribute("Info","用户名不存在，请重新输入用户名22");
                request.getRequestDispatcher("test.jsp").forward(request,response);
            }
            else if ("success".equals(recheck))
            {
                session.setAttribute("Info","注册成功，请登录");
                request.getRequestDispatcher("test.jsp").forward(request,response);
            }else if ("cc".equals(recheck)){
                session.setAttribute("Info","注册失败，请重试");
                request.getRequestDispatcher("test.jsp").forward(request,response);
            }
            else if ("dd".equals(recheck)){
                session.setAttribute("Info","注册失败，有必填字段为空，请重试");
                request.getRequestDispatcher("test.jsp").forward(request,response);
            }else if ("weizhi".equals(recheck)){
                session.setAttribute("Info","判断未知");
                request.getRequestDispatcher("registerInfo.jsp").forward(request,response);
            }
        }
        else{
            session.setAttribute("Info","未知错误，请重试");
            request.getRequestDispatcher("test.jsp").forward(request,response);
        }
    }
%>
