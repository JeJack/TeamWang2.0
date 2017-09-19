<%@ page import="com.dao.ContactUsDao" %>
<%@ page import="com.entity.ContactUs" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.entity.ReplyContactUs" %>
<%@ page import="com.dao.ReplyContactUsDao" %><%--
  Created by IntelliJ IDEA.
  User: qiuje
  Date: 2017/9/18
  Time: 14:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <!-- META TAGS -->
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>联系管理</title>

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

</head>

<body>
<%if (session.getAttribute("UserId")!=null){
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
                        <li class="current-menu-item"><a href="forum.jsp">论坛主页</a></li>
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
        <p style="text-align: center;color: #e8ffdb">感谢您的到来，如果有什么需要，请在下方留言，待管理员上线，会一 一为您服务！</p>
        <%
            if (session.getAttribute("Info")!=null){
        %>
        <h3 style="text-align: center;color: #ff191c"><%=session.getAttribute("Info").toString()%></h3>
        <%
                session.removeAttribute("Info");
            }
        %>
    </div>
</div>
<!-- End of Search Wrapper -->

<div id="respond">
    <div class="cancel-comment-reply">
        <a rel="nofollow" id="cancel-comment-reply-link" href="#" style="display:none;">Click here to cancel reply.</a>
    </div>
    <form action="doContactUs.jsp" method="post" id="commentform">
        <p class="comment-notes" style="text-align: center">请遵守社区公约言论规则，不得违反国家法律法规</p>
        <div style="margin:0 auto; width:756px; height:80px; border:1px solid rgba(159,159,159,0.12)">
            <h5>发表问题</h5>
            <input type="text" style="height: 30px;width: 756px;text-align: center" name="theme" placeholder="请填写标题">
        </div>
        <div style="margin: auto; width:756px; height:210px; border:1px solid rgba(210,255,197,0.09)">
            <textarea class="span8" name="faq" cols="58" rows="10" placeholder="请输入您的问题详情"></textarea>
        </div>
        <p class="comment-notes" style="text-align: center">网友评论仅供其表达个人看法，并不表明优购房立场。</p>
        <div style="margin:0 auto; width:46px; height:28px; border:1px solid #37ff4b">
            <input name="submit" type="submit"  value="提交">
        </div>
    </form>
</div>

<div class="faqs clearfix">
    <h2 style="text-align: center;color: #cb863b">我提交的问题</h2>
    <%
        ContactUsDao contactUsDao = new ContactUsDao();
        ArrayList<ContactUs> contactUses = contactUsDao.getContactUsByUserId(session.getAttribute("UserId").hashCode());
        for (int i=0;contactUses!=null&&contactUses.size()>i;i++){
    %>
    <div style="margin:0 auto; width:756px; border:1px solid #cbb1c5">
        <article class="faq-item active">
            <span class="faq-icon"></span>
            <h3 class="faq-question">
                <p>主题：<%=contactUses.get(i).getTheme()%></p>
            </h3>
            <div class="faq-answer">
            <p>内容：<%=contactUses.get(i).getFaq()%></p>
        </div>
            <div class="faq-answer" style="text-align: right">
                <%=contactUses.get(i).getCtime()%>
            </div>
            <br/>
            <div class="faq-answer">
                <p style="color: red">管理员回复：</p>
                <%
                    ReplyContactUsDao replyContactUsDao = new ReplyContactUsDao();
                    ReplyContactUs replyContactUs = replyContactUsDao.getReplyContactUsByContactUsId(contactUses.get(i).getContactUsId());
                    if (replyContactUs!=null){
                %>
                <p><%=replyContactUs.getReply()%></p>
            </div>
            <div class="faq-answer" style="text-align: right">
                <%=replyContactUs.getReplyTime()%>
            </div>
            <%}%>
        </article>
    </div>
    <%}%>
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
<%}else {
    response.sendRedirect("../login.jsp");
}%>
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
