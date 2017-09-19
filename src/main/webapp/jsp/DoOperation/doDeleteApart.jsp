<%@ page import="com.dao.RentHouseDao" %>
<%@ page import="com.entity.RentHouse" %>
<%@ page import="com.dao.RentHouseImageDao" %>
<%@ page import="com.dao.UserCollectionDao" %><%--
  Created by IntelliJ IDEA.
  User: qiuje
  Date: 2017/9/12
  Time: 11:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("utf-8");
%>

<%
    RentHouseDao rentHouseDao = new RentHouseDao();
    RentHouseImageDao rentHouseImageDao = new RentHouseImageDao();
    UserCollectionDao userCollectionDao = new UserCollectionDao();
    RentHouse rentHouse = rentHouseDao.getRentHouseById(Integer.parseInt(request.getParameter("id")));
    if (rentHouse!=null){
        if (rentHouseDao.deleteRentHouseByRentHouseId(rentHouse.getRentHouseId())){
            rentHouseImageDao.deleteRentHouseImageByRentHouseId(rentHouse.getRentHouseId());
            userCollectionDao.deleteUserCollectionByRentHouseId(rentHouse.getRentHouseId());
            session.setAttribute("Info","数据删除成功");
            response.sendRedirect("../admin/DeleteApart.jsp");
//            request.getRequestDispatcher("../admin/DeleteApart.jsp").forward(request,response);
            return;
        }
        else{
            session.setAttribute("Info","数据删除失败,请重试");
            response.sendRedirect("../admin/DeleteApart.jsp");
//            request.getRequestDispatcher("../admin/DeleteApart.jsp").forward(request,response);
        }
    }
%>
