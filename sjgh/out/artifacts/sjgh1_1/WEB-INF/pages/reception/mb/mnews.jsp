<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!--=========================手机端之个人中心之我的消息页面============================-->

<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
%>

<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0;" name="viewport" />
    <%--<meta name="viewport" content="user-scalable=0">--%>
    <meta name="viewpormt" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/reception/mb/css/mnews.css">
    <%--友好提示--%>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/reception/plug_in_unit/sweet-alert.css">
    <title>我的消息_赏金工会</title>
</head>

<body>
<!-- 头部标题start -->
<header>
    <div class="empty">
    </div>
    <div class="top-title">
        <a href="/mb_center/list"><img src="<%=request.getContextPath()%>/static/reception/mb/img/back.png" width="10px"
                                       height="18px"></a>
        <span class="center">我的消息</span>
    </div>
</header>
<!-- 头部标题end -->
<!-- 消息三大类 陈嘉辉 20190527 20:28 -->
<!-- 消息三大类start -->
<div class="threeKindOf_news">
    <a href="javascript:void(0);" onclick="cutover('a')">
        <div class="personal_letter">
            <img src="<%=request.getContextPath()%>/static/reception/mb/img/news_green.png" width="30px" height="30px">
            <span>私信</span>
        </div>
    </a>
    <a href="javascript:void(0);" onclick="cutover('b')">
        <div class="official">
            <img src="<%=request.getContextPath()%>/static/reception/mb/img/official_yellow.png" width="30px"
                 height="30px">
            <span>通知</span>
        </div>
    </a>
</div>
<!-- 消息三大类end -->
<!-- 消息细节 陈嘉辉 20190527 12:50-->
<!-- 消息细节start -->
<div class="empty_gray user_news">
</div>
<%--个人消息--%>
<div class="news_detail_home user_news">
    <%--<div class="news_detail">
        <div class="user_faceImg">
            <img src="<%=request.getContextPath()%>/static/reception/mb/img/mustWrite.png" width="41px" height="41px">
        </div>
        <div class="name_words">
            <span class="user_name">陈嘉辉</span>
            <span class="comment_word">还能再少吗还能再少吗还能再少吗还能</span>
        </div>
        <a href="#">
            <div class="reply">
                <span class="reply_word">回复</span>
            </div>
        </a>
    </div>--%>

</div>
<%--通知--%>
<div class="empty_gray official_news" style="display: none">
</div>
<div class="news_detail_home official_news" style="display: none">

    <%--<div class="news_detail">
        <div class="user_faceImg">
            <img src="<%=request.getContextPath()%>/static/reception/mb/img/logo_small.png" width="41px" height="41px">
        </div>
        <div class="name_words">
            <span class="user_name">接单提示</span>
            <span class="comment_word">
          <b>轻工水上飘同学</b>领取了您的任务
          <br>请在订单中心中确认,如有疑问请联系客服
        </span>
        </div>
    </div>--%>

</div>
<!-- 消息细节end -->


