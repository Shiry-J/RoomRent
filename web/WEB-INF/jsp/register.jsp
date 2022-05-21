<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户注册 - 房屋租赁系统</title>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/register.css" />
</head>

<body>
<form action="${pageContext.request.contextPath}/doRegister.html" method="post" align="center" name="registerform" id="registerform">
    <div class="login-box">
        <h1>注册</h1>
        <div class="input-box">
            <div class="input-text">
                <span><img src="/statics/img/用户.png" width="17px"></span>
                <input type="text" name="username" id="username" placeholder="请输入用户名" onfocus="showTips('span_username','用户名至少6个字符')" onblur="checkUserName()" onkeyup="checkUserName()"/>
                <span id="span_username" style="font-size: 7px"></span>
            </div>
            <div class="input-text">
                <span><img src="/statics/img/用户.png" width="17px"></span>
                <input type="text" name="nickname" id="nickname" placeholder="请输入昵称"  onfocus="showTips('span_nickname','昵称至少2个字符')" onblur="checkNickName()" onkeyup="checkNickName()"/>
                <span id="span_nickname" style="font-size: 7px"></span>
            </div>
            <div class="input-text">
                <span><img src="/statics/img/密码.png" width="20px"></span>
                <input type="password" name="password1" id="password1" placeholder="请输入密码" onfocus="showTips('span_password1','密码至少6个字符')" onblur="checkPassWord1()" onkeyup="checkPassWord1()"/>
                <span id="span_password1" style="font-size: 7px"></span>
            </div>
            <div class="input-text">
                <span><img src="/statics/img/确认密码.png" width="20px"></span>
                <input type="password" name="password2" id="password2" placeholder="重复密码" onfocus="showTips('span_password2','重复密码')" onblur="checkPassWord2()" onkeyup="checkPassWord2()">
                <span id="span_password2" style="font-size: 7px"></span>
            </div>
            <div class="input-text">
                <span><img src="/statics/img/手机.png" width="20px"></span>
                <input type="text" name="phone" id="phone" placeholder="请输入手机号" onfocus="showTips('span_phone','请输入手机号')" onblur="checkPhone()" onkeyup="checkPhone()">
                <span id="span_phone" style="font-size: 7px"></span>
            </div>
            <div class="input-text">
                <span><img src="/statics/img/邮箱.png" width="15px"></span>
                <input type="text" name="email" id="email" placeholder="请输入邮箱地址" onfocus="showTips('span_email','请输入邮箱')" onblur="checkEmail()" onkeyup="checkEmail()">
                <span id="span_email" style="font-size: 7px"></span>
            </div>
            <div class="input-btn">
                <input type="submit" value="注册">
            </div>
            <div class="sgin-up">
                已有账户？<a href="${pageContext.request.contextPath}/backLogin.html">返回</a>
            </div>
        </div>
    </div>
</form>
</body>
<script>

    function showTips(spanID,msg){
        var span = document.getElementById(spanID);
        span.innerHTML = msg;
    }

    function checkUserName(){
        var username = document.getElementById("username").value;
        var span = document.getElementById("span_username");
        if (username.length<6){
            span.innerHTML = "<font color='red' size='0.7'>用户名少于6个字符</font>";
            return false;
        }else{
            span.innerHTML = "";
            return true;
        }
    }

    function checkNickName(){
        var nickname = document.getElementById("nickname").value;
        var span = document.getElementById("span_nickname");
        if (nickname.length<2){
            span.innerHTML = "<font color='red' size='0.7'>昵称少于2个字符</font>";
            return false;
        }else{
            span.innerHTML = "";
            return true;
        }
    }

    function checkPassWord1(){
        var password1 = document.getElementById("password1").value;
        var span = document.getElementById("span_password1");
        if (password1.length<6){
            span.innerHTML = "<font color='red' size='0.7'>密码少于6个字符</font>";
            return false;
        }else{
            span.innerHTML = "";
            return true;
        }
    }

    function checkPassWord2(){
        var password1 = document.getElementById("password1").value;
        var password2 = document.getElementById("password2").value;
        var span = document.getElementById("span_password2");
        if (password1 !== password2 || password2 == null || password2 === ""){
            span.innerHTML = "<font color='red' size='0.7'>密码不一致</font>";
            return false;
        }
        else{
            span.innerHTML = "";
            return true;
        }
    }

    function checkPhone(){
        var phone = document.getElementById("phone").value;
        var span = document.getElementById("span_phone");
        if (phone.length !== 11){
            span.innerHTML = "<font color='red' size='0.7'>请输入正确的手机号</font>";
            return false;
        }
        else{
            span.innerHTML = "";
            return true;
        }
    }

    function checkEmail(){
        var email = document.getElementById("email").value;
        var span = document.getElementById("span_email");
        var emailcheck = /^\w+@[a-z0-9]+(\.[a-z]+){1,3}$/;
        if (email === "" || email == null || !emailcheck.test(email)){
            span.innerHTML = "<font color='red' size='0.7'>请输入正确的邮箱</font>";
            return false;
        }
        else{
            span.innerHTML = "";
            return true;
        }
    }

</script>
</html>
