<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!--============================手机端之事件代办详情页面首页=====================-->

<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
%>

<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/reception/mb/css/mdetail.css">
    <%--友好提示--%>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/reception/plug_in_unit/sweet-alert.css">
    <title>任务详情_赏金工会</title>
</head>

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
                    <span class="nav_keywords_orange">事件代办</span>
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
                    <span class="nav_keywords_gray">我的</span>
                </div>
            </a>
        </li>
    </ul>
</div>
<!-- 底部导航栏end -->
<main>
    <!-- logo宣传语 陈嘉辉 20190506 16:38 -->
    <!-- logo宣传语start -->
    <div class="empty"></div>
    <div class="logoAndPublicity">
        <span class="Publicity_left">大学生都用</span>
        <img src="<%=request.getContextPath()%>/static/reception/mb/img/logo.png" width="123.68px" height="37.49">
        <span class="Publicity_right">交易有保障</span>
    </div>
    <!-- logo宣传语end -->
    <!-- 返回和悬赏条件 陈嘉辉 20190507 17:12 -->
    <!-- 返回和悬赏条件start -->
    <div class="back_receiveRequire">
        <%--<div class="back">

        </div>--%>
        <div class="receiveRequire">
            <span class="receiveRequire_bigWord">悬赏榜 —— 接榜</span>
            <hr class="receiveRequire_line">
            <div class="verify">
                <div class="verify_word_home">
                    <span class="verify_word">已学生验证</span>
                </div>
            </div>
            <div class="compensation">
                <div class="compensation_word_home">
                    <span class="compensation_word">违约必赔</span>
                </div>
            </div>
        </div>
    </div>
    <!-- 返回和悬赏条件end -->
    <!-- 任务细节 陈嘉辉 20190406 12:53 -->
    <div class="event_home">
        <div class="event">
            <div class="task_all">
                <div class="money_event">
                    <div class="money_home">
                        <span class="money">¥</span>
                        <span class="money">${sessionScope.agentEvent.price}</span>
                    </div>
                    <div class="small_event_home">
                        <span class="event_keyword">${sessionScope.agentEvent.event_tags}</span>
                        <img src="<%=request.getContextPath()%>/static/reception/img/project.png" width="19px"
                             height="19px">
                    </div>
                </div>
                <hr class="description_hr">
                <div class="description">
                    <p>${sessionScope.agentEvent.event_describe}</p>
                </div>
                <div class="description_img">
                    <img src="${sessionScope.agentEvent.road}" width="180px" height="163px">
                </div>
                <div class="exhibition_details_footer">
                    <div class="user_imformation">
                        <img src="${sessionScope.agentEvent.user_er.head_portrait}" width="32px" height="32px">
                        <div class="Name_LegalTimes">
                            <span class="name">${sessionScope.agentEvent.user_er.user_name}</span>
                            <div class="legaltimes">
                                <span class="word_times">履约次数</span>
                                <span class="times"></span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- 任务细节end -->
    <!-- 接单按钮start -->
    <a href="#">
        <div class="button">

            <%--<a onclick="receive_pay()">--%><%--此处是用来测试微信支付的--%>
                <%--<a onclick="receive()">  此处是正式的内容--%>
                <a href="/mb_pay/wxpay.do?commodityDescription=1&price=1">
                <button class="ensure_receive" type="button" name="button">领取任务</button>
            </a>
        </div>
    </a>
    <!-- 接单按钮end -->
</main>
<!--私信，以及输入框按钮-->
<a href="javascript:void(0);" onclick="comment_show()">
    <button class="personal_letter" type="button">私信</button>
</a>
<div class="background_letter">
    <div class="personal_letter_word_home">
        <form class="" method="post">
        <textarea class="personal_letter_word_input sjdb_comment" name="content" rows="8"
                  cols="80"></textarea>
            <button type="button" name="button" onclick="sjdb_content_update()">提交</button>
        </form>
    </div>
</div>

