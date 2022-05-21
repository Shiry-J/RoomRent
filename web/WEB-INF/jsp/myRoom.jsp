<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>我的出租 - 房屋租赁系统</title>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/myRoom.css" />
</head>
<body>
<%@include file="before_jsp/head.jsp"%>
<div class="roombody">
    <div class="add-btn"><a href="${pageContext.request.contextPath}/addRoomPage">新增房屋</a></div>
    <div class="title1">已上架的房屋</div>
    <div>
        <table>
            <tr class="title2">
                <td class="title3">编号</td>
                <td class="title3">图片</td>
                <td class="title3">标题</td>
                <td class="title3">描述</td>
                <td class="title3">类型</td>
                <td class="title3">价格</td>
                <td class="title3">创建时间</td>
                <td class="title3">修改时间</td>
                <td class="title3">状态</td>
                <td class="title3">操作</td>
            </tr>
            <c:forEach items="${RoomListByRentId}" var="room">
                <c:if test="${room.is_on==1}">
                    <tr class="title2">
                        <td class="title3">${room.id}</td>
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
                        <td class="title3">
                            <fmt:formatDate value="${room.gmt_create}" pattern="yyyy-MM-dd HH:mm:ss"/>
                        </td>
                        <td class="title3">
                            <fmt:formatDate value="${room.gmt_modified}" pattern="yyyy-MM-dd HH:mm:ss"/>
                        </td>
                        <td class="title3">
                            <a class="title5" href="${pageContext.request.contextPath}/offRoom?id=${room.id}">下架</a>
                        </td>
                        <td class="title3">
                            <a class="title5" href="${pageContext.request.contextPath}/updateRoomPage?id=${room.id}">修改</a>
                            <a class="title5" href="${pageContext.request.contextPath}/delRoom?id=${room.id}">删除</a>
                        </td>
                    </tr>

                </c:if>
            </c:forEach>
        </table>
    </div>
    <div class="end">无更多内容</div>
    <div class="title1">未上架的房屋</div>
    <div>
        <table>
            <tr class="title2">
                <td class="title3">编号</td>
                <td class="title3">图片</td>
                <td class="title3">标题</td>
                <td class="title3">描述</td>
                <td class="title3">类型</td>
                <td class="title3">价格</td>
                <td class="title3">创建时间</td>
                <td class="title3">修改时间</td>
                <td class="title3">状态</td>
                <td class="title3">操作</td>
            </tr>
            <c:forEach items="${RoomListByRentId}" var="room">
                <c:if test="${room.is_on==0}">
                    <tr class="title2">
                        <td class="title3">${room.id}</td>
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
                        <td class="title3">
                            <fmt:formatDate value="${room.gmt_create}" pattern="yyyy-MM-dd HH:mm:ss"/>
                        </td>
                        <td class="title3">
                            <fmt:formatDate value="${room.gmt_modified}" pattern="yyyy-MM-dd HH:mm:ss"/>
                        </td>
                        <td class="title3">
                            <a class="title5" href="${pageContext.request.contextPath}/onRoom?id=${room.id}">上架</a>
                        </td>
                        <td class="title3">
                            <a class="title5" href="${pageContext.request.contextPath}/updateRoomPage?id=${room.id}">修改</a>
                            <a class="title5" href="${pageContext.request.contextPath}/delRoom?id=${room.id}">删除</a>
                        </td>
                    </tr>
                </c:if>
            </c:forEach>
        </table>
    </div>
    <div class="end">无更多内容</div>
</div>
</body>
</html>
