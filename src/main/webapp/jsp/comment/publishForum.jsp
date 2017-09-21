<%--
  Created by IntelliJ IDEA.
  User: qiuje
  Date: 2017/9/18
  Time: 14:31
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

    <title>发表主题帖</title>

    <link rel="shortcut icon" href="../../images/logo.jpg" />

    <!-- Style Sheet-->
    <%--<link rel="stylesheet" href="style.css"/>--%>
    <link rel='stylesheet' id='bootstrap-css-css'  href='../../css/comment/css/bootstrap5152.css?ver=1.0' type='text/css' media='all' />
    <link rel='stylesheet' id='responsive-css-css'  href='../../css/comment/css/responsive5152.css?ver=1.0' type='text/css' media='all' />
    <link rel='stylesheet' id='pretty-photo-css-css'  href='../../js/prettyphoto/prettyPhotoaeb9.css?ver=3.1.4' type='text/css' media='all' />
    <link rel='stylesheet' id='main-css-css'  href='../../css/comment/css/main5152.css?ver=1.0' type='text/css' media='all' />
    <link rel='stylesheet' id='custom-css-css'  href='../../css/comment/css/custom5152.html?ver=1.0' type='text/css' media='all' />
    <!-- BOOTSTRAP STYLES-->
    <link href="../../css/assets/css/bootstrap.css" rel="stylesheet" />

    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
    <script src="../../js/html5.js"></script>
    <![endif]-->

</head>

<body>
<%if (session.getAttribute("UserId")==null){
    response.sendRedirect("../login.jsp");
}
%>
<!-- Start of Header -->
<div class="header-wrapper">
    <header>
        <div class="container">
            <div class="logo-container">
                <!-- Website Logo -->
                <span style="font-size:18px;font-weight: bold;color: white">EasyPurchase</span>
                <span class="tag-line">欢迎来到优购房业主论坛</span>
            </div>
            <!-- Start of Main Navigation -->
            <nav class="main-nav">
                <div class="menu-top-menu-container">
                    <ul id="menu-top-menu" class="clearfix">
                        <li ><a href="../homePage.jsp">主页</a></li>
                        <li><a href="forum.jsp">业主论坛</a></li>
                        <li><a href="redecoratedForum.jsp">装修论坛</a></li>
                        <li><a href="faq.jsp">常见问题</a></li>
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

<div id="respond" style="text-align: center">
    <div class="cancel-comment-reply">
        <a rel="nofollow" id="cancel-comment-reply-link" href="#" style="display:none;">Click here to cancel reply.</a>
    </div>
    <form action="doTopic.jsp" method="post" id="commentform">
        <p class="comment-notes">请遵守社区公约言论规则，不得违反国家法律法规</p>
        <div>
            <h5>发表新帖</h5>
            <input type="text" style="height: 30px;width: 756px" name="ownerTopicTheme" placeholder="请填写标题">
        </div>
        <div>
            <p>选择论坛</p>
                <select   style="height: 30px;width: 756px;text-align: center" name="category" >
                    <option>装修论坛贴子</option>
                    <option >业主论坛贴子</option>
                </select>
        </div>
        <div style="margin: auto; width:756px; height:210px; border:1px solid rgba(210,255,197,0.09)">
            <textarea class="span8" name="ownerTopic" cols="58" rows="10" style="height: 210px;width: 756px;" placeholder="请输入您的贴子详情"></textarea>
        </div>
        <div>
            <p class="comment-notes">网友评论仅供其表达个人看法，并不表明优购房立场。</p>
        </div>
        <div style="margin:0 auto; width:46px; height:28px; border:1px solid #37ff4b;clear: both">
            <input name="submit" type="submit"  value="提交">
        </div>
    </form>
</div>
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

<!-- End of Footer -->

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
