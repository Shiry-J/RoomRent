<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>房间详情 - 房屋租赁系统</title>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/roominfo.css" />
</head>
<body>
<%@include file="before_jsp/head.jsp"%>
<div class="infoBody">
    <div class="title">${RoomInfo.title}</div>
    <div class="body1">
        <div class="price1">${RoomInfo.price}</div>
        <div class="price2">元/月</div>
        <div class="vertical-bar">|</div>
        <div class="house-type">${RoomInfo.house_type}</div>
        <div class="vertical-bar2">|</div>
        <div class="area1">${RoomInfo.area}</div>
        <div class="area2">平方米</div>
        <div class="rent-type">
            <c:if test="${RoomInfo.rent_type==1}">整租</c:if>
            <c:if test="${RoomInfo.rent_type==0}">合租</c:if>
        </div>
        <div class="orientation">${RoomInfo.orientation}</div>
    </div>
    <div class="collection">
        <c:if test="${is_collected==0}">
            <div class="collection-img">
                <a href="${pageContext.request.contextPath}/addCollection?id=${RoomInfo.id}">
                    <img src="${pageContext.request.contextPath}/statics/img/收藏未选中.png" alt="">
                </a>
            </div>
            <div class="collection-text">
                <a href="${pageContext.request.contextPath}/addCollection?id=${RoomInfo.id}">收藏</a>
            </div>
        </c:if>
        <c:if test="${is_collected==1}"><a href="">
            <div class="collection-img">
                <a href="${pageContext.request.contextPath}/delCollection?id=${RoomInfo.id}">
                    <img src="${pageContext.request.contextPath}/statics/img/收藏选中.png" alt="">
                </a>
            </div>
            <div class="collection-text">
                <a href="${pageContext.request.contextPath}/delCollection?id=${RoomInfo.id}">取消收藏</a>
            </div>
        </c:if>
    </div>
    <div class="img">
        <img src="/statics/img/saveimg/${RoomInfo.image}" alt="">
    </div>
    <div class="house-info">房屋信息</div>
    <div class="bottom-black-box"></div>
    <div class="revise">
        <div class="price1">${RoomInfo.price}</div>
        <div class="price2">元/月</div>
        <div class="house-type1">户型:</div>
        <div class="house-type2">${RoomInfo.house_type}</div>
        <div class="area3">面积:</div>
        <div class="area4">${RoomInfo.area}平方米</div>
        <div class="orientation1">朝向:</div>
        <div class="orientation2">${RoomInfo.orientation}</div>
        <div class="floor1">楼层:</div>
        <div class="floor2">${RoomInfo.floor}层</div>
        <div class="rent-type1">出租类型:</div>
        <div class="rent-type2">
            <c:if test="${RoomInfo.rent_type==1}">整租</c:if>
            <c:if test="${RoomInfo.rent_type==0}">合租</c:if>
        </div>
        <div class="address1">地址:</div>
        <div class="address2">${RoomInfo.region}${RoomInfo.community}</div>
        <div class="contact1">联系人:</div>
        <div class="contact2">${RoomInfo.contacts}</div>
        <div class="phone1">联系方式:</div>
        <div class="phone2">${RoomInfo.phone}</div>
    </div>
    <div class="revise2">
        <div class="house-info">房屋描述</div>
        <div class="bottom-black-box"></div>
        <div class="content">${RoomInfo.content}</div>
    </div>
    <div class="revise3">
        <div class="house-info">房屋问答</div>
        <div class="bottom-black-box"></div>
    </div>
    <c:forEach items="${Dialogue}" var="dialogue">
        <div class="answerbody">
            <div class="question">${dialogue.question_content}</div>
            <div class="date">提问时间:<fmt:formatDate value="${dialogue.gmt_create}" pattern="yyyy-MM-dd HH:mm:ss"/></div>
            <div class="myanswer"><a href="${pageContext.request.contextPath}/addAnswerPage?id=${RoomInfo.id}&Dialogue=${dialogue.id}">我来回答</a></div>
        </div>
    </c:forEach>
    <div class="userquestion"><a href="${pageContext.request.contextPath}/addQuestionPage?id=${RoomInfo.id}">我要提问</a></div>
</div>
<%@include file="before_jsp/bottom.jsp"%>
</body>
</html>
