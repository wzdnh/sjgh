<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!--=========================手机端之个个人资料页面============================-->

<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
%>
<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0;" name="viewport" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/reception/mb/css/mpersonal_center.css">
    <%--友好提示--%>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/reception/plug_in_unit/sweet-alert.css">
    <title>个人资料_赏金工会</title>
</head>

<body>
<!-- 头部标题 陈嘉辉 20190520 13:30 -->
<!-- 头部标题start -->
<header>
    <div class="top-title">
        <a href="/mb_center/list"><img src="<%=request.getContextPath()%>/static/reception/mb/img/back.png" width="10px" height="18px"></a>
        <span class="center">个人资料</span>
    </div>
</header>
<!-- 头部标题end -->
<!-- 用户头像 陈嘉辉 2019 0524 02:52 -->
<!-- 用户头像start -->
<div class="user_face">
    <div class="user_face_img">
        <img id="user_face_img" src="${sessionScope.user.head_portrait}" width="123px" height="123px">
    </div>
    <div class="user_face_word">
        <span onclick="changeImg()">修改头像</span>
        <input name="img" id="imgUpload" type="file" class="inputPic" style="display: none">
    </div>
</div>
<!-- 用户头像end -->
<!-- 用户信息修改详细start -->
<form id="user_info" method="post">
    <div class="input_home">
        <ul>
            <li>
                <div class="input_keyword">
                    <span>常规</span>
                </div>
            </li>
            <li>
                <div class="input_detail_home">
                    <span class="input_title">昵称/用户名</span>
                    <input class="input_detail" type="text" value="${sessionScope.user.user_name}" name="username">
                    <small>昵称长度不能超过9个汉字</small>
                </div>
            </li>
            <li>
                <div class="input_detail_home">
                    <span class="input_title">地址</span>
                    <input class="input_detail" type="text" placeholder="例如西九519" value="${sessionScope.user.address}" name="address">
                </div>
            </li>
            <li>
                <div class="input_detail_home">
                    <span class="input_title">性别</span>
                    <div class="sex">
                        <input id="man" type="radio" name="sex" value="男">
                        <label for="man">
                            <span>男</span>
                        </label>
                        <input id="woman" type="radio" name="sex" value="女">
                        <label for="woman">
                            <span>女</span>
                        </label>
                    </div>
                </div>
            </li>
            <li>
                <div class="input_detail_home">
                    <span class="input_title">电话</span>
                    <input name="phone_number" class="input_detail" type="tel" value="${sessionScope.user.phone_number}">
                </div>
            </li>
            <li>
                <div class="input_detail_home">
                    <span class="input_title">电子邮件</span>
                    <input class="input_detail" type="email" name="email" value="${sessionScope.user.email}">
                </div>
            </li>
        </ul>
    </div>
    <a href="#">
        <button class="save_button" type="button" name="button" onclick="update_info()">保存</button>
    </a>
</form>
<!-- 用户信息修改详细end -->
</body>
<script type="text/javascript" src="<%=request.getContextPath()%>/static/reception/js/jquery-3.4.0.min.js"></script>
<!--友好提示-->
<script src="<%=request.getContextPath()%>/static/reception/plug_in_unit/sweet-alert.js"></script>
<script>
    //页面一被打开
    $(document).ready(function () {
        getUserInfo();
    });

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
                var sex = arr.sex;
                if (sex == "男") {
                    $("#man").attr("checked", true);
                } else if (sex == "女") {
                    $("#woman").attr("checked", true);
                }

            },
            error: function (data) {
                /*alert("请登录")*/
                var title = "请登录";
                var text = "此部分内容需要登录后才可操作";
                friendly_tips(title, text);
            }
        });


    };


    //用户提交个人资料函数
    function update_info() {
        var formData = new FormData($('#user_info')[0]);
        //图片为不为空时，去到/set_info控制器
        var user_face_img = $("#imgUpload")[0].files[0];
        //先判断用户是否有填写空值
        //if ()

        if (user_face_img) {
            /*alert("bukogn")*/
            //图片不为空时，去到/set_info_img
            formData.append("img", $("#imgUpload")[0].files[0]);
            $.ajax({
                type: "POST",
                url: "<%= basePath%>/user/set_info_img",
                data: formData,
                //async: false,//要求同步 不是不需看你的需求,
                /*false;避开jQuery对formdata的默认处理*/
                processData: false,
                /*必须false才会自动加上正确的content-type*/
                contentType: false,
                success: function (data) {
                    /*alert("ok");*/
                    var title = "成功";
                    var text = "成功更新个人信息";
                    friendly_tips_timer(title, text);
                    //查询用户相关信息函数
                    getUserInfo();
                },
                error: function (data) {
                    var title = "错误";
                    var text = "请联系系统管理员";
                    friendly_tips(title, text);

                }
            });

        } else {

            /*alert("kong")*/
            $.ajax({
                type: "POST",
                url: "<%= basePath%>/user/set_info",
                data: formData,
                //async: false,//要求同步 不是不需看你的需求,
                /*false;避开jQuery对formdata的默认处理*/
                processData: false,
                /*必须false才会自动加上正确的content-type*/
                contentType: false,
                success: function (data) {
                    /*alert("ok");*/
                    var title = "成功";
                    var text = "成功更新个人信息";
                    friendly_tips_timer(title, text);
                    //查询用户相关信息函数
                    getUserInfo();
                },
                error: function (data) {
                    /*alert("error**************")*/
                    var title = "错误";
                    var text = "请联系系统管理员";
                    friendly_tips(title, text);

                }
            });
        }
    };


    //修改头像
    //用户修改头像，头像预览部分
    function changeImg() {
        $("#imgUpload").click();
    }

    $("#imgUpload").on('change', function () {
        if (typeof (FileReader) != "undefined") {
            var image_holder = $("#user_face_img");
            image_holder.empty();
            var reader = new FileReader();
            reader.onload = function (e) {
                image_holder.attr("src", e.target.result);
            };
            reader.readAsDataURL($(this)[0].files[0]);
        } else {
            /* alert("你的浏览器不支持FileReader");*/
            var title = "错误";
            var text = "您的的浏览器不支持FileReader";
            friendly_tips(title, text);
        }
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

</html>
