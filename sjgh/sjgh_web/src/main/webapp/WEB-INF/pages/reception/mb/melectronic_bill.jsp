<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!--============================手机端之个人中心之订单中心=====================-->

<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
%>
<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0;" name="viewport" />
    <%--<meta name="viewport" content="user-scalable=0">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">--%>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/reception/mb/css/melectronic_bill.css">
    <%--友好提示--%>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/reception/plug_in_unit/sweet-alert.css">
    <title>订单中心_赏金工会</title>

<body>
<!-- 陈嘉辉 20190504 17:53 -->
<!-- 底部导航栏start -->
<div id="nav_bottom">
    <ul class="nav">
        <li>
            <a href="/mb_home/list">
                <div class="home">
                    <img src="<%=request.getContextPath()%>/static/reception/mb/img/home_gray.png" width="20.71px"
                         height="19px">
                    <span class="nav_keywords_gray">主页</span>
                </div>
            </a>
        </li>
        <li>
            <a href="/mb_seconds/sjdb_page">
                <div class="sjdb">
                    <img src="<%=request.getContextPath()%>/static/reception/mb/img/sjdb_gray.png" width="21.5px"
                         height="21.5px">
                    <span class="nav_keywords_gray">事件代办</span>
                </div>
            </a>
        </li>
        <li>
            <a href="/mb_seconds/swzl_page">
                <div class="swxz">
                    <img src="<%=request.getContextPath()%>/static/reception/mb/img/swxz_gray.png" width="22.454px"
                         height="21.5px">
                    <span class="nav_keywords_gray">失物寻找</span>
                </div>
            </a>
        </li>
        <li>
            <a href="/mb_seconds/swjy_page">
                <div class="xzjy">
                    <img src="<%=request.getContextPath()%>/static/reception/mb/img/xzjy_gray.png" width="21.5px"
                         height="21.5px">
                    <span class="nav_keywords_gray">闲置交易</span>
                </div>
            </a>
        </li>
        <li>
            <a href="/mb_center/list">
                <div class="myself">
                    <img src="<%=request.getContextPath()%>/static/reception/mb/img/myself_gray.png" width="20px"
                         height="20px">
                    <span class="nav_keywords_orange">我的</span>
                </div>
            </a>
        </li>
    </ul>
</div>
<!-- 底部导航栏end -->
<!-- 头部标题 陈嘉辉 20190520 13:30 -->
<!-- 头部标题start -->
<header>
    <div class="top-title">
        <a href="/mb_center/list"><img src="<%=request.getContextPath()%>/static/reception/mb/img/back.png" width="10px" height="18px"></a>
        <span>我的订单</span>
    </div>
    <div class="top-description">
        <div class="top-description_left">
            <div class="span_home">
                <a onclick="cutover('a')" href="javascript:void(0);">
                    <span>已发布</span>
                </a>
            </div>
        </div>
        <div class="top-description_right">
            <div class="span_home">
                <a onclick="cutover('b')" href="javascript:void(0);">
                    <span>已领取</span>
                </a>
            </div>
        </div>
    </div>
</header>
<!-- 头部标题end -->
<!-- 订单详情 陈嘉辉 20190521 04:08 -->
<!-- 订单详情start -->
<%--用户发布的--%>
<div class="task_home send_event">

    <%--<div class="task">
        <div class="task_keyword_state">
            <span class="left_keyword">代取快递（事件代办）</span>
            <span class="right_state">接单未完成</span>
        </div>
        <div class="task_otherDeprection">
            <div class="task_otherDeprection_img">
                <img src="img/test.png" width="73px" height="66px">
            </div>
            <div class="task_otherDeprection_words">
                <p>我爱吃西红柿a，我爱吃西红柿a，我爱吃西红柿a，我爱吃西红柿a，
                    我爱吃西红柿a，我爱吃西红柿a，我爱吃西红柿a，我爱吃西红柿a，我爱吃西红柿a，我爱吃西红柿a，</p>
            </div>
        </div>
        <div class="task_date_money">
            <span class="task_date">今天&nbsp;14:20</span>
            <span class="task_money_number">3.2</span>
            <span class="task_money_word">任务赏金&nbsp;:&nbsp;</span>
        </div>
        <div class="task_date_button">
            <a href="#">
                <button class="button_sure_done" type="button">确认完成</button>
            </a>
            <a href="#">
                <button class="button_back" type="button">撤回</button>
            </a>
            <a href="#">
                <button class="button_detail_judge" type="button">工会调解</button>
            </a>
        </div>
    </div>--%>
