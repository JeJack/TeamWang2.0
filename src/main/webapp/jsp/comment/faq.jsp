<%@ page import="com.dao.FaqDao" %>
<%@ page import="com.entity.Faq" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: qiuje
  Date: 2017/9/8
  Time: 11:28
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

    <title>常见问题</title>

    <link rel="shortcut icon" href="../../images/logo.jpg" />

    <!-- Style Sheet-->
    <link rel="stylesheet" href="style.css"/>
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
<%
    FaqDao faqDao = new FaqDao();
    ArrayList<Faq> faqs = faqDao.getAllFaq();
%>
<!-- Start of Header -->
<div class="header-wrapper">
    <header>
        <div class="container">


            <div class="logo-container">
                <!-- Website Logo -->
                <span style="font-size:18px;font-weight: bold;color: white">EasyPurchase</span>
                <span class="tag-line">欢迎来到优购房论坛</span>
            </div>


            <!-- Start of Main Navigation -->
            <nav class="main-nav">
                <div class="menu-top-menu-container">
                    <ul id="menu-top-menu" class="clearfix">
                        <li ><a href="../homePage.jsp">主页</a></li>
                        <li><a href="forum.jsp">论坛主页</a></li>
                        <li class="current-menu-item"><a href="faq.jsp">常见问题</a></li>
                        <li><a href="contactUs.jsp">联系我们</a></li>
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
                <article class=" page type-page hentry clearfix">
                    <h1 class="post-title"><a href="#">常见问题</a></h1>
                    <hr>
                    <p>买房不是一件小事，动辄花费几十万上百万，买房前如何历经千辛万苦不说，买房的路上也总是会遇到各种磕磕碰碰，如果稍不注意，就可能会买到一辈子的后悔。
                        开发商无限期延迟交房、买到问题精装房、还没交房就要催缴物业费......如果遇到这些问题你怎么办？请参看我们为你准备的相关资料。</p>
                </article>
                <div class="faqs clearfix">
                    <%
                        for (int i=0;faqs!=null&&faqs.size()>i;i++){
                    %>
                    <article class="faq-item active">
                        <span class="faq-icon"></span>
                        <h3 class="faq-question">
                            <%=faqs.get(i).getFaqTheme()%>
                        </h3>
                        <div class="faq-answer">
                            <%=faqs.get(i).getFaq()%>
                          </div>
                    </article>
                    <%}%>
                </div>
            </div>
            <!-- end of page content -->
            <!-- start of sidebar -->
            <aside class="span4 page-sidebar">
                <section class="widget">
                    <div class="support-widget">
                        <h3 class="title"><a href="contactUs.jsp">联系我们</a></h3>
                        <p class="intro">如果你有任何问题、意见或建议，请联系我们。</p>
                    </div>
                </section>
            </aside>
            <!-- end of sidebar -->
        </div>
    </div>
</div>
<!-- End of Page Container -->


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
<script type='text/javascript' src='js/jquery-1.8.3.min.js'></script>
<script type='text/javascript' src='js/jquery.easing.1.3.js'></script>
<script type='text/javascript' src='js/prettyphoto/jquery.prettyPhoto.js'></script>
<script type='text/javascript' src='js/jflickrfeed.js'></script>
<script type='text/javascript' src='js/jquery.liveSearch.js'></script>
<script type='text/javascript' src='js/jquery.form.js'></script>
<script type='text/javascript' src='js/jquery.validate.min.js'></script>
<script type='text/javascript' src='js/custom.js'></script>

<div style="display:none"><script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script></div>
</body>
</html>

