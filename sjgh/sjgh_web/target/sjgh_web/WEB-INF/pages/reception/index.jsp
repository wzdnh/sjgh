<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
%>

<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>赏金工会_大学生互助悬赏平台</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/reception/css/index.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/reception/css/auth.css">
    <%--<link rel="stylesheet" href="<%=request.getContextPath()%>/static/reception/css/personal_base.css">--%>
    <%--友好提示--%>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/reception/plug_in_unit/sweet-alert.css">
</head>

<body>
<header>
    <!-- logo和注册 陈嘉辉 20190412 00:23 -->
    <!-- logo和注册star -->

    <!--test===start-->
    <%--<div class="fa_xin_xi">
        <a href="/release/to_add">点我发布信息</a>
        <a href="/to_login">点我去后台</a>
        <a href="/re_quit">退出登录</a>
    </div>--%>
    <!----test====end-->

    <div class="partcenter">
        <div class="empty">
        </div>
        <div class="logo_login">
            <div class="logo">
                <a href="/home/list">
                    <img src="<%=request.getContextPath()%>/static/reception/img/logo.png" alt="logo" width="205"
                         height="63">
                </a>
            </div>
            <!--陈政
                19-5-11 21.26
                增加了个人中心入口
            -->
            <div class="login_sign_home">

                <!--登录注册部分-->
                <%--<div class="login_sign">
                    <a onclick="login()" href="javascript:void(0);">
                        <div class="login">
                            <p id="login">登录</p>
                        </div>
                    </a>
                    <span class="sign_two"> / </span>
                    <div class="sign">
                        <a id="register_button" onclick="register()" href="javascript:void(0);">
                            <p class="sign_two">还没账号</p>
                        </a>
                    </div>
                </div>--%>
            </div>
        </div>
        <!-- logo和注册end -->
        <!-- 导航与轮播图与搜索的框start -->
        <nav>
            <div class="empty">
            </div>
            <div class="big_keyword">
                <div class="sy">
                    <a href="#"><span class="big_keyword_one">首页</span></a>
                </div>
                <div class="sjdb">
                    <a href="/re_seconds/sjdb_page"><span class="big_keyword_two">事件代办</span></a>
                </div>
                <div class="swxz">
                    <a href="/re_seconds/swzl_page"><span class="big_keyword_two">失物寻找</span></a>
                </div>
                <div class="swjy">
                    <a href="/re_seconds/swjy_page"><span class="big_keyword_two">事物交易</span></a>
                </div>
            </div>
            <div class="search">
                <%--<form action="index.html" method="post">
                    <input class="search_input" type="text" name="search_input">
                </form>
                <a href="#">
                    <div class="search_button">
                        <img src="<%=request.getContextPath()%>/static/reception/img/search.png">
                    </div>
                </a>--%>
            </div>
            <div class="search_below">
                <%--<a href="#">
                    <span>带飞期末</span>
                </a>
                <a href="#">
                    <span>代取快递</span>
                </a>
                <a href="#">
                    <span>代帮打饭</span>
                </a>
                <a href="#">
                    <span>一起打卡</span>
                </a>
                <a href="#">
                    <span>喵了个咪</span>
                </a>--%>
            </div>
            <!--轮播模块-->
            <div class="LunBO" id="LunBo">
                <div class="lunbo" id="lun_bo">
                    <a href="">
                        <div class="banner-slide slide1 slide-active"><img class="lunbo_image"
                                                                           src="<%=request.getContextPath()%>${sessionScope.officialPicture.get(0).road}"/>
                        </div>
                    </a>
                    <a href="">
                        <div class="banner-slide slide2"><img class="lunbo_image"
                                                              src="<%=request.getContextPath()%>${sessionScope.officialPicture.get(1).road}"/>
                        </div>
                    </a>
                    <a href="">
                        <div class="banner-slide slide3"><img class="lunbo_image"
                                                              src="<%=request.getContextPath()%>${sessionScope.officialPicture.get(2).road}"/>
                        </div>
                    </a>
                    <a href="">
                        <div class="banner-slide slide4"><img class="lunbo_image"
                                                              src="<%=request.getContextPath()%>${sessionScope.officialPicture.get(3).road}"/>
                        </div>
                    </a>
                    <a href="">
                        <div class="banner-slide slide5"><img class="lunbo_image"
                                                              src="<%=request.getContextPath()%>${sessionScope.officialPicture.get(4).road}"/>
                        </div>
                    </a>
                </div>
                <!--向前向后按钮-->
                <%--style="background: url('<%=request.getContextPath()%>/static/reception/img/arrow.png') no-repeat"--%>
                <a class="button prev" id="prev"></a>
                <a class="button next" id="next" ></a>
                <%--style="background: url('<%=request.getContextPath()%>/static/reception/img/arrow.png') no-repeat; transform:rotate(180deg);"--%>
                <!--五个小按钮-->
                <div class="dots" id="dots">
                    <span class="active"></span>
                    <span></span>
                    <span></span>
                    <span></span>
                    <span></span>
                </div>
            </div>
        </nav>
        <!-- 导航与轮播图与搜索的框end -->
    </div>
