<%--
  Created by IntelliJ IDEA.
  cn.RoomManagement.pojo: hp
  Date: 2021/5/31
  Time: 10:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>系统登录 - 房屋租赁系统</title>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/login.css" />
</head>
<body>
<form action="${pageContext.request.contextPath}/dologin.html" method="post">
    <div class="login-box">
        <h1>登录</h1>
        <div class="input-box">
            <div class="error-message">${error}</div>
            <div class="input-text">
                <span><img src="/statics/img/用户.png" width="17px"></span>
                <input type="text" name="username" placeholder="请输入用户名">
            </div>
            <div class="input-text">
                <span><img src="/statics/img/密码.png" width="20px"></span>
                <input type="password" name="password" placeholder="请输入密码">
            </div>
            <div class="input-btn">
                <input type="submit" value="登录">
            </div>
            <div class="sgin-up">
                还没账户？<a href="${pageContext.request.contextPath}/register.html">立即注册</a>
            </div>
        </div>
    </div>
</form>
</body>
</html>
