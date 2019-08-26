<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!--========================失物招领详情以及评论页面=============================-->

<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
%>

<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/reception/css/details.css">
    <%--友好提示--%>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/reception/plug_in_unit/sweet-alert.css">
    <title>详情界面_赏金工会</title>
</head>

<body>
<!--陈政 5-4 15.23 查看大图后的显示部分-->
<div class=view_larger_image_bac onclick="view_larger_image_hidden()">
    <img src="${sessionScope.lostAndFound.road}">
</div>

<!-- 陈嘉辉 20190423 00:58 -->
<main>
    <!-- 导航start -->
    <nav>
        <div class="center">
            <div class="logo_all">
                <a href="/home/list">
                    <img src="<%=request.getContextPath()%>/static/reception/img/logo.png" width="189px" height="57px">
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
                        <img src="<%=request.getContextPath()%>/static/reception/img/search2.png" width="23px" height="23px">
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
                    <span>我的位置 ：</span>
                    <a href="/re_seconds/swzl_page">
                        <span>失物招领</span>
                    </a>
                    <span>></span>
                    <span>任务详情</span>
                </div>
            </div>
            <%--<div class="back">
                现在这是空的
            </div>--%>
        </div>
    </div>
    <!-- 目前位置提示end -->
    <!-- 任务详情确认领取任务等信息start -->
    <!-- 任务详情 陈嘉辉 20190423 16:09 -->
    <div class="main">
        <div class="center">
            <div class="task_all">
                <div class="money_event">
                    <div class="money_home">
                        <span class="money">¥</span>
                        <span class="money">${sessionScope.lostAndFound.price}</span>
                    </div>
                    <div class="event_home">
                        <img src="<%=request.getContextPath()%>/static/reception/img/project.png" width="31.5px" height="31.5px">
                        <span class="event">${sessionScope.lostAndFound.event_tags}</span>
                    </div>
                </div>
                <hr class="description_hr">
                <div class="description">
                    <p>${sessionScope.lostAndFound.event_describe}</p>
                </div>
                <div class="description_img">
                    <img id="img_id" src="${sessionScope.lostAndFound.road}" onclick="view_larger_image()">
                </div>
                <div class="exhibition_details_footer">
                    <div class="user_imformation">
                        <img src="${sessionScope.lostAndFound.user_er.head_portrait}" width="45px" height="45px">
                        <div class="Name_LegalTimes">
                            <span class="name">${sessionScope.lostAndFound.user_er.user_name}</span>
                            <div class="legaltimes">
                                <span class="word_times">履约次数：</span>
                                <span class="times">${sessionScope.lostAndFound.user_er.performance}</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="ensure_task">
                <!-- 缴纳保证金按钮start  -->
                <div class="ensurence">
                    <div class="ensurence_home">
                        <p>赔：违约必赔</p>
                    </div>
                </div>
                <!-- 缴纳保证金按钮end -->
                <img class="img_one" src="<%=request.getContextPath()%>/static/reception/img/xxb.png" width="448px" height="117px">
                <a onclick="receive()">
                    <div class="ensure_button">
                        <div class="ensure_words_home">
                            <span>拾到提醒</span>
                        </div>
                    </div>
                </a>

                <div class="ensure_out_home">
                    <img class="ensure_out" src="<%=request.getContextPath()%>/static/reception/img/ensure_out.png" width="587px" height="177px">
                </div>
                <div class="comment">

                    <!--=============陈政
                                     4-26 20：18
                                     这里是用户评论处
                    ================     -->
                    <!-- 输入评论 陈嘉辉 20190518 0930 -->
                    <!-- 输入评论start -->
                    <div class="comment_input">
                        <div class="comment_input_userFace">
                            <img src="${sessionScope.user.head_portrait}" width="40px" height="40px">
                        </div>
                        <div class="comment_input_right">
                            <form class="comment_input_despriction"  method="post">
                                <textarea class="swzl_comment" name="input_despriction" placeholder="我也说两句"></textarea>
                                <button type="button" name="button" onclick="swzl_content_update()">发送</button>
                            </form>
                        </div>
                    </div>
                    <!-- 输入评论end -->


                </div>
            </div>
        </div>
    </div>
    <!-- 任务详情确认领取任务等信息end -->
</main>
<%--<form id="comment_swzl" method="post">
    <input type="text" name="content">
    <input type="button" onclick="swzl_content_update()" value="点我评论">
</form>--%>
</body>

<script src="<%=request.getContextPath()%>/static/reception/js/jquery-3.4.0.min.js"></script>
<script src="<%=request.getContextPath()%>/static/reception/js/details.js"></script>