</body>
<script type="text/javascript" src="<%=request.getContextPath()%>/static/reception/js/jquery-3.4.0.min.js"></script>
<!--友好提示-->
<script src="<%=request.getContextPath()%>/static/reception/plug_in_unit/sweet-alert.js"></script>
<script>
    //私信与通知页面的切换
    function cutover(flag) {
        if (flag == 'a') {
            $(".user_news").show();
            $(".official_news").hide();
        } else {
            $(".user_news").hide();
            $(".official_news").show();
            //并且获取通知列表
            get_official_news_list()
        }
    };


    //页面一被打开就开始执行
    $(document).ready(function () {
        //获取私信列表
        get_user_news_list();
    });

    //获取私信
    function get_user_news_list() {
        var formData = new FormData();
        formData.append("user_id", ${sessionScope.user.user_id});
        $.ajax({
            type: "POST",
            url: "<%= basePath%>/mb_center/get_news",
            data: formData,
            //async: false,//要求同步 不是不需看你的需求,
            /*false;避开jQuery对formdata的默认处理*/
            processData: false,
            /*必须false才会自动加上正确的content-type*/
            contentType: false,
            success: function (data) {
                //现将原先的数据清空
                $('.news_description').remove();
                var official_news = data.official_news;
                var sjdb_news = data.sjdb_news;
                var swjy_news = data.swjy_news;
                var swzl_news = data.swzl_news;

                /*官方消息*/
                for (var i = 0; i < data.official_news.length; i++) {
                    //var id = sjdb_news[i].user_id;
                    var title = official_news[i].title;
                    //此消息的处理人，如接单提示，则此处表示接单者的用户名,也就是接单者
                    var username;
                    if (title == "接单提示") {
                        username = "接单提示";//official_news[i].receive_user_er.user_name;//
                    } else if (title == "失物寻找") {
                        username = "失物招领";
                    } else {
                        username = " "
                    }
                    ;
                    var content = official_news[i].content;
                    var road = "<%=request.getContextPath()%>/static/reception/mb/img/logo_small.png";
                    $('.official_news').append(
                        "<div class='news_detail'>" +
                        "<div class='user_faceImg'>" +
                        "<img src=" + road + " width ='41px' height='41px'>" +
                        "</div>" +
                        "<div class='name_words'>" +
                        "<span class='user_name'>" + title + "</span>" +
                        "<span class='comment_word'>" + "<b>" + username + "</b>" + content +
                        "</span>" +
                        "</div>" +
                        "</div>"
                    );

                    /*//只有有关事务招领的信息，才有回复按钮
                    if(title != "失物寻找"){
                        $('.official_swzl_btn' + i).remove();
                    }*/
                }
                ;


                /*事件代办消息*/
                for (var i = 0; i < data.sjdb_news.length; i++) {
                    /*此评论的id*/
                    var comment_id = sjdb_news[i].id;
                    //这条评论评论的是哪条任务
                    var sjdb_id = sjdb_news[i].sjdb_id;
                    var username = sjdb_news[i].user_er.user_name;
                    var img = sjdb_news[i].user_er.head_portrait;
                    var content = sjdb_news[i].content;
                    var sjdb_img = sjdb_news[i].sjdb_er.road;
                    $('.user_news').append(
                        "<div class='news_detail'>" +
                        "<div class='user_faceImg'>" +
                        "<img src=" + img + " width='41px' height='41px'>" +
                        "</div>" +
                        "<div class='name_words'>" +
                        "<span class='user_name'>" + username + "</span>" +
                        "<span class='comment_word'>" + content + "</span>" +
                        "</div>" +
                        "<a href='#'>" +
                        "<div class='reply'>" +
                        "<span class='reply_word'>回复" + "</span>" +
                        "</div>" +
                        "</a>" +
                        "</div>"
                    );
                }
                ;

                /*事物交易消息*/
                for (var i = 0; i < data.swjy_news.length; i++) {
                    /*//console.log("***********789")*/
                    var id = swjy_news[i].user_id;
                    var swjy_id = swjy_news[i].swjy_id;
                    var username = swjy_news[i].user_er.user_name;
                    var img = swjy_news[i].user_er.head_portrait;
                    var content = swjy_news[i].content;
                    var swjy_img = swjy_news[i].swjy_er.road;
                    $('.user_news').append(
                        "<div class='news_detail'>" +
                        "<div class='user_faceImg'>" +
                        "<img src=" + img + " width='41px' height='41px'>" +
                        "</div>" +
                        "<div class='name_words'>" +
                        "<span class='user_name'>" + username + "</span>" +
                        "<span class='comment_word'>" + content + "</span>" +
                        "</div>" +
                        "<a href='#'>" +
                        "<div class='reply'>" +
                        "<span class='reply_word'>回复" + "</span>" +
                        "</div>" +
                        "</a>" +
                        "</div>"
                    );
                }
                ;

                /*失物招领消息*/
                for (var i = 0; i < data.swzl_news.length; i++) {
                    var id = swzl_news[i].user_id;
                    var swzl_id = swzl_news[i].swzl_id;
                    var username = swzl_news[i].user_er.user_name;
                    var img = swzl_news[i].user_er.head_portrait;
                    var content = swzl_news[i].content;
                    var swzl_img = swzl_news[i].swzl_er.road;
                    $('.user_news').append(
                        "<div class='news_detail'>" +
                        "<div class='user_faceImg'>" +
                        "<img src=" + img + " width='41px' height='41px'>" +
                        "</div>" +
                        "<div class='name_words'>" +
                        "<span class='user_name'>" + username + "</span>" +
                        "<span class='comment_word'>" + content + "</span>" +
                        "</div>" +
                        "<a href='#'>" +
                        "<div class='reply'>" +
                        "<span class='reply_word'>回复" + "</span>" +
                        "</div>" +
                        "</a>" +
                        "</div>"
                    );
                }
            },
            error: function (data) {
                var title = "错误";
                var text = "请联系系统管理员";
                friendly_tips(title, text);
            }
        });
    };

    //获取通知
    function get_official_news_list() {

    }
</script>
</html>
