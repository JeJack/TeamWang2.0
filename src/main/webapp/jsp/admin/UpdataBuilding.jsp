<%@ page import="com.entity.Administrator" %>
<%@ page import="com.dao.AdministratorDao" %><%--
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
    <title>楼盘上架</title>
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
                    <h2>楼盘上架</h2>
                </div>
            </div>
            <!-- /. ROW  -->
            <hr />
            <%--qqQQQQqform--%>
            <form name="form" action="../DoOperation/doUpdataBuilding.jsp" method="post">
            <div class="row">
                <div class="col-md-12">
                    <!--start Form Elements -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                           填写详细信息
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-md-6">
                                    <h3>楼盘信息</h3>
                                    <div class="form-group">
                                            <label>楼盘名称</label>
                                            <input class="form-control" name="buildingName" />
                                        </div>
                                        <div class="form-group">
                                            <label>楼盘地址</label>
                                            <input class="form-control" name="buildingAddress" />
                                        </div>
                                        <div class="form-group">
                                            <label>楼盘面积</label>
                                            <input class="form-control" name="buildingArea" />
                                        </div>

                                        <div class="form-group">
                                            <label>总楼层数</label>
                                            <input class="form-control" name="buildingAllFloor" />
                                        </div>
                                        <div class="form-group">
                                            <label>所在城市</label>
                                            <input class="form-control" name="buildingCity" />
                                        </div>
                                        <div class="form-group">
                                            <label>所在区/县</label>
                                            <input class="form-control" name="buildingDistrict" />
                                        </div>
                                        <div class="form-group">
                                            <label>装修情况</label>
                                            <input class="form-control" name="buildingRedecorated" />
                                        </div>
                                          <div class="form-group">
                                            <label>容积率</label>
                                            <input class="form-control" name="buildingPlotRatio" />
                                        </div>
                                        <div class="form-group">
                                            <label>绿化率</label>
                                            <input class="form-control" name="buildingGreeningRate" />
                                        </div>
                                        <div class="form-group">
                                            <label>联系电话</label>
                                            <input class="form-control" name="buildingPhone" />
                                        </div>
                                        <div class="form-group">
                                            <label>总住户数</label>
                                            <input class="form-control" name="buildingHousehold" />
                                        </div>
                                    <div class="form-group">
                                        <label>总楼栋数</label>
                                        <input class="form-control" name="buildingSumNum" />
                                    </div>
                                    <div class="form-group">
                                        <label>开盘时间</label>
                                        <input type="date" class="form-control" name="buildingTimeHanded" />
                                    </div>
                                        <div class="form-group">
                                            <label>小区停车位</label>
                                            <input class="form-control" name="buildingPark" />
                                        </div>
                                        <div class="form-group">
                                            <label>物业公司</label>
                                            <input class="form-control" name="buildingPropertyCompany" />
                                        </div>
                                    <br />
                                </div>
                                <div class="col-md-6">
                                    <h3>详细信息</h3>
                                    <div class="form-group">
                                        <label>特色介绍</label>

                                        <textarea class="form-control" rows="3" name="buildingCharacteristic"></textarea>
                                    </div>
                                    <div class="form-group">
                                        <label>交通状况</label>

                                        <textarea class="form-control" rows="3" name="buildingTrafficInfo"></textarea>
                                    </div>
                                    <div class="form-group">
                                        <label>项目配套</label>
                                        <textarea class="form-control" rows="3" name="buildingProjectMatching"></textarea>
                                    </div>
                                    <div class="form-group">
                                        <label>项目简介</label>
                                        <textarea class="form-control" rows="3" name="buildingProjectBrief"></textarea>
                                    </div>

                                    <h3>房屋信息</h3>
                                    <%--<form role="form">--%>
                                        <div class="form-group has-warning">
                                            <label class="control-label" >房屋价格</label>
                                            <input type="text" class="form-control" name="buildingPrice">
                                        </div>
                                        <div class="form-group has-warning">
                                            <label class="control-label" >卧室数量</label>
                                            <input type="text" class="form-control" name="buildingBedroom">
                                        </div>
                                        <div class="form-group has-warning">
                                            <label class="control-label" >客厅数量</label>
                                            <input type="text" class="form-control" name="buildingHall">
                                        </div>
                                        <div class="form-group has-warning">
                                            <label class="control-label" >卫生间数量</label>
                                            <input type="text" class="form-control" name="buildingToilet">
                                        </div>
                                        <div class="form-group has-warning">
                                            <label class="control-label" >所在楼层</label>
                                            <%--<input type="text" class="form-control" name="buildingFloor">--%>
                                            <select class="form-control" name="buildingFloor">
                                                <option>低层</option>
                                                <option>中层</option>
                                                <option>高层</option>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <p>将信息提交之后才能上传图片</p>
                                            <%--<label>上传图片</label>--%>
                                            <%--<input type="file" />--%>
                                        </div>
                                        <%--<input type="submit" class="btn btn-default">--%>
                                    <input type="submit" value="提交" onclick="return onCheck()"/>
                                    <input type="reset" value="取消"/>
                                        <%--</form>--%>
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
                    </div>
                    <!-- End Form Elements -->
                </div>
            </div>
            </form>
            <%--qqq end END form--%>
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
        var phone = form.buildingPhone.value;
        var regphone = "^1[3|4|5|8][0-9]\\d{8}$";//电话号码正则表达式
        var rephone = new RegExp(regphone);//电话号码

        var ReBedroom = form.buildingBedroom.value;
        var regBedroom = "^(0|[1-9][0-9]*)$";//整数正则表达式
        var reBedroom = new RegExp(regBedroom);//卧室数量

        var hall = form.buildingHall.value;
        var reghall = "^(0|[1-9][0-9]*)$";//整数正则表达式
        var rehall = new RegExp(reghall);//客厅数量

        var Toilet = form.buildingToilet.value;
        var regToilet = "^(0|[1-9][0-9]*)$";//整数正则表达式
        var reToilet = new RegExp(regToilet);//卫生间数量

        var Price = form.buildingPrice.value;
        var regPrice = "^(0|[1-9][0-9]*)$";//整数正则表达式
        var rePrice = new RegExp(regPrice);//价格

        var Floor = form.buildingFloor.value;
        var regFloor = "^(0|[1-9][0-9]*)$";//整数正则表达式
        var reFloor = new RegExp(regFloor);//楼层

        var Characteristic = form.buildingCharacteristic.value;//特色介绍
        var cot1 = Characteristic.length;

        var TrafficInfo = form.buildingTrafficInfo.value;//交通状况
        var cot2 = TrafficInfo.length;

        var ProjectMatching = form.buildingProjectMatching.value;//配套项目
        var cot3 = ProjectMatching.length;

        var ProjectBrief = form.buildingProjectBrief.value;//项目简介
        var cot4 = ProjectBrief.length;
        if(form.buildingName==null||form.buildingName.value=="")
        {
            alert("楼盘名称不能为空");
            return false;
        }
        if(form.buildingAddress==null||form.buildingAddress.value=="")
        {
            alert("楼盘地址不能为空");
            return false;
        }
        if(form.buildingArea==null||form.buildingArea.value=="")
        {
            alert("楼盘面积不能为空");
            return false;
        }
        if(form.buildingAllFloor==null||form.buildingAllFloor.value=="")
        {
            alert("楼盘总层数不能为空");
            return false;
        }
        if(form.buildingCity==null||form.buildingCity.value=="")
        {
            alert("楼盘所在城市不能为空");
            return false;
        }
        if(form.buildingDistrict==null||form.buildingDistrict.value=="")
        {
            alert("楼盘所在区县不能为空");
            return false;
        }
        if(form.buildingRedecorated==null||form.buildingRedecorated.value=="")
        {
            alert("装修情况不能为空");
            return false;
        }
        if(form.buildingPlotRatio==null||form.buildingPlotRatio.value=="")
        {
            alert("容积率不能为空");
            return false;
        }
        if(form.buildingGreeningRate==null||form.buildingGreeningRate.value=="")
        {
            alert("绿化率不能为空");
            return false;
        }
        if(!rephone.test(phone))
        {
            alert("联系电话输入错误");
            return false;
        }
        if(form.buildingHousehold==null||form.buildingHousehold.value=="")
        {
            alert("总住户不能为空");
            return false;
        }
        if(form.buildingSumNum==null||form.buildingSumNum.value=="")
        {
            alert("总楼栋数不能为空");
            return false;
        }
        if(form.buildingPark==null||form.buildingPark.value=="")
        {
            alert("小区停车位不能为空");
            return false;
        }
        if(form.buildingPropertyCompany==null||form.buildingPropertyCompany.value=="")
        {
            alert("物业公司不能为空");
            return false;
        }

        if(form.buildingCharacteristic==null||form.buildingCharacteristic.value=="" || cot1>800)
        {
            alert("输入错误：特色介绍为空或输入字符超过800");
            return false;
        }
        if(form.buildingTrafficInfo==null||form.buildingTrafficInfo.value=="" || cot2>800)
        {
            alert("输入错误：交通状况为空或输入字符超过800");
            return false;
        }
        if(form.buildingProjectMatching==null||form.buildingProjectMatching.value=="" || cot3>800)
        {
            alert("输入错误：配套项目为空或输入字符超过800");
            return false;
        }
        if(form.buildingProjectBrief==null||form.buildingProjectBrief.value=="" || cot4>800)
        {
            alert("输入错误：项目简介为空或输入字符超过800");
            return false;
        }

        if(!rePrice.test(Price))
        {
            alert("房屋价格输入错误");
            return false;
        }

        if(!(form.buildingBedroom==null||form.buildingBedroom.value==""))
        {

            if(!reBedroom.test(Bedroom))
            {
                alert("卧室数输入错误");
                return false;
            }
        }
        if(!(form.buildingHall==null||form.buildingHall.value==""))
        {

            if(!rehall.test(hall))
            {
                alert("客厅数输入错误");
                return false;
            }
        }
        if(!(form.buildingToilet==null||form.buildingToilet.value==""))
        {

            if(!reToilet.test(Toilet))
            {
                alert("卫生间数输入错误");
                return false;
            }
        }
        if(!reFloor.test(Floor))
        {
            alert("所在楼层输入错误");
            return false;
        }

        else
            return true;
    }
</script>
<%--验证输入框JS---END--%>
</body>
</html>

