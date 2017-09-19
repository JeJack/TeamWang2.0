<%@ page import="com.entity.OwnerTopic" %>
<%@ page import="com.dao.OwnerTopicDao" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: qiuje
  Date: 2017/9/4
  Time: 10:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<!--[if lt IE 7]> <html class="lt-ie9 lt-ie8 lt-ie7" lang="en-US"> <![endif]-->
<!--[if IE 7]>    <html class="lt-ie9 lt-ie8" lang="en-US"> <![endif]-->
<!--[if IE 8]>    <html class="lt-ie9" lang="en-US"> <![endif]-->
<!--[if gt IE 8]><!--> <html lang="en-US"> <!--<![endif]-->
<head>
    <!-- META TAGS -->
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>装修论坛</title>

    <link rel="shortcut icon" href="../../images/logo.jpg" />

    <!-- Style Sheet-->
    <%--<link rel="stylesheet" href="style.css"/>--%>
    <link rel='stylesheet' id='bootstrap-css-css'  href='../../css/comment/css/bootstrap5152.css?ver=1.0' type='text/css' media='all' />
    <link rel='stylesheet' id='responsive-css-css'  href='../../css/comment/css/responsive5152.css?ver=1.0' type='text/css' media='all' />
    <link rel='stylesheet' id='pretty-photo-css-css'  href='../../js/prettyphoto/prettyPhotoaeb9.css?ver=3.1.4' type='text/css' media='all' />
    <link rel='stylesheet' id='main-css-css'  href='../../css/comment/css/main5152.css?ver=1.0' type='text/css' media='all' />
    <link rel='stylesheet' id='custom-css-css'  href='../../css/comment/css/custom5152.html?ver=1.0' type='text/css' media='all' />


    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
    <script src="../../js/html5.js"></script>
    <![endif]-->

</head>

<body>

<!-- Start of Header -->
<div class="header-wrapper">
    <header>
        <div class="container">
            <div class="logo-container">
                <!-- Website Logo -->
                <span style="font-size:18px;font-weight: bold;color: white">EasyPurchase</span>
                <span class="tag-line">欢迎来到优购房装修论坛</span>
            </div>
            <!-- Start of Main Navigation -->
            <nav class="main-nav">
                <div class="menu-top-menu-container">
                    <ul id="menu-top-menu" class="clearfix">
                        <li ><a href="../homePage.jsp">主页</a></li>
                        <li><a href="forum.jsp">业主论坛</a></li>
                        <li class="current-menu-item"><a href="redecoratedForum.jsp">装修论坛</a></li>
                        <li><a href="faq.jsp">常见问题</a></li>
                        <li><a href="#">更多</a>
                            <ul class="sub-menu">
                                <li><a href="full-width.html">Full Width</a></li>
                                <li><a href="elements.html">Elements</a></li>
                                <li><a href="page.html">Sample Page</a></li>
                            </ul>
                        </li>
                        <li><a href="contact.html">联系我们</a></li>
                    </ul>
                </div>
            </nav>
            <!-- End of Main Navigation -->

        </div>
    </header>
</div>
<!-- End of Header -->

<!-- Start of Search Wrapper -->
<div class="search-area-wrapper">
    <div class="search-area container">
        <h3 class="search-header">优购房</h3>
        <p class="search-tag-line">与全国各地的业主交流房产信息！</p>
    </div>
</div>
<!-- End of Search Wrapper -->

