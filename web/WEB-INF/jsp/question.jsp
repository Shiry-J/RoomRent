<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>提问 - 房屋租赁系统</title>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/question.css" />
</head>
<body>
<%@include file="before_jsp/head.jsp"%>
<div class="questionBody">
    <div class="title1">提问房屋：</div>
    <div class="title2">${question_Room.title}</div>
    <div class="content">房屋描述：${question_Room.content}</div>
    <div class="question">
        <form method="post" action="${pageContext.request.contextPath}/addQuestion?id=${question_Room.id}" onsubmit="return checkQuestion()">
            <div class="title3">请描述您的问题：</div>
            <div class="questioncontent">
                <input type="text" name="question" id="question" placeholder="请尽可能简短的描述您的问题，以便得到专业的回答！" onblur="checkQuestion()" onkeyup="checkQuestion()"/>
                <span id="span_question" style="font-size: 7px"></span>
            </div>
            <div class="submit"><input id="submit-btn" type="submit" value="提交问题" onclick="checkQuestion()"></div>
        </form>
    </div>
</div>
</body>
<script>
    function showTips(spanID,msg){
        var span = document.getElementById(spanID);
        span.innerHTML = msg;
    }

    function checkQuestion(){
        var question = document.getElementById("question").value;
        var span = document.getElementById("span_question");
        if (question.length<6){
            span.innerHTML = "<font color='red' size='2px'>问题少于6个字符</font>";
            return false;
        }else{
            span.innerHTML = "";
            return true;
        }
    }
</script>
</html>
