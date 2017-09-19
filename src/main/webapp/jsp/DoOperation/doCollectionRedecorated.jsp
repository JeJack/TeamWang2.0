<%@ page import="com.dao.UserCollectionDao" %>
<%@ page import="com.entity.UserCollection" %>
<%@ page import="com.entity.Redecorated" %>
<%@ page import="com.dao.RedecoratedDao" %><%--
  Created by IntelliJ IDEA.
  User: qiuje
  Date: 2017/9/13
  Time: 10:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("utf-8");
%>
<%
    UserCollectionDao userCollectionDao = new UserCollectionDao();
    UserCollection userCollection = new UserCollection();
    if (session.getAttribute("UserId")!=null){
        userCollection.setUserId(session.getAttribute("UserId").hashCode());

        RedecoratedDao redecoratedDao = new RedecoratedDao();
        Redecorated redecorated = redecoratedDao.getRedecoratedById(Integer.parseInt(request.getParameter("id")));
        if(redecorated!=null)
        {
            userCollection.setCollectionCategoryId(redecorated.getRedecoratedId());
            userCollection.setCollectionCategory(redecorated.getRedecoratedCategory());
            userCollectionDao.createCollectionSql(userCollection);
        }
        response.sendRedirect("../userCenter/collectionRedecorated.jsp");
    }else{
        response.sendRedirect("../login.jsp");
    }

%>