<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!--==============================用户发布信息页面=============================-->

<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
%>

<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>任务发布_赏金工会</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/reception/css/release_jobs.css">
    <%--友好提示--%>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/reception/plug_in_unit/sweet-alert.css">
</head>

<body>
<!-- 陈嘉辉 20190416 23:45 -->
<!-- 用户信息stat -->
<header>
    <div class="center">
        <a href="/center/list">
        <div class="name_news">
            <div class="name">
                <span>你好、</span>
                <span class="user_name" id="username_span"></span>
            </div>
            <div class="news">
                <img class="bell_img" width="28px" height="28px" src="<%=request.getContextPath()%>/static/reception/img/bell.jpg">
                <span class="news_word">消息 </span>
                <span class="news_number"></span>
            </div>
        </div>
        </a>
        <div class="PersonalCenter_order">
            <div class="personal_center">
                <a href="/center/list"><span>个人中心</span></a>
            </div>
            <img src="img/header_line.png" width="1" height="25">
            <div class="the_order">
                <a href="/center/list"><span>我的订单</span></a>
            </div>
        </div>
    </div>
</header>
<!-- 用户信息end -->
<!-- 导航、任务发布界面、流程信息、客服位置start -->
<main>
    <!-- 导航start -->
    <nav>
        <div class="center">
            <div class="logo_all">
                <a href="/home/list">
                    <img src="<%=request.getContextPath()%>/static/reception/img/logo.png" alt="logo" width="189px"
                         height="57px">
                </a>
            </div>
            <div class="class_keyword">
                <ul>
                    <li>
                        <a href="/home/list">
                            <div class="class_keyword_big">
                                <div class="class_keyword_small">
                                    <p>主页</p>
                                </div>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="/re_seconds/sjdb_page">
                            <div class="class_keyword_big">
                                <div class="class_keyword_small">
                                    <p>事件代办</p>
                                </div>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="/re_seconds/swzl_page">
                            <div class="class_keyword_big">
                                <div class="class_keyword_small">
                                    <p>事物寻找</p>
                                </div>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="/re_seconds/swjy_page">
                            <div class="class_keyword_big">
                                <div class="class_keyword_small">
                                    <p>事物交易</p>
                                </div>
                            </div>
                        </a>
                    </li>
                </ul>
            </div>
            <%--<div class="search_all">
                <div class="search_input">
                    <form action="index.html" method="post">
                        <input type="text" name="search_keywords_all">
                    </form>
                </div>
                <a href="#">
                    <div class="search_button">
                        <img src="img/search2.png" width="23px" height="23px">
                    </div>
                </a>
            </div>--%>
        </div>
    </nav>
    <!-- 导航end -->
    <!-- 目前位置提示start -->

    <div class="location_back">
        <div class="center">
            <div class="location">
                <div class="location_center">
                    <a href="/re_seconds/sjdb_page">
                        <span>事件代办</span>
                    </a>
                    <span>></span>
                    <span>发布任务</span>
                </div>
            </div>
            <%--<div class="back">

            </div>--%>
        </div>
    </div>
    <!-- 目前位置提示end -->
    <!-- 任务发布大厅、活动指南、客服中心start -->
    <div class="threePart_home">
        <div class="threePart">
            <div class="task_distribution">
                <div class="big_title">
                    <span>任务发布大厅</span>
                </div>
                <hr>
                <div class="goal_all">
                    <!-- 任务类型start -->
                    <div class="taskClass">
                        <img class="questionName_img" src="img/mustWrite.png" width="12px" height="12px">
                        <span class="questionName">任务类型 ：</span>
                        <ul>
                            <li>
                                <div class="sjdb_home">
                                    <label for="sjdb">
                                        <input class="a" id="sjdb" type="radio" name="typeOfClass" checked="true"><span>事件代办</span>
                                    </label>
                                </div>
                            </li>
                            <li>
                                <div class="swzl_home">
                                    <label for="swzl">
                                        <input id="swzl" type="radio" name="typeOfClass"><span>失物招领</span>
                                    </label>
                                </div>
                            </li>
                            <li>
                                <div class="swjy_home">
                                    <label for="swjy">
                                        <input id="swjy" type="radio" name="typeOfClass"><span>事物交易</span>
                                    </label>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <!-- 任务类型end -->
                    <!-- 任务细节  陈嘉辉 20190420 12:03  -->

                    <!--
                            作者：陈政
                             时间：2019-04-21
                             描述：此处是点击按钮，隐藏或显示的部分
                        -->
                    <!--
                            事件代办的显示隐藏部分
                        任务细节start
                        -->
                    <form id="sjdb_display_hiding" method="post" enctype="multipart/form-data">
                        <div class="taskDetail">
                            <ul>
                                <li>
                                    <div class="tastKeyWords_home">
                                        <img src="img/mustWrite.png" width="12px" height="12px">
                                        <span class="task_keywords">事件关键词 ：</span>
                                        <div class="taskSign_home">
                                            <select class="taskSign" name="event_tags">
                                                <option value="代取快递">代取快递</option>
                                                <option value="辅助学习">辅助学习</option>
                                                <option value="代跑腿">代跑腿（吃的、药品等）</option>
                                                <option value="其他任务类型">其他任务类型</option>
                                            </select>
                                        </div>
                                    </div>
                                </li>
                                <!-- 任务完成时间start -->
                                <!-- <li>
                                    <div class="done_time_home">
                                        <img src="img/mustWrite.png" width="12px" height="12px">
                                        <span class="task_keywords">完成时间 ：</span>
                                        <div class="done_time_detail">
                                            <input type="time" name="done_time"><span>前</span>
                                        </div>
                                    </div>
                                </li> -->
                                <!-- 任务完成时间end -->
                                <!-- 接单者要求start -->
                                <li>
                                    <div class="tastKeyWords_home">
                                        <img src="img/mustWrite.png" width="12px" height="12px">
                                        <span class="task_keywords">接单者要求 ：</span>
                                        <div class="taskSign_home">

                                            <input id="askSign_detail_a" type="checkbox" name="authentication" value="1">
                                            <input type="hidden" name="authentication" value="0">
                                            <label for="askSign_detail_a">
                                                <span class="taskSign_detail">通过学生身份验证</span>
                                            </label>
                                            <div class="askSign_detail_b">
                                                <input id="askSign_detail_b" type="checkbox" name="deposit" value="1">
                                                <input type="hidden" name="deposit" value="0">
                                                <label for="askSign_detail_b">
                                                    <span class="taskSign_detail">缴纳违约赔偿金</span>
                                                </label>

                                            </div>
                                        </div>
                                    </div>
                                </li>
                                <!-- 接单者要求end -->
                                <li>
                                    <div class="money_amount">
                                        <img src="img/mustWrite.png" width="12px" height="12px">
                                        <span class="task_keywords">悬赏金额 :</span>
                                        <div class="money_amountNumber">
                                            <input type="number" name="price" min="0"><span>元</span>
                                        </div>
                                    </div>
                                </li>

                                <li>
                                    <div class="otherDemand_home">
                                        <div class="otherDemand_words">
                                            <img src="img/mustWrite.png" width="12px" height="12px">
                                            <span class="task_keywords">其他说明 ：</span>
                                        </div>
                                        <div class="otherDemand_detail">

                                            <!--图片上传预览部分-->
                                            <div class="sjdb_pic_upload">
                                                <!--图片所在的div-->
                                                <div id="sjdb_image-holder"></div>
                                                <div class="empity">
                                                </div>
                                                <!--文件上传项-->
                                                <div class="fileUpload_div">
                                                    <input id="sjdb_fileUpload" type="file" name="img"/>
                                                </div>
                                            </div>

                                            <textarea class="sjdb_describe"  name="input_despriction" placeholder="例:&#10;下周一上午第一节&#10;晚上8点送到桃五&#10;去学校对面药店买胃药"></textarea>
                                        </div>

                                    </div>
                                </li>
                                <li>
                                    <!-- 提交按钮start -->
                                    <input id="sjdb_submit" class="ensure_submit" type="button" onclick="sjdb_update()"
                                           value="确认提交">
                                    <!-- 提交按钮end -->
                                </li>
                            </ul>
                        </div>
                    </form>
                    <!-- 事件代办之任务细节end -->

                    <!--失物招领的显示隐藏部分
                        任务细节start-->
                    <form id="swzl_display_hiding" method="post" enctype="multipart/form-data" style="display: none;">
                        <div class="taskDetail">
                            <ul>
                                <li>
                                    <div class="tastKeyWords_home">
                                        <img src="img/mustWrite.png" width="12px" height="12px">
                                        <span class="task_keywords">事件关键词 ：</span>
                                        <div class="swzl_keywords_home">
                                            <input id="lostSomething" type="radio" name="event_tags" value="丢失"
                                                   checked="checked">
                                            <label for="lostSomething">
                                                <span>丢了东西</span>
                                            </label>
                                            <div class="findSomething_right">
                                                <input id="findSomething" type="radio" name="event_tags" value="捡到">
                                                <label for="findSomething">
                                                    <span>捡到东西</span>
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                                <!-- <li>
                                <div class="done_time_home">
                                    <img src="img/mustWrite.png" width="12px" height="12px">
                                    <span class="task_keywords">完成时间 ：</span>
                                    <div class="done_time_detail">
                                        <input type="time" name="done_time"><span>前</span>
                                    </div>
                                </div>
                            </li> -->
                                <li>
                                    <div class="money_amount">
                                        <img src="img/mustWrite.png" width="12px" height="12px">
                                        <span class="task_keywords">物品类型 ：</span>
                                        <div class="typeOfthing_home">
                                            <select class="typeOfthing" name="goods">
                                                <option value="一卡通">
                                                    <span>一卡通</span>
                                                </option>
                                                <option value="课本">
                                                    <span>课本</span>
                                                </option>
                                                <option value="钥匙">
                                                    <span>钥匙</span>
                                                </option>
                                                <option value="其他物品">
                                                    <span>其他物品</span>
                                                </option>
                                            </select>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="money_amount">
                                        <img src="img/mustWrite.png" width="12px" height="12px">
                                        <span class="task_keywords">有偿意愿 ：</span>
                                        <div class="payOrNot_home">
                                            <input id="payOrNot_yes" type="radio" name="free" value="1"
                                                   checked="checked">
                                            <label for="payOrNot_yes">
                                                <span>愿意有偿</span>
                                            </label>
                                            <div class="payOrNot_no_home">

                                                <input id="payOrNot_no" type="radio" name="free" value="0">
                                                <label for="payOrNot_no">
                                                    <span>不愿意有偿</span>
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="otherDemand_home">
                                        <div class="otherDemand_words">
                                            <img src="img/mustWrite.png" width="12px" height="12px">
                                            <span class="task_keywords">其他说明 ：</span>
                                        </div>
                                        <div class="otherDemand_detail">

                                            <!--图片上传预览部分-->
                                            <div class="swzl_pic_upload">
                                                <div id="swzl_image-holder"></div>
                                                <div class="empity"></div>
                                                <div class="fileUpload_div">
                                                    <input id="swzl_fileUpload" type="file" name="img"/>
                                                </div>
                                            </div>

                                            <textarea class="swzl_describe" name="input_despriction" placeholder="例：&#10;一卡通/身份证昨天落在三教了，看到求归还，号码是20175xxx"></textarea>
                                        </div>

                                    </div>
                                </li>
                                <li>
                                    <!-- 提交按钮start -->
                                    <input class="ensure_submit" type="button" value="确认提交" onclick="swzl_update()">
                                    <!-- 提交按钮end -->
                                </li>
                            </ul>
                        </div>
                    </form>
                    <!-- 事物交易之任务细节end -->

                    <!--
                        事物交易的显示隐藏部分
                        任务细节start
                        -->
                    <form id="swjy_display_hiding" method="post" style="display: none;">
                        <div class="taskDetail">
                            <ul>
                                <li>
                                    <div class="done_time_home">
                                        <img src="img/mustWrite.png" width="12px" height="12px">
                                        <span class="task_keywords">物品类型 ：</span>
                                        <div class="deal_home">
                                            <input id="study_thing" type="radio" name="event_tags" value="学习用品"
                                                   checked="checked">
                                            <label for="study_thing">
                                                <span>学习用品</span>
                                            </label>
                                            <input class="liveThing_otherThing" id="live_thing" type="radio"
                                                   name="event_tags" value="生活用品">
                                            <label for="live_thing">
                                                <span>生活用品</span>
                                            </label>
                                            <input class="liveThing_otherThing" id="other_thing" type="radio"
                                                   name="event_tags" value="其它用品">
                                            <label for="other_thing">
                                                <span>其他物品</span>
                                            </label>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="money_amount">
                                        <img src="img/mustWrite.png" width="12px" height="12px">
                                        <span class="task_keywords">出售金额 :</span>
                                        <div class="money_amountNumber">
                                            <input type="number" name="price" min="0"><span>元</span>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="otherDemand_home">
                                        <div class="otherDemand_words">
                                            <img src="img/mustWrite.png" width="12px" height="12px">
                                            <span class="task_keywords">其他说明 ：</span>
                                        </div>
                                        <div class="otherDemand_detail">

                                            <!--图片上传预览部分-->
                                            <div class="swjy_pic_upload">
                                                <div id="swjy_image-holder"></div>
                                                <div class="empity"></div>
                                                <div class="fileUpload_div">
                                                    <input id="swjy_fileUpload" type="file" name="img"/>
                                                </div>

                                            </div>
                                            <textarea class="swjy_describe"  name="input_despriction" placeholder="例：&#10;全新课本/考研复习资料/化妆品大甩卖啦，可留言小刀，欢迎骚扰"></textarea>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <!-- 提交按钮start -->
                                    <input class="ensure_submit" type="button" value="确认提交" onclick="swjy_update()">
                                    <!-- 提交按钮end -->
                                </li>
                            </ul>
                        </div>
                    </form>
                    <!-- 事物交易之任务细节end -->

                </div>
            </div>
            <div class="guider_savingProblem">
                <div class="event_guide">
                    <p class="big_words">流程指南</p>
                    <hr>
                    <ul>
                        <li>
                            <span class="number">1</span><span class="words">发布任务</span>
                        </li>
                        <li>
                            <span class="number">2</span><span class="words">买家支付预付款</span>
                        </li>
                        <li>
                            <span class="number">3</span><span class="words">任务大厅展示</span>
                        </li>
                        <li>
                            <span class="number">4</span><span class="words">赏金猎人缴纳押金</span>
                        </li>
                        <li>
                            <span class="number">5</span><span class="words">赏金猎人领取任务</span>
                        </li>
                        <li>
                            <span class="number">6</span><span class="words">赏金猎人完成任务</span>
                        </li>
                        <li>
                            <span class="number">7</span><span class="words">买方确认任务完成</span>
                        </li>
                        <li>
                            <span class="number">8</span><span class="words">平台结算</span>
                        </li>
                    </ul>
                </div>
                <div class="saving_problenm">
                    <div class="logo_money_home">
                        <img src="<%=request.getContextPath()%>/static/reception/img/logo_money.png" width="85px" height="75px">
                    </div>
                    <a href="#">
                        <div class="consult">
                            <span>在线咨询</span>
                        </div>
                    </a>
                    <div class="consult_phone_home">
                        <div class="consult_phone">
                            <span class="consult_bigWords">客服热线:</span>
                            <span class="phoneNumber">183</span>
                            <span class="phoneNumber">7672</span>
                            <span class="phoneNumber">7574</span>
                        </div>
                    </div>
                    <div class="question_home">
                        <div class="question">
                            <div class="question_title">
                                <span>热门问题 :</span>
                            </div>
                            <div class="question_detail">
                                <p>1、赏金猎人接单但不及时完成怎么办？</p>
                                <p>2、任务完成出现纠纷怎么办，我该找谁帮我解决我的问题？</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
    <!-- 任务发布界面、流程信息、客服位置end -->
