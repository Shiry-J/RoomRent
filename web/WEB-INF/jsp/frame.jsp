<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>首页 - 房屋租赁系统</title>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/frame.css">
</head>
<body>
<%@include file="before_jsp/head.jsp"%>
<div class="none">
    <div id="container" class="center-justify">
        <div class="sea-container">
            <form action="${pageContext.request.contextPath}/do_search.html">
                <input type="text" name="search" id="search" class="blue-input">
                <input type="submit" value="搜索" class="blue-button">
            </form>
        </div>
    </div>
    <c:forEach items="${roomList}" var="room">
        <div class="product">
            <ul>
                <li>
                    <div class="pro-img">
                        <a href="${pageContext.request.contextPath}/roominfo.html?id=${room.id}">
                            <img src="/statics/img/saveimg/${room.image}" alt="">
                        </a>
                    </div>
                    <h3><a href="${pageContext.request.contextPath}/roominfo.html?id=${room.id}">${room.title}</a></h3>
                    <p class="desc">${room.region}${room.community}</p>
                    <p class="price">
                        <span>${room.price}</span>元
                    </p>
                    <div class="review">
                        <a href="${pageContext.request.contextPath}/roominfo.html?id=${room.id}">
                            <span class="msg">查看详情</span>
                        </a>
                    </div>
                </li>
            </ul>
        </div>
    </c:forEach>
</div>
</body>

</html>
