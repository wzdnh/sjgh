<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!--=========================手机端之个人中心之安全设置页面============================-->

<%
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
%>
<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0;" name="viewport" />
  <meta name="viewpormt" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/static/reception/mb/css/mset_up_savety.css">
  <title>安全设置_赏金工会</title>
</head>

<body>
  <!-- 头部标题start -->
  <header>
    <div class="top-title">
      <a href="#"><img src="<%=request.getContextPath()%>/static/reception/mb/img/back.png" width="10px" height="18px"></a>
      <span class="center">安全设置</span>
    </div>
  </header>
  <!-- 头部标题end -->
  <!-- 具体安全设置 陈嘉辉 20190526 01:20 -->
  <!-- 具体安全设置start -->
  <span class="save_bigTailtle">账户安全</span>
  <a href="#">
    <div class="detail_save_first">
      <img src="img/save_passWord.png" width="50px" height="50px">
      <div class="detail_save_first_description">
        <span class="detail_keyword">登录密码</span>
        <span class="detail_description">为更好地保障您的交易安全<br>建议您定期更改密码以保护账户安全</span>
      </div>
    </div>
  </a>
  <a href="#">
    <div class="detail_save">
      <img src="img/save_phone.png" width="50px" height="50px">
      <div class="detail_save_first_description">
        <span class="detail_keyword">手机验证</span>
        <span class="detail_description">您验证的手机:${sessionScope.user.phone_number}<br>若已丢失或停用，请立即更换</span>
      </div>
    </div>
  </a>
  <a href="#">
    <div class="detail_save">
      <img src="img/save_weChat.png" width="50px" height="50px">
      <div class="detail_save_first_description">
        <span class="detail_keyword">微信绑定</span>
        <span class="detail_description">为更好地保障您的交易安全<br>方便您快速登录,建议您进行微信登录绑定</span>
      </div>
    </div>
  </a>
  <!-- 具体安全内容end -->

  <script type="text/javascript" src="<%=request.getContextPath()%>/static/reception/mb/js/jquery-3.4.0.min.js"></script>
  <!--友好提示-->
  <%--<script src="<%=request.getContextPath()%>/static/reception/plug_in_unit/sweet-alert.js"></script>--%>
  <script>
/*    //页面一被打开就执行
    $(document).ready(function () {

    });

    //获取用户绑定的电话
    function x() {

    }*/

  </script>
</body>

</html>
