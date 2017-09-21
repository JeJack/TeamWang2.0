<%@ page import="com.dao.ContactUsDao" %>
<%@ page import="com.entity.ContactUs" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.dao.ReplyContactUsDao" %>
<%@ page import="com.entity.ReplyContactUs" %>
<%@ page import="com.dao.AdministratorDao" %>
<%@ page import="com.entity.Administrator" %>
<%@ page import="com.dao.UsersDao" %>
<%@ page import="com.entity.Users" %><%--
  Created by IntelliJ IDEA.
  User: qiuje
  Date: 2017/9/19
  Time: 9:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>用户提交的问题</title>
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
            <div class="faqs clearfix">
                <h2 style="text-align: center;color: #cb863b">用户提交的问题</h2>
                <%
                if (session.getAttribute("Info")!=null){
                %>
                <p style="text-align: center"><%=session.getAttribute("Info")%></p>
                <%
                session.removeAttribute("Info");}%>
                <%
                    ContactUsDao contactUsDao = new ContactUsDao();
                    ArrayList<ContactUs> contactUses = contactUsDao.getAllContactUs();
                    UsersDao usersDao = new UsersDao();
                    Users users = new Users();
                    for (int i=0;contactUses!=null&&contactUses.size()>i;i++){
                        users = usersDao.getUsersById(contactUses.get(i).getUserId());
                %>
                <div style="margin:0 auto; width:990px; border:1px solid #cbb1c5">
                    <article class="faq-item active">
                        <span class="faq-icon"></span>
                        <h3 class="faq-question">
                            <p>用户名：<%=users.getUserName()%></p>
                        </h3>
                        <h3 class="faq-question">
                            <p>主题：<%=contactUses.get(i).getTheme()%></p>
                        </h3>
                        <div class="faq-answer">
                            <p>内容：<%=contactUses.get(i).getFaq()%></p>
                        </div>
                        <div class="faq-answer" style="text-align: left">
                            <%=contactUses.get(i).getCtime()%>
                        </div>
                        <br/>
                        <div class="faq-answer">
                            <p style="color: red">管理员回复：</p>
                            <%
                                ReplyContactUsDao replyContactUsDao = new ReplyContactUsDao();
                                ReplyContactUs replyContactUs = replyContactUsDao.getReplyContactUsByContactUsId(contactUses.get(i).getContactUsId());
                                if (replyContactUs!=null&&replyContactUs.getReply()!=null){
                            %>
                            <p><%=replyContactUs.getReply()%></p>
                        </div>
                        <div class="faq-answer">
                            <p style="text-align: left;">管理员：<%=replyContactUs.getAdminName()%></p>
                            <%--<p style="text-align: left;"><%=replyContactUs.getReplyTime()%></p>--%>
                            <%=replyContactUs.getReplyTime()%>
                        </div>

                        <%}else{
                        %>
                        <form action="../DoOperation/doReplyContact.jsp" method="post">
                            <div class="form-group">
                                <%--<label for="userName" class="sr-only">用户名</label>--%>
                                <input type="text" class="form-control" name="reply" placeholder="回复内容" autocomplete="off">
                            </div>
                            <div >
                                <input type="text" name="contactUsId" style="border:0px;display: none"  value="<%=contactUses.get(i).getContactUsId()%>" size="20"/>
                            </div>
                            <div class="form-group">
                                <input type="submit" value="回复" class="btn btn-primary"/>
                            </div>
                        </form>
                        <%
                            }%>
                    </article>
                </div>
                <%}%>
            </div>
        </div>
    </div>
</div>
<%
    }else{
        response.sendRedirect("AdminLogin.jsp");
    }
%>
<!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
<!-- JQUERY SCRIPTS -->
<script src="../../admin/assets/js/jquery-1.10.2.js"></script>
<!-- BOOTSTRAP SCRIPTS -->
<script src="../../admin/assets/js/bootstrap.min.js"></script>
<!-- METISMENU SCRIPTS -->
<script src="../../admin/assets/js/jquery.metisMenu.js"></script>
<!-- CUSTOM SCRIPTS -->
<script src="../../admin/assets/js/custom.js"></script>
<script language="javascript">
    function sel(){
        document.thisform.submit();
    }
</script>


</body>
</html>
