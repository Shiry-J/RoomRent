<%@ page import="com.RoomRent.pojo.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>个人信息 - 房屋租赁系统</title>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/userinfo.css" />
    <%!
        public String changePhone(HttpSession session){
            User user = (User) session.getAttribute("userSession");
            String phone = user.getPhone();
            return phone.substring(0,3)+"*****"+phone.substring(8,11);
        }

        public String changeEmail(HttpSession session){
            User user = (User) session.getAttribute("userSession");
            String email = user.getEmail();
            return email.substring(0,3)+"*****"+email.substring(email.length()-7);
        }
    %>
</head>
<body>
<%@include file="before_jsp/head.jsp"%>
<div class="infobody">
    <div class="title">个人信息</div>
    <div class="box1">账号:</div>
    <div class="box2">${userSession.username}</div>
    <div class="box3"><a href="${pageContext.request.contextPath}/modifyPassword.html">修改密码</a></div>
    <div class="box1">昵称:</div>
    <div class="box2">${userSession.nickname}</div>
    <div class="box3"><a href="${pageContext.request.contextPath}/modifyNickName.html">编辑</a></div>
    <div class="box1">电话:</div>
    <div class="box2"><%=changePhone(session)%></div>
    <div class="box3"><a href="${pageContext.request.contextPath}/modifyPhone.html">编辑</a></div>
    <div class="box1">邮箱:</div>
    <div class="box2"><%=changeEmail(session)%></div>
    <div class="box3"><a href="${pageContext.request.contextPath}/modifyEmail.html">编辑</a></div>
</div>
</body>
</html>
