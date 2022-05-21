<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改邮箱 - 房屋租赁系统</title>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/modifyEasy.css" />
</head>
<body>
<%@include file="before_jsp/head.jsp"%>
<div class="modifyBody">
    <div class="modfiy-title">修改邮箱</div>
    <form method="post" action="${pageContext.request.contextPath}/doModifyEmail" onsubmit="return checknewEmail()">
        <div class="modify">
            <div class="modify-box1">新邮箱:</div>
            <div class="modify-box2">
                <input type="text" name="email" id="newNickName" onblur="checknewEmail()" onkeyup="checknewEmail()">
                <span id="span_email" style="font-size: 20px"></span>
            </div>
        </div>
        <div class="submit"><input type="submit" value="提交" id="submit-btn"></div>
    </form>
</div>
</body>
<script>
    function checknewEmail(){
        var email = document.getElementById("email").value;
        var oldemail = "${userSession.email}";
        var span = document.getElementById("span_email");
        var emailcheck = /^\w+@[a-z0-9]+(\.[a-z]+){1,3}$/;
        if (email === "" || email == null || !emailcheck.test(email)){
            span.innerHTML = "<font color='red' size='2px'>邮箱格式不正确</font>";
            return false;
        }else if (oldemail === email){
            span.innerHTML = "<font color='red' size='2px'>新邮箱不能与原邮箱相同</font>";
            return false;
        }
        else{
            span.innerHTML = "";
            return true;
        }
    }
</script>
</html>
