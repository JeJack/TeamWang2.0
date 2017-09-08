<%@ page import="com.entity.RentHouse" %>
<%@ page import="com.dao.RentHouseDao" %>
<%@ page import="com.entity.RentHouseImage" %>
<%@ page import="com.dao.RentHouseImageDao" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: qiuje
  Date: 2017/9/4
  Time: 11:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%--%>
    <%--String path = request.getContextPath();--%>
    <%--String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";--%>
<%--%>--%>

<html>
<head>
    <%--<base href="<%=basePath%>">--%>
    <title>房源信息</title>
</head>
<h1>房源信息</h1>
<hr>
<center>
    <table width="750" height="60" cellpadding="0" cellspacing="0" border="0">
        <tr>
            <!-- 房源信息 -->
            <%
                RentHouseDao RHD=new RentHouseDao();
                RentHouse RHouse = RHD.getRentHouseById(Integer.parseInt(request.getParameter("id")));
                if(RHouse!=null)
                {
                    RentHouseImageDao RHIDao = new RentHouseImageDao();
                    ArrayList<RentHouseImage> RHimage=RHIDao.getAllRentHouseImageNameByRentHouseId(RHouse.getRentHouseId());
                    if(0<RHimage.size()){
                        RentHouseImage rhimage=RHimage.get(0);
            %>
            <td width="70%" valign="top">
                <table>
                    <tr>
                        <td rowspan="8"><img src="../../images/rentHouseImage/<%=rhimage.getRentHouseImageName()%>" width="480px" height="400px" alt="图片无法显示" /></td>
                    </tr>
                    <tr>
                        <td><B><%=RHouse.getRentHouseName() %></B></td>
                    </tr>
                    <tr>
                        <td>地址：<%=RHouse.getRentHouseAddress()%></td>
                    </tr>
                    <tr>
                        <td>地址：<%=RHouse.getRentHouseAddress()%></td>
                    </tr>
                    <tr>
                        <td>租金：￥<%=RHouse.getRentHousePrice() %></td>
                    </tr>
                </table>
            </td>
            <div class="wholePage">
                <div class="disImage">
                    <%--显示图片--%>
                </div>
                <div class="disHouseInfo">
                    <%--显示房源信息--%>
                </div>
            </div>
            <%
                    }
                }
            %>
        </tr>
    </table>
</center>
</body>
</html>
