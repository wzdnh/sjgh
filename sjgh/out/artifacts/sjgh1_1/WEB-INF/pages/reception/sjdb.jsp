<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!--=========================事件代办二级界面============================-->

<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
%>

<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/reception/css/sjdb.css">
    <!--分页插件-->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/reception/css/page_turning.css"/>
    <!--登录注册弹出的界面与友好提示-->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/reception/plug_in_unit/sweet-alert.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/reception/css/auth.css">
    <title>事件代办</title>
</head>

<body>
<!-- logo和登录和局部搜索start -->
<!-- 陈嘉辉 20190414 00:16 -->
<header>
    <div class="empty">
    </div>
    <div class="logo">
        <a href="/home/list">
            <img src="<%=request.getContextPath()%>/static/reception/img/logo.png" width="205" height="63">
        </a>
    </div>
    <div class="loginSign_search">
        <div class="search">
            <div class="search_input">
                <form id="sjdb_search" class="a" method="post">
                    <input id="search_input" type="text" name="sjdb_keyWords" autocomplete="off">
                </form>
                <a onclick="sjdb_search_update_page_info()">
                    <div class="search_img">
                        <img src="<%=request.getContextPath()%>/static/reception/img/search.png">
                    </div>
                </a>
            </div>
            <div style="height: 38px; width: 20px">
                <!--此div是用来占空的.防止搜索动态预览部分上滑-->
            </div>
            <!--搜索动态预览部分-->
            <ul class="search_dynamic_preview"></ul>
        </div>


        <!--登录注册部分-->
        <div class="login_sign_home">
            <!-- 登录注册 -->
            <%--<a href="javascript:void(0);" onclick="login()">
                <div class="login">
                    <p>登录</p>
                </div>
            </a>
            <div class="login_center">
                <p>/</p>
            </div>
            <a href="javascript:void(0);" onclick="register()">
                <div class="sign">
                    <p>还没账号</p>
                </div>
            </a>--%>
            <!-- 登录注册end -->
        </div>
    </div>
</header>
<!-- 登录和局部搜索end -->
<!-- 陈嘉辉 20190414 02:07 -->
<main>
    <!-- 导航和轮播图start -->
    <nav>
        <div class="nav_center">
            <div class="empty">
            </div>
            <div class="big_keyword">
                <div class="sy">
                    <a href="/home/list"><span class="big_keyword_two">首页</span></a>
                </div>
                <div class="sjdb">
                    <a href="/re_seconds/sjdb_page"><span class="big_keyword_one" style="color: #F18216">事件代办</span></a>
                </div>
                <div class="swxz">
                    <a href="/re_seconds/swzl_page"><span class="big_keyword_two">失物寻找</span></a>
                </div>
                <div class="swjy">
                    <a href="/re_seconds/swjy_page"><span class="big_keyword_two">事物交易</span></a>
                </div>
            </div>
            <div class="main_img_home">
                <div class="main_img">
                    <img class="main_img" src="<%=request.getContextPath()%>${sessionScope.officialPicture.get(16).road}" />
                </div>
            </div>
            <div class="location_home">
                <div class="location_center">
                    <span class="location_center_title">热门：</span>
                    <a href="javascript:void(0);" onclick="lable_search_page_info('代取快递')"><span
                            class="location_center_keywords">代取快递</span></a>
                    <a href="javascript:void(0);" onclick="lable_search_page_info('辅助学习')"><span
                            class="location_center_keywords">辅助学习</span></a>
                    <a href="javascript:void(0);" onclick="lable_search_page_info('代跑腿')"><span
                            class="location_center_keywords">代跑腿</span></a>
                    <a href="javascript:void(0);" onclick="lable_search_page_info('其他任务类型')"><span
                            class="location_center_keywords">其他任务类型</span></a>
                </div>
            </div>
        </div>
    </nav>
    <!-- 排序方式 -->
    <div class="body_two">
        <span>排序方式：</span>
        <table>
            <ul>
                <a href="javascript:void(0);" onclick="time_sort()">
                    <li>热门排序</li>
                </a>
                <%--排序的这个方法，传入的排序关键词，应该与数据库一致--%>
                <a href="javascript:void(0);" onclick="sjdb_sort_page_info('price')">
                    <li>赏金排序</li>
                </a>
                <a href="javascript:void(0);" onclick="release_sort()">
                    <li>发布时间排序</li>
                </a>
            </ul>
        </table>
    </div>
    <!-- 排序方式end -->
    <%--<div class="empty_a">
    </div>--%>
    <div class="big_words_home">
        <div class="big_words">
            <p id="big_words_up">悬 赏 榜 — 揭 榜</p>
            <div id="big_words_down">
                <hr>
            </div>
        </div>
    </div>
    <!-- 任务细节start -->
    <div class="event_home">
        <div class="event">

            <%--            <c:forEach items="${agentEventList}" var="ael">
                        <div class="event_dedtails" style="float: left; margin-right: 40px; margin-bottom: 40px">
                            <div class="real_name">
                                <p>验</p>
                            </div>
                            <div class="insurance">
                                <p>保</p>
                            </div>
                            <div class="empty">
                            </div>
                            <div class="event_img">
                                <img src="" alt="">
                            </div>
                            <div class="money">
                                <p>¥${ael.price}</p>
                            </div>
                            <hr class="hr_up">
                            <div class="event_description">
                                <p style="overflow: hidden">${ael.event_describe}…</p>
                            </div>
                            <hr class="hr_down">
                            <div class="event_keywords">
                                <div class="event_keywords_time">
                                    &lt;%&ndash;<img src="img/time.png" width="35" height="35px">&ndash;%&gt;
                                    <span>${ael.start_time}</span>
                                </div>
                                <div class="event_keywords_project">
                                    &lt;%&ndash;<img src="img/project.png" width="24" height="24px">&ndash;%&gt;
                                    <span>${ael.event_tags}</span>
                                </div>
                            </div>
                            <div class="exhibition_details_footer">
                                <div class="user_imformation">
                                    <img src="${ael.user_er.head_portrait}" width="22px" height="22px">
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
                        </c:forEach>--%>

        </div>
    </div>
