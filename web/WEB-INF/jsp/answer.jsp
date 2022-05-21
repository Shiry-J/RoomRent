<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>回答 - 房屋租赁系统</title>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/answer.css" />
</head>
<body>
<%@include file="before_jsp/head.jsp"%>
<div class="answerBody">
    <div class="title1">回答房屋：</div>
    <div class="title2">${answer_Room.title}</div>
    <div class="content">房屋描述：${answer_Room.content}</div>
    <div class="question">
        <div class="title4">问题：${Dialogue.question_content}</div>
        <div class="date">提问时间:<fmt:formatDate value="${Dialogue.gmt_create}" pattern="yyyy-MM-dd HH:mm:ss"/></div>
        <c:if test="${Dialogue.question_id != userSession.id}">
            <form method="post" action="${pageContext.request.contextPath}/addAnswer?id=${answer_Room.id}&Dialogue=${Dialogue.id}" onsubmit="return checkAnswer()">
                <div class="title3">您的回答：</div>
                <div class="questioncontent">
                    <input type="text" name="answer" id="answer" placeholder="请输入你想要回答的内容！" onblur="checkAnswer()" onkeyup="checkAnswer()"/>
                    <span id="span_answer" style="font-size: 7px"></span>
                </div>
                <div class="submit"><input id="submit-btn" type="submit" value="提交回答" onclick="checkAnswer()"></div>
            </form>
        </c:if>
        <c:if test="${Dialogue.question_id == userSession.id}">
            <div class="title6">不能回答自己的问题！</div>
        </c:if>
    </div>
    <div class="title5">全部回答：</div>
    <div class="answerList">
        <c:forEach items="${answer_Dialogue}" var="answer">
            <div class="answer">
                <div class="answer-type">
                    <c:if test="${answer_Room.rent_id==answer.answer_id}">房主回答:</c:if>
                    <c:if test="${answer_Room.rent_id!=answer.answer_id}">答:</c:if>
                </div>
                <div class="answer-content">${answer.answer_content}</div>
                <div class="date">回答时间:<fmt:formatDate value="${answer.answer_time}" pattern="yyyy-MM-dd HH:mm:ss"/></div>
            </div>
        </c:forEach>
        <div class="end">暂无更多回答</div>
    </div>
</div>
</body>
<script>
    function showTips(spanID,msg){
        var span = document.getElementById(spanID);
        span.innerHTML = msg;
    }

    function checkAnswer(){
        var answer = document.getElementById("answer").value;
        var span = document.getElementById("span_answer");
        if (answer.length<3){
            span.innerHTML = "<font color='red' size='0.7'>回答少于3个字符</font>";
            return false;
        }else{
            span.innerHTML = "";
            return true;
        }
    }
</script>
</html>