</header>
<main>
    <!-- 事件代办 陈嘉辉 20190419 22:35 -->
    <!-- 事件代办start -->
    <div class="partone">
        <div class="partcenter">
            <div class="empty">
            </div>
            <div class="title_home">
                <div class="title">
                    <p class="title_big">事件代办</p>
                    <p class="title_small">——————— 找人帮忙做事 ———————</p>
                </div>
            </div>
            <div class="exhibition">
                <div class="exhibition_img">
                    <img src="<%=request.getContextPath()%>${sessionScope.officialPicture.get(5).road}" width="278px"
                         height="508px">
                </div>
                <%--style="display: flex;justify-content:space-between;"--%>
                <div class="exhibition_details">

                    <c:forEach items="${agentEventList}" var="ael">
                        <a class="exhibition_details_group" href="/re_detail/sjdb?event_id=${ael.event_id}">
                            <div class="exhibition_details_group"
                                 style="float: left; margin-right: 5px; margin-bottom: 15px">
                                <!-- 新加入的身份等接单要求start -->
                                <%--<div class="real_name">
                                    <p>验</p>
                                </div>
                                <div class="insurance">
                                    <p>保</p>
                                </div>--%>
                                <!-- 新加入的身份等接单要求end -->
                                <b>
                                    <div class="exhibition_details_keywords_home" style="margin-top: 40px">
                                        <div class="exhibition_details_keywords">
                                            <div class="exhibition_details_what">
                                                <p>${ael.event_tags}</p>
                                            </div>
                                            <div class="exhibition_details_howmuch">
                                                <p>${ael.price}元</p>
                                            </div>
                                            <div class="exhibition_details_when">
                                                    <%--<p>${ael.start_time} ${ael.end_time}</p>--%>
                                            </div>
                                        </div>
                                    </div>
                                </b>
                                <hr class="ImaginaryLine">
                                <div class="description">
                                    <p>${ael.event_describe}…</p>
                                </div>
                                <div class="exhibition_details_footer">
                                    <div class="user_imformation">
                                        <img src="<%=request.getContextPath()%>${ael.user_er.head_portrait}"
                                             width="29px"
                                             height="29px">
                                        <div class="Name_LegalTimes">
                                            <span class="name">${ael.user_er.user_name}</span>
                                            <div class="legaltimes">
                                                <span class="word_times">履约次数：</span>
                                                <span class="times">${ael.user_er.performance}</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </c:forEach>

                </div>
            </div>
            <div class="more_home">
                <a href="/re_seconds/sjdb_page">
                    <p class="more">查看更多==></p>
                </a>
            </div>
        </div>
    </div>
    <!-- 事件代办end -->
    <!-- 事物寻找start -->
    <div class="parttwo">
        <div class="partcenter">
            <div class="empty">
            </div>
            <div class="title_home">
                <div class="title">
                    <p class="title_big">事物寻找</p>
                    <p class="title_small">——————— 东西丢了/捡到东西 ———————</p>
                </div>
            </div>
            <div class="exhibition">
                <div class="exhibition_img">
                    <img src="<%=request.getContextPath()%>${sessionScope.officialPicture.get(6).road}" width="278px"
                         height="508px">
                </div>
                <div class="exhibition_details">

                    <c:forEach items="${lostAndFoundList}" var="laf">
                        <a class="exhibition_details_group" href="/re_detail/swzl?id=${laf.id}">
                            <div class="exhibition_details_group">
                                <p class="exhibition_details_keyword">帮</p>
                                <b>
                                    <div class="exhibition_details_keywords_home">
                                        <div class="exhibition_details_keywords">
                                            <div class="exhibition_details_what">
                                                <p>${laf.event_tags}</p>
                                            </div>
                                            <div class="exhibition_details_howmuch">
                                                <p>${laf.price}元</p>
                                            </div>
                                            <div class="exhibition_details_when">
                                                    <%--<p>${laf.start_time} ${laf.end_time}</p>--%>
                                            </div>
                                        </div>
                                    </div>
                                </b>
                                <hr class="ImaginaryLine">
                                <div class="description">
                                    <p>${laf.event_describe}…</p>
                                </div>
                                <div class="exhibition_details_footer">
                                    <div class="user_imformation">
                                        <img src="<%=request.getContextPath()%>${laf.user_er.head_portrait}"
                                             width="29px"
                                             height="29px">
                                        <div class="Name_LegalTimes">
                                            <span class="name">${laf.user_er.user_name}</span>
                                            <div class="legaltimes">
                                                <span class="word_times">履约次数：</span>
                                                <span class="times">${laf.user_er.performance}</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </c:forEach>

                </div>
            </div>
            <div class="more_home">
                <a href="/re_seconds/swzl_page">
                    <p class="more">查看更多==></p>
                </a>
            </div>
        </div>
    </div>
    <!-- 事物寻找end -->
    <!-- 事物交易start -->
    <div class="partthree">
        <div class="partcenter">
            <div class="empty">
            </div>
            <div class="title_home">
                <div class="title">
                    <p class="title_big">事物交易</p>
                    <p class="title_small">——————— 同校闲置物品交易 ———————</p>
                </div>
            </div>
            <div class="exhibition">
                <div class="exhibition_img">
                    <img src="<%=request.getContextPath()%>${sessionScope.officialPicture.get(7).road}" width="278px"
                         height="508px">
                </div>
                <div class="exhibition_details">

                    <c:forEach items="${transactionOfThingsList}" var="tot">
                        <a class="exhibition_details_group" href="/re_detail/swjy?id=${tot.id}">
                            <div class="exhibition_details_group">
                                <p class="exhibition_details_keyword">卖</p>
                                <b>
                                    <div class="exhibition_details_keywords_home">
                                        <div class="exhibition_details_keywords">
                                            <div class="exhibition_details_what">
                                                <p>${tot.event_tags}</p>
                                            </div>
                                            <div class="exhibition_details_howmuch">
                                                <p>${tot.price}元</p>
                                            </div>
                                            <div class="exhibition_details_when">
                                                    <%--<p>${tot.start_time} ${tot.end_time}</p>--%>
                                            </div>
                                        </div>
                                    </div>
                                </b>
                                <hr class="ImaginaryLine">
                                <div class="description">
                                    <p>${tot.event_describe}…</p>
                                </div>
                                <div class="exhibition_details_footer">
                                    <div class="user_imformation">
                                        <img src="<%=request.getContextPath()%>${tot.user_er.head_portrait}"
                                             width="29px"
                                             height="29px">
                                        <div class="Name_LegalTimes">
                                            <span class="name">${tot.user_er.user_name}</span>
                                            <div class="legaltimes">
                                                <span class="word_times">履约次数：</span>
                                                <span class="times">${tot.user_er.performance}</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </c:forEach>

                </div>
            </div>
            <div class="more_home">
                <a href="/re_seconds/swjy_page">
                    <p class="more">查看更多==></p>
                </a>
            </div>
        </div>
    </div>
    <!-- 事物交易end -->