</main>

<div class="next_part">
    <div class="page_turning">
        <div id="demo1">
        </div>
    </div>
</div>
<!--分页部分end-->


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
                                <label>用户名 / 电话<a href="#" class="login-back-link">Sign in?</a></label>
                                <input type="text" id="account_number" name="username" class="lowin-input">
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
        </div>
    </div>
</div>
<!--===================登录注册部分end===================-->

<!-- 发布任务按钮、退出登录按钮start -->
<a onclick="release()" href="javascript:void(0);">
    <button class="button_releaseJobs" type="button">发布任务</button>
</a>
<a class="quit" href="/re_quit" style="display: none">
    <button class="button_logOut" type="button">退出登录</button>
</a>
<!-- 发布任务按钮、退出登录按钮end -->

<style>
    /*设置铃铛的背景图*/
    .bell_img {
        background-image: url(..<%=request.getContextPath()%>/static/reception/img/bell.jpg);
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
</style>


<script type="text/javascript" src="<%=request.getContextPath()%>/static/reception/js/jquery-3.4.0.min.js"></script>
<!--手机端自动跳转-->
<script src="<%=request.getContextPath()%>/static/reception/js/mb_seconds_sjdb.js" type="text/javascript"></script>
<!--分页的-->
<script src="<%=request.getContextPath()%>/static/reception/js/page_turning.js" type="text/javascript"></script>
<!--友好提示-->
<script src="<%=request.getContextPath()%>/static/reception/plug_in_unit/sweet-alert.js"></script>

<script type="text/javascript">

    //页面一被打开就开始执行
    $(document).ready(function () {
        //获取消息数
        //每隔三秒查看消息
        window.setInterval(getNewsNum, 1000);

        //,点击第一页
        $('.jPag-pages').find('li:first').click();

        //判断用户是否登录
        //如果用户已登录
        var username = "${sessionScope.user.user_name}";
        if (username != "") {
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
                "<img class='bell_img' width='28px' height='28px'>" +
                "<span class='news_word'>消息  " + "</span>" +
                "<span class='news_number'>" + "</span>" +
                "</div>" +
                "</a>" +
                "</div>"
            );

            //显示退出按钮
            $(".quit").show();
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

    });


    /**
     *
     *
     * 分页部分操作
     * */

    //默认下的分页
    $("#demo1").paginate({
        //总页数
        count: ${sessionScope.pageInfo.pages},
        start: 1,
        display: 7,
        border: false,
        text_color: '#79B5E3',
        background_color: 'none',
        text_hover_color: '#2573AF',
        background_hover_color: 'none',
        images: false,
        mouse: 'press',
        //click_page_number_query(currentPage)
        onChange: function a(currentPage) {//回调函数,参数为当前点击的页码
            //通过传入的页码，查询相对应的数据
            click_page_number_query(currentPage);
        }
    });


    //事件代办点击分页的页码查询相关的信息
    function click_page_number_query(currentPage) {//回调函数,参数为当前点击的页码
        /*alert(currentPage);*/
        //将页码发到后台,传回分页的列表,在渲染到对应位置
        var formData = new FormData();
        //放入此事件代办的id
        formData.append("currentPage", currentPage)
        $.ajax({
            type: "POST",
            url: "<%= basePath%>/re_seconds/sjdb",
            data: formData,
            //async: false,//要求同步 不是不需看你的需求,
            /*false;避开jQuery对formdata的默认处理*/
            processData: false,
            /*必须false才会自动加上正确的content-type*/
            contentType: false,
            success: function (data) {
                //清空，防止回显的数据叠加
                $('.event_dedtails').remove();
                var arr = data.agentEvent;
                for (var i = 0; i < data.agentEvent.length; i++) {
                    var id = arr[i].event_id;
                    var name = arr[i].user_er.user_name;
                    var describe = arr[i].event_describe;
                    var tage = arr[i].event_tags;
                    var time = arr[i].create_time;
                    var road = arr[i].road;
                    var price = arr[i].price;
                    var performance = arr[i].user_er.performance;
                    var head_portrait = arr[i].user_er.head_portrait;
                    var deposit = arr[i].deposit;
                    var authentication = arr[i].authentication;
                    $('.event').prepend(
                        "<a class='event_details' href='/re_detail/sjdb?event_id= " + id + "'>" +
                        "<div class='event_dedtails' style='float: left;' margin-right: '40px;' margin-bottom: '40px'>" +
                        "<div" + " class" + "='" + "real_name" + " yan" + i + "'" + ">" +
                        "<p>验" + "</p>" +
                        "</div>" +
                        "<div" + " class" + "='" + "insurance" + " bao" + i + "'" + ">" +
                        "<p>保" + "</p>" +
                        "</div>" +
                        "<div class='empty'>" +
                        "</div>" +
                        "<div class='event_img'>" +
                        /*"<img >" + "</>" +*/
                        "</div>" +
                        "<div class='money'>" +
                        "<p>￥" + price + "</p>" +
                        "</div>" +
                        "<hr class='hr_up'>" +
                        "<div class='event_description'>" +
                        "<p style='overflow: hidden'>" + describe + '…' +
                        "</p>" +
                        "</div>" +
                        "<hr class='hr_down'>" +
                        "<div class='event_keywords'>" +
                        /*"<div class='event_keywords_time'>" +
                        "<span>" + time + "</span>" +
                        "</div>" +*/
                        "<div class='event_keywords_project'>" +
                        "<span>" +tage+ "</span>" +
                        "</div>" +
                        "</div>" +
                        "<div class='exhibition_details_footer'>" +
                        "<div class='user_imformation'>" +
                        "<img width='24px' height='24px' src=" + head_portrait + ">" +
                        "<div class='Name_LegalTimes'>" +
                        "<span class='name'>" + name + "</span>" +
                        "<div class='legaltimes'>" +
                        "<span class='word_times'>履约次数: " + "</span>" +
                        "<span class='times'>" + performance + "</span>" +
                        "</div>" +
                        "</div>" +
                        "</div>" +
                        "</div>" +
                        "</div>" +
                        "</a>"
                    );

                    //控制  标签：  验和保的显示隐藏  陈政 2019/5/29 19:38
                    if(deposit == 0){
                        //移除标签
                        $('.bao' + i).remove();
                    };

                    if(authentication == 0){
                        //移除标签
                        $('.yan' + i).remove();
                    };

                }
                ;

            },
            error: function (data) {
                alert("erroy")
            }
        });

    };



    /**
     * 模糊搜索操作模块
     *
     *
     * */
    //点击搜索,获取分页信息
    function sjdb_search_update_page_info() {
        //放入输入的关键词
        var formData = new FormData($('#sjdb_search')[0]);
        var sjdb_keyWords = formData.get("sjdb_keyWords");
        $.ajax({
            url: "<%=basePath%>/search/sjdb_search_page_info",
            type: "post",
            data: formData,
            processData: false,
            /*必须false才会自动加上正确的content-type*/
            contentType: false,
            success: function (data) {
                //现将分页的类名改为demo3
                $(".page_turning div").attr("id", "demo3");
                var pageCount = data.info.pages;
                //alert(pageCount);
                if(pageCount == 0){
                    //提示用户，没有要搜索的
                    var title = "抱歉";
                    var text = "没有您要搜索的内容";
                    friendly_tips_timer(title, text);
                };
                //此处先将原先的分页列表删除
                //点击标签后的分页
                $("#demo3").paginate({
                    //总页数
                    count: pageCount,
                    start: 1,
                    display: 7,
                    border: false,
                    text_color: '#79B5E3',
                    background_color: 'none',
                    text_hover_color: '#2573AF',
                    background_hover_color: 'none',
                    images: false,
                    mouse: 'press',
                    //click_page_number_query(currentPage)
                    onChange: function a(currentPage) {//回调函数,参数为当前点击的页码
                        //lable_search(lable, currentPage);//此函数，传入页码，获取相关信息
                        sjdb_search_update(sjdb_keyWords, currentPage); //此函数，传入页码，获取相关信息
                    }
                });
                if (pageCount != 0) {
                    //,点击第一页
                    $('.jPag-pages').find('li:first').click();
                }
            },
            error: function (data) {
                return 0;
            }
        });
    }


    //点击分页，传入页码，以及用户搜索的关键字，返回相关的任务列表
    function sjdb_search_update(sjdb_keyWords, currentPage){

        //放入输入的关键词
        var formData = new FormData();
        formData.append("sjdb_keyWords", sjdb_keyWords);
        formData.append("currentPage", currentPage);
        $.ajax({
            type: "POST",
            url: "<%= basePath%>/search/sjdb",
            data: formData,
            //async: false,//要求同步 不是不需看你的需求,
            /*false;避开jQuery对formdata的默认处理*/
            processData: false,
            /*必须false才会自动加上正确的content-type*/
            contentType: false,
            success: function (data) {
                //先获取搜索框的值，用作后面的匹配关键词高亮
                var searchContent = $("#search_input").val();
                var arr = data.agentEvent;
                var fuzzySelectCount = data.fuzzySelectCount;
                //清空事件搜索框
                $("#search_input").val("");
                //清空事件代办信息列表，防止回显的数据叠加
                $('.event_dedtails').remove();
                //清空友好提示，防止回显的数据叠加
                //$('.empty_a .tip').remove();
                //搜索结果友好提示
                //$('.empty_a').append("<div class='tip'>" + "<p>搜索结果:" + fuzzySelectCount + "</p>" + "</div>");
                for (var i = 0; i < data.agentEvent.length; i++) {
                    var id = arr[i].event_id;
                    var name = arr[i].user_er.user_name;
                    var describe = arr[i].event_describe;
                    var tage = arr[i].event_tags;
                    var time = arr[i].create_time;
                    var road = arr[i].road;
                    var price = arr[i].price;
                    var performance = arr[i].user_er.performance;
                    var head_portrait = arr[i].user_er.head_portrait;
                    $('.event').prepend(
                        "<a class='event_dedtails' href='/re_detail/sjdb?event_id= " + id + "' >" +
                        "<div class='event_dedtails' style='float: left;' margin-right: '40px;' margin-bottom: '40px'>" +
                        "<div" + " class" + "='" + "real_name" + " yan" + i + "'" + ">" +
                        "<p>验" + "</p>" +
                        "</div>" +
                        "<div" + " class" + "='" + "insurance" + " bao" + i + "'" + ">" +
                        "<p>保" + "</p>" +
                        "</div>" +
                        "<div class='empty'>" +
                        "</div>" +
                        "<div class='event_img'>" +
                        /*"<img >" + "</>" +*/
                        "</div>" +
                        "<div class='money'>" +
                        "<p>￥" + price + "</p>" +
                        "</div>" +
                        "<hr class='hr_up'>" +
                        "<div class='event_description'>" +
                        "<p class='high_light'>" + describe + '…' +
                        "</p>" +
                        "</div>" +
                        "<hr class='hr_down'>" +
                        "<div class='event_keywords'>" +
                        /*"<div class='event_keywords_time'>" +
                        "<span>" + time + "</span>" +
                        "</div>" +*/
                        "<div class='event_keywords_project'>" +
                        "<span>" + tage + "</span>" +
                        "</div>" +
                        "</div>" +
                        "<div class='exhibition_details_footer'>" +
                        "<div class='user_imformation'>" +
                        "<img width='24px' height='24px' src=" + head_portrait + ">" +
                        "<div class='Name_LegalTimes'>" +
                        "<span class='name'>" + name + "</span>" +
                        "<div class='legaltimes'>" +
                        "<span class='word_times'>履约次数: " + "</span>" +
                        "<span class='times'>" + performance + "</span>" +
                        "</div>" +
                        "</div>" +
                        "</div>" +
                        "</div>" +
                        "</div>" +
                        "</a>"
                    );


                }
                ;

                <!--=======实现匹配关键词高亮========-->
                //1.获取要高亮显示的行
                var rowNode = $('.high_light');
                //2.获取搜索的内容，这个放在里最上面
                //var searchContent = $("#search_input").val();
                //3.遍历整行内容，添加高亮颜色
                rowNode.each(function () {
                    var word = $(this).html();
                    word = word.replace(searchContent, '<span style="color:red;">' + searchContent + '</span>');
                    $(this).html(word);
                });
                <!--实现匹配关键词高亮========-->

                //控制  标签：  验和保的显示隐藏  陈政 2019/5/29 19:38
                if(deposit == 0){
                    //移除标签
                    $('.bao' + i).remove();
                };

                if(authentication == 0){
                    //移除标签
                    $('.yan' + i).remove();
                };
                //控制  标签：  验和保的显示隐藏  陈政 2019/5/29 19:38  end


            },
            error: function (data) {
                alert("erroy")
            }
        });

    };


    /**
     *
     *动态搜索预览部分
     *
     * */
    //当用户输入时触发此函数
    $('#search_input').keyup(function () {
        var searchKeyword = $('#search_input').val();
        if (searchKeyword != "") {
            var formData = new FormData();
            //放入此事件代办的id
            formData.append("searchKeyword", searchKeyword);
            $.ajax({
                url: "<%=basePath%>/search/sjdb_search_review",
                type: "post",
                data: formData,
                dataType: "json",
                //async: false,//要求同步 不是不需看你的需求,
                /*false;避开jQuery对formdata的默认处理*/
                processData: false,
                /*必须false才会自动加上正确的content-type*/
                contentType: false,
                success: function (data) {
                    /*先清空动态预览列表，防止数据叠加*/
                    $('.search_dynamic_preview li').remove();
                    var arr = data.sjdbSearchPreview;
                    for (var i = 0; i < data.sjdbSearchPreview.length; i++) {
                        var describe = arr[i];
                        $('.search_dynamic_preview').prepend("<li>" + describe + "</li>");
                    }

                },
                error: function (data) {
                    /*alert("erroy")*/
                }

            });
        }


    });


    //用户点击搜索动态预览时，将点击的内容添加到输入框
    $("ul.search_dynamic_preview").on("click", "li", function () {
        $("#search_input").val($(this).text())
    });

    //当用户从输入框移开时,1秒触发此函数
    $("#search_input").blur(function () {
        setTimeout(function () {
            $('.search_dynamic_preview li').remove()
        }, 300);
    });


    /**
     * 点击标签功能模块
     *
     *
     * */
    //点击标签查询,获取分页信息
    function lable_search_page_info(lable) {
        var formData = new FormData();
        formData.append("lable", lable);
        $.ajax({
            url: "<%=basePath%>/search/sjdb_lable_search_page_info",
            type: "post",
            data: formData,
            processData: false,
            /*必须false才会自动加上正确的content-type*/
            contentType: false,
            success: function (data) {
                //现将分页的类名改为demo2
                $(".page_turning div").attr("id", "demo2");
                var pageCount = data.info.pages;
                //alert(pageCount);
                //此处先将原先的分页列表删除
                //点击标签后的分页
                $("#demo2").paginate({
                    //总页数
                    count: pageCount,
                    start: 1,
                    display: 7,
                    border: false,
                    text_color: '#79B5E3',
                    background_color: 'none',
                    text_hover_color: '#2573AF',
                    background_hover_color: 'none',
                    images: false,
                    mouse: 'press',
                    //click_page_number_query(currentPage)
                    onChange: function a(currentPage) {//回调函数,参数为当前点击的页码
                        lable_search(lable, currentPage);//此函数，传入页码，获取相关信息
                    }
                });
                if (pageCount != 0) {
                    //,点击第一页
                    $('.jPag-pages').find('li:first').click();
                }
            },
            error: function (data) {
                return 0;

            }
        });
    }

    //点击标签查询后,点击分页页码，获取想观的信息
    function lable_search(lable, currentPage) {
        var formData = new FormData();
        formData.append("lable", lable);
        formData.append("currentPage", currentPage);
        $.ajax({
            url: "<%=basePath%>/search/sjdb_lable_search",
            type: "post",
            data: formData,
            processData: false,
            contentType: false,
            success: function (data) {
                //清空，防止回显的数据叠加
                $('.event_dedtails').remove();
                var arr = data.agentEventLableSearchList;
                for (var i = 0; i < arr.length; i++) {
                    var id = arr[i].event_id;
                    var name = arr[i].user_er.user_name;
                    var describe = arr[i].event_describe;
                    var tage = arr[i].event_tags;
                    var time = arr[i].create_time;
                    var road = arr[i].road;
                    var price = arr[i].price;
                    var performance = arr[i].user_er.performance;
                    var head_portrait = arr[i].user_er.head_portrait;
                    $('.event').prepend(
                        "<a class='event_details' href='/re_detail/sjdb?event_id= " + id + "'>" +
                        "<div class='event_dedtails' style='float: left;' margin-right: '40px;' margin-bottom: '40px'>" +
                        "<div" + " class" + "='" + "real_name" + " yan" + i + "'" + ">" +
                        "<p>验" + "</p>" +
                        "</div>" +
                        "<div" + " class" + "='" + "insurance" + " bao" + i + "'" + ">" +
                        "<p>保" + "</p>" +
                        "</div>" +
                        "<div class='empty'>" +
                        "</div>" +
                        "<div class='event_img'>" +
                        /*"<img >" + "</>" +*/
                        "</div>" +
                        "<div class='money'>" +
                        "<p>￥" + price + "</p>" +
                        "</div>" +
                        "<hr class='hr_up'>" +
                        "<div class='event_description'>" +
                        "<p style='overflow: hidden'>" + describe + '…' +
                        "</p>" +
                        "</div>" +
                        "<hr class='hr_down'>" +
                        "<div class='event_keywords'>" +
                        /*"<div class='event_keywords_time'>" +
                        "<span>" + time + "</span>" +
                        "</div>" +*/
                        "<div class='event_keywords_project'>" +
                        "<span>" +tage+ "</span>" +
                        "</div>" +
                        "</div>" +
                        "<div class='exhibition_details_footer'>" +
                        "<div class='user_imformation'>" +
                        "<img width='24px' height='24px' src=" + head_portrait + ">" +
                        "<div class='Name_LegalTimes'>" +
                        "<span class='name'>" + name + "</span>" +
                        "<div class='legaltimes'>" +
                        "<span class='word_times'>履约次数: " + "</span>" +
                        "<span class='times'>" + performance + "</span>" +
                        "</div>" +
                        "</div>" +
                        "</div>" +
                        "</div>" +
                        "</div>" +
                        "</a>"
                    );



                    //控制  标签：  验和保的显示隐藏  陈政 2019/5/29 19:38
                    if(deposit == 0){
                        //移除标签
                        $('.bao' + i).remove();
                    };

                    if(authentication == 0){
                        //移除标签
                        $('.yan' + i).remove();
                    };
                    //控制  标签：  验和保的显示隐藏  陈政 2019/5/29 19:38  end

                }
                ;


            },
            error: function (data) {
                alert("标签分页，点击页码获取数据失败")
            }
        });
    };




    /**
     *
     * 排序模块
     *
     *
     * */
    //最热排序
    function time_sort() {
        var title = "成功";
        var text = "已将任务最热排序";
        friendly_tips_timer(title, text);
    }

    //发布时间排序 发布
    function release_sort() {
        var title = "成功";
        var text = "已将任务按发布时间排序";
        friendly_tips_timer(title, text);
    }


    //赏金排序
    function sjdb_sort_page_info(sjdb_sort) {
        //放入输入的关键词
        var formData = new FormData();
        formData.append("sjdb_sort", sjdb_sort);
        $.ajax({
            url: "<%=basePath%>/search/sjdb_sort_page_info",
            type: "post",
            data: formData,
            processData: false,
            /*必须false才会自动加上正确的content-type*/
            contentType: false,
            success: function (data) {
                //现将分页的类名改为demo4
                $(".page_turning div").attr("id", "demo4");
                var pageCount = data.info.pages;
                //alert(pageCount);
                /*if(pageCount == 0){
                    //提示用户，没有要搜索的
                    var title = "抱歉";
                    var text = "没有您要搜索的内容";
                    friendly_tips_timer(title, text);
                };*/
                //此处先将原先的分页列表删除
                //点击标签后的分页
                $("#demo4").paginate({
                    //总页数
                    count: pageCount,
                    start: 1,
                    display: 7,
                    border: false,
                    text_color: '#79B5E3',
                    background_color: 'none',
                    text_hover_color: '#2573AF',
                    background_hover_color: 'none',
                    images: false,
                    mouse: 'press',
                    //click_page_number_query(currentPage)
                    onChange: function a(currentPage) {//回调函数,参数为当前点击的页码
                        //此函数，传入页码，获取相关信息
                        sjdb_sort_task(sjdb_sort, currentPage);
                    }
                });
                if (pageCount != 0) {
                    //,点击第一页
                    alert("点击了第一页")
                    $('.jPag-pages').find('li:first').click();
                }
            },
            error: function (data) {
                return 0;
            }
        });
    };


    //点击分页，传入页码，以及用户搜索的关键字，返回相关的任务列表
    //排序任务函数
    function sjdb_sort_task(sjdb_sort, currentPage){

        //放入输入的关键词
        var formData = new FormData();
        formData.append("sjdb_sort", sjdb_sort);
        formData.append("currentPage", currentPage);
        $.ajax({
            type: "POST",
            url: "<%= basePath%>/search/sjdb_sort",
            data: formData,
            //async: false,//要求同步 不是不需看你的需求,
            /*false;避开jQuery对formdata的默认处理*/
            processData: false,
            /*必须false才会自动加上正确的content-type*/
            contentType: false,
            success: function (data) {
                var arr = data.sjdb_sort;
                //清空事件代办信息列表，防止回显的数据叠加
                $('.event_dedtails').remove();
                for (var i = 0; i < data.sjdb_sort.length; i++) {
                    var id = arr[i].event_id;
                    var name = arr[i].user_er.user_name;
                    var describe = arr[i].event_describe;
                    var tage = arr[i].event_tags;
                    var time = arr[i].create_time;
                    var road = arr[i].road;
                    var price = arr[i].price;
                    var performance = arr[i].user_er.performance;
                    var head_portrait = arr[i].user_er.head_portrait;
                    $('.event').prepend(
                        "<a  href='/re_detail/sjdb?event_id= " + id + "' >" +
                        "<div class='event_dedtails' style='float: left;' margin-right: '40px;' margin-bottom: '40px'>" +
                        "<div" + " class" + "='" + "real_name" + " yan" + i + "'" + ">" +
                        "<p>验" + "</p>" +
                        "</div>" +
                        "<div" + " class" + "='" + "insurance" + " bao" + i + "'" + ">" +
                        "<p>保" + "</p>" +
                        "</div>" +
                        "<div class='empty'>" +
                        "</div>" +
                        "<div class='event_img'>" +
                        /*"<img >" + "</>" +*/
                        "</div>" +
                        "<div class='money'>" +
                        "<p>￥" + price + "</p>" +
                        "</div>" +
                        "<hr class='hr_up'>" +
                        "<div class='event_description'>" +
                        "<p class='high_light'>" + describe + '…' +
                        "</p>" +
                        "</div>" +
                        "<hr class='hr_down'>" +
                        "<div class='event_keywords'>" +
                        /*"<div class='event_keywords_time'>" +
                        "<span>" + time + "</span>" +
                        "</div>" +*/
                        "<div class='event_keywords_project'>" +
                        "<span>" + tage + "</span>" +
                        "</div>" +
                        "</div>" +
                        "<div class='exhibition_details_footer'>" +
                        "<div class='user_imformation'>" +
                        "<img width='24px' height='24px' src=" + head_portrait + ">" +
                        "<div class='Name_LegalTimes'>" +
                        "<span class='name'>" + name + "</span>" +
                        "<div class='legaltimes'>" +
                        "<span class='word_times'>履约次数: " + "</span>" +
                        "<span class='times'>" + performance + "</span>" +
                        "</div>" +
                        "</div>" +
                        "</div>" +
                        "</div>" +
                        "</div>" +
                        "</a>"
                    );

                    //控制  标签：  验和保的显示隐藏  陈政 2019/5/29 19:38
                    if(deposit == 0){
                        //移除标签
                        $('.bao' + i).remove();
                    };

                    if(authentication == 0){
                        //移除标签
                        $('.yan' + i).remove();
                    };
                    //控制  标签：  验和保的显示隐藏  陈政 2019/5/29 19:38  end

                };
            },
            error: function (data) {
                alert("erroy")
            }
        });

    };







    //点击去到我的消息页面
    function to_news() {
        window.location.href = "<%=basePath%>/center/list"
    };


    //动态获取消息数
    function getNewsNum() {
        var user_name = $(".user_name").val();
        /*console.log("-----------------------------");*/
        if (user_name != null) {
            /*console.log("-----------------------------");*/
            $.ajax({
                url: "<%=basePath%>/re_get_news_num",
                type: "post",
                /*data: formData,*/
                processData: false,
                /*必须false才会自动加上正确的content-type*/
                contentType: false,
                success: function (data) {
                    /*console.log("-----------------------------");*/
                    $(".news_number").text(data.sum);
                    /*var title = "成功";
                    var text = "验证码已成功发送，请注意查看";
                    friendly_tips(title, text);*/
                    /*alert(data.sum);*/
                },
                error: function () {
                    /*var title = "错误";
                    var text = "请联系系统管理员";
                    friendly_tips(title, text);*/
                }
            });


        }

    };


    //发布任务功能，只有登陆时，才进行跳转
    function release() {
        //先判断用户是否已登录
        var user_name = $(".user_name").val();
        if (user_name == null) {
            var title = "抱歉";
            var text = "请先登录，登陆后可发布任务";
            friendly_tips(title, text);
        } else {
            //如果登陆，则可以进入发布页面
            window.location.href = "/release/to_add";
        }
    };


    /**
     * 登录部分与注册功能模块
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
                            "<span>你好、" + "</span>" +
                            "</div>" +
                            "</a>" +
                            "<a class='news' href='javascript:void(0);' onclick='to_news()'>" +
                            "<div class='news'>" +
                            "<img class='bell_img' width='28px' height='28px'>" +
                            "<span class='news_word'>消息  " + "</span>" +
                            "<span class='news_number'>" + "</span>" +
                            "</div>" +
                            "</a>" +
                            "</div>"
                        )

                        //显示退出按钮
                        $(".quit").show();
                    }

                    //获取消息数
                    getNewsNum();

                },
                error: function (data) {

                    alert("error")
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
                    setTimeout(function () {
                        $(".close").click()
                    }, 3000);
                    //刷新当前页面.
                    setTimeout(function () {
                        window.location.reload()
                    }, 3000);
                }

            },
            error: function () {
                var title = "错误";
                var text = "请联系系统管理员";
                friendly_tips(title, text);
            }
        });
    });


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
