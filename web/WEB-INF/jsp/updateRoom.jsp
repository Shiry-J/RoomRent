<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改房间 - 房屋租赁系统</title>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/addRoom.css" />
</head>
<body>
<%@include file="before_jsp/head.jsp"%>
<div class="AddBody">
  <div class="title">修改房屋信息</div>
  <form method="post" action="${pageContext.request.contextPath}/updateRoom?id=${updateRoomInfo.id}" enctype="multipart/form-data">
    <div class="box">
      <div class="box1">标题：</div>
      <div class="box2">
        <input class="box3" type="text" name="title" value="${updateRoomInfo.title}" id="title" placeholder="请输入标题" onblur="checkTitle()" onkeyup="checkTitle()">
        <span id="span_title" style="font-size: 7px"></span>
      </div>
    </div>
    <div class="push"></div>
    <div class="box">
      <div class="box1">类型：</div>
      <div class="box2">
        <select class="box3" id="rent_type" name="rent_type">
          <option>合租</option>
          <option>整租</option>
        </select>
        <div class="lastchoose">
          上次选择:
          <c:if test="${updateRoomInfo.rent_type==1}">整租</c:if>
          <c:if test="${updateRoomInfo.rent_type==0}">合租</c:if>
        </div>
      </div>
    </div>
    <div class="push"></div>
    <div class="box">
      <div class="box1">户型：</div>
      <div class="box2">
        <input class="box3" type="text" name="house_type" id="house_type"  value="${updateRoomInfo.house_type}" placeholder="x室x厅x卫" onblur="checkHouse_type()" onkeyup="checkHouse_type()">
        <span id="span_house_type" style="font-size: 7px"></span>
      </div>
    </div>
    <div class="push"></div>
    <div class="box">
      <div class="box1">朝向：</div>
      <div class="box2">
        <select class="box3" name="orientation" id="orientation">
          <option>东</option>
          <option>西</option>
          <option>南</option>
          <option>北</option>
          <option>东南</option>
          <option>东北</option>
          <option>西南</option>
          <option>西北</option>
        </select>
        <div class="lastchoose">上次选择:${updateRoomInfo.orientation}</div>
      </div>
    </div>
    <div class="push"></div>
    <div class="box">
      <div class="box1">面积：</div>
      <div class="box2">
        <input class="box4" value="${updateRoomInfo.area}" type="text" name="area" id="area" placeholder="请输入面积" onblur="checkArea()" onkeyup="checkArea()">
        <div class="box5">平方米</div>
        <span id="span_area" style="font-size: 7px"></span>
      </div>
    </div>
    <div class="push"></div>
    <div class="box">
      <div class="box1">地区：</div>
      <div class="box2">
        <input class="box3" type="text"  value="${updateRoomInfo.region}" name="region" id="region" placeholder="xx省xx市xx区" onblur="checkRegion()" onkeyup="checkRegion()">
        <span id="span_region" style="font-size: 7px"></span>
      </div>
    </div>
    <div class="push"></div>
    <div class="box">
      <div class="box1">小区：</div>
      <div class="box2">
        <input class="box3" type="text" value="${updateRoomInfo.community}" name="community" id="community" placeholder="请输入小区名" onblur="checkCommunity()" onkeyup="checkCommunity()">
        <span id="span_community" style="font-size: 7px"></span>
      </div>
    </div>
    <div class="push"></div>
    <div class="box">
      <div class="box1">楼层：</div>
      <div class="box2">
        <input class="box4" value="${updateRoomInfo.floor}" type="text" name="floor" id="floor" placeholder="请输入楼层" onblur="checkFloor()" onkeyup="checkFloor()">
        <div class="box5">楼</div>
        <span id="span_floor" style="font-size: 7px"></span>
      </div>
    </div>
    <div class="push"></div>
    <div class="box">
      <div class="box1">租金：</div>
      <div class="box2">
        <input class="box4" value="${updateRoomInfo.price}" type="text" name="price" id="price" placeholder="请输入租金" onblur="checkPrice()" onkeyup="checkPrice()">
        <div class="box5">元/月</div>
        <span id="span_price" style="font-size: 7px"></span>
      </div>
    </div>
    <div class="push"></div>
    <div class="box">
      <div class="box1">描述：</div>
      <div class="box2">
        <input class="box3" type="text" value="${updateRoomInfo.content}" name="content" id="content" placeholder="请输入描述" onblur="checkContent()" onkeyup="checkContent()">
        <span id="span_content" style="font-size: 7px"></span>
      </div>
    </div>
    <div class="push"></div>
    <div class="box">
      <div class="box1">图片：</div>
      <div class="box2">
        <input class="img-btn" type="file" name="image" id="image">
      </div>
    </div>
    <div class="push"></div>
    <div class="box">
      <div class="box1">联系人：</div>
      <div class="box2">
        <input class="box6" type="text" value="${updateRoomInfo.contacts}" name="contacts" id="contacts" placeholder="请输入联系人" onblur="checkContacts()" onkeyup="checkContacts()">
        <span id="span_contacts" style="font-size: 7px"></span>
      </div>
    </div>
    <div class="push"></div>
    <div class="box">
      <div class="box1">联系电话：</div>
      <div class="box2">
        <input class="box7" value="${updateRoomInfo.phone}" type="text" name="phone" id="phone" placeholder="请输入联系电话" onblur="checkPhone()" onkeyup="checkPhone()">
        <span id="span_phone" style="font-size: 7px"></span>
      </div>
    </div>
    <div class="push"></div>
    <div class="submit"><input id="submit-btn" type="submit" value="提交"></div>
  </form>
