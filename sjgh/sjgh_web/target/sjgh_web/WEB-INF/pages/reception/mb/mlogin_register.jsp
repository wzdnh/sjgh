<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!--============================手机端之登录注册页面=====================-->

<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Lowin</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/reception/mb/css/auth.css">
    <%--友好提示--%>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/reception/plug_in_unit/sweet-alert.css">
</head>

<body>
<a href="/mb_home/list">
    <div style="float: right; height: 16px; width: 16px; margin-top: -60px">
        <img class="close" src="<%=request.getContextPath()%>/static/reception/img/close.svg"
             style="width: 16px; height: 16px;">
    </div>
</a>
<div class="lowin">
    <div class="lowin-brand">
        <img src="<%=request.getContextPath()%>/static/reception/img/80.png" alt="logo" width="80px"
             height="80px">
    </div>
    <div class="lowin-wrapper">
        <div class="lowin-box lowin-login">
            <%--<img class="close" src="<%=request.getContextPath()%>/static/reception/img/close.svg"
                 style="width: 16px; height: 16px; margin-left: 164px; position: absolute; z-index: 9999"
                 onclick="close()">--%>
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

        <div class="lowin-box lowin-register">
            <%--<img class="close" src="<%=request.getContextPath()%>/static/reception/img/close.svg"
                 style="width: 16px; height: 16px; margin-left: 164px;  z-index: 9999; position: absolute;">--%>
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
    <footer class="lowin-footer">
        <%--赏金工会——永远相信美好事物正在发生 忙着长大 忙着可爱--%>
    </footer>
</div>

<script src="<%=request.getContextPath()%>/static/reception/js/jquery-3.4.0.min.js"></script>
<script src="<%=request.getContextPath()%>/static/reception/mb/js/auth.js"></script>
<!--友好提示-->
<script src="<%=request.getContextPath()%>/static/reception/plug_in_unit/sweet-alert.js"></script>
<script>
    Auth.init({
        login_url: '#login',
        forgot_url: '#forgot'
    });

    /**
     *
     * 登录注册ajax提交处理模块
     *
     * */
    //登录部分
    $("#login_btn").click(function () {

        var formData = new FormData($('#login_info')[0]);
        var phone_number = $("#account_number").val();
        //放入电话号码
        formData.append("phone_number", phone_number);

        $.ajax({
            url: "<%=basePath%>/mb_login_register/re_login",
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
                ;

                //登录成功时,去到个人中心页面
                if (flag != 0 && flag != null) {
                    setTimeout(function () {
                        window.location.href = '<%=basePath%>/mb_center/list'
                    }, 1500);
                }


            },
            error: function (data) {
                var title = "错误";
                var text = "请联系系统管理员";
                friendly_tips(title, text);
            }

        });

    })
    ;


    /*获取验证码*/
    function getCode() {
        var formData = new FormData($('#register_info')[0]);
        $.ajax({
            url: "<%=basePath%>/mb_login_register/re_get_code",
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
            url: "<%=basePath%>/mb_login_register/re_register",
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

                    //注册成功时，跳转到个人中心页面
                    window.location.href = '<%=basePath%>/mb_center/list'


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
