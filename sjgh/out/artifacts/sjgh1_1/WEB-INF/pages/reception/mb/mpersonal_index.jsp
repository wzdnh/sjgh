<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!--=========================手机端之个人中心界面============================-->

<%
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
%>

<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="user-scalable=0">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/reception/mb/css/mpersonal_index.css">
    <%--友好提示--%>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/reception/plug_in_unit/sweet-alert.css">
    <title>个人中心_赏金工会</title>
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
<!-- 姓名头像 陈嘉辉 20190519  -->
<!-- 姓名头像、关键信息start -->
<div class="name_Userface">
    <div class="empty">
    </div>
    <div class="name_Userface_home">
        <div class="name">
            <span class="user_name"></span>
            <a onclick="to_userInfo()" href="javascript:void(0);"><span class="modification">点击修改信息</span></a>
        </div>
        <%--<div class="user_face">
        </div>--%>
        <img class="user_face" />
    </div>

    <div class="big_keyWord">
        <div class="news">
            <span class="big_keyWord_number big_keyWord_number_news">0</span>
            <span class="big_keyWord_word">消息</span>
        </div>
        <div class="progress_order">
            <span class="big_keyWord_number big_keyWord_number_order">0</span>
            <span class="big_keyWord_word">订单</span>
        </div>
        <div class="red_packet">
            <span class="big_keyWord_number big_keyWord_number_red_envelope">0</span>
            <span class="big_keyWord_word">红包</span>
        </div>
    </div>
    <div class="advertising_big">
        <!-- <img src="img/logo.png" width="23px" height="23px"> -->
        <p>任务安全有保障的大学生悬赏互助平台</p>
    </div>
    <div class="advertising_small">

    </div>
</div>
<!-- 姓名头像、关键信息end -->
<!-- 各个功能按键start -->
<!-- <div class="empty_function_buton_top">
</div> -->
<div class="function_buton_home">
    <div class="function_buton">
        <a onclick="to_userInfo()" href="javascript:void(0);">
            <div class="function_buton_detail">
                <div class="img_home">
                    <img src="<%=request.getContextPath()%>/static/reception/mb/img/test1.png" width="30px" height="35px">
                </div>
                <span class="function_buton_keyword">个人资料</span>
            </div>
        </a>
        <a href="/mb_center/go_user_wallet">
            <div class="function_buton_detail">
                <div class="img_home">
                    <img src="<%=request.getContextPath()%>/static/reception/mb/img/test1.png" width="30px" height="35px">
                </div>
                <span class="function_buton_keyword">我的钱包</span>
            </div>
        </a>
        <a href="/mb_center/go_user_orders">
            <div class="function_buton_detail">
                <div class="img_home">
                    <img src="<%=request.getContextPath()%>/static/reception/mb/img/test1.png" width="30px" height="35px">
                </div>
                <span class="function_buton_keyword">订单管理</span>
            </div>
        </a>
        <a href="/mb_center/go_user_news">
            <div class="function_buton_detail">
                <div class="img_home">
                    <img src="<%=request.getContextPath()%>/static/reception/mb/img/test1.png" width="30px" height="35px">
                </div>
                <span class="function_buton_keyword">我的消息</span>
            </div>
        </a>
        <a href="/mb_center/go_user_security_setting">
            <div class="function_buton_detail">
                <div class="img_home">
                    <img src="<%=request.getContextPath()%>/static/reception/mb/img/test1.png" width="30px" height="35px">
                </div>
                <span class="function_buton_keyword">安全设置</span>
            </div>
        </a>
        <a href="/mb_center/go_user_student_certification">
            <div class="function_buton_detail">
                <div class="img_home">
                    <img src="<%=request.getContextPath()%>/static/reception/mb/img/test1.png" width="30px" height="35px">
                </div>
                <span class="function_buton_keyword">学生认证</span>
            </div>
        </a>
    </div>
</div>
<!-- 各个功能按键end -->
<!-- 客服start -->
<a onclick="doing()" href="javascript:void(0);">
    <div class="custumer_servive_home">
        <div class="custumer_servive">
            <img class="custumer_servive_left" src="<%=request.getContextPath()%>/static/reception/mb/img/customer_survive.png" width="36px" height="37.5px">
            <p>联系客服</p>
            <img class="custumer_servive_right" src="<%=request.getContextPath()%>/static/reception/mb/img/use_it.png" width="24px" height="33px">
        </div>
    </div>
</a>
<!-- 客服end -->
<!-- 意见反馈start -->
<a onclick="doing()" href="javascript:void(0);">
    <div class="custumer_servive_home">
        <div class="custumer_servive">
            <img class="custumer_servive_left" src="<%=request.getContextPath()%>/static/reception/mb/img/feedback.png" width="32.5px" height="33.5px">
            <p>意见反馈</p>
            <img class="custumer_servive_right" src="<%=request.getContextPath()%>/static/reception/mb/img/use_it.png" width="24px" height="33px">
        </div>
    </div>
</a>
<!-- 意见反馈end -->
</body>

<script type="text/javascript" src="<%=request.getContextPath()%>/static/reception/js/jquery-3.4.0.min.js"></script>
<!--友好提示-->
<script src="<%=request.getContextPath()%>/static/reception/plug_in_unit/sweet-alert.js"></script>
<script>

    //页面一被打开就开始执行
    $(document).ready(function () {
        //获取消息数
        //每隔一秒查看消息
        window.setInterval(getNewsNum, 1000);

        //获取用户信息
        getUserInfo();

    });

    //动态获取消息数
    function getNewsNum() {
        var user_name = "${sessionScope.get("user").user_name}";
        if (user_name != null) {
            $.ajax({
                url: "<%=basePath%>/re_get_news_num",
                type: "post",
                /*data: formData,*/
                processData: false,
                /*必须false才会自动加上正确的content-type*/
                contentType: false,
                success: function (data) {
                    /*console.log("-----------------------------")*/
                    $(".big_keyWord_number_news").text(data.sum);
                },
                error: function () {
                    /*var title = "错误";
                    var text = "请联系系统管理员";
                    friendly_tips(title, text);*/
                }
            });
        }
    };

    //个人中心首页
    //查询用户相关信息函数
    function getUserInfo() {
        var formData = new FormData();
        formData.append("username", "${sessionScope.get("user").user_name}");
        $.ajax({
            type: "POST",
            url: "<%= basePath%>/mb_center/get_info",
            data: formData,
            //async: false,//要求同步 不是不需看你的需求,
            /*false;避开jQuery对formdata的默认处理*/
            processData: false,
            /*必须false才会自动加上正确的content-type*/
            contentType: false,
            success: function (data) {
                var arr = data.user;
                var head_portrait = arr.head_portrait;
                var username = arr.user_name;
                var phone_number = arr.phone_number;
                var performance = arr.performance;
                var invitation_code = arr.invitation_code;
                var wechart = arr.wechart;
                var sex = arr.sex;
                var address = arr.address;
                var email = arr.email;

                //写入用户名
                $(".user_name").text(username);
                $(".user_face").attr("src", head_portrait)
            },
            error: function (data) {
                /*alert("请登录")*/
                var title = "请登录";
                var text = "此部分内容需要登录后才可操作";
                friendly_tips(title, text);
            }
        });


    };

    function to_userInfo() {
        //去到用户信息页面
        window.location.href = '<%=basePath%>/mb_center/go_user_info';
    };


    //正在开发中...
    function doing() {
        var title = "温馨提示";
        var text = "此功能正加班开发中，您的请求已通知客服，我们将尽快与您联系";
        friendly_tips(title, text);
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
