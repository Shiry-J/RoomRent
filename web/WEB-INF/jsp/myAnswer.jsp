<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 2021/11/6
  Time: 15:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>我的回答 - 房屋租赁系统</title>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/Q&A.css" />
</head>
<body>
<%@include file="before_jsp/head.jsp"%>
<div class="abody">
    <div class="title1">我的回答列表</div>
    <c:forEach items="${answerSession}" var="answer">
        <div class="title2">
            <div class="title3">${answer.answer_content}</div>
            <div class="date"><fmt:formatDate value="${answer.gmt_create}" pattern="yyyy-MM-dd HH:mm:ss"/></div>
            <div class="title4">
                <a href="${pageContext.request.contextPath}/addAnswerPage?id=${answer.room_id}&Dialogue=${answer.question_id}">查看详情</a>
                <a href="${pageContext.request.contextPath}/roominfo.html?id=${answer.room_id}">查看房间</a>
                <a href="${pageContext.request.contextPath}/delAnswer?id=${answer.id}">删除</a>
            </div>
        </div>
        <div class="push"></div>
    </c:forEach>
</div>
</body>
</html>