</main>

<!--===================登录注册部分===================-->
<div id="login_register_div"
     style="width: 100%; height: 100%; position: fixed; z-index: 99; top: 0; left: 0; display: none; background: rgba(190,190,190,0.5) ">
    <div id="login_register"
         style="width: 360px; height: 50%;  z-index: 9999; position: relative; top: 10px; left: 0; right: 0; margin: auto; display: none; ">

        <div class="lowin">
            <div class="lowin-brand">
                <img src="<%=request.getContextPath()%>/static/reception/img/80.png" alt="logo" width="80px"
                     height="80px">
            </div>
            <div class="lowin-wrapper">
                <div class="lowin-box lowin-login" style="display: none;">
                    <img class="close" src="<%=request.getContextPath()%>/static/reception/img/close.svg"
                         style="width: 16px; height: 16px; margin-left: 164px; position: absolute; z-index: 9999"
                         onclick="close()">
                    <div class="lowin-box-inner">
                        <form id="login_info" method="post">
                            <p>赏&nbsp;金&nbsp;工&nbsp;会</p>
                            <div class="lowin-group">
                                <label>用户名 / 电话 <a href="#" class="login-back-link">Sign in?</a></label>
                                <input id="account_number" name="username" type="text" class="lowin-input">
                            </div>
                            <div class="lowin-group password-group" id="login_password_div">
                                <label>密码 <a href="#" class="forgot-link">忘了密码?</a></label>
                                <input type="password" name="password" class="lowin-input" AUTOCOMPLETE="off">
                            </div>
                            <button type="button" id="login_btn" class="lowin-btn login-btn">
                                登录
                            </button>
                            <div class="text-foot">
                                还没账号? <a class="register-link" class="login-link" onclick="register()"
                                         href="javascript:void(0);">注册</a>
                            </div>
                        </form>
                    </div>
                </div>

                <div class="lowin-box lowin-register" style="display: none">
                    <img class="close" src="<%=request.getContextPath()%>/static/reception/img/close.svg"
                         style="width: 16px; height: 16px; margin-left: 164px;  z-index: 9999; position: absolute;">
                    <div class="lowin-box-inner">

                        <form id="register_info" method="post">
                            <p class="lowin-box-inner_title">赏金工会注册</p>
                            <div class="lowin-group">
                                <label>学校</label>
                                <select id="school_select">
                                    <option name="school_name" value="天津商业大学">天津商业大学</option>
                                    <!-- <option value="tjcu">天津商业大学</option>
                                    <option value="tjcu">天津商业大学</option> -->
                                </select>
                                <!-- <input type="text" name="school" class="lowin-input"> -->
                            </div>
                            <div class="lowin-group">
                                <label>用户名</label>
                                <input type="text" name="username" class="lowin-input" AUTOCOMPLETE="off">
                            </div>
                            <div class="lowin-group">
                                <label>密码</label>
                                <input type="password" name="password" class="lowin-input">
                            </div>
                            <div class="lowin-group">
                                <label>确认密码</label>
                                <input type="password" name="password_ok" class="lowin-input">
                            </div>
                            <div class="lowin-group">
                                <label>邀请码（选填)</label>
                                <input name="invitation_code" type="number" class="lowin-input">
                            </div>
                            <div class="lowin-group">
                                <label>手机</label>
                                <input name="phone_number" type="number" class="lowin-input_phoneNumber"
                                       style="-moz-appearance:textfield"
                                       placeholder="请输入常用手机号码">
                                <a href="javascript:void(0);" onclick="getCode()"><span
                                        class="lowin-input_requireNumber">获取验证码</span></a>
                                <input name="verification_code" class="lowin-input" style="-moz-appearance:textfield"
                                       placeholder="请输入验证码">
                            </div>
                            <button id="register-btn" type="button" class="lowin-btn">
                                注&nbsp;册
                            </button>

                            <div class="text-foot">
                                已经账号? <a class="login-link" onclick="login()" href="javascript:void(0);">登录</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <%--        <footer class="lowin-footer">
                        &lt;%&ndash;赏金工会——永远相信美好事物正在发生 忙着长大 忙着可爱&ndash;%&gt;
                    </footer>--%>
        </div>
    </div>
