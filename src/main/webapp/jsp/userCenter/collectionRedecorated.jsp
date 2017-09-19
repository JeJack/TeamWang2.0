<%@ page import="java.util.ArrayList" %>
<%@ page import="com.dao.*" %>
<%@ page import="com.entity.*" %><%--
  Created by IntelliJ IDEA.
  User: qiuje
  Date: 2017/9/7
  Time: 15:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>我的收藏·装修</title>
    <link rel="shortcut icon" href="../../images/logo.jpg" />

    <!-- BOOTSTRAP STYLES-->
    <link href="../../css/assets/css/bootstrap.css" rel="stylesheet" />
    <!-- FONTAWESOME STYLES-->
    <link href="../../css/assets/css/font-awesome.css" rel="stylesheet" />
    <!-- CUSTOM STYLES-->
    <link href="../../css/assets/css/custom.css" rel="stylesheet" />
    <!-- GOOGLE FONTS-->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
</head>
<body>

<%
    request.setCharacterEncoding("utf-8");
%>
<%
    UsersDao usersDao = new UsersDao();
    if (session.getAttribute("UserId")!=null){
        Users user = usersDao.getUsersById(session.getAttribute("UserId").hashCode());
        UserCollectionDao userCollectionDao=new UserCollectionDao();
        ArrayList<UserCollection> userCollectionArrayList = userCollectionDao.getUserCollectionByUserId(user.getUserId());
%>
<div id="wrapper">
    <nav class="navbar navbar-default navbar-cls-top " role="navigation" style="margin-bottom: 0">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="userInfo.jsp">个人中心</a>
        </div>
        <div style="color: white;
padding: 15px 50px 5px 50px;
float: right;
font-size: 16px;">&nbsp; <a href="../homePage.jsp" class="btn btn-danger square-btn-adjust">返回主页</a> </div>
    </nav>
    <!-- /. NAV TOP  -->
    <nav class="navbar-default navbar-side" role="navigation">
        <div class="sidebar-collapse">
            <ul class="nav" id="main-menu">
                <li class="text-center">
                    <%
                        if (user.getUserPhoto()!=null){
                    %>
                    <%--<img src="<%=user.getUserPhoto()%>" style="height: 170px;width: 165px" class="user-image img-responsive"/>--%>
                    <a href="modifyUserPhoto.jsp"><img src="<%=user.getUserPhoto()%>" style="height: 170px;width: 165px" class="user-image img-responsive"/></a>
                    <p style="color: rgba(140,134,208,0.8)"><%=user.getUserName()%></p>
                    <%
                    }else{
                    %>
                    <a href="modifyUserPhoto.jsp"><img src="../../images/nullphoto.jpg" style="height: 170px;width: 165px" class="user-image img-responsive"/></a>
                    <p style="color: rgba(140,134,208,0.8)"><%=user.getUserName()%></p>
                    <%
                        }
                    %>
                </li>
                <li>
                    <a href="#"><i class="fa fa-sitemap fa-3x"></i> 我的信息<span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="userInfo.jsp">基本信息</a>
                        </li>
                        <li>
                            <a href="modifyuserInfo.jsp">修改个人信息</a>
                        </li>
                        <li>
                            <a href="modifyPassword.jsp">修改密码</a>
                        </li>
                    </ul>
                </li>

                <li>
                    <a href="#"><i class="fa fa-sitemap fa-3x"></i> 我的收藏<span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="collectionBuilding.jsp">楼盘</a>
                        </li>
                        <li>
                            <a href="collectionRentHouse.jsp">租房</a>
                        </li>
                        <li>
                            <a href="collectionRedecorated.jsp">装修</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#"><i class="fa fa-sitemap fa-3x"></i> 我的申请<span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="userApplyBuilding.jsp">申请楼盘</a>
                        </li>
                        <li>
                            <a href="userApplyRentHouse.jsp">申请租房</a>
                        </li>
                        <li>
                            <a href="userApplyRedecorated.jsp">申请装修</a>
                        </li>
                    </ul>
                </li>
            </ul>

        </div>

    </nav>
    <!-- /. NAV SIDE  -->
    <div id="page-wrapper" >
        <div id="page-inner">
            <div class="row">
                <div class="col-md-12">
                    <h2>我的收藏·装修</h2>
                    <h5>&nbsp;</h5>

                </div>
            </div>
            <!-- /. ROW  -->
            <hr />
            <%--<%--%>
                <%--for (int i =0;i<userCollectionArrayList.size();){--%>
            <%--%>--%>
            <div class="row">
                <%
                    for (int i =0;i<userCollectionArrayList.size();){
                    for (int j =0;j<3&&i<userCollectionArrayList.size();i++){
                        if ("redecorated".equals(userCollectionArrayList.get(i).getCollectionCategory())){
                    RedecoratedDao redecoratedDao = new RedecoratedDao();
                    Redecorated redecorated = redecoratedDao.getRedecoratedById(userCollectionArrayList.get(i).getCollectionCategoryId());
                %>

                <div class="col-sm-6 col-md-4 ser">
                    <div class="thumbnail">
                        <div class="caption">
                            <p><%=redecorated.getRedecoratedStyle()%>风格<%=redecorated.getRedecoratedFunction()%></p>
                        </div>
                        <div class="caption">
                            <a href="../redecorated/redecoratedDetails.jsp?id=<%=redecorated.getRedecoratedId()%>">
                                <img src="<%=redecorated.getRedecoratedImageName()%>" width="318px" height="300" alt="图片无法显示"/></a>
                        </div>
                        <div class="caption">
                            <p><%=redecorated.getRedecoratedDescribe()%></p>
                        </div>
                    </div>
                </div>

                <%
                            }
                        }
                    }
                %>
            </div>
            <%--<%--%>
                    <%--}--%>
                <%--}--%>
            <%--%>--%>
        </div>
        <!-- /. PAGE INNER  -->
    </div>
    <!-- /. PAGE WRAPPER  -->
</div>

<%
    }else{
        response.sendRedirect("../login.jsp");
    }
%>

<!-- /. WRAPPER  -->
<!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
<!-- JQUERY SCRIPTS -->
<script src="../../css/assets/js/jquery-1.10.2.js"></script>
<!-- BOOTSTRAP SCRIPTS -->
<script src="../../css/assets/js/bootstrap.min.js"></script>
<!-- METISMENU SCRIPTS -->
<script src="../../css/assets/js/jquery.metisMenu.js"></script>
<!-- CUSTOM SCRIPTS -->
<script src="../../css/assets/js/custom.js"></script>


</body>
</html>

