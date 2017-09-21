<%@ page import="com.dao.AdministratorDao" %>
<%@ page import="com.entity.Administrator" %><%--
  Created by IntelliJ IDEA.
  User: qiuje
  Date: 2017/9/11
  Time: 11:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>租房上架</title>
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
                        <li>
                            <a href="UpdateFAQ.jsp">常见问题管理</a>
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
                    <h2>租房上架</h2>

                </div>
            </div>
            <!-- /. ROW  -->
            <hr />
            <div class="row">
                <div class="col-md-12">
                    <!-- Form Elements -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <p>填写出租房屋的详细信息</p>
                        </div>
                        <form name="form" action="../DoOperation/doUpdataApart.jsp" method="post">
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-md-6">
                                    <h3>房源信息</h3>
                                        <div class="form-group">
                                            <label>房源名称</label>
                                            <input class="form-control"  name="rentHouseName"/>
                                        </div>
                                    <div class="form-group">
                                        <label>房源城市</label>
                                        <input class="form-control" name="rentHouseCity" />
                                    </div>
                                    <div class="form-group">
                                        <label>房源区/县</label>
                                        <input class="form-control" name="rentHouseDistrict" />
                                    </div>
                                        <div class="form-group">
                                            <label>房源详细地址</label>
                                            <input class="form-control" name="rentHouseAddress" />
                                        </div>
                                        <div class="form-group">
                                            <label>房源面积</label>
                                            <input class="form-control" name="rentHouseArea" />
                                        </div>
                                    <div class="form-group">
                                        <label>房源所在楼层</label>
                                        <%--<input class="form-control" name="rentHouseFloor" />--%>
                                        <select class="form-control" name="rentHouseFloor">
                                            <option>低层</option>
                                            <option>中层</option>
                                            <option>高层</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label>楼盘总层数</label>
                                        <input class="form-control" name="rentHouseAllFloor" />
                                    </div>
                                    <div class="form-group">
                                        <label>建筑年代</label>
                                        <input type="date" class="form-control" name="rentHouseBuildTime"/>
                                    </div>
                                        <div class="form-group">
                                            <label>装修情况</label>
                                            <input class="form-control" name="rentHouseRedecorated"/>
                                        </div>
                                        <div class="form-group">
                                            <label>卧室数量</label>
                                            <input class="form-control" name="rentHouseBedroom" />
                                        </div>
                                        <div class="form-group">
                                            <label>客厅数量</label>
                                            <input class="form-control" name="rentHouseHall" />
                                        </div>
                                        <div class="form-group">
                                            <label>卫生间数</label>
                                            <input class="form-control" name="rentHouseToilet" />
                                        </div>
                                    <br />
                                </div>

                                <div class="col-md-6">
                                    <h3>详细信息</h3>
                                    <div class="form-group">
                                        <label>房源详情</label>
                                        <textarea class="form-control" name="rentHouseDescribe" rows="3"></textarea>
                                    </div>

                                    <h3>其他信息</h3>
                                    <%--<form role="form">--%>
                                        <div class="form-group has-warning">
                                            <label class="control-label" >租房价格：元/月</label>
                                            <input type="text" class="form-control" name="rentHousePrice">
                                        </div>
                                        <div class="form-group has-warning">
                                            <label class="control-label" >联系电话</label>
                                            <input type="text" class="form-control" name="rentHousePhone">
                                        </div>
                                        <%--<div class="form-group has-warning">--%>
                                            <%--<label class="control-label" >建筑年代</label>--%>
                                            <%--<input type="date" class="form-control" name="rentHouseBuildTime">--%>
                                        <%--</div>--%>
                                        <%--<div class="form-group has-warning">--%>
                                            <%--<label class="control-label" >登记出租时间</label>--%>
                                            <%--<input type="text" class="form-control" name="rentHousePublishTime">--%>
                                        <%--</div>--%>

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
                                    <div class="form-group">
                                        <%
                                            if (session.getAttribute("Info")!=null){
                                        %>
                                        <p><%=session.getAttribute("Info")%></p>
                                        <%
                                                session.removeAttribute("Info");
                                            }
                                        %>
                                    </div>
                                </div>
                            </div>
                        </div>
                        </form>
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

<script type="text/javascript">
    function onCheck()
    {
        var phone = form.rentHousePhone.value;
        var regphone = "^1[3|4|5|8][0-9]\\d{8}$";//电话号码正则表达式
        var rephone = new RegExp(regphone);//电话号码

        var Redecorated = form.rentHouseBedroom.value;
        var regRedecorated = "^(0|[1-9][0-9]*)$";//整数正则表达式
        var reRedecorated = new RegExp(regRedecorated);//卧室数量

        var hall = form.rentHouseHall.value;
        var reghall = "^(0|[1-9][0-9]*)$";//整数正则表达式
        var rehall = new RegExp(reghall);//客厅数量

        var Toilet = form.rentHouseToilet.value;
        var regToilet = "^(0|[1-9][0-9]*)$";//整数正则表达式
        var reToilet = new RegExp(regToilet);//卫生间数量

        var Price = form.rentHousePrice.value;
        var regPrice = "^(0|[1-9][0-9]*)$";//整数正则表达式
        var rePrice = new RegExp(regPrice);//价格

        var Describe = form.rentHouseDescribe.value;//详细描述
        var cot = Describe.length;

        if(form.rentHouseName==null||form.rentHouseName.value=="")
        {
            alert("房源名称不能为空");
            return false;
        }
        if(form.rentHouseCity==null||form.rentHouseCity.value=="")
        {
            alert("房源城市不能为空");
            return false;
        }
        if(form.rentHouseDistrict==null||form.rentHouseDistrict.value=="")
        {
            alert("房源区县不能为空");
            return false;
        }
        if(form.rentHouseAddress==null||form.rentHouseAddress.value=="")
        {
            alert("房源详细地址不能为空");
            return false;
        }
        if(form.rentHouseArea==null||form.rentHouseArea.value=="")
        {
            alert("房源面积不能为空");
            return false;
        }
        if(form.rentHouseFloor==null||form.rentHouseFloor.value=="")
        {
            alert("房源所在楼层不能为空");
            return false;
        }
        if(form.rentHouseAllFloor==null||form.rentHouseAllFloor.value=="")
        {
            alert("房源总楼层不能为空");
            return false;
        }
        if(form.rentHouseRedecorated==null||form.rentHouseRedecorated.value=="")
        {
            alert("装修情况不能为空");
            return false;
        }
        if(!(form.rentHouseBedroom==null||form.rentHouseBedroom.value==""))
        {

            if(!reRedecorated.test(Redecorated))
            {
                alert("卧室数输入错误");
                return false;
            }
        }
        if(!(form.rentHouseHall==null||form.rentHouseHall.value==""))
        {

            if(!rehall.test(hall))
            {
                alert("客厅数输入错误");
                return false;
            }
        }
        if(!(form.rentHouseToilet==null||form.rentHouseToilet.value==""))
        {

            if(!reToilet.test(Toilet))
            {
                alert("卫生间数输入错误");
                return false;
            }
        }
        if(form.rentHouseDescribe==null||form.rentHouseDescribe.value=="" || cot>800)
        {
            alert("输入错误：房源详情为空或输入字符超过800");
            return false;
        }

        if(!rePrice.test(Price))
        {
            alert("租房价格输入错误");
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

</body>
</html>

