<%--
  Created by IntelliJ IDEA.
  User: qiuje
  Date: 2017/9/11
  Time: 11:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>优购房管理员登录</title>
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

<div class="container">
    <div class="row text-center ">
        <div class="col-md-12">
            <br /><br />
            <h2> 管理员登录</h2>
            <br />
        </div>
    </div>
    <div class="row ">

        <div class="col-md-4 col-md-offset-4 col-sm-6 col-sm-offset-3 col-xs-10 col-xs-offset-1">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <strong>   请输入登录信息 </strong>
                </div>
                <div class="panel-body">
                    <form role="form" action="DoAdminLogin.jsp" method="post">
                        <br />
                        <div class="form-group input-group">
                            <span class="input-group-addon"><i class="fa fa-tag"  ></i></span>
                            <input type="text" class="form-control" placeholder="Your Username " name="administratorName" />
                        </div>
                        <div class="form-group input-group">
                            <span class="input-group-addon"><i class="fa fa-lock"  ></i></span>
                            <input type="password" class="form-control"  placeholder="Your Password" name="administratorPassword" />
                        </div>
                        <div class="form-group">
                            <%--<label class="checkbox-inline">--%>
                                <%--<input type="checkbox" /> 记住我--%>
                            <%--</label>--%>
                            <span class="pull-right"><a href="#" >忘记密码? </a>
                            </span>
                        </div>
                        <div>
                            <input type="submit" value="登录" class="btn btn-primary"/>
                        </div>
                        <%
                            String loginInfo="";
                            if (session.getAttribute("Info")!=null)
                            {
                                loginInfo=session.getAttribute("Info").toString();
                                session.removeAttribute("Info");
                        %>
                        <h2><%=loginInfo%></h2>
                        <%
                            }
                        %>
                        <hr />
                    </form>
                </div>

            </div>
        </div>


    </div>
</div>


<!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
<!-- JQUERY SCRIPTS -->
<script src="../../admin/assets/js/jquery-1.10.2.js"></script>
<!-- BOOTSTRAP SCRIPTS -->
<script src="../../admin/assets/js/bootstrap.min.js"></script>
<!-- METISMENU SCRIPTS -->
<script src="../../admin/assets/js/jquery.metisMenu.js"></script>
<!-- CUSTOM SCRIPTS -->
<script src="../../admin/assets/js/custom.js"></script>

</body>
</html>

