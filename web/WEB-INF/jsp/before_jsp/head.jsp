<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/head.css" />
    <title></title>
    <style type="text/css">
        .bottom-black {
            background: #9B9595;
            width: 100%;
            height: 1px;
        }
    </style>
</head>
<body>
<nav class="nav1">
    <ul>
        <li><a href="${pageContext.request.contextPath}/back">首页</a></li>
        <li><a href="${pageContext.request.contextPath}/myRoomPage">我的出租</a></li>
        <li><a href="${pageContext.request.contextPath}/MyCollectionPage">我的收藏</a></li>
        <li><a href="${pageContext.request.contextPath}/MyQuestionPage">我的提问</a></li>
        <li><a href="${pageContext.request.contextPath}/MyAnswerPage">我的回答</a></li>
        <li>
            <c:if test="${userSession.username=='游客'}">
                <a href="${pageContext.request.contextPath}/backLogin.html"><img src="${pageContext.request.contextPath}/statics/img/用户_填充.png" style="width: 16px;height: 16px" alt="">游客，请登录</a>
            </c:if>
            <c:if test="${userSession.username!='游客'}">
                <a><img src="${pageContext.request.contextPath}/statics/img/用户_填充.png" style="width: 16px;height: 16px" alt="">${userSession.nickname}</a>
                <div class="details">
                    <ul>
                        <li><a href="${pageContext.request.contextPath}/userinfo.html">个人信息</a></li>
                        <li><a href="${pageContext.request.contextPath}/Login.html">退出</a></li>
                    </ul>
                </div>
            </c:if>
        </li>
    </ul>
</nav>
<div class="bottom-black"></div>
</body>
</html>
