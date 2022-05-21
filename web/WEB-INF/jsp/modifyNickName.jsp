<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改昵称 - 房屋租赁系统</title>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/modifyEasy.css" />
</head>
<body>
<%@include file="before_jsp/head.jsp"%>
<div class="modifyBody">
    <div class="modfiy-title">修改昵称</div>
    <form method="post" action="${pageContext.request.contextPath}/domodifyNickName" onsubmit="return checknewNickName()">
        <div class="modify">
            <div class="modify-box1">新昵称:</div>
            <div class="modify-box2">
                <input type="text" name="newNickName" id="newNickName" onblur="checknewNickName()" onkeyup="checknewNickName()">
                <span id="span_newNickName" style="font-size: 20px"></span>
            </div>
        </div>
        <div class="submit"><input type="submit" value="提交" id="submit-btn"></div>
    </form>
</div>
</body>
<script>
    function checknewNickName(){
        var newNickName = document.getElementById("newNickName").value;
        var oldNickName = "${userSession.nickname}";
        var span = document.getElementById("span_newNickName");
        if (newNickName.length<2){
            span.innerHTML = "<font color='red' size='2px'>昵称少于2个字符</font>";
            return false;
        }else if(newNickName===oldNickName){
            span.innerHTML = "<font color='red' size='2px'>新昵称不能与原昵称相应</font>";
            return false;
        }else{
            span.innerHTML = "";
            return true;
        }
    }
</script>
</html>
