<%@ page import="com.entity.Building" %><%--
  Created by IntelliJ IDEA.
  User: qiuje
  Date: 2017/9/11
  Time: 15:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="BuildInfo" class="com.entity.Building" scope="page"/>
<jsp:useBean id="BuildInfoDao" class="com.dao.BuildingDao" scope="page"/>
<jsp:setProperty name="BuildInfo" property="*"/>

<%
    if(BuildInfoDao.createBuildingInfoSql(BuildInfo)){
        Building building = BuildInfoDao.getBuildingByPhoneCharacteristic(BuildInfo);
        session.setAttribute("buildingId",building.getBuildingId());
        response.sendRedirect("../admin/UpdatePhoto.jsp");
    }
    else{
        session.setAttribute("Info","数据上传失败");
        request.getRequestDispatcher("test.jsp").forward(request,response);
    }
%>