</div>
<!--===================登录注册部分=================== end-->

<!-- 发布任务按钮、退出登录按钮start -->
<a onclick="release()" href="javascript:void(0);">
    <button class="button_releaseJobs" type="button">发布任务</button>
</a>
<a class="quit" href="/re_quit" style="display: none">
    <button class="button_logOut" type="button">退出登录</button>
</a>
<!-- 发布任务按钮、退出登录按钮end -->

<footer>
    <div class="empty">
    </div>
    <p>赏金工会：永远相信美好事物正在发生 忙着可爱 忙着长大。</p>
</footer>

<style media="screen">
    /*设置铃铛*/
    .bell_img{
        width: 28px;
        height: 28px;
        background: url(..<%=request.getContextPath()%>/static/reception/img/bell.jpg);
        display: block;
        float: left;
    }

    .name_news {
        width: 340px;
        height: 33px;
        float: right;
    }

    .name_news .name {
        width: 171px;
        height: 33px;
        float: left;
        margin-right: 10px;
        overflow: hidden;
    }

    .name_news .name span {
        font-size: 20px;
        color: #FF8900;
        position: relative;
        top: 2.5px;
        float: right;
    }

    .news {
        width: 150px;
        height: 38px;
        float: left;
    }

    .news_word {
        font-size: 20px;
        color: #7C7C7C;
    }

    .news_number {
        font-size: 20px;
        color: #FF8900;
        font-weight: bold;
    }

    .news img {
        position: relative;
        top: 2.5px;
    }

    .news span {
        position: relative;
        top: -2.5px;
    }

    #prev{
        background: url(..<%=request.getContextPath()%>/static/reception/img/arrow.svg);
    }

    #next{
        background: url(..<%=request.getContextPath()%>/static/reception/img/arrow.svg);
    }
