<%@ page import="java.util.ArrayList" %>
<%@ page import="com.dao.*" %>
<%@ page import="com.entity.*" %><%--
  Created by IntelliJ IDEA.
  User: qiuje
  Date: 2017/9/4
  Time: 9:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>主页</title>
    <link href="../css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="../js/jquery-1.11.0.min.js"></script>
    <!-- Custom Theme files -->
    <link href="../css/style.css" rel="stylesheet" type="text/css" media="all"/>
    <link rel="stylesheet" href="../css/flexslider.css" type="text/css" media="screen" />

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
    <script type="text/javascript" src="../js/move-top.js"></script>
    <script type="text/javascript" src="../js/easing.js"></script>
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
                <a href="index.html"> <img src="../images/logo.png" alt="" title=""> </a>
            </div>
            <div class="head-right">
                <div class="top-nav">
                    <span class="menu"> <img src="../images/icon.png" alt=""/></span>
                    <ul class="res">
                        <li><a class="active" href="homePage.jsp">首页</a></li>
                        <li><a href="building/building.jsp">楼盘</a></li>
                        <li><a href="rentHouse/rentHouse.jsp">租房</a></li>
                        <li><a href="redecorated/redecorated.jsp">装修</a></li>
                        <li><a href="comment/forum.jsp">论坛</a></li>
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
            </div>
                <%--用户头像--%>
            <div class="search-box">
                <div id="sb-search" class="sb-search">
                    <a href="userCenter/userInfo.jsp"><img src="../images/face.jpg" height=100% width=100%></a>
                </div>
            </div>
            <div class="clearfix"> </div>
        </div>
        <div class="clearfix"> </div>
    </div>
</div>
<!--header end here-->
<!--banner strip start here-->
<script src="../js/responsiveslides.min.js"></script>
<script>
    $(function () {
        $("#slider").responsiveSlides({
            auto: true,
            speed: 500,
            namespace: "callbacks",
            pager: false,
            nav:true,
        });
    });
</script>

<div class="banner">
    <div class="container">
        <div class="banner-main">
            <ul class="rslides" id="slider">
                <li>
                    <h3>最好的服务</h3>
                    <p>欢迎来到优购房</p>
                </li>
            </ul>
        </div>
    </div>
</div>
<div class="banner-strip">
    <div class="container">
        <h3>优房购带来最优质的服务</h3>
        <div class="bann-strip-btn">
            <a href="#" class="hvr-shutter-out-horizontal">Read More</a>
        </div>
        <div class="clearfix"> </div>
    </div>
</div>
<!--banner strip end here-->
<!--services start here-->
<div class="services">
    <div class="container">
        <div class="services-main">
            <div class="services-top">
                <h3>热卖楼盘</h3>
                <p>欢迎购买</p>
            </div>
            <div class="services-bottom">
                <!-- 商品循环开始 -->
                <%
                    BuildingDao buildingdao = new BuildingDao();
                    ArrayList<Building> listB = buildingdao.getAllBuilding();
                    if(listB!=null&&listB.size()>0)
                    {
                        for(int j=0;j<2;j++)
                        {
                %>
                <div class="row">
                 <%
                            for(int i=j*3;i<listB.size()&&i<3*(j+1);i++)
                            {
                                Building building = listB.get(i);
                                BuildingImageDao Builddao = new BuildingImageDao();
                                ArrayList<BuildingImage> Buildimage=Builddao.getAllBuildingImageNameByBuildingId(building.getBuildingId());
                                if(0<Buildimage.size()){
                                    BuildingImage Buimage=Buildimage.get(0);
                %>
                    <div class="col-sm-6 col-md-4 ser">
                        <div class="thumbnail">
                            <a href="building/buildingDetails.jsp?id=<%=building.getBuildingId()%>">
                                <img src="../images/<%=Buimage.getBuildingImageName()%>" alt=""/></a>
                            <div class="caption">
                                <a> <h3><%=building.getBuildingName() %></h3></a>
                                <p>环境优美，装修奢华.</p>
                            </div>
                        </div>
                    </div>
                    <%
                                     }
                                 }
                    %>
                    <div class="clearfix"> </div>
                </div>
                    <%
                            }
                        }
                    %>
            </div>
        </div>
    </div>
</div>
<!--services end here-->
<!--fetures start here-->
<div class="features">
    <div class="container">
        <div class="features-main">
            <div class="features-top">
                <h3>时尚装修</h3>
                <p>案例展示，时尚装修</p>
            </div>
            <div class="features-bottom">
                <%
                    RedecoratedDao redecoratedDao = new RedecoratedDao();
                    ArrayList<Redecorated> redecorated=redecoratedDao.getAllRedecorated();
                %>
                <div class="col-md-5 featu-left">
                    <a href="redecorated/redecoratedDetails.jsp?id=<%=redecorated.get(0).getRedecoratedId()%>">
                        <img src="../images/<%=redecorated.get(0).getRedecoratedImageName()%>" width="400px" height="200px" alt=""></a>
                </div>
                <div class="col-md-7 featu-right">
                    <h3><%=redecorated.get(0).getRedecoratedStyle()%>设计</h3>
                    <p><%=redecorated.get(0).getRedecoratedDescribe()%></p>
                    <div class="featu-btn">
                        <a href="redecorated/redecoratedDetails.jsp?id=<%=redecorated.get(0).getRedecoratedId()%>">了解更多信息</a>
                    </div>
                </div>
                <div class="clearfix"> </div>
            </div>
        </div>
    </div>
