<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>收藏 - 房屋租赁系统</title>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/mycollection.css" />
</head>
<body>
<%@include file="before_jsp/head.jsp"%>
<div class="roombody">
    <div class="title1">我的收藏</div>
    <div>
        <table>
            <tr class="title2">
                <td class="title3">图片</td>
                <td class="title3">标题</td>
                <td class="title3">内容</td>
                <td class="title3">类型</td>
                <td class="title3">价格</td>
                <td class="title3">操作</td>
            </tr>
            <c:forEach items="${RoomCollected}" var="room">
                <tr class="title2">
                    <td class="title3">
                        <a href="${pageContext.request.contextPath}/roominfo.html?id=${room.id}">
                            <img src="/statics/img/saveimg/${room.image}" alt="" style="height: 150px;width: 150px">
                        </a>
                    </td>
                    <td class="title3">
                        <a class="title4" href="${pageContext.request.contextPath}/roominfo.html?id=${room.id}">
                                ${room.title}
                        </a>
                    </td>
                    <td class="title3">
                        <a class="title4" href="${pageContext.request.contextPath}/roominfo.html?id=${room.id}">
                                ${room.content}
                        </a>
                    </td>
                    <td class="title3">
                        <c:if test="${room.rent_type==1}"><div class="rent-type">整租</div></c:if>
                        <c:if test="${room.rent_type==0}"><div class="orientation">合租</div></c:if>
                    </td>
                    <td class="title3">
                        <div class="price-body">
                            <div class="price1">${room.price}</div>
                            <div class="price2">元/月</div>
                        </div>
                    </td>
                    <td class="title3"><a class="title5" href="${pageContext.request.contextPath}/delSingleCollection?id=${room.id}">取消收藏</a></td>
                </tr>
            </c:forEach>
        </table>
        <div class="end">暂无更多收藏</div>
    </div>
</div>
</body>
</html>
