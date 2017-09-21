<%--
  Created by IntelliJ IDEA.
  User: qiuje
  Date: 2017/9/4
  Time: 10:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>注册</title>
    <link rel="shortcut icon" href="../images/logo.jpg" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Free HTML5 Template by FreeHTML5.co" />
    <meta name="keywords" content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive" />

    <!-- Facebook and Twitter integration -->
    <meta property="og:title" content=""/>
    <meta property="og:image" content=""/>
    <meta property="og:url" content=""/>
    <meta property="og:site_name" content=""/>
    <meta property="og:description" content=""/>
    <meta name="twitter:title" content="" />
    <meta name="twitter:image" content="" />
    <meta name="twitter:url" content="" />
    <meta name="twitter:card" content="" />

    <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
    <link rel="shortcut icon" href="favicon.ico">

    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,700,300' rel='stylesheet' type='text/css'>

    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/animate.css">
    <link rel="stylesheet" href="../css/style.css">

    <!-- Modernizr JS -->
    <script src="../js/modernizr-2.6.2.min.js"></script>
    <!-- FOR IE9 below -->
    <!--[if lt IE 9]>
    <script src="../js/respond.min.js"></script>
    <![endif]-->

</head>
<body class="style-3">

<div class="container">
    <div class="row"></div>
    <div class="row">
        <div class="col-md-4 col-md-push-8">
            <%
                String Info="";
                if (session.getAttribute("Info")!=null)
                {
                    Info=session.getAttribute("Info").toString();
                    session.removeAttribute("Info");
                }
            %>
            <h2 style="color: rgba(208,40,123,0.8)"><%=Info%></h2>
            <!-- Start Sign In Form -->
            <form action="DoOperation/doRegister.jsp" name="form" class="fh5co-form animate-box" data-animate-effect="fadeInRight" method="post">
                <h2>注册</h2>

                <div class="form-group">
                    <%--<label for="userName" class="sr-only">用户名</label>--%>
                    <input type="text" class="form-control" name="userName" placeholder="用户名" autocomplete="off">
                </div>
                <div class="form-group">
                    <%--<label for="userPhoneNum" class="sr-only">电话号码</label>--%>
                    <input type="text" class="form-control" name="userPhoneNum" placeholder="电话号码" autocomplete="off">
                </div>

                <div class="form-group">
                    <%--<label for="userLoginPassword" class="sr-only">密码</label>--%>
                    <input type="password" class="form-control" name="userLoginPassword" placeholder="密码" autocomplete="off">
                </div>
                <div class="form-group">
                    <%--<label for="re-password" class="sr-only">重新输入密码</label>--%>
                    <input type="password" class="form-control" name="passwordConfirm" placeholder="重新输入密码" autocomplete="off">
                </div>
                <div class="form-group">
                    <label for="remember"><input type="checkbox" id="remember"> 记住我</label>
                </div>
                <div class="form-group">
                    <p>已经注册过？ <a href="login.jsp">登录</a></p>
                </div>
                <div class="form-group">
                    <input type="submit" value="注册" onclick="return onCheck()" class="btn btn-primary"/>
                </div>
            </form>
            <!-- END Sign In Form -->


        </div>
    </div>
    <div class="row" style="padding-top: 60px; clear: both;"></div>
</div>

<!-- jQuery -->
<script src="../js/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="../js/bootstrap.min.js"></script>
<!-- Placeholder -->
<script src="../js/jquery.placeholder.min.js"></script>
<!-- Waypoints -->
<script src="../js/jquery.waypoints.min.js"></script>
<!-- Main JS -->
<script src="../js/main.js"></script>
<script type="text/javascript">
    function onCheck()
    {
        var userName = form.userName.value;//用户名
        var cot1 = userName.length;

        var phone = form.userPhoneNum.value;
        var regphone = "^1[3|4|5|8][0-9]\\d{8}$";//电话号码正则表达式
        var rephone = new RegExp(regphone);//电话号码


        if(form.userName==null||form.userName.value=="" || cot1>9)
        {
            alert("输入错误:用户名为空或用户名长度超过8个字符");
            return false;
        }
        if(!rephone.test(phone))
        {
            alert("手机号输入错误");
            return false;
        }
        if(form.userLoginPassword==null||form.userLoginPassword.value=="")
        {
            alert("密码不能为空");
            return false;
        }
        if(form.userLoginPassword.value!=form.passwordConfirm.value)
        {
            alert("对不起，您2次输入的密码不一致");
            return false;
        }
        else
            return true;
    }
</script>
</body>
</html>
