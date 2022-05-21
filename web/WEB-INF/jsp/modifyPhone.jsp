<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改联系电话 - 房屋租赁系统</title>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/modifyEasy.css" />
</head>
<body>
<%@include file="before_jsp/head.jsp"%>
<div class="modifyBody">
    <div class="modfiy-title">修改电话</div>
    <form method="post" action="${pageContext.request.contextPath}/doModifyPhone" onsubmit="return checkPhone()">
        <div class="modify">
            <div class="modify-box1">新电话:</div>
            <div class="modify-box2">
                <input type="text" name="phone" id="newNickName" onblur="checkPhone()" onkeyup="checkPhone()">
                <span id="span_phone" style="font-size: 20px"></span>
            </div>
        </div>
        <div class="submit"><input type="submit" value="提交" id="submit-btn"></div>
    </form>
</div>
</body>
<script>
    function checkPhone(){
        var phone = document.getElementById("phone").value;
        var oldphone = "${userSession.phone}";
        var span = document.getElementById("span_phone");
        if (phone.length !== 11){
            span.innerHTML = "<font color='red' size='2px'>请输入正确的手机号</font>";
            return false;
        }else if(oldphone === phone){
            span.innerHTML = "<font color='red' size='2px'>新手机号不能与原手机号相同</font>";
            return false;
        }
        else{
            span.innerHTML = "";
            return true;
        }
    }
</script>
</html>
