<%--
  Created by IntelliJ IDEA.
  User: qiuje
  Date: 2017/9/6
  Time: 14:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>租房详情</title>

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
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); }>
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
                        <li><a href="../building/building.jsp">楼盘</a></li>
                        <li><a class="active" href="rentHouse.jsp">租房</a></li>
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
                <div class="search-box">
                    <div id="sb-search" class="sb-search">
                        <form>
                            <input class="sb-search-input" placeholder="Search" type="search" name="search" id="search">
                            <input class="sb-search-submit" type="submit" value="">
                            <span class="sb-icon-search"> </span>
                        </form>
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
            <div class="blog-top">
                <h3>碧桂园·KCC·云南映象</h3>
                <p>碧桂园·KCC·云南映象营销中心即将开放，项目将推出生态洋房、观湖大平层、双拼亲水墅，均为精装住宅，项目目前认筹卡办理中.</p>
            </div>
            <div class="col-md-9 blog-left">
                <div class="blog-grids">
                    <a href="single.html"><img src="../../images/images/blog1.jpg" alt=""></a>
                    <div class="blog-detail">
                        <a><h3>配套信息</h3></a>
                        <h4><span class="blog-clr">交通状况</span></h4>
                        <hr/>
                        <p>项目享有四横四纵三地铁的立体交通网络，四横为铂金大道、北辰大道、北二环、沣源路。四纵为北京路、穿金路、白龙路、昆曲高速。三地铁为地铁2号线、
                            5号线和8号线。同时周边公共交通系统发达， 10路、47路、50路、182路、119路、142路、146路、91路等19条公交线路覆盖项目周边，交通极为便利。</p>
                    </div>

                    <div class="blog-detail">
                        <h4><span class="blog-clr">项目配套</span></h4>
                        <hr/>
                        <p>幼儿园：自带9班幼儿园、佳蒙·映象幼儿园<br/>
                            中小学：明通小学、盘龙小学、金殿中学。<br/>
                            综合商场：中汇、北辰、同德<br/>
                            医院：解放军533医院、昆明第一人民医院甘美国际医院、盘龙区人民医院<br/>
                            银行：菠萝村邮政支行 农业银行、交通银行、工商银行、红塔银行<br/>
                            其他：世博生态园、金殿森林公园<br/>
                            小区内部配套：幼儿园、健身设施、地下停车场</p>
                    </div>

                    <div class="blog-detail">
                        <h4><span class="blog-clr">项目简介</span></h4>
                        <hr/>
                        <p>碧桂园·KCC·云南映象择址北市核心，位于昆明传统的富人区——世博片区。项目3公里范围内覆盖大型繁华商圈（中汇、北辰、同德商圈）相伴；
                            三甲医院（昆明市第一人民医院、533医院等明星医疗）为您的健康保驾护航；此外项目临近地铁2、5号线，规划地铁8号线经过铂金大道，物业价值有保障。
                            临近世博生态板块，金殿森林公园等生态资源环抱，奢享城市稀缺生态资源，周边土地权贵趋之若鹜，入则宁静，出则繁华。
                            项目占地350亩，自身打造12000㎡人工湖，洋房、别墅环湖而建，容积率仅2.03，绿地率53.31%，建筑密度19.15%，总户数2046户，涵盖洋房、别墅、商业。</p>
                    </div>

                </div>


            </div>
            <div class="col-md-3 blog-right">
                <div class="blog-cate">
                    <h3>楼盘信息</h3>
                    <ul>
                        <li><a >价格：<span class="blog-clr"> 待定</span></a></li>
                        <li><a >主力户型：暂无</a></li>
                        <li><a >项目地址： 盘龙区穿金路与铂金大道交汇处</a ></li>
                        <li><a >近期开盘：  预计2017年9月开盘住宅</a></li>
                        <li><a >咨询电话： 400-890-0000</a></li>
                    </ul>
                </div>
                <div class="blog-post">
                    <h3>楼盘详情图</h3>
                    <div class="ftr-gd4-img">
                        <a class="zoom-3"  href="../../images/images/11.jpg"><img src="../../images/images/11-min.jpg"/></a>
                        <a class="zoom-3"  href="../../images/images/22.jpg"><img src="../../images/images/22-min.jpg"/></a>
                        <a class="zoom-3"  href="../../images/images/33.jpg"><img src="../../images/images/33-min.jpg"/></a>
                        <a class="zoom-3"  href="../../images/images/44.jpg"><img src="../../images/images/44-min.jpg"/></a>
                        <div class="clearfix"> </div>
                    </div>
                    <div class="ftr-gd4-img">
                        <a class="zoom-3"  href="../../images/images/55.jpg"><img src="../../images/images/55-min.jpg"/></a>
                        <a class="zoom-3"  href="../../images/images/66.jpg"><img src="../../images/images/66-min.jpg"/></a>
                        <a class="zoom-3"  href="../../images/images/77.jpg"><img src="../../images/images/77-min.jpg"/></a>
                        <a class="zoom-3"  href="../../images/images/88.jpg"><img src="../../images/images/88-min.jpg"/></a>
                        <div class="clearfix"> </div>
                    </div>
                    <div class="ftr-gd4-img">
                        <a class="zoom-3"  href="../../images/images/99.jpg"><img src="../../images/images/99-min.jpg"/></a>
                        <a class="zoom-3"  href="../../images/images/00.jpg"><img src="../../images/images/00-min.jpg"/></a>
                        <a class="zoom-3"  href="../../images/images/12.jpg"><img src="../../images/images/12-min.jpg"/></a>
                        <a class="zoom-3"  href="../../images/images/10.jpg"><img src="../../images/images/10-min.jpg"/></a>
                        <div class="clearfix"> </div>
                    </div>
                    <hr/>
                </div>
                <div class="blog-cate">
                    <h3>小区规划</h3>
                    <ul>
                        <li><a >占地面积：220000平方米</a></li>
                        <li><a >容积率：2.00</a></li>
                        <li><a >停车位： 3585个</a ></li>
                        <li><a >楼栋总数：暂无资料</a></li>
                        <li><a >总户数：  3002户</a></li>
                        <li><a >楼层状况： 3栋12层、1栋33层高层住宅</a></li>
                        <li><a >建筑面积： 700000平方米</a></li>
                        <li><a >绿化率：53%</a></li>
                        <li><a >物业公司：暂无资料</a></li>
                    </ul>
                </div>
            </div>
            <div class="clearfix"> </div>
        </div>
    </div>
</div>
<!--blog end here-->
<!--footer start here-->
<div class="footer">
    <div class="container">
        <div class="footer-main">
            <p style="color: #faebcc">相关：碧桂园·KCC·云南映象项目城市展厅已开放，展厅位于穿金路和铂金大道交汇处十字路口。
                将推出生态洋房、观湖大平层、双拼亲水墅，精装。</p>
            <div class="clearfix"> </div>
        </div>
    </div>
    <div class="copyright">
        <div class="container">
            <div class="copy-main">

                <div class="copy-right">
                    <ul>
                        <li><a class="active" href="index.html">首页</a></li>/
                        <li><a href="">楼盘</a></li>/
                        <li><a href="">租房</a></li>/
                        <li><a href="">装修</a></li>
                        <li><a href="">论坛</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<!--footer end here-->
</body>
</html>