<!-- Start of Page Container -->
<div class="page-container">
    <div class="container">
        <div class="row">

            <!-- start of page content -->
            <div class="span8 page-content">
                <%
                    OwnerTopicDao ownerTopicDao = new OwnerTopicDao();
                    ArrayList<OwnerTopic> ownerTopics = ownerTopicDao.getAllOwnerTopic();
                %>
                <!-- Basic Home Page Template -->
                <div class="row separator">
                    <section class="span4 articles-list">
                        <h3>热门贴子</h3>
                        <ul class="articles">
                            <%
                                for (int i=0;i<ownerTopics.size();i++){
                            %>
                            <li class="article-entry standard">
                                <h4><a href="single.html"><%=ownerTopics.get(i).getOwnerTopicTheme()%></a></h4>
                                <span class="article-meta"><%=ownerTopics.get(i).getOwnerTopicTime()%> <a href="#" ></a></span>
                                <span class="like-count">66</span>
                            </li>
                            <%
                                }
                            %>
                        </ul>
                    </section>


                    <section class="span4 articles-list">
                        <h3>最新帖子</h3>
                        <ul class="articles">
                            <%
                                for (int i=0;i<ownerTopics.size();i++){
                            %>
                            <li class="article-entry standard">
                                <h4><a href="single.html"><%=ownerTopics.get(i).getOwnerTopicTheme()%></a></h4>
                                <span class="article-meta"><%=ownerTopics.get(i).getOwnerTopicTime()%> <a href="#" ></a></span>
                                <span class="like-count">66</span>
                            </li>
                            <%
                                }
                            %>
                        </ul>
                    </section>
                </div>

            </div>
            <!-- end of page content -->


            <!-- start of sidebar -->
            <aside class="span4 page-sidebar">

                <section class="widget">
                    <div class="support-widget">
                        <h3 class="title">联系我们</h3>
                        <p class="intro">如果你有任何问题、意见或建议，请联系我们。</p>
                    </div>
                </section>

                <section class="widget">
                    <div class="quick-links-widget">
                        <h3 class="title">跳转至...</h3>
                        <ul id="menu-quick-links" class="menu clearfix">
                            <li><a href="../homePage.jsp">主页</a></li>
                            <li><a href="forum.jsp">业主论坛</a></li>
                            <li><a href="redecoratedForum.jsp">装修论坛</a></li>
                            <li><a href="faq.jsp">常见问题</a></li>
                            <li><a href="contact.html">联系我们</a></li>
                        </ul>
                    </div>
                </section>

                <section class="widget">
                    <h3 class="title">关键字</h3>
                    <div class="tagcloud">
                        <a href="#" class="btn btn-mini">楼盘信息</a>
                        <a href="#" class="btn btn-mini">二手房</a>
                        <a href="#" class="btn btn-mini">出租</a>
                        <a href="#" class="btn btn-mini">抢优惠</a>
                        <a href="#" class="btn btn-mini">装修</a>
                        <a href="#" class="btn btn-mini">短租</a>
                        <a href="#" class="btn btn-mini">房价</a>
                        <a href="#" class="btn btn-mini">房源</a>
                        <a href="#" class="btn btn-mini">金融贷款</a>
                        <a href="#" class="btn btn-mini">加盟</a>
                        <a href="#" class="btn btn-mini">热门楼盘</a>
                        <a href="#" class="btn btn-mini">新房</a>
                        <a href="#" class="btn btn-mini">新盘</a>
                        <a href="#" class="btn btn-mini">口碑</a>
                        <a href="#" class="btn btn-mini">户型</a>
                        <a href="#" class="btn btn-mini">人气</a>
                        <a href="#" class="btn btn-mini">热卖</a>
                        <a href="#" class="btn btn-mini">设计</a>
                        <a href="#" class="btn btn-mini">装饰</a>
                    </div>
                </section>

            </aside>
            <!-- end of sidebar -->
        </div>
    </div>
</div>
<!-- End of Page Container -->

<!-- Start of Footer -->

<!-- end of #footer -->

<!-- Footer Bottom -->
<div id="footer-bottom-wrapper">
    <div id="footer-bottom" class="container">
        <div class="row">
            <div class="span6">
                <p class="copyright" style="color: #e8ffdb">
                    Copyright &copy; 2017.Company TeamWang All rights reserved.
                </p>
            </div>

        </div>
    </div>
</div>
<!-- End of Footer Bottom -->

</footer>
<!-- End of Footer -->

<a href="#top" id="scroll-top"></a>

<!-- script -->
<script type='text/javascript' src='../../js/jquery-1.8.3.min.js'></script>
<script type='text/javascript' src='../../js/jquery.easing.1.3.js'></script>
<script type='text/javascript' src='../../js/prettyphoto/jquery.prettyPhoto.js'></script>
<script type='text/javascript' src='../../js/jflickrfeed.js'></script>
<script type='text/javascript' src='../../js/jquery.liveSearch.js'></script>
<script type='text/javascript' src='../../js/jquery.form.js'></script>
<script type='text/javascript' src='../../js/jquery.validate.min.js'></script>
<script type='text/javascript' src='../../js/custom.js'></script>

<div style="display:none"><script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script></div>
</body>
</html>