</main>

<!--图片上传按钮背景图片-->
<style>
    /*设置铃铛的背景图*/
    .bell_img{
        background-image: url(..<%=request.getContextPath()%>/static/reception/img/bell.jpg);
    }

    .fileUpload_div {
        background: url(<%=request.getContextPath()%>/static/reception/img/release/upload.png);
    }
</style>


<script src="<%=request.getContextPath()%>/static/reception/js/jquery-3.4.0.min.js"></script>
<!--手机端自动跳转-->
<script type="text/javascript" src="<%=request.getContextPath()%>/static/reception/js/mb_release.js"></script>

<!--友好提示-->
<script src="<%=request.getContextPath()%>/static/reception/plug_in_unit/sweet-alert.js"></script>

<script type="text/javascript" src="<%=request.getContextPath()%>/static/reception/js/release.js"></script>
<script type="text/javascript">


    //页面一被打开就判断用户是否登录
    $(document).ready(function () {
        var username = "${sessionScope.user.user_name}";
        //如果用户已登录
        if (username != "") {
            //放入用户名
            $(".user_name").text(username);

            //获取消息数
            //每隔三秒查看消息
            window.setInterval(getNewsNum, 5000);
        }else{
            x();
            function x() {
                var title = "抱歉";
                var text = "您还没有登录，登录后可以发布任务";
                friendly_tips(title, text);
            }


        }
    });

    //事件代办ajax提交
    function sjdb_update() {
        //用户先将钱打到平台后，才允许发布任务

        var formData = new FormData($('#sjdb_display_hiding')[0]);
        formData.append("event_describe", $(".sjdb_describe").val());
        $.ajax({
            type: "POST",
            url: "<%= basePath%>/release/sjdb_add",
            data: formData,
            //async: false,//要求同步 不是不需看你的需求,
            /*false;避开jQuery对formdata的默认处理*/
            processData: false,
            /*必须false才会自动加上正确的content-type*/
            contentType: false,
            success: function (result) {
                var title = "成功";
                var text = "任务正在上传中";
                friendly_tips(title, text);
                //1.5秒后执行
                setTimeout(function () {
                    window.location.href = "<%=request.getContextPath()%>/home/list";
                }, 1500);

            },
            error: function (result) {
                var title = "抱歉";
                var text = "您还没有登录，登录后可以发布任务";
                friendly_tips(title, text);
            }
        });
    };

    //失物招领提交
    function swzl_update() {
        var formData = new FormData($('#swzl_display_hiding')[0]);
        formData.append("event_describe", $(".swzl_describe").val());
        $.ajax({
            type: "POST",
            url: "<%= basePath%>/release/swzl_add",
            data: formData,
            //async: false,//要求同步 不是不需看你的需求,
            /*false;避开jQuery对formdata的默认处理*/
            processData: false,
            /*必须false才会自动加上正确的content-type*/
            contentType: false,
            success: function (result) {
                var title = "成功";
                var text = "任务正在上传中";
                friendly_tips(title, text);
                setTimeout(function () {
                    window.location.href = "<%=request.getContextPath()%>/home/list";
                }, 1500);
            },
            error: function (result) {
                var title = "抱歉";
                var text = "您还没有登录，登录后可以发布任务";
                friendly_tips(title, text);
            }
        });
    };

    //事物交易提交
    function swjy_update() {
        var formData = new FormData($('#swjy_display_hiding')[0]);
        formData.append("event_describe", $(".swjy_describe").val());
        $.ajax({
            type: "POST",
            url: "<%= basePath%>/release/swjy_add",
            data: formData,
            //async: false,//要求同步 不是不需看你的需求,
            /*false;避开jQuery对formdata的默认处理*/
            processData: false,
            /*必须false才会自动加上正确的content-type*/
            contentType: false,
            success: function (result) {
                var title = "成功";
                var text = "任务正在上传中";
                friendly_tips(title, text);
                setTimeout(function () {
                    window.location.href = "<%=request.getContextPath()%>/home/list";
                }, 1500);
            },
            error: function (result) {
                var title = "抱歉";
                var text = "您还没有登录，登录后可以发布任务";
                friendly_tips(title, text);
            }
        });
    };


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
                },
                error: function () {
                    /*var title = "错误";
                    var text = "请联系系统管理员";
                    friendly_tips(title, text);*/
                }
            });


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
</body>

</html>