<%--
  Created by IntelliJ IDEA.
  User: qiuje
  Date: 2017/6/18
  Time: 9:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>注册</title>
    <link rel="shortcut icon" href="../images/logo.jpg" />
    <link rel="stylesheet" type="text/css" href="css/register.css">
</head>
<body>
<div id="register">
    <form class="registerform" name="registerFram" action="DoOperation/doRegister.jsp" method="post">
        <p style="font-size: 20px">注册</p>
        <div id="registerUP">
            <table>
                <tr>
                    <td>用户名:</td>
                    <td><input type="text" name="userName"  style="height: 30px"/></td>
                </tr>
                <tr>
                    <td>密码:</td>
                    <td><input type="password" name="userLoginPassword" style="height: 30px"/> </td>
                </tr>
                <tr>
                    <td>手机号:</td>
                    <td><input type="text" name="userPhoneNum" style="height: 30px"/> </td>
                </tr>
            </table>
        </div>

        <div id="registersubmit">
            <input type="submit" value="注册" style="width: 100px" />
            <a href="login.jsp"><input type="button" value="已有账号，去登录"  /></a>
        </div>
    </form>
</div>
</body>
</html>
