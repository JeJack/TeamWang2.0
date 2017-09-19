<%@ page import="com.dao.OwnerTopicDao" %>
<%@ page import="com.entity.OwnerTopic" %>
<%@ page import="com.dao.OwnerTopicCommentDao" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.entity.OwnerTopicComment" %>
<%@ page import="com.dao.UsersDao" %>
<%@ page import="org.apache.catalina.User" %>
<%@ page import="com.entity.Users" %><%--
  Created by IntelliJ IDEA.
  User: qiuje
  Date: 2017/9/8
  Time: 11:43
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

    <title>主题贴详情</title>

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
    OwnerTopicDao ownerTopicDao = new OwnerTopicDao();
    OwnerTopic ownerTopic = new OwnerTopic();
    if (request.getParameter("id")!=null){
        ownerTopic = ownerTopicDao.getOwnerTopicByOwnerTopicId(Integer.parseInt(request.getParameter("id")));
    }

    session.setAttribute("OTID",ownerTopic.getOwnerTopicId());
    OwnerTopicCommentDao ownerTopicCommentDao = new OwnerTopicCommentDao();
    ArrayList<OwnerTopicComment> ownerTopicComments=ownerTopicCommentDao.getAllOwnerTopicCommentByOwnerTopicId(ownerTopic.getOwnerTopicId());
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
                        <li ><a href="forum.jsp">论坛主页</a></li>
                        <li><a href="faq.jsp">常见问题</a></li>
                        <%--<li><a href="#">更多</a>--%>
                            <%--<ul class="sub-menu">--%>
                                <%--<li><a href="full-width.html">Full Width</a></li>--%>
                                <%--<li><a href="elements.html">Elements</a></li>--%>
                                <%--<li><a href="page.html">Sample Page</a></li>--%>
                            <%--</ul>--%>
                        <%--</li>--%>
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
                <ul class="breadcrumb">
                    <%--<li><a href="#">Knowledge Base Theme</a><span class="divider">/</span></li>--%>
                    <%--<li><a href="#" title="View all posts in Server &amp; Database">Server &amp; Database</a> <span class="divider">/</span></li>--%>
                    <li class="active"><%=ownerTopic.getOwnerTopicTheme()%></li>
                </ul>
                <article class=" type-post format-standard hentry clearfix">

                    <h1 class="post-title"><a href="#"><%=ownerTopic.getOwnerTopicTheme()%></a></h1>

                    <div class="post-meta clearfix">
                        <span class="date"><%=ownerTopic.getOwnerTopicTime()%></span>
                        <span class="like-count">66</span>
                    </div><!-- end of post meta -->
                    <p><%=ownerTopic.getOwnerTopic()%></p>
                </article>

                <div class="like-btn">

                    <form id="like-it-form" action="#" method="post">
                        <span class="like-it ">66</span>
                        <input type="hidden" name="post_id" value="99">
                        <input type="hidden" name="action" value="like_it">
                    </form>

                    <span class="tags">
                        <strong>Tags:&nbsp;&nbsp;</strong><a href="#" rel="tag">basic</a>, <a href="#" rel="tag">setting</a>, <a href="http://knowledgebase.inspirythemes.com/tag/website/" rel="tag">website</a>
                    </span>
                </div>
                <section id="comments">
                    <h3 id="comments-title">网友评论</h3>
                    <ol class="commentlist">
                        <%
                            for (int i=0;null!=ownerTopicComments&&ownerTopicComments.size()>i;i++){
                                UsersDao usersDao = new UsersDao();
                                Users user = usersDao.getUsersById(ownerTopicComments.get(i).getOwnerTopicUserId());
                        %>
                        <li class="comment even thread-even depth-1" id="li-comment-2">
                            <article id="comment-2">
                                <a href="#">
                                    <img alt="" src="<%=user.getUserPhoto()%>" class="avatar avatar-60 photo" height="60" width="60">
                                </a>
                                <div class="comment-meta">
                                    <h5 class="author">
                                        <cite class="fn">
                                            <a href="#" rel="external nofollow" class="url"><%=user.getUserNickname()%></a>
                                        </cite>
                                    </h5>
                                    <p class="date">
                                        <a href="#">
                                            <time datetime="2013-02-26T13:18:47+00:00"><%=ownerTopicComments.get(i).getCommentTime()%></time>
                                        </a>
                                    </p>
                                </div><!-- end .comment-meta -->
                                <div class="comment-body">
                                    <p><%=ownerTopicComments.get(i).getComment()%></p>
                                </div><!-- end of comment-body -->

                            </article><!-- end of comment -->
                            <%
                                }
                            %>
                        </li>
                    </ol>
                    <div id="respond">
                        <h3>欢迎来到优购房论坛</h3>
                        <div class="cancel-comment-reply">
                            <a rel="nofollow" id="cancel-comment-reply-link" href="#" style="display:none;">Click here to cancel reply.</a>
                        </div>
                        <form action="doComment.jsp" method="post" id="commentform">
                            <p class="comment-notes">请遵守社区公约言论规则，不得违反国家法律法规</p>
                            <div>
                                <h3>评论</h3>
                                <textarea class="span8" name="comment" id="comment" cols="58" rows="10"></textarea>
                            </div>
                            <p class="comment-notes">网友评论仅供其表达个人看法，并不表明优购房立场。</p>
                            <div>
                                <input name="submit" type="submit"  value="提交">
                            </div>
                        </form>
                    </div>

                </section><!-- end of comments -->

            </div>
            <!-- end of page content -->


            <!-- start of sidebar -->
            <aside class="span4 page-sidebar">

                <section class="widget">
                    <div class="support-widget">
                        <a href="publishForum.jsp"><h3 class="title">发表贴子</h3></a>
                        <p class="intro">欢迎您来发表贴子</p>
                    </div>
                </section>


                <section class="widget">
                    <h3 class="title">精选贴子</h3>
                    <ul class="articles">
                        <%
                            ArrayList<OwnerTopic> ownerTopics = ownerTopicDao.getAllOwnerTopic();
                            for (int i=0;null!=ownerTopics&&i<ownerTopics.size();i++){
                        %>
                        <li class="article-entry standard">
                            <h4><a href="topicDetails.jsp?id=<%=ownerTopics.get(i).getOwnerTopicId()%>"><%=ownerTopics.get(i).getOwnerTopicTheme()%></a></h4>
                            <span class="article-meta"><%=ownerTopics.get(i).getOwnerTopicTime()%> <a href="#" ></a></span>
                            <span class="like-count">66</span>
                        </li>
                        <%
                            }
                        %>
                    </ul>
                </section>
            </aside>
            <!-- end of sidebar -->
        </div>
    </div>
</div>
<!-- End of Page Container -->

<!-- Start of Footer -->
<footer id="footer-wrapper">
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