</div>
<!--features end here-->
<!--effec start here-->
<div class="effec">
    <div class="container">
        <div class="effet-main">
            <div class="effec-top">
                <h3>热门装修案例</h3>
                <p>最热门的装修案例</p>
            </div>
            <div class="effec-bottom">
                <div class="col-md-7 effec-left">
                    <h3><%=redecorated.get(1).getRedecoratedDescribe()%></h3>
                    <%--<p>全面的设计，最优化的价格.</p>--%>
                    <div class="effec-btn">
                        <a href="redecorated/redecoratedDetails.jsp?id=<%=redecorated.get(1).getRedecoratedId()%>">了解更多信息</a>
                    </div>
                </div>
                <div class="col-md-5 effec-right">
                    <a href="redecorated/redecoratedDetails.jsp?id=<%=redecorated.get(1).getRedecoratedId()%>">
                        <img src="../images/<%=redecorated.get(1).getRedecoratedImageName()%>" width="400px" height="200px" alt=""></a>
                </div>
                <div class="clearfix"> </div>
            </div>
        </div>
    </div>
</div>
<!--effec end here-->
<!--project star here-->
<link rel="stylesheet" type="text/css" href="css/magnific-popup.css">
<script type="text/javascript" src="../js/nivo-lightbox.min.js"></script>
<script type="text/javascript">
    $(document).ready(function(){
        $('#nivo-lightbox-demo a').nivoLightbox({ effect: 'fade' });
    });
</script>
<div class="project">
    <div class="container">
        <div class="project-main">
            <div class="project-top">
                <h3>优惠租房</h3>
                <p>最热门的出租房，欢迎租房</p>
            </div>
            <div class="project-bottom">
                <!-- 出租房源信息循环开始 -->
                <%
                    RentHouseDao renthouseDao = new RentHouseDao();
                    ArrayList<RentHouse> list = renthouseDao.getAllRentHouse();
                    if(list!=null&&list.size()>0)
                    {
                        for(int i=0;i<list.size()&&i<4;i++)
                        {
                            RentHouse RHouse=list.get(i);
                            RentHouseImageDao RHIDao = new RentHouseImageDao();
                            ArrayList<RentHouseImage> RHimage=RHIDao.getAllRentHouseImageNameByRentHouseId(RHouse.getRentHouseId());
                            if(0<RHimage.size()){
                                RentHouseImage rhimage=RHimage.get(0);
                    %>
                <div class="col-md-3 project-grid">
                    <div class="project-eff">
                        <%--<div class="nivo-lightbox-demo">--%>
                            <%--<p> <a href="rentHouse/rentHouseDetails.jsp?id=<%=RHouse.getRentHouseId()%>"><img src="../images/<%=rhimage.getRentHouseImageName()%>" alt=""/></a></p>--%>
                        <%--</div>--%>
                            <a href="rentHouse/rentHouseDetails.jsp?id=<%=RHouse.getRentHouseId()%>"><img src="../images/<%=rhimage.getRentHouseImageName()%>" width="300px" height="300px" alt=""/></a>

                    </div>
                    <div class="project-details">
                        <h4><%=RHouse.getRentHouseName()%></h4>
                        <p><%=RHouse.getRentHousePrice()%>元/月</p>
                    </div>
                </div>
                    <%
                            }
                        }
                    }
                %>
                <div class="clearfix"> </div>
            </div>
        </div>
    </div>
</div>
<!--project end here-->


<!-- FlexSlider -->
<script defer src="../js/jquery.flexslider.js"></script>
<script type="text/javascript">
    $(function(){
        SyntaxHighlighter.all();
    });
    $(window).load(function(){
        $('.flexslider').flexslider({
            animation: "slide",
            start: function(slider){
                $('body').removeClass('loading');
            }
        });
    });
</script>
<!-- FlexSlider -->
<!--clients end here-->

<!--footer start here-->
<div class="footer">
    <div class="container">
        <div class="footer-main">
            <div class="col-md-3 footer-grid">
                <h3>目录</h3>
                <ul>
                    <li><a href="homePage.jsp">首页</a></li>
                    <li><a href="building/building.jsp">楼盘</a></li>
                    <li><a href="rentHouse/rentHouse.jsp">租房</a></li>
                    <li><a href="redecorated/redecorated.jsp">装修</a></li>
                    <li><a href="comment/forum.jsp">论坛</a></li>
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
                        <a href="building/buildingDetails.jsp?id=<%=BuildRent.getBuildingId()%>"><img src="../images/<%=BuildImageList.get(0).getBuildingImageName()%>" width="60px" height="60px" alt=""></a>
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
                    <%for (int n=0;img<Rimg.size()&&n<4;img++){
                    %>
                    <a href="redecorated/redecoratedDetails.jsp?id=<%=Rimg.get(img).getRedecoratedId()%>"><img src="../images/<%=Rimg.get(img).getRedecoratedImageName()%>" width="60px" height="60px"/></a>
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
                        <li><a href="homePage.jsp">首页</a></li>
                        <li><a href="building/building.jsp">楼盘</a></li>
                        <li><a href="rentHouse/rentHouse.jsp">租房</a></li>
                        <li><a href="redecorated/redecorated.jsp">装修</a></li>
                        <li><a href="comment/forum.jsp">论坛</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<!--footer end here-->
</body>
</html>
