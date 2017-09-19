<%--
  Created by IntelliJ IDEA.
  User: qiuje
  Date: 2017/9/18
  Time: 11:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="OTComent" class="com.entity.OwnerTopicComment" scope="page"/>
<jsp:useBean id="OTComentDao" class="com.dao.OwnerTopicCommentDao" scope="page"/>
<jsp:setProperty name="OTComent" property="comment"/>

<%
    if (session.getAttribute("UserId")!=null&&session.getAttribute("OTID")!=null){
        OTComent.setOwnerTopicUserId(session.getAttribute("UserId").hashCode());
        OTComent.setOwnerTopicId(session.getAttribute("OTID").hashCode());
        int id=session.getAttribute("OTID").hashCode();
        OTComentDao.createOwnerTopicCommentInfoSql(OTComent);
        session.removeAttribute("OTID");
        String s = "topicDetails.jsp?id="+id;
        response.sendRedirect(s);
    }else {
        response.sendRedirect("../login.jsp");
    }
%>

