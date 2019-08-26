<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!--============================手机端之个人中心页面我的钱包=====================-->

<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
%>

<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0;" name="viewport"/>
    <meta name="viewpormt" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/reception/mb/css/mspecial_offer.css">
    <title>我的钱包_赏金工会</title>
</head>

<body>
<!-- 头部标题start -->
<header>
    <div class="top-title">
        <a href="/mb_center/list"><img src="<%=request.getContextPath()%>/static/reception/mb/img/back.png" width="10px"
                                       height="18px"></a>
        <span class="center">我的钱包</span>
    </div>
</header>
<!-- 头部标题end -->
<!-- 红包类名  陈嘉辉 20190526 23:38-->
<!-- 红包类名start -->
<div class="big_title">
    <a onclick="change('a')" href="javascript:void(0);">
        <div class="red_packet">
            <span class="red_packet_word">红包</span>
        </div>
    </a>
    <a onclick="change('b')" href="javascript:void(0);">
        <div class="other_packet">
            <span class="other_packet_word">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;其他奖励</span>
        </div>
    </a>
</div>
<!-- 红包类名end -->
<!-- 红包、其他奖励细节start -->
<div class="red_packet_down a" style="display: none">
    <div class="red_packet_numberHome">
        <span class="red_packet_big_word_one">可用红包</span>
        <span class="red_packet_big_number">3</span>
        <span class="red_packet_big_word_two">个</span>
    </div>
    <div class="red_packet_detai_home">
        <a href="#">
            <div class="red_packet_detail">
                <span class="red_packet_time">有效期：2019.05.1-2019.05.31</span>
            </div>
        </a>
    </div>
</div>
<div class="other_packet_down b">
    <div class="red_packet_numberHome">
        <span class="red_packet_big_word_one">其他奖励</span>
    </div>
    <div class="red_packet_detai_home">
        <a href="#">
            <div class="other_packet_detail">
                <span class="red_packet_time">有效期：2019.05.1-2019.05.31</span>
                <span class="detail_webCode"> 编号12345<br>充值卡账号<br>ABCDabcd12345<br>充值卡密码<br>12345678 </span>
            </div>
        </a>
    </div>
</div>
<!-- 红包、其他奖励细节end -->
</body>

<script src="<%=request.getContextPath()%>/static/reception/js/jquery-3.4.0.min.js"></script>
<script src="<%=request.getContextPath()%>/static/reception/mb/js/auth.js"></script>
<!--友好提示-->
<script>


    //点击切换红包或是其他奖励
    function change(flag) {
        if (flag == "a"){
            $(".a").show();
            $(".b").hide();
        } else{
            $(".b").show();
            $(".a").hide();
        }
    }

</script>

</html>
