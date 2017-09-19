<%@ page import="com.dao.UsersDao" %>
<%@ page import="com.entity.Users" %><%--
  Created by IntelliJ IDEA.
  User: qiuje
  Date: 2017/9/14
  Time: 16:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>修改个人信息</title>
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



</div>

<div id="page-wrapper" >
    <div id="page-inner">
        <div class="row">
            <div class="col-md-12">
                <h2>修改个人信息</h2>
            </div>
            <form class="form-horizontal" name="form" action="../DoOperation/doUserInfo.jsp" method="post">
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
                        <select class="form-control" name="userSex">
                            <option>男</option>
                            <option>女</option>
                        </select>
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
                        <button type="submit" onclick="return onCheck()"  class="btn btn-default">保存</button>
                    </div>
                </div>
            </form>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <%if (session.getAttribute("Info")!=null)
                    {
                    %>
                    <p><%=session.getAttribute("Info")%></p>
                    <%
                        session.removeAttribute("Info");
                    }%>

                </div>
            </div>
        </div>
        <!-- /. ROW  -->
        <hr />

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
<!-- MORRIS CHART SCRIPTS -->
<script src="../../css/assets/js/morris/raphael-2.1.0.min.js"></script>
<script src="../../css/assets/js/morris/morris.js"></script>
<!-- CUSTOM SCRIPTS -->
<script src="../../css/assets/js/custom.js"></script>
<script>
function onCheck()
{
var Nickname = form.userNickname.value;//昵称
var cot1 = Nickname.length;

var mail = form.userEmail.value;var regmail = "^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$";//邮箱正则表达式
var remail = new RegExp(regmail);//邮箱

if(form.userNickname==null||form.userNickname.value=="" || cot1>13)
{
alert("输入错误:用户名昵称为空或用户名长度超过12个字符");
return false;
}

if(!remail.test(mail))
{
alert("邮箱输入错误");
return false;
}
else
return true;
}
</script>
</body>
</html>