</div>
<%--用户揭榜的--%>
<div class="task_home receive_event" style="display: none">
</div>
<!-- 订单详情end -->
</body>

<script type="text/javascript" src="<%=request.getContextPath()%>/static/reception/js/jquery-3.4.0.min.js"></script>
<!--友好提示-->
<script src="<%=request.getContextPath()%>/static/reception/plug_in_unit/sweet-alert.js"></script>
<script>

    //页面一被打开就开始执行
    $(document).ready(function () {
        //先清空，防止数据回显
        $(".task").remove();
        get_send_event();
    });

    //点击切换发布列表或者揭榜列表
    function cutover(flag) {
        //先清空，防止数据回显
        $(".task").remove();
        if(flag == 'a'){
            //就是发布列表
            $(".send_event").show();
            $(".receive_event").hide();
            //获取已发布的列表
            get_send_event();
        }else{
            //就是揭榜列表
            $(".send_event").hide();
            $(".receive_event").show();
            //获取已发布的列表
            get_receive_event();
        }
    };

    /**
     * 获取用户的发布任务
     * 自己的发布部分
     * @author: 陈政
     * @Datetime: 2019-6-2 22:41
     *
     * */
    function get_send_event() {
        var formData = new FormData();
        formData.append("state", 3);//3表示未删除的事件,此处查询所有的为删除的列表
        $.ajax({
            url: "<%=basePath%>/mb_center/re_get_event",
            type: "post",
            data: formData,
            processData: false,
            /*必须false才会自动加上正确的content-type*/
            contentType: false,
            success: function (data) {
                /*console.log("==================================")*/
                var sjdb_event = data.sjdb_event;
                var swzl_event = data.swzl_event;
                var swjy_event = data.swjy_event;
                //事件代办部分
                for (var i = 0; i < data.sjdb_event.length; i++) {
                    var keywords = sjdb_event[i].event_tags;
                    var money = sjdb_event[i].price;
                    var road = sjdb_event[i].road;
                    var describe = sjdb_event[i].event_describe;
                    var state = sjdb_event[i].state;

                    $(".send_event").append(
                        "<div class='task'>" +
                        "<div class='task_keyword_state'>" +
                        "<span class='left_keyword'>" + keywords + "（事件代办）</span>" +
                        "<span" + " class" + "='" + "right_state" + " sjdb_a" + i + "'" + ">" + "</span>" +
                        "</div>" +
                        "<div class='task_otherDeprection'>" +
                        "<div class='task_otherDeprection_img'>" +
                        "<img src=" + road + " width='73px' height='66px'>" +
                        "</div>" +
                        "<div class='task_otherDeprection_words'>" +
                        "<p>" + describe + "</p>" +
                        "</div>" +
                        "</div>" +
                        "<div class='task_date_money'>" +
                        "<span class='task_date'>今天&nbsp;14:20" + "</span>" +
                        "<span class='task_money_number'>" + money + "</span>" +
                        "<span class='task_money_word'>任务赏金&nbsp;:&nbsp;</span>" +
                        "</div>" +
                        "<div class='task_date_button'>" +
                        "<a href='#'>" +
                        /*"<button" + " class" + "='" + "detail_back" + " " + "sjdb_a" + i + "'" + "type" + "='" + "button" + "'" + ">撤回" + "</button>" +*/
                        "<button" + " class" + "='" + "button_sure_done" + " " + "sjdb_b" + i + "'" + "type" + "='" + "button" + "'" + ">撤回" + "</button>" +
                        "</a>" +
                        "<a href='#'>" +
                        "<button" + " class" + "='" + "button_back" + " " + "sjdb_c" + i + "'" + "type" + "='" + "button" + "'" + ">工会调解" + "</button>" +
                        "</a>" +
                        "<a href='#'>" +
                        "<button" + " class" + "='" + "button_detail_judge" + " " + "sjdb_d" + i + "'" + "type" + "='" + "button" + "'" + ">确认完成" + "</button>" +
                        "</a>" +
                        "</div>" +
                        "</div>"
                    );

                    //事件代办之，显示订单的状态，按钮显示隐藏
                    if (state == 0) {
                        //未接单，可撤回
                        $('.sjdb_a' + i).text("未接单")
                        //$('.sjdb_b' + i).remove();
                        $('.sjdb_c' + i).remove();
                        $('.sjdb_d' + i).remove();
                    } else if (state == 1) {
                        //已接单未完成，工会调解，确认完成
                        $('.sjdb_a' + i).text("已接单")
                        $('.sjdb_b' + i).remove();
                        //$('.sjdb_c' + i).remove();
                        //$('.sjdb_d' + i).remove();
                    } else if (state == 2) {
                        //已完成
                        $('.sjdb_a' + i).text("已完成")
                        $('.sjdb_b' + i).remove();
                        $('.sjdb_c' + i).remove();
                        //$('.sjdb_d' + i).remove();
                    }
                    ;

                }
                ;

                //事物交易部分
                for (var i = 0; i < data.swjy_event.length; i++) {
                    var keywords = swjy_event[i].event_tags;
                    var money = swjy_event[i].price;
                    var road = swjy_event[i].road;
                    var describe = swjy_event[i].event_describe;
                    var state = swjy_event[i].state;
                    /*console.log("==================================");*/
                    $(".send_event").append(
                        "<div class='task'>" +
                        "<div class='task_keyword_state'>" +
                        "<span class='left_keyword'>" + keywords + "（二手交易）</span>" +
                        "<span" + " class" + "='" + "right_state" + " swjy_a" + i + "'" + ">" + "</span>" +
                        "</div>" +
                        "<div class='task_otherDeprection'>" +
                        "<div class='task_otherDeprection_img'>" +
                        "<img src=" + road + " width='73px' height='66px'>" +
                        "</div>" +
                        "<div class='task_otherDeprection_words'>" +
                        "<p>" + describe + "</p>" +
                        "</div>" +
                        "</div>" +
                        "<div class='task_date_money'>" +
                        "<span class='task_date'>今天&nbsp;14:20" + "</span>" +
                        "<span class='task_money_number'>" + money + "</span>" +
                        "<span class='task_money_word'>任务赏金&nbsp;:&nbsp;</span>" +
                        "</div>" +
                        "<div class='task_date_button'>" +
                        "<a href='#'>" +
                        "<button" + " class" + "='" + "button_sure_done" + " " + "swjy_b" + i + "'" + "type" + "='" + "button" + "'" + ">撤回" + "</button>" +
                        "</a>" +
                        "<a href='#'>" +
                        "<button" + " class" + "='" + "button_back" + " " + "swjy_c" + i + "'" + "type" + "='" + "button" + "'" + ">工会调解" + "</button>" +
                        "</a>" +
                        "<a href='#'>" +
                        "<button" + " class" + "='" + "button_detail_judge" + " " + "swjy_d" + i + "'" + "type" + "='" + "button" + "'" + ">确认完成" + "</button>" +
                        "</a>" +
                        "</div>" +
                        "</div>"
                    );

                    //事物交易之，显示订单的状态，按钮显示隐藏
                    if (state == 0) {
                        //未接单，可撤回
                        $('.swjy_a' + i).text("未接单")
                        //$('.swjy_b' + i).remove();
                        $('.swjy_c' + i).remove();
                        $('.swjy_d' + i).remove();
                    } else if (state == 1) {
                        //已接单未完成，工会调解，确认完成
                        $('.swjy_a' + i).text("已接单")
                        $('.swjy_b' + i).remove();
                        //$('.swjy_c' + i).remove();
                        //$('.swjy_d' + i).remove();
                    } else if (state == 2) {
                        //已完成
                        $('.swjy_a' + i).text("已完成")
                        $('.swjy_b' + i).remove();
                        $('.swjy_c' + i).remove();
                        //$('.swjy_d' + i).remove();
                    }

                }
                ;


                //失物招领部分
                for (var i = 0; i < data.swzl_event.length; i++) {
                    var keywords = swzl_event[i].event_tags;
                    var money = swzl_event[i].free;
                    var road = swzl_event[i].road;
                    var describe = swzl_event[i].event_describe;
                    var state = swzl_event[i].state;
                    $(".send_event").append(
                        "<div class='task'>" +
                        "<div class='task_keyword_state'>" +
                        "<span class='left_keyword'>" + keywords + "（失物寻找）</span>" +
                        "<span" + " class" + "='" + "right_state" + " swzl_a" + i + "'" + ">" + "</span>" +
                        "</div>" +
                        "<div class='task_otherDeprection'>" +
                        "<div class='task_otherDeprection_img'>" +
                        "<img src=" + road + " width='73px' height='66px'>" +
                        "</div>" +
                        "<div class='task_otherDeprection_words'>" +
                        "<p>" + describe + "</p>" +
                        "</div>" +
                        "</div>" +
                        "<div class='task_date_money'>" +
                        "<span class='task_date'>今天&nbsp;14:20" + "</span>" +
                        "<span class='task_money_number'>" + money + "</span>" +
                        "<span class='task_money_word'>任务赏金&nbsp;:&nbsp;</span>" +
                        "</div>" +
                        "<div class='task_date_button'>" +
                        "<a href='#'>" +
                        "<button" + " class" + "='" + "button_sure_done" + " " + "swzl_b" + i + "'" + "type" + "='" + "button" + "'" + ">撤回" + "</button>" +
                        "</a>" +
                        "<a href='#'>" +
                        "<button" + " class" + "='" + "button_back" + " " + "swzl_c" + i + "'" + "type" + "='" + "button" + "'" + ">工会调解" + "</button>" +
                        "</a>" +
                        "<a href='#'>" +
                        "<button" + " class" + "='" + "button_detail_judge" + " " + "swzl_d" + i + "'" + "type" + "='" + "button" + "'" + ">确认完成" + "</button>" +
                        "</a>" +
                        "</div>" +
                        "</div>"
                    );

                    //失物招领之，显示订单的状态，按钮显示隐藏
                    if (state == 0) {
                        //未接单，可撤回
                        $('.swzl_a' + i).text("未接单")
                        //$('.swzl_b' + i).remove();
                        $('.swzl_c' + i).remove();
                        $('.swzl_d' + i).remove();
                    } else if (state == 1) {
                        //已接单未完成，工会调解，确认完成
                        $('.swzl_a' + i).text("已接单")
                        $('.swzl_b' + i).remove();
                        //$('.swzl_c' + i).remove();
                        //$('.swzl_d' + i).remove();
                    } else if (state == 2) {
                        //已完成
                        $('.swzl_a' + i).text("已完成")
                        $('.swzl_b' + i).remove();
                        $('.swzl_c' + i).remove();
                        //$('.swzl_d' + i).remove();
                    }

                }
                ;
            },
            error: function () {
                var title = "错误";
                var text = "请联系系统管理员 ";
                friendly_tips(title, text);
            }
        });

    };


    /**
     * 用户揭榜部分处理
     * @author: 陈政
     * @Datetime: 2019-6-2 22:41
     *
     * */
    function get_receive_event() {
        var formData = new FormData();
        formData.append("state", 3);//3表示未删除的事件,此处查询所有的为删除的列表
        $.ajax({
            url: "<%=basePath%>/mb_center/re_get_receive_event",
            type: "post",
            data: formData,
            processData: false,
            /*必须false才会自动加上正确的content-type*/
            contentType: false,
            success: function (data) {
                console.log("================接单ok==================");
                var sjdb_event = data.sjdb_event;
                var swzl_event = data.swzl_event;
                var swjy_event = data.swjy_event;

                //事件代办部分
                for (var i = 0; i < data.sjdb_event.length; i++) {
                    var keywords = sjdb_event[i].event_tags;
                    var money = sjdb_event[i].price;
                    var road = sjdb_event[i].road;
                    var describe = sjdb_event[i].event_describe;
                    var state = sjdb_event[i].state;
                    console.log("================接单ok==================");
                    //$("#send_event").append("<div" + " class" +  "='" + "a"+  + i +"'" + ">" + keywords + "</div>");
                    $(".receive_event").append(
                        "<div class='task'>" +
                        "<div class='task_keyword_state'>" +
                        "<span class='left_keyword'>" + keywords + "（事件代办）</span>" +
                        "<span" + " class" + "='" + "right_state" + " sjdb_a" + i + "'" + ">" + "</span>" +
                        "</div>" +
                        "<div class='task_otherDeprection'>" +
                        "<div class='task_otherDeprection_img'>" +
                        "<img src=" + road + " width='73px' height='66px'>" +
                        "</div>" +
                        "<div class='task_otherDeprection_words'>" +
                        "<p>" + describe + "</p>" +
                        "</div>" +
                        "</div>" +
                        "<div class='task_date_money'>" +
                        "<span class='task_date'>今天&nbsp;14:20" + "</span>" +
                        "<span class='task_money_number'>" + money + "</span>" +
                        "<span class='task_money_word'>任务赏金&nbsp;:&nbsp;</span>" +
                        "</div>" +
                        "<div class='task_date_button'>" +
                        "<a href='#'>" +
                        /*"<button" + " class" + "='" + "detail_back" + " " + "sjdb_a" + i + "'" + "type" + "='" + "button" + "'" + ">撤回" + "</button>" +*/
                        "<button" + " class" + "='" + "button_sure_done" + " " + "sjdb_b" + i + "'" + "type" + "='" + "button" + "'" + ">撤回" + "</button>" +
                        "</a>" +
                        "<a href='#'>" +
                        "<button" + " class" + "='" + "button_back" + " " + "sjdb_c" + i + "'" + "type" + "='" + "button" + "'" + ">工会调解" + "</button>" +
                        "</a>" +
                        "<a href='#'>" +
                        "<button" + " class" + "='" + "button_detail_judge" + " " + "sjdb_d" + i + "'" + "type" + "='" + "button" + "'" + ">确认完成" + "</button>" +
                        "</a>" +
                        "</div>" +
                        "</div>"
                    );

                    //事件代办之，显示订单的状态，按钮显示隐藏
                    if (state == 0) {
                        //未接单，可撤回
                        $('.sjdb_a_re' + i).text("未接单")
                        //$('.sjdb_b_re' + i).remove();
                        $('.sjdb_c_re' + i).remove();
                        $('.sjdb_d_re' + i).remove();
                    } else if (state == 1) {
                        //已接单未完成，工会调解，确认完成
                        $('.sjdb_a_re' + i).text("已接单")
                        $('.sjdb_b_re' + i).remove();
                        //$('.sjdb_c_re' + i).remove();
                        //$('.sjdb_d_re' + i).remove();
                    } else if (state == 2) {
                        //已完成
                        $('.sjdb_a_re' + i).text("已完成")
                        $('.sjdb_b_re' + i).remove();
                        $('.sjdb_c_re' + i).remove();
                        //$('.sjdb_d_re' + i).remove();
                    }
                    ;

                }
                ;

                //事物交易部分
                for (var i = 0; i < data.swjy_event.length; i++) {
                    var keywords = swjy_event[i].event_tags;
                    var money = swjy_event[i].price;
                    var road = swjy_event[i].road;
                    var describe = swjy_event[i].event_describe;
                    var state = swjy_event[i].state;
                    /*console.log(state)*/
                    $(".send_event").append(
                        "<div class='task'>" +
                        "<div class='task_keyword_state'>" +
                        "<span class='left_keyword'>" + keywords + "（二手交易）</span>" +
                        "<span" + " class" + "='" + "right_state" + " swjy_a" + i + "'" + ">" + "</span>" +
                        "</div>" +
                        "<div class='task_otherDeprection'>" +
                        "<div class='task_otherDeprection_img'>" +
                        "<img src=" + road + " width='73px' height='66px'>" +
                        "</div>" +
                        "<div class='task_otherDeprection_words'>" +
                        "<p>" + describe + "</p>" +
                        "</div>" +
                        "</div>" +
                        "<div class='task_date_money'>" +
                        "<span class='task_date'>今天&nbsp;14:20" + "</span>" +
                        "<span class='task_money_number'>" + money + "</span>" +
                        "<span class='task_money_word'>任务赏金&nbsp;:&nbsp;</span>" +
                        "</div>" +
                        "<div class='task_date_button'>" +
                        "<a href='#'>" +
                        "<button" + " class" + "='" + "button_sure_done" + " " + "swjy_b" + i + "'" + "type" + "='" + "button" + "'" + ">撤回" + "</button>" +
                        "</a>" +
                        "<a href='#'>" +
                        "<button" + " class" + "='" + "button_back" + " " + "swjy_c" + i + "'" + "type" + "='" + "button" + "'" + ">工会调解" + "</button>" +
                        "</a>" +
                        "<a href='#'>" +
                        "<button" + " class" + "='" + "button_detail_judge" + " " + "swjy_d" + i + "'" + "type" + "='" + "button" + "'" + ">确认完成" + "</button>" +
                        "</a>" +
                        "</div>" +
                        "</div>"
                    );

                    //事物交易之，显示订单的状态，按钮显示隐藏
                    if (state == 0) {
                        //未接单，可撤回
                        $('.swjy_a_re' + i).text("未接单");
                        //$('.swjy_b_re' + i).remove();
                        $('.swjy_c_re' + i).remove();
                        $('.swjy_d_re' + i).remove();
                    } else if (state == 1) {
                        //已接单未完成，工会调解，确认完成
                        $('.swjy_a_re' + i).text("已接单");
                        $('.swjy_b_re' + i).remove();
                        //$('.swjy_c_re' + i).remove();
                        //$('.swjy_d_re' + i).remove();
                    } else if (state == 2) {
                        //已完成
                        $('.swjy_a_re' + i).text("已完成");
                        $('.swjy_b_re' + i).remove();
                        $('.swjy_c_re' + i).remove();
                        //$('.swjy_d_re' + i).remove();
                    }
                    ;

                }
                ;


                //失物招领部分
                for (var i = 0; i < data.swzl_event.length; i++) {
                    var keywords = swzl_event[i].event_tags;
                    var money = swzl_event[i].free;
                    var road = swzl_event[i].road;
                    var describe = swzl_event[i].event_describe;
                    var state = swzl_event[i].state;
                    $(".send_event").append(
                        "<div class='task'>" +
                        "<div class='task_keyword_state'>" +
                        "<span class='left_keyword'>" + keywords + "（失物寻找）</span>" +
                        "<span" + " class" + "='" + "right_state" + " swzl_a" + i + "'" + ">" + "</span>" +
                        "</div>" +
                        "<div class='task_otherDeprection'>" +
                        "<div class='task_otherDeprection_img'>" +
                        "<img src=" + road + " width='73px' height='66px'>" +
                        "</div>" +
                        "<div class='task_otherDeprection_words'>" +
                        "<p>" + describe + "</p>" +
                        "</div>" +
                        "</div>" +
                        "<div class='task_date_money'>" +
                        "<span class='task_date'>今天&nbsp;14:20" + "</span>" +
                        "<span class='task_money_number'>" + money + "</span>" +
                        "<span class='task_money_word'>任务赏金&nbsp;:&nbsp;</span>" +
                        "</div>" +
                        "<div class='task_date_button'>" +
                        "<a href='#'>" +
                        "<button" + " class" + "='" + "button_sure_done" + " " + "swzl_b" + i + "'" + "type" + "='" + "button" + "'" + ">撤回" + "</button>" +
                        "</a>" +
                        "<a href='#'>" +
                        "<button" + " class" + "='" + "button_back" + " " + "swzl_c" + i + "'" + "type" + "='" + "button" + "'" + ">工会调解" + "</button>" +
                        "</a>" +
                        "<a href='#'>" +
                        "<button" + " class" + "='" + "button_detail_judge" + " " + "swzl_d" + i + "'" + "type" + "='" + "button" + "'" + ">确认完成" + "</button>" +
                        "</a>" +
                        "</div>" +
                        "</div>"
                    );

                    //失物招领之，显示订单的状态，按钮显示隐藏
                    if (state == 0) {
                        //未接单，可撤回
                        $('.swzl_a_re' + i).text("未接单");
                        //$('.swzl_b_re' + i).remove();
                        $('.swzl_c_re' + i).remove();
                        $('.swzl_d_re' + i).remove();
                    } else if (state == 1) {
                        /*alert("事物交易已接单")*/
                        //已接单未完成，工会调解，确认完成
                        $('.swzl_a_re' + i).text("已接单");
                        $('.swzl_b_re' + i).remove();
                        //$('.swzl_c_re' + i).remove();
                        //$('.swzl_d_re' + i).remove();
                    } else if (state == 2) {
                        //已完成
                        $('.swzl_a_re' + i).text("已完成");
                        $('.swzl_b_re' + i).remove();
                        $('.swzl_c_re' + i).remove();
                        //$('.swzl_d_re' + i).remove();
                    }
                    ;

                }
                ;
            },
            error: function (data) {
                var title = "错误";
                var text = "请联系系统管理员 ";
                friendly_tips(title, text);
            }
        });
    }


    //友好提示---带定时器
    function friendly_tips_timer(title, text) {
        swal({
            title: title,
            text: text,
            timer: 1500
        });
    };

    //友好提示，不带定时器
    function friendly_tips(title, text) {
        swal(title, text)
    };
</script>

</html>
