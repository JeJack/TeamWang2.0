<%@ page import="java.util.ArrayList" %>
<%@ page import="com.entity.*" %>
<%@ page import="com.dao.*" %><%--
  Created by IntelliJ IDEA.
  User: qiuje
  Date: 2017/9/6
  Time: 14:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>楼盘详情</title>
    <link rel="shortcut icon" href="../../images/logo.jpg" />
    <link rel="stylesheet" href="../../css/imgbox.css"/>
    <script src="../../js/jquery.min.js"></script>
    <script src="../../js/jquery.imgbox.pack.js"></script>
    <script>
        $(document).ready(function(){
            $("a.zoom-3").imgbox({'overlayShow':true,'alignment':'center','speedIn':0,'speedOut':0});
        });
    </script>

    <link href="../../css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="../../js/jquery-1.11.0.min.js"></script>
    <!-- Custom Theme files -->
    <link href="../../css/style.css" rel="stylesheet" type="text/css" media="all"/>
    <!-- Custom Theme files -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); }
    </script>
    <meta name="keywords" content="Auction Responsive web template, Bootstrap Web Templates, Flat Web Templates, AndriodCompatible web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
    <!--Google Fonts-->
    <link href='http://fonts.useso.com/css?family=Lato:100,300,400,700,900' rel='stylesheet' type='text/css'>
    <link href='http://fonts.useso.com/css?family=Lora:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
    <!-- start-smoth-scrolling -->
    <script src="http://ajax.useso.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script type="text/javascript" src="../../js/move-top.js"></script>
    <script type="text/javascript" src="../../js/easing.js"></script>
    <script type="text/javascript">
        jQuery(document).ready(function($) {
            $(".scroll").click(function(event){
                event.preventDefault();
                $('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
            });
        });
    </script>
</head>
<body>
<!-- //end-smoth-scrolling -->
<!--header start here-->
<div class="header">
    <div class="container">
        <div class="header-main">
            <div class="logo">
                <a href="index.html"> <img src="../../images/logo.png" alt="" title=""/> </a>
            </div>
            <div class="head-right">
                <div class="top-nav">
                    <span class="menu"> <img src="../../images/icon.png" alt=""/></span>
                    <ul class="res">
                        <li><a href="../homePage.jsp">首页</a></li>
                        <li><a class="active" href="../building/building.jsp">楼盘</a></li>
                        <li><a href="../rentHouse/rentHouse.jsp">租房</a></li>
                        <li><a href="../redecorated/redecorated.jsp">装修</a></li>
                        <li><a href="../comment/forum.jsp">论坛</a></li>
                        <div class="clearfix"> </div>
                    </ul>
                    <!-- script-for-menu -->
                    <script>
                        $( "span.menu" ).click(function() {
                            $( "ul.res" ).slideToggle( 300, function() {
                                // Animation complete.
                            });
                        });
                    </script>
                    <!-- /script-for-menu -->
                </div>
                <%--用户头像--%>
                <div class="search-box">
                    <div id="sb-search" class="sb-search">
                        <%if (session.getAttribute("UserId")!=null){
                            UsersDao usersDao=new UsersDao();
                            Users user = usersDao.getUsersById(session.getAttribute("UserId").hashCode());
                            if (user.getUserPhoto()!=null){
                        %>
                        <a href="../userCenter/userInfo.jsp"><img src="<%=user.getUserPhoto()%>" style="height: 100%;width: 100%" class="user-image img-responsive"/></a>
                        <p style="color: rgba(140,134,208,0.8)"><%=user.getUserName()%></p>
                        <%}}%>
                        <a href="../userCenter/userInfo.jsp"><img src="../../images/nullphoto.jpg" style="height: 100%;width: 100%" class="user-image img-responsive"/></a>

                    </div>
                </div>
                <div class="clearfix"> </div>
                <!-- search-scripts -->
                <script src="../../js/classie.js"></script>
                <script src="../../js/uisearch.js"></script>
                <script>
                    new UISearch( document.getElementById( 'sb-search' ) );
                </script>
                <!-- //search-scripts -->
            </div>
            <div class="clearfix"> </div>
        </div>
    </div>
</div>
<!--header end here-->
<!--blog start here-->
<div class="blog">
    <div class="container">
        <div class="blog-main">
            <%
                BuildingDao BDao=new BuildingDao();
                Building Build=BDao.getBuildingById(Integer.parseInt(request.getParameter("id")));
                if(Build!=null)
                {
                    BuildingImageDao BIDao = new BuildingImageDao();
                    ArrayList<BuildingImage> Bimage=BIDao.getAllBuildingImageNameByBuildingId(Build.getBuildingId());
                    if(0<Bimage.size()){
                        BuildingImage bimage=Bimage.get(0);
            %>
            <div class="blog-top">
                <h3><%=Build.getBuildingName()%> &nbsp;&nbsp;<a href="../DoOperation/doCollectionBuilding.jsp?id=<%=Build.getBuildingId()%>" style="color: rgba(208,50,32,0.8)">收藏</a> &nbsp;&nbsp;<a href="applyBuilding.jsp?id=<%=Build.getBuildingId()%>" style="color: red">申请楼盘</a></h3>
                <p><%=Build.getBuildingCharacteristic()%></p>
            </div>
            <div class="col-md-9 blog-left">
                <div class="blog-grids">
                    <a><img src="<%=bimage.getBuildingImageName()%>"  width="480px" height="400px" alt="查不到错误"/></a>
                    <div class="blog-detail">
                        <a><h3>配套信息</h3></a>
                        <h4><span class="blog-clr">交通状况</span></h4>
                        <hr/>
                        <p><%=Build.getBuildingTrafficInfo()%></p>
                    </div>

                    <div class="blog-detail">
                        <h4><span class="blog-clr">项目配套</span></h4>
                        <hr/>
                        <p><%=Build.getBuildingProjectMatching()%></p>
                    </div>

                    <div class="blog-detail">
                        <h4><span class="blog-clr">项目简介</span></h4>
                        <hr/>
                        <p><%=Build.getBuildingProjectBrief()%></p>
                    </div>

                </div>


            </div>
            <div class="col-md-3 blog-right">
                <div class="blog-cate">
                    <h3>房源信息</h3>
                    <ul>
                        <li><a >价格：<span class="blog-clr"> <%=Build.getBuildingPrice()%>元/平米</span></a></li>
                        <li><a >装修：<%=Build.getBuildingRedecorated()%></a></li>
                        <li><a >户型：<%=Build.getBuildingBedroom()%>室<%=Build.getBuildingHall()%>厅<%=Build.getBuildingToilet()%>卫</a></li>
                        <li><a >面积：<%=Build.getBuildingArea()%>平方米</a></li>
                        <li><a >楼层状况： 总<%=Build.getBuildingAllFloor()%>层，本房在<%=Build.getBuildingFloor()%></a></li>
                        <li><a >绿化率：<%=Build.getBuildingGreeningRate()%></a></li>
                        <li><a >容积率：<%=Build.getBuildingPlotRatio()%></a></li>
                        <li><a >小区停车位： <%=Build.getBuildingPark()%>个</a ></li>
                        <li><a >楼栋总数：<%=Build.getBuildingSumNum()%></a></li>
                        <li><a >小区总户数：  <%=Build.getBuildingHousehold()%>户</a></li>
                        <li><a >咨询电话： <%=Build.getBuildingPhone()%></a></li>
                        <li><a >物业公司：<%=Build.getBuildingPropertyCompany()%></a></li>
                        <li><a >开盘时间时间：  <%=Build.getBuildingTimeHanded()%></a></li>
                        <li><a >登记售卖时间：  <%=Build.getBuildingPublishTime()%></a></li>
                        <li><a >房源地址：<%=Build.getBuildingAddress()%></a ></li>
                    </ul>
                </div>
                <div class="blog-post">
                    <h3>房源详情图</h3>
                    <%
                        for (int img=0;img<Bimage.size()&&img<12;){
                    %>
                    <div class="ftr-gd4-img">
                        <%
                            for (int n=0;img<Bimage.size()&&n<4;img++){
                        %>
                        <a class="zoom-3"  href="<%=Bimage.get(img).getBuildingImageName()%>"><img src="<%=Bimage.get(img).getBuildingImageName()%>" width="60px" height="60px"/></a>
                        <% n++;}%>
                        <div class="clearfix"> </div>
                    </div>
                    <%
                        }
                    %>
                    <hr/>
                </div>
            </div>
            <div class="clearfix"> </div>
            <%
                    }
                }
            %>
        </div>
    </div>
</div>
<!--blog end here-->
<!--footer start here-->
<div class="footer">
    <div class="container">
        <div class="footer-main">
            <div class="col-md-3 footer-grid">
                <h3>目录</h3>
                <ul>
                    <li><a href="../homePage.jsp">首页</a></li>
                    <li><a href="building.jsp">楼盘</a></li>
                    <li><a href="../rentHouse/rentHouse.jsp">租房</a></li>
                    <li><a href="../redecorated/redecorated.jsp">装修</a></li>
                    <li><a href="../comment/forum.jsp">论坛</a></li>
                </ul>
            </div>
            <div class="col-md-3 footer-grid">
                <h3>关于我们</h3>
                <p>搜房网是全球最大的房地产家居网络平台，一直引领新房、二手房、租房、家居、房地产研究等领域的互联网创新，在PC及移动领域均处于领先的地位。
                    根据DCCI第三方数据显示，2014年搜房网PC平台用户浏览量和独立访客数始终领先，位居第一。</p>
            </div>
            <div class="col-md-3 footer-grid">
                <h3>售房</h3>
                <%
                    BuildingDao BuildDao = new BuildingDao();
                    ArrayList<Building> BDaoList = BuildDao.getAllBuilding();
//                为了显示最近的房屋信息
                    for(int BD=0;BD<BDaoList.size()&&BD<3;BD++){
                        Building BuildRent = BDaoList.get(BD);
                        BuildingImageDao RandImageDao = new BuildingImageDao();
                        ArrayList<BuildingImage> BuildImageList = RandImageDao.getAllBuildingImageNameByBuildingId(BuildRent.getBuildingId());
                        if(0<BuildImageList.size()){

                %>
                <div class="ftr-sub-gd">
                    <div class="col-md-4 ftr-gd2-img">
                        <a href="buildingDetails.jsp?id=<%=BuildRent.getBuildingId()%>"><img src="<%=BuildImageList.get(0).getBuildingImageName()%>" width="60px" height="60px" alt=""></a>
                    </div>
                    <div class="col-md-8 ftr-gd2-text">
                        <a href="#"><h4><%=BuildRent.getBuildingName()%></h4></a>
                        <a href="#"><p><%=BuildRent.getBuildingTimeHanded()%></p></a>
                    </div>
                    <div class="clearfix"> </div>
                </div>
                <%
                        }
                    }
                %>
            </div>
            <div class="col-md-3 footer-grid">
                <h3>装修展示</h3>
                <%
                    RedecoratedDao RDao = new RedecoratedDao();
                    ArrayList<Redecorated> Rimg = RDao.getAllRedecorated();
                    for (int img=0;img<Rimg.size()&&img<12;){
                %>
                <div class="ftr-gd4-img">
                    <%
                        for (int n=0;img<Rimg.size()&&n<4;img++){
                    %>
                    <a href="../redecorated/redecoratedDetails.jsp?id=<%=Rimg.get(img).getRedecoratedId()%>"><img src="<%=Rimg.get(img).getRedecoratedImageName()%>" width="60px" height="60px"/></a>
                    <% n++;}%>
                    <div class="clearfix"> </div>
                </div>
                <%
                    }
                %>
            </div>
            <div class="clearfix"> </div>
        </div>
    </div>
    <div class="copyright">
        <div class="container">
            <div class="copy-main">
                <div class="copy-left">
                    <p>Copyright &copy; 2017.Company TeamWang All rights reserved </p>
                </div>
                <div class="copy-right">
                    <ul>
                        <li><a href="../homePage.jsp">首页</a></li>
                        <li><a href="building.jsp">楼盘</a></li>
                        <li><a href="../rentHouse/rentHouse.jsp">租房</a></li>
                        <li><a href="../redecorated/redecorated.jsp">装修</a></li>
                        <li><a href="../comment/forum.jsp">论坛</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<!--footer end here-->
</body>
</html>