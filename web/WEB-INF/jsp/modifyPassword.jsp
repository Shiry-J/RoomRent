<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改密码 - 房屋租赁系统</title>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/modifyEasy2.css" />
</head>
<body>
<%@include file="before_jsp/head.jsp"%>
<div class="modifyBody">
    <div class="modfiy-title">修改密码</div>
    <form method="post" action="${pageContext.request.contextPath}/doModifyPassword" onsubmit="return check()">
        <div class="modify">
            <div class="modify-box1">旧密码:</div>
            <div class="modify-box2"><input class="modify-box3" type="password" name="oldPas" id="oldPas" onblur="checkoldPas()" onkeyup="checkoldPas()"><span id="span_oldPas" style="font-size: 20px"></span></div>
            <div class="modify-box1">新密码:</div>
            <div class="modify-box2"><input class="modify-box3" type="password" name="newPas1" id="newPas1" onblur="checknewPas1()" onkeyup="checknewPas1()"><span id="span_newPas1" style="font-size: 20px"></span></div>
            <div class="modify-box1">重复密码:</div>
            <div class="modify-box2"><input class="modify-box3" type="password" name="newPas2" id="newPas2" onblur="checknewPas2()" onkeyup="checknewPas2()"><span id="span_newPas2" style="font-size: 20px"></span></div>
            <div class="submit"><input type="submit" value="提交" id="submit-btn"></div>
        </div>
    </form>
</div>
</body>
<script>

    function checkoldPas(){
        var oldPas = document.getElementById("oldPas").value;
        var password = "${userSession.password}";
        var span = document.getElementById("span_oldPas");
        if (oldPas!==password){
            span.innerHTML = "<font color='red' size='2px'>新旧密码不一致</font>";
            return false;
        }else{
            span.innerHTML = "";
            return true;
        }
    }

    function checknewPas1(){
        var newPas1 = document.getElementById("newPas1").value;
        var span = document.getElementById("span_newPas1");
        if (newPas1.length<6){
            span.innerHTML = "<font color='red' size='2px'>新密码少于6个字符</font>";
            return false;
        }else{
            span.innerHTML = "";
            return true;
        }
    }

    function checknewPas2(){
        var newPas1 = document.getElementById("newPas1").value;
        var newPas2 = document.getElementById("newPas2").value;
        var span = document.getElementById("span_newPas2");
        if (newPas1 !== newPas2 || newPas2 == null || newPas2 === ""){
            span.innerHTML = "<font color='red' size='2px'>密码不一致</font>";
            return false;
        }else{
            span.innerHTML = "";
            return true;
        }
    }

    function check(){
        var check1 = checkoldPas();
        var check2 = checknewPas1();
        var check3 = checknewPas2();
        return check1 === true && check2 === true && check3 === true;
    }

</script>
</html>
