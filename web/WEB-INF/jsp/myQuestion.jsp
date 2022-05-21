<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>我的问题 - 房屋租赁系统</title>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/Q&A.css" />
</head>
<body>
<%@include file="before_jsp/head.jsp"%>
<div class="abody">
    <div class="title1">我的问题列表</div>
    <c:forEach items="${questionSession}" var="question">
        <div class="title2">
            <div class="title3">${question.question_content}</div>
            <div class="date"><fmt:formatDate value="${question.gmt_create}" pattern="yyyy-MM-dd HH:mm:ss"/></div>
            <div class="title4">
                <a href="${pageContext.request.contextPath}/addAnswerPage?id=${question.room_id}&Dialogue=${question.id}">查看详情</a>
                <a href="${pageContext.request.contextPath}/roominfo.html?id=${question.room_id}">查看房间</a>
                <a href="${pageContext.request.contextPath}/delQuestion?id=${question.id}">删除</a>
            </div>
        </div>
        <div class="push"></div>
    </c:forEach>
</div>
</body>
</html>