</body>
<script src="<%=request.getContextPath()%>/static/reception/js/jquery-3.4.0.min.js"></script>
<script src="<%=request.getContextPath()%>/static/reception/js/details.js"></script>
<!--友好提示-->
<script src="<%=request.getContextPath()%>/static/reception/plug_in_unit/sweet-alert.js"></script>
<script>
    //事件代办评论提交提交
    function sjdb_content_update() {
        //先判断用户是否登录
        var userneme = "${sessionScope.user.user_name}";
        if (userneme != "") {

            var formData = new FormData();
            formData.append("user_id", ${sessionScope.user.user_id});
            formData.append("sjdb_id", ${sessionScope.agentEvent.event_id});
            //放入评论
            formData.append("content", $(".sjdb_comment").val());
            //放入这个产品的发布的人的id
            formData.append("commented_user_id", ${sessionScope.agentEvent.user_id});
            $.ajax({
                type: "POST",
                url: "<%= basePath%>/mb_detail/sjdb_comment_add",
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
                    $(".sjdb_comment").val("");
                    //清空评论输入框
                    $(".sjdb_comment").val("");
                    //评论框
                    $(".background_letter").hide();

                    var title = "成功";
                    var text = "评论成功！";
                    friendly_tips_timer(title, text);

                },
                error: function (data) {
                    alert("评论erroy")
                }
            });

        } else {
            var title = "抱歉";
            var text = "请先登录";
            friendly_tips(title, text);
        }
    };

    function comment_show() {
        $(".background_letter").show();
    }


    /*
    //页面一被打开就开始执行
    $(document).ready(function () {7
        //查询评论列表
        sjdb_content_list();
    });

    //事件代办评论列表
    function sjdb_content_list(){
        var formDataTwo = new FormData();
        //放入此事件代办的id
        formDataTwo.append("sjdb_id", {sessionScope.agentEvent.event_id})
        $.ajax({
            type: "POST",
            url: "%= basePath%>/re_detail/sjdb_comment_list",
            data: formDataTwo,
            //async: false,//要求同步 不是不需看你的需求,
            /!*false;避开jQuery对formdata的默认处理*!/
            processData: false,
            /!*必须false才会自动加上正确的content-type*!/
            contentType: false,
            success: function (data) {
                var arr = data.comment;
                for(var i = 0; i< data.comment.length; i++){
                    var name = arr[i].user_er.user_name;
                    var content = arr[i].content;
                    var time = arr[i].create_time;
                    var head_portrait = arr[i].user_er.head_portrait
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
                        /!*"<p class='comment_time_0clock'>" + time +
                        "</p>" +*!/
                        "<p class='comment_detail'>" + content +
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
    };*/

    //查看大图
    function view_larger_image() {
        $(".view_larger_image_bac").show();
    }

    //点击任意地方取消查看大图
    function view_larger_image_hidden() {
        $(".view_larger_image_bac").hide();
    }

    //领取任务之微信支付的测试
    function receive_pay() {
        var formData = new FormData();
        //formData.append("commodityDescription", 1);
        //formData.append("price", "1");
        $.ajax({
            type: "POST",
            url: "<%= basePath%>/mb_pay/wxpay.do?commodityDescription&price=1",
            data: formData,
            //async: false,//要求同步 不是不需看你的需求,
            /*false;避开jQuery对formdata的默认处理*/
            processData: false,
            /*必须false才会自动加上正确的content-type*/
            contentType: false,
            success: function (data) {
                var flag = data.respData;
                var title = "成功";
                var text = "微信支付测试成功";
                friendly_tips(title, text);
            },
            error: function (data) {
                var title = "失败";
                var text = "调用微信支付";
                friendly_tips(title, text);
            }
        });
    };


    //领取任务
    function receive() {
        alert("接单中、、、")
        var formDataTwo = new FormData();
        //传入他对接单者的要求
        //学生认证
        formDataTwo.append("authentication", ${sessionScope.agentEvent.authentication});
        //缴纳押金
        formDataTwo.append("deposit", ${sessionScope.agentEvent.deposit});
        //放入此事件代办的id
        console.log('${sessionScope.agentEvent.authentication}' + "" + '${sessionScope.agentEvent.deposit}');
        formDataTwo.append("type_id", "${sessionScope.agentEvent.event_id}");
        formDataTwo.append("invoice_user_id", "${sessionScope.agentEvent.user_id}");
        formDataTwo.append("type", "事件代办");
        //放入此订单的状态码
        formDataTwo.append("state", "${sessionScope.agentEvent.state}");
        $.ajax({
            type: "POST",
            url: "<%= basePath%>/mb_orders/sjdb_receive",
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

                if (flag == 0) {
                    var title = "揭榜失败";
                    var text = "您还没有登录";
                    friendly_tips(title, text);
                } else if (flag == 1) {
                    var title = "揭榜失败";
                    var text = "为保障任务安全，请先前往个人中心进行学生认证";
                    friendly_tips(title, text);
                } else if (flag == 2) {
                    var title = "揭榜失败";
                    var text = "按发布任务者要求，请先前往个人中心缴纳押金";
                    friendly_tips(title, text);
                } else if (flag == 3) {
                    var title = "揭榜失败";
                    var text = "抱歉，不能揭自己的榜";
                    friendly_tips(title, text);
                } else if (flag == 4) {
                    var title = "揭榜失败";
                    var text = "抱歉，已被用户揭榜";
                    friendly_tips(title, text);
                } else {
                    var title = "揭榜成功";
                    var text = "请尽快完成任务";
                    friendly_tips_timer(title, text);

                    //此处修改订单状态码
                    //向发布任务的用户发出消息
                    //上面这两个功能已移交到/orders/sjdb_receive中进行处理
                }

                /*var arr = data.comment;
                for(var i = 0; i< data.comment.length; i++){
                    var name = arr[i].username;
                    var content = arr[i].content;
                    var time = arr[i].create_time;
                    var head_portrait = arr[i].user_er.head_portrait
                    $('.comment').prepend(

                    );

                };*/

            },
            error: function (data) {
                var title = "揭榜失败";
                var text = "您还没有登录";
                friendly_tips(title, text);
            }
        });
    };


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
