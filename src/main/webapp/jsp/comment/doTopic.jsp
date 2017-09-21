<%--
  Created by IntelliJ IDEA.
  User: qiuje
  Date: 2017/9/18
  Time: 14:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="OTopic" class="com.entity.OwnerTopic" scope="page"/>
<jsp:useBean id="OTopicDao" class="com.dao.OwnerTopicDao" scope="page"/>
<jsp:setProperty name="OTopic" property="*"/>

<%
    if (session.getAttribute("UserId")!=null){
        OTopic.setOwnerUserId(session.getAttribute("UserId").hashCode());
        if (OTopic.getCategory()!=null&&OTopic.getCategory().equals("装修论坛贴子")){
            OTopic.setCategory("redecorated");
        }else if (OTopic.getCategory()!=null&&OTopic.getCategory().equals("业主论坛贴子")){
            OTopic.setCategory("owner");
        }
        OTopicDao.createOwnerTopicInfoSql(OTopic);

        int id=OTopicDao.getOwnerTopicByUserIdAndTopic(OTopic).getOwnerTopicId();
        String s = "topicDetails.jsp?id="+id;
        response.sendRedirect(s);
    }else {
        response.sendRedirect("../login.jsp");
    }
%>
