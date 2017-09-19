<%@ page import="com.dao.RedecoratedDao" %>
<%@ page import="com.entity.Redecorated" %>
<%@ page import="com.dao.AdministratorDao" %>
<%@ page import="com.entity.Administrator" %><%--
  Created by IntelliJ IDEA.
  User: qiuje
  Date: 2017/9/11
  Time: 11:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>查看装修案例</title>
    <link rel="shortcut icon" href="../../images/logo.jpg" />
    <!-- BOOTSTRAP STYLES-->
    <link href="../../admin/assets/css/bootstrap.css" rel="stylesheet" />
    <!-- FONTAWESOME STYLES-->
    <link href="../../admin/assets/css/font-awesome.css" rel="stylesheet" />
    <!-- CUSTOM STYLES-->
    <link href="../../admin/assets/css/custom.css" rel="stylesheet" />
    <!-- GOOGLE FONTS-->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />


</head>
<body>
<%
    request.setCharacterEncoding("utf-8");
%>

<%
    AdministratorDao administratorDao = new AdministratorDao();
    if (session.getAttribute("administratorName")!=null){
        Administrator administrator = administratorDao.getAdministratorsByName(session.getAttribute("administratorName").toString());
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
            <a class="navbar-brand" href="AdminIndex.jsp">后台管理</a>
        </div>
        <div style="color: white;
padding: 15px 50px 5px 50px;
float: right;
font-size: 16px;"> <a href="../DoOperation/doAnminOut.jsp" class="btn btn-danger square-btn-adjust">退出</a> </div>
    </nav>
    <!-- /. NAV TOP  -->
    <nav class="navbar-default navbar-side" role="navigation">
        <div class="sidebar-collapse">
            <ul class="nav" id="main-menu">
                <li class="text-center">
                    <img src="../../admin/assets/img/find_user.png" class="user-image img-responsive"/>
                </li>
                <li>
                    <a href="#"><i class="fa fa-sitemap fa-3x"></i> 用户管理<span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="ViewUser.jsp">查看用户</a>
                        </li>
                        <li>
                            <a href="DeleteUser.jsp">删除用户</a>
                        </li>

                    </ul>
                </li>
                <li>
                    <a href="#"><i class="fa fa-sitemap fa-3x"></i> 楼盘管理<span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="ViewBuilding.jsp">查看楼盘</a>
                        </li>
                        <li>
                            <a href="UpdataBuilding.jsp">楼盘上架</a>
                        </li>
                        <li>
                            <a href="DeleteBuilding.jsp">楼盘下架</a>
                        </li>
                        <li>
                            <a href="ApplyBuilding.jsp">楼盘申请</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#"><i class="fa fa-sitemap fa-3x"></i> 租房管理<span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="ViewApart.jsp">查看租房</a>
                        </li>
                        <li>
                            <a href="UpdataApart.jsp">租房上架</a>
                        </li>
                        <li>
                            <a href="DeleteApart.jsp">租房下架</a>
                        </li>
                        <li>
                            <a href="ApplyApart.jsp">租房申请</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#"><i class="fa fa-sitemap fa-3x"></i> 装修管理<span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="ViewDec.jsp">查看装修</a>
                        </li>
                        <li>
                            <a href="UpdataDec.jsp">装修上架</a>
                        </li>
                        <li>
                            <a href="DeleteDec.jsp">装修下架</a>
                        </li>
                        <li>
                            <a href="ApplyDec.jsp">装修申请</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#"><i class="fa fa-sitemap fa-3x"></i> 论坛管理<span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="DeleteRemark.jsp">论坛</a>
                        </li>
                        <li>
                            <a href="ReplyContact.jsp">用户提交的问题</a>
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
                    <h2>查看装修</h2>

                </div>
            </div>
            <!-- /. ROW  -->

            <form class="navbar-form navbar-left" role="search" name="thisform" method="post">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="输入装修ID" name="redecoratedId">
                </div>
                <input type="button" value="查询" onclick="sel()">
                <%--<button type="button" onclick="sel() class="btn btn-default">搜索</button>--%>
            </form>
            <table class="table table-bordered">
                <caption>装修列表</caption>
                <thead>
                <tr>
                    <th>装修id</th>
                    <th>功能</th>
                    <th>风格</th>
                    <th>价格（元）</th>
                    <th>联系方式</th>
                </tr>
                </thead>
                <tbody>
                <%
                    int id =0;
                    String Rid=request.getParameter("redecoratedId");
                    if (Rid!=null){
                        try {
                            id = Integer.parseInt(Rid);
                        } catch (NumberFormatException e) {
                            e.printStackTrace();
                        }
                    }
                    RedecoratedDao redecoratedDao = new RedecoratedDao();
                    Redecorated redecorated = redecoratedDao.getRedecoratedById(id);
                    if (redecorated!=null){
                %>
                <tr>
                    <td><%=redecorated.getRedecoratedId()%></td>
                    <td><%=redecorated.getRedecoratedFunction()%></td>
                    <td><%=redecorated.getRedecoratedStyle()%></td>
                    <td><%=redecorated.getRedecoratedPrice()%></td>
                    <td><%=redecorated.getRedecoratedPhone()%></td>
                </tr>
                <%
                    }else{
                %>
                <td>null</td>
                <td>null</td>
                <td>null</td>
                <td>null</td>
                <td>null</td>
                <%
                    }
                %>
                </tbody>
            </table>
            <button type="submit" class="btn btn-default"><a href="AllViewDec.jsp">查看所有装修</a></button>
            <table class="table table-bordered">
                <caption>装修列表</caption>
                <thead>
                <tr>
                    <th>装修id</th>
                    <th>功能</th>
                    <th>风格</th>
                    <th>价格（元）</th>
                    <th>联系方式</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>null</td>
                    <td>null</td>
                    <td>null</td>
                    <td>null</td>
                    <td>null</td>
                </tr>


                </tbody>
            </table>
            <br />

        </div>
    </div>
</div>
<%
    }else{
        response.sendRedirect("AdminLogin.jsp");
    }
%>
<!-- /. WRAPPER  -->
<!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
<!-- JQUERY SCRIPTS -->
<script src="../../admin/assets/js/jquery-1.10.2.js"></script>
<!-- BOOTSTRAP SCRIPTS -->
<script src="../../admin/assets/js/bootstrap.min.js"></script>
<!-- METISMENU SCRIPTS -->
<script src="../../admin/assets/js/jquery.metisMenu.js"></script>
<!-- CUSTOM SCRIPTS -->
<script src="../../admin/assets/js/custom.js"></script>
<script language="javascript">
    function sel(){
        document.thisform.submit();
    }
</script>

</body>
</html>