<!--友好提示-->
<script src="<%=request.getContextPath()%>/static/reception/plug_in_unit/sweet-alert.js"></script>
<script>

    //事件代办评论提交提交
    function swzl_content_update() {
        var formData = new FormData();
        formData.append("user_id", ${sessionScope.user.user_id});
            /*//放入此事件代办的id*/
        formData.append("swzl_id", ${sessionScope.lostAndFound.id});
        formData.append("content", $(".swzl_comment").val());
        //放入这个产品的发布的人的id
        formData.append("commented_user_id", ${sessionScope.lostAndFound.user_id});
        $.ajax({
            type: "POST",
            url: "<%= basePath%>/re_detail/swzl_comment_add",
            data: formData,
            //async: false,//要求同步 不是不需看你的需求,
            /*false;避开jQuery对formdata的默认处理*/
            processData: false,
            /*必须false才会自动加上正确的content-type*/
            contentType: false,
            success: function (data) {
                //清空原先回显的数据，防止数据叠加
                $('.comment_onefFloor').remove();
                //评论框清空
                $(".swzl_comment").val("");
                //ajax查询评论
                swzl_content_list();
            },
            error: function (data) {
                alert("评论erroy")
            }
        });
    };

    //页面一被打开就开始执行
    $(document).ready(function () {
        swzl_content_list();
    });

    function swzl_content_list(){
        var formDataTwo = new FormData();
        //放入此事件代办的id
        formDataTwo.append("swzl_id", ${sessionScope.lostAndFound.id})
        $.ajax({
            type: "POST",
            url: "<%= basePath%>/re_detail/swzl_comment_list",
            data: formDataTwo,
            //async: false,//要求同步 不是不需看你的需求,
            /*false;避开jQuery对formdata的默认处理*/
            processData: false,
            /*必须false才会自动加上正确的content-type*/
            contentType: false,
            success: function (data) {
                var arr = data.comment;
                for(var i = 0; i< data.comment.length; i++){
                    var name = arr[i].user_er.user_name;
                    var content = arr[i].content;
                    var time = arr[i].create_time;
                    var head_portrait = arr[i].user_er.head_portrait;
                    $('.comment').append(
                        "<div class='comment_onefFloor'>" +
                            "<div class = 'comment_left' >" +
                                "<div class='user_face'>"  +
                                    "<img src='"+head_portrait+"'>" +
                                "</div>" +
                            "</div>" +
                            "<div class='comment_right'>" +
                                "<p class='comment_name'>" +name+
                                "</p>" +
                                "<p class='comment_time_day'>" + time +
                                "</p>" +
                                /*"<p class='comment_time_0clock'>" + time +
                                "</p>" +*/
                                "<p class='comment_detail'>" + content +
                                "</p>" +
                                /*"<p>" + "-------------------------------------------" +*/
                                "</p>" +
                            "</div>" +
                        "</div>"
                    );


                };

            },
            error: function(data) {
                alert("erroy")
            }
        });
    };


    //查看大图
    function view_larger_image() {
        $(".view_larger_image_bac").show();
    }
    //点击任意地方取消查看大图
    function view_larger_image_hidden() {
        $(".view_larger_image_bac").hide();
    }


    //领取任务
    function receive() {
        var formDataTwo = new FormData();
        //传入他对接单者的要求
        //学生认证
        /*formDataTwo.append("authentication", {sessionScope.agentEvent.authentication});*/
        //缴纳押金
        /*formDataTwo.append("deposit", {sessionScope.agentEvent.deposit});*/
        //放入此事件代办的id
        /*console.log('{sessionScope.agentEvent.authentication}' +""+ '{sessionScope.agentEvent.deposit}');*/
        formDataTwo.append("type_id", "${sessionScope.lostAndFound.id}");
        formDataTwo.append("invoice_user_id", "${sessionScope.lostAndFound.user_id}");
        formDataTwo.append("type", "失物招领");
        formDataTwo.append("state", "${sessionScope.lostAndFound.state}");
        formDataTwo.append("tags", "${sessionScope.lostAndFound.event_tags}");
        $.ajax({
            type: "POST",
            url: "<%= basePath%>/orders/swzl_receive",
            data: formDataTwo,
            //async: false,//要求同步 不是不需看你的需求,
            /*false;避开jQuery对formdata的默认处理*/
            processData: false,
            /*必须false才会自动加上正确的content-type*/
            contentType: false,
            success: function (data) {
                /*var title = "揭榜成功";
                var text = "";
                friendly_tips_timer(title, text);*/
                //1.修改状态码

                //2.向发布的用户发出有人接单的信息
                var flag = data.flag;

                if (flag == 0){
                    var title = "揭榜失败";
                    var text = "您还没有登录";
                    friendly_tips(title, text);
                }else if(flag == 1){
                    var title = "揭榜失败";
                    var text = "抱歉，已被用户揭榜";
                    friendly_tips(title, text);
                }else if(flag == 2){
                    var title = "工会提示";
                    var text = "您的申请已发送给对方，请你耐心等待对方私信，或您可直接私信拾者";
                    friendly_tips_timer(title, text);
                }else if(flag == 3){
                    var title = "拾到提醒";
                    var text = "您的消息已发送给失者，请你耐心等候失者的私信，感谢您！";
                    friendly_tips_timer(title, text);
                }

            },
            error: function(data) {
                var title = "揭榜失败";
                var text = "您还没有登录";
                friendly_tips(title, text);
            }
        });
    };


    //
    //title： 拾到提醒
    //text: 您的消息已发送给失者，请你耐心等候失者的私信，感谢您！

    //title：工会提示
    //text：您的申请已发送给对方，请你耐心等待对方私信，或您可直接私信拾者

    //消息

    //评论也放到私信里





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
