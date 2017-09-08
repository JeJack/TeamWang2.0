<%@ page import="com.dao.UsersDao" %>
<%@ page import="com.entity.Users" %><%--
  Created by IntelliJ IDEA.
  User: qiuje
  Date: 2017/9/4
  Time: 10:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Free Bootstrap Admin Template : Binary Admin</title>
    <!-- BOOTSTRAP STYLES-->
    <link href="../../css/assets/css/bootstrap.css" rel="stylesheet" />
    <!-- FONTAWESOME STYLES-->
    <link href="../../css/assets/css/font-awesome.css" rel="stylesheet" />
    <!-- MORRIS CHART STYLES-->
    <link href="../../css/assets/js/morris/morris-0.4.3.min.css" rel="stylesheet" />
    <!-- CUSTOM STYLES-->
    <link href="../../css/assets/css/custom.css" rel="stylesheet" />
    <!-- GOOGLE FONTS-->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body class="h4">
<div id="wrapper">
    <div class="navbar navbar-default navbar-cls-top " role="navigation" style="margin-bottom: 0">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="userInfo.jsp">个人中心</a>
            <div style="color: white;
padding: 15px 50px 5px 50px;
float: right;
font-size: 16px;">&nbsp; <a href="../homePage.jsp" class="btn btn-danger square-btn-adjust">退出</a> </div>
    </div>
    <!-- /. NAV TOP  -->
    <nav class="navbar-default navbar-side" role="navigation">
        <div class="sidebar-collapse">
            <ul class="nav" id="main-menu">
                <li class="text-center">
                    <img src="../../css/assets/img/find_user.png" class="user-image img-responsive"/>
                </li>
                <li>
                    <a class="active-menu"  href="userInfo.jsp"><i class="fa fa-dashboard fa-3x"></i> 基本信息</a>
                </li>
                <li>
                    <a  href="userCollection.jsp"><i class="fa fa-qrcode fa-3x"></i> 我的收藏</a>
                </li>
                <li>
                    <a   href="userApply.jsp"><i class="fa fa-bar-chart-o fa-3x"></i> 我的申请</a>
                </li>
            </ul>

        </div>

    </nav>
    <!-- /. NAV SIDE  -->

</div>

</div>
<div id="page-wrapper" >
    <div id="page-inner">
        <div class="row">
            <div class="col-md-12">
                <%
                    UsersDao usersDao = new UsersDao();
                    Users user = usersDao.getUsersByName("赵天下");
                %>
                <h2>基本信息</h2>
                <p>用户名：<%=user.getUserName()%></p>
                <p>昵称：<%=user.getUserNickname()%></p>
                <p>性别：<%=user.getUserSex()%></p>
                <p>电话号码：<%=user.getUserPhoneNum()%></p>
                <p>邮箱：<%=user.getUserEmail()%></p>
            </div>
            <div class="col-md-12">
                <h2>修改个人信息</h2>
            </div>
            <form class="form-horizontal" role="form" action="../DoOperation/doUserInfo.jsp" method="post">
                <div class="form-group">
                    <label  class="col-sm-2 control-label">昵称：</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="userNickname"
                               placeholder="请输入昵称">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">性别：</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="userSex"
                               placeholder="请输入性别男/女">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">邮箱：</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="userEmail"
                               placeholder="请输入邮箱">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button type="submit" class="btn btn-default">保存</button>
                    </div>
                </div>
            </form>
        </div>
        <!-- /. ROW  -->
        <hr />

    </div>
    <!-- /. PAGE WRAPPER  -->
</div>

<!-- /. WRAPPER  -->
<!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
<!-- JQUERY SCRIPTS -->
<script src="../../css/assets/js/jquery-1.10.2.js"></script>
<!-- BOOTSTRAP SCRIPTS -->
<script src="../../css/assets/js/bootstrap.min.js"></script>
<!-- METISMENU SCRIPTS -->
<script src="../../css/assets/js/jquery.metisMenu.js"></script>
<!-- MORRIS CHART SCRIPTS -->
<script src="../../css/assets/js/morris/raphael-2.1.0.min.js"></script>
<script src="../../css/assets/js/morris/morris.js"></script>
<!-- CUSTOM SCRIPTS -->
<script src="../../css/assets/js/custom.js"></script>

</body>
</html>