</style>

<script src="<%=request.getContextPath()%>/static/reception/js/jquery-3.4.0.min.js"></script>
<!--手机端自动跳转-->
<script src="<%=request.getContextPath()%>/static/reception/js/mb_index.js" type="text/javascript"></script>
<!--友好提示-->
<script src="<%=request.getContextPath()%>/static/reception/plug_in_unit/sweet-alert.js"></script>
<script>


    //页面一被打开就判断用户是否登录
    $(document).ready(function () {

        var username = "${sessionScope.user.user_name}";

        //如果用户已登录
        if (username != "") {
            //显示退出按钮
            $(".quit").show();
            //var sum = '${sessionScope.sum}';
            $(".login_sign").remove();
            $(".login_sign_home").prepend(
                "<div class='name_news'>" +
                "<a href='/center/list' class='name'>" +
                "<div class='name'>" +
                "<span class='user_name'>" + username + "</span>" +
                "<span>你好、" + "</span>" +
                "</div>" +
                "</a>" +
                "<a class='news' href='javascript:void(0);' onclick='to_news()'>" +
                "<div class='news'>" +
                /*"<img" + "class" + "='" +bell_img + "'"  + "src" + "='" +img+ "'" + ">" +*/
                "<span class='bell_img'>" + "</span>" +
                /*"<img" + "class" + "='" +bell_img + "'"  + "src" + "='" +img+ "'" + ">" +*/
                /*"<img" + "src" + "='" + "%=request.getContextPath()%>/static/reception/img/bell.jpg" + "'" + "class" + "='" + "bell_img" + "'" + ">" +*/
                "<span class='news_word'>消息  " + "</span>" +
                "<span class='news_number'>" + "</span>" +
                "</div>" +
                "</a>" +
                "</div>"
            )

        } else {

            $(".name_news").remove();
            $(".login_sign_home").prepend(
                "<div class='login_sign'>" +
                "<a onclick='login()' href='javascript:void(0);'>" +
                "<div class='login'>" +
                "<p id='login'>登录" + "</p>" +
                "</div>" +
                "</a>" +
                "<span class='sign_two'> /" + "</span>" +
                "<div class='sign'>" +
                "<a id='register_button' onclick='register()' href='javascript:void(0);'>" +
                "<p class='sign_two'>还没账号" + "</p>" +
                "</a>" +
                "</div>" +
                "</div>"
            )
        }


        //获取消息数
        //每隔三秒查看消息
        window.setInterval(getNewsNum, 1000);

    });



    /**
     *
     * 登录注册部分
     *
     * */
    //点击登录,登录div显示
    function login() {
        $("#login_register_div").show();
        $("#login_register").show();
        $(".lowin-login").show();
        $(".lowin-register").hide();
    };

    //点击按钮注册，注册界面div显示
    function register() {
        $("#login_register_div").show();
        $("#login_register").show();
        $(".lowin-register").show();
    };


    //点击x，清空表单关闭登录注册窗口
    $(".close").click(function () {
        $("input").val("");
        $("#login_register").hide();
        $("#login_register_div").hide();
        $(".lowin-login").hide();
        $(".lowin-register").hide();
    });


    /**
     *
     * 登录注册ajax提交处理模块
     *
     * */
    //登录部分
    $("#login_btn").click(function () {
        //首先判断是否已登录
        var user = "${sessionScope.user.user_name}";
        if (user != "") {
            alert("已登录");
        } else {
            var formData = new FormData($('#login_info')[0]);
            var phone_number = $("#account_number").val();
            //放入电话号码
            formData.append("phone_number", phone_number);

            $.ajax({
                url: "<%=basePath%>/re_login",
                type: "post",
                data: formData,
                processData: false,
                /*必须false才会自动加上正确的content-type*/
                contentType: false,
                success: function (data) {
                    var flag = data.flag;
                    /*switch (flag) {
                        case 0:
                            alert("失败");
                            break;
                        case 1:
                            alert("连续签到成功");
                            $(".close").click();
                            break;
                        case 2:
                            alert("已签到，登录成功");
                            $(".close").click();
                            break;
                        case 3:
                            alert("今日成功签到");
                            $(".close").click();
                            break;
                    }
                    ;*/
                    if (flag == 0) {
                        var title = "登录失败";
                        var text = "请重新输入账号和密码";
                        friendly_tips(title, text);
                    } else if (flag == 1) {
                        var title = "登录成功";
                        var text = "连续签到";
                        friendly_tips_timer(title, text);
                    } else if (flag == 2) {
                        var title = "登录成功";
                        var text = "今日已签到";
                        friendly_tips_timer(title, text);
                    } else if (flag == 3) {
                        var title = "登录成功";
                        var text = "今日成功签到";
                        friendly_tips_timer(title, text);
                    }

                    //登录成功时，显示隐藏操作
                    if (flag != 0 && flag != null) {
                        var username = data.user.user_name;

                        //登录注册界面隐藏
                        $("#login_register_div").hide();
                        //原先的登录注册按钮移除
                        $(".login_sign").remove();
                        $(".login_sign_home").prepend(
                            "<div class='name_news'>" +
                            "<a href='/center/list' class='name'>" +
                            "<div class='name'>" +
                            "<span class='user_name'>" + username + "</span>" +
                            "<span >你好、" + "</span>" +
                            "</div>" +
                            "</a>" +
                            "<a class='news' href='javascript:void(0);' onclick='to_news()'>" +
                            "<div class='news'>" +

                            //"<div" + "class" +  "='" + "a"+  + i +"'" + ">" + keywords + "</div>"
                            /*"<img" + "class" + "='" +bell_img + "'"  + "src" + "='" +img+ "'" + ">" +*/
                            "<span class='bell_img'>" + "</span>" +
                            /*"<img" + "src" + "='" + "%=request.getContextPath()%>/static/reception/img/bell.jpg" + "'" + "class" + "='" + "bell_img" + "'" + ">" +*/
                            "<span class='news_word'>消息  " + "</span>" +
                            "<span class='news_number'>" + "</span>" +
                            "</div>" +
                            "</a>" +
                            "</div>"
                        );

                        //显示退出按钮
                        $(".quit").show();
                    }

                    //获取消息数
                    getNewsNum();

                },
                error: function (data) {
                    var title = "错误";
                    var text = "请联系系统管理员";
                    friendly_tips(title, text);
                }
            });
        }
        ;

    });


    /*获取验证码*/
    function getCode() {
        var formData = new FormData($('#register_info')[0]);
        $.ajax({
            url: "<%=basePath%>/re_get_code",
            type: "post",
            data: formData,
            processData: false,
            /*必须false才会自动加上正确的content-type*/
            contentType: false,
            success: function (data) {
                var title = "成功";
                var text = "验证码已成功发送，请注意查看";
                friendly_tips(title, text);
            },
            error: function () {
                var title = "错误";
                var text = "请重新输入电话号码";
                friendly_tips(title, text);
            }
        });

    }

    /*注册部分ajax*/
    $("#register-btn").click(function () {

        var formData = new FormData($('#register_info')[0]);
        var school_name = $('#school_select option:selected').val();
        formData.append("school_name", school_name);
        $.ajax({
            url: "<%=basePath%>/re_register",
            type: "post",
            data: formData,
            processData: false,
            /*必须false才会自动加上正确的content-type*/
            contentType: false,
            success: function (data) {
                var flag = data.flag;
                if (flag == 0) {
                    var title = "错误";
                    var text = "请填写完整信息";
                    friendly_tips(title, text);
                } else if (flag == 1) {
                    var title = "错误";
                    var text = "填写的密码不一致，请重新填写密码";
                    friendly_tips(title, text);
                } else if (flag == 2) {
                    var title = "错误";
                    var text = "请填写正确的短信验证码";
                    friendly_tips(title, text);
                } else if (flag == 3) {
                    var title = "注册成功";
                    var text = "欢迎您使用赏金工会大学生悬赏互助平台";
                    friendly_tips(title, text);
                    //关闭登录注册页面
                    setTimeout(function(){$(".close").click()}, 3000);
                    //刷新当前页面.
                    setTimeout(function(){window.location.reload()}, 3000);
                }

            },
            error: function () {
                var title = "错误";
                var text = "请联系系统管理员";
                friendly_tips(title, text);
            }
        });
    });

    //点击去到我的消息页面
    function to_news() {
        window.location.href = "<%=basePath%>/center/list"
    }

    //动态获取消息数
    function getNewsNum() {
        /*var formData = new FormData();*/
        var user_name = $(".user_name").val();
        /*formData.append("username", user_name);*/

        if (user_name != null) {
            /*console.log("-----------------------------")*/
            $.ajax({
                url: "<%=basePath%>/re_get_news_num",
                type: "post",
                /*data: formData,*/
                processData: false,
                /*必须false才会自动加上正确的content-type*/
                contentType: false,
                success: function (data) {
                    $(".news_number").text(data.sum);
                    /*var title = "成功";
                    var text = "验证码已成功发送，请注意查看";
                    friendly_tips(title, text);*/
                },
                error: function () {
                    var title = "错误";
                    var text = "请联系系统管理员";
                    friendly_tips(title, text);
                }
            });


        }

    };


    //发布任务功能，只有登陆时，才进行跳转
    function release() {
        //先判断用户是否已登录
        var user_name = $(".user_name").val();
        if(user_name == null){
            var title = "抱歉";
            var text = "请先登录，登陆后可发布任务";
            friendly_tips(title, text);
        }else {
            //如果登陆，则可以进入发布页面
            window.location.href="/release/to_add";
        }
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


<script type="text/javascript" src="<%=request.getContextPath()%>/static/reception/js/mb_index.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/static/reception/js/lun_bo.js"></script>

</body>

</html>
<!-- all end 陈嘉辉 20190413 11:49 -->
