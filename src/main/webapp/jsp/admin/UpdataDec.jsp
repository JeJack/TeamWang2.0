<%@ page import="com.dao.AdministratorDao" %>
<%@ page import="com.entity.Administrator" %><%--
  Created by IntelliJ IDEA.
  User: qiuje
  Date: 2017/9/11
  Time: 11:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>装修上架</title>
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
                    <h2>装修上架</h2>

                </div>
            </div>
            <!-- /. ROW  -->
            <hr />
            <div class="row">
                <div class="col-md-12">
                    <!-- Form Elements -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3>装修详细信息</h3>
                        </div>
                        <%--装修 Start Form--%>
                        <form name="form" action="../DoOperation/doUpdataDec.jsp" method="post">
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-md-6">
                                    <h3>装修信息</h3>
                                        <div class="form-group">
                                            <label>装修位置</label>
                                            <select class="form-control" name="redecoratedFunction">
                                                <option>客厅</option>
                                                <option>卧室</option>
                                                <option>厨房</option>
                                                <option>卫浴</option>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label>装修风格</label>
                                            <select class="form-control" name="redecoratedStyle">
                                                <option>现代</option>
                                                <option>简欧</option>
                                                <option>田园</option>
                                                <option>简约</option>
                                                <option>中式</option>
                                                <option>欧式</option>
                                                <option>混搭</option>
                                                <option>美式</option>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label>装修面积</label>
                                            <select class="form-control" name="redecoratedArea" >
                                            <option>40平米以下</option>
                                            <option>41-60平米</option>
                                            <option>61-90平米</option>
                                            <option>91-120平米</option>
                                            <option>121-150平米</option>
                                            <option>151-200平米</option>
                                            <option>201平米以上</option>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label>装修价格</label>
                                            <input class="form-control" name="redecoratedPrice" />
                                        </div>
                                    <br />
                                </div>

                                <div class="col-md-6">
                                    <h3>详细信息</h3>
                                    <div class="form-group">
                                        <label>详细描述</label>
                                        <textarea class="form-control" name="redecoratedDescribe" rows="3"></textarea>
                                    </div>

                                    <h3>其它信息</h3>
                                        <div class="form-group has-warning">
                                            <label class="control-label">联系电话</label>
                                            <input type="text" class="form-control" name="redecoratedPhone">
                                        </div>

                                        <div class="form-group">
                                            <p>将信息提交之后才能上传图片</p>
                                            <%--<label>上传图片</label>--%>
                                            <%--<input type="file" />--%>
                                        </div>
                                        <%--<button type="submit" class="btn btn-default">提交</button>--%>
                                        <%--<button type="reset" class="btn btn-primary">重置</button>--%>
                                        <%--<input type="submit" class="btn btn-default">--%>
                                    <input type="submit" value="提交" onclick="return onCheck()"/>
                                    <input type="reset" value="取消"/>

                                </div>
                            </div>
                        </div>
                        </form>
                        <%--装修 END Form--%>
                    </div>
                    <!-- End Form Elements -->
                </div>
            </div>
            <!-- /. ROW  -->
            <!-- /. ROW  -->
        </div>
        <!-- /. PAGE INNER  -->
    </div>
    <!-- /. PAGE WRAPPER  -->
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
<%--验证输入框JS---start--%>
<script type="text/javascript">
    function onCheck()
    {
        var phone = form.redecoratedPhone.value;
        var regphone = "^1[3|4|5|8][0-9]\\d{8}$";//电话号码正则表达式
        var rephone = new RegExp(regphone);//电话号码


        var Price = form.redecoratedPrice.value;
        var regPrice = "^(0|[1-9][0-9]*)$";//整数正则表达式
        var rePrice = new RegExp(regPrice);//价格

        var Describe = form.redecoratedDescribe.value;//详细描述
        var cot = Describe.length;

        if(!rePrice.test(Price))
        {
            alert("装修价格输入错误");
            return false;
        }
        if(form.redecoratedDescribe==null||form.redecoratedDescribe.value=="" || cot>150)
        {
            alert("输入错误：详细描述为空或输入字符超过150");
            return false;
        }

        if(!rephone.test(phone))
        {
            alert("联系电话输入错误");
            return false;
        }

        else
            return true;
    }
</script>
<%--验证输入框JS---End--%>
</body>
</html>