</div>

</body>

<script>
  function showTips(spanID,msg){
    var span = document.getElementById(spanID);
    span.innerHTML = msg;
  }

  function checkTitle(){
    var title = document.getElementById("title").value;
    var span = document.getElementById("span_title");
    if (title.length<6){
      span.innerHTML = "<font color='red' size='3px'>标题少于6个字符</font>";
      return false;
    }else{
      span.innerHTML = "";
      return true;
    }
  }

  function checkHouse_type(){
    var house_type = document.getElementById("house_type").value;
    var span = document.getElementById("span_house_type");
    if (house_type.length<1){
      span.innerHTML = "<font color='red' size='3px'>户型不能为空</font>";
      return false;
    }else{
      span.innerHTML = "";
      return true;
    }
  }

  function checkArea(){
    var area = document.getElementById("area").value;
    var span = document.getElementById("span_area");
    if (area.length<1){
      span.innerHTML = "<font color='red' size='3px'>房屋面积不能为空</font>";
      return false;
    }else{
      span.innerHTML = "";
      return true;
    }
  }

  function checkCommunity(){
    var community = document.getElementById("community").value;
    var span = document.getElementById("span_community");
    if (community.length<1){
      span.innerHTML = "<font color='red' size='3px'>所在小区不能为空</font>";
      return false;
    }else{
      span.innerHTML = "";
      return true;
    }
  }

  function checkRegion(){
    var region = document.getElementById("region").value;
    var span = document.getElementById("span_region");
    if (region.length<1){
      span.innerHTML = "<font color='red' size='3px'>所在地区不能为空</font>";
      return false;
    }else{
      span.innerHTML = "";
      return true;
    }
  }

  function checkFloor(){
    var floor = document.getElementById("floor").value;
    var span = document.getElementById("span_floor");
    if (floor.length<1){
      span.innerHTML = "<font color='red' size='3px'>楼层不能为空</font>";
      return false;
    }else{
      span.innerHTML = "";
      return true;
    }
  }

  function checkPrice(){
    var price = document.getElementById("price").value;
    var span = document.getElementById("span_price");
    if (price.length<1){
      span.innerHTML = "<font color='red' size='3px'>租金不能为空</font>";
      return false;
    }else{
      span.innerHTML = "";
      return true;
    }
  }

  function checkContent(){
    var content = document.getElementById("content").value;
    var span = document.getElementById("span_content");
    if (content.length<10){
      span.innerHTML = "<font color='red' size='3px'>描述不能小于10个字符</font>";
      return false;
    }else{
      span.innerHTML = "";
      return true;
    }
  }

  function checkContacts(){
    var contacts = document.getElementById("contacts").value;
    var span = document.getElementById("span_contacts");
    if (contacts.length<1){
      span.innerHTML = "<font color='red' size='3px'>联系人不能为空</font>";
      return false;
    }else{
      span.innerHTML = "";
      return true;
    }
  }

  function checkPhone(){
    var phone = document.getElementById("phone").value;
    var span = document.getElementById("span_phone");
    if (phone.length!==11){
      span.innerHTML = "<font color='red' size='3px'>手机号格式不正确</font>";
      return false;
    }else{
      span.innerHTML = "";
      return true;
    }
  }
</script>
</html>
