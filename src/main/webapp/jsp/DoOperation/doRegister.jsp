<%--
  Created by IntelliJ IDEA.
  User: qiuje
  Date: 2017/9/4
  Time: 14:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="userCreate" class="com.entity.Users" scope="page" />
<jsp:useBean id="usersDao" class="com.dao.UsersDao" scope="page" />
<%--<jsp:setProperty name="userCreate" property="*" />--%>
<jsp:setProperty name="userCreate" property="userName"/>
<jsp:setProperty name="userCreate" property="userLoginPassword"/>
<jsp:setProperty name="userCreate" property="userPhoneNum"/>

<%
    if (null==userCreate.getUserName()||userCreate.getUserName().length()<=0
            ||null==userCreate.getUserLoginPassword()||userCreate.getUserLoginPassword().length()<=0||
            null==userCreate.getUserPhoneNum()||userCreate.getUserPhoneNum().length()<=0)
            {
        session.setAttribute("Info","注册失败，有必填字段为空，请重试.");
        response.sendRedirect("../register.jsp");
        return;
//        request.getRequestDispatcher("../register.jsp").forward(request,response);
    }else{
        String  recheck = usersDao.usersCreate(userCreate);
        if (null!=recheck&&recheck.length()>0){
            if ("rename".equals(recheck))
            {
                session.setAttribute("Info","用户名已存在，请重新输入一个用户名");
//                request.getRequestDispatcher("../register.jsp").forward(request,response);
                response.sendRedirect("../register.jsp");
                return;
            }
            else if ("success".equals(recheck))
            {
                session.setAttribute("Info","注册成功，请登录");
//                request.getRequestDispatcher("../login.jsp").forward(request,response);
                response.sendRedirect("../login.jsp");
                return;
            }else if ("cc".equals(recheck)){
                session.setAttribute("Info","注册失败，请重试");
//                request.getRequestDispatcher("../register.jsp").forward(request,response);
                response.sendRedirect("../register.jsp");
                return;
            }
            else if ("dd".equals(recheck)){
                session.setAttribute("Info","注册失败，有必填字段为空，请重试");
//                request.getRequestDispatcher("../register.jsp").forward(request,response);
                response.sendRedirect("../register.jsp");
                return;
            }else if ("weizhi".equals(recheck)){
                session.setAttribute("Info","未知错误，请重试");
//                request.getRequestDispatcher("../register.jsp").forward(request,response);
                response.sendRedirect("../register.jsp");
                return;
            }
        }
        else{
            session.setAttribute("Info","未知错误，请重试");
//            request.getRequestDispatcher("../register.jsp").forward(request,response);
            response.sendRedirect("../register.jsp");
            return;
        }
    }
%>