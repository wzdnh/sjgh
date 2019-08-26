<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!--============================手机端之个人中心学生认证页面=====================-->

<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
%>
<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
    <meta charset="utf-8">
    <%--陈嘉辉 2019/6/8 1:06:39--%>
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0;" name="viewport" />
    <meta name="viewpormt" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/reception/mb/css/mverification.css">
    <%--友好提示--%>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/reception/plug_in_unit/sweet-alert.css">
    <title>学生认证_赏金工会</title>
</head>

<body>
<!-- 头部标题start -->
<header>
    <div class="top-title">
        <a href="/mb_center/list"><img src="<%=request.getContextPath()%>/static/reception/mb/img/back.png" width="10px"
                         height="18px"></a>
        <span class="center">学生认证</span>
    </div>
</header>
<!-- 头部标题end -->

<!-- 学号、姓名、学生证照片等 陈嘉辉 20190525 18:38 -->
<!-- 学号、姓名、学生证照片等start -->
<!-- 用户头像start -->
<div class="user_face">
    <div class="user_face_img">
        <img src="<%=request.getContextPath()%>/static/reception/mb/img/user.png" width="123px" height="123px">
    </div>
</div>
<!-- 用户头像end -->
<form id="student_certification" class="" method="post">
    <div class="input_home">
        <ul>
            <li>
                <div class="input_keyword">
                    <span>个人验证</span>gg
                </div>
            </li>
            <li>
                <div class="input_detail_home">
                    <span class="input_title">学校</span>
                    <input class="input_detail" type="text" value="天津商业大学" readonly="readonly" name="school_name">
                    <small>注：需要修改请联系管理员</small>
                </div>
            </li>
            <li>
                <div class="input_detail_home">
                    <span class="input_title">姓名</span>
                    <input class="input_detail user_true_name" name="name" type="text" placeholder="请输入您的真实姓名">
                </div>
            </li>
            <li>
                <div class="input_detail_home">
                    <span class="input_title">学号</span>
                    <input class="input_detail student_id" type="number" placeholder="请输入您学号" name="student_id">
                </div>
            </li>
            <li>
                <div class="card_ensurence">
                    <span class="input_title">一卡通验证</span>
                    <div class="photo">
                        <!-- 照片所在位置 -->
                        <div class="filePic">
                            <input name="img" id="student_card_upload" type="file" class="inputPic"
                                   allowexts="gif,jpeg,jpg,png,bmp" accept="image/*"
                                   style="height: 90px; width: 90px;"/>
                            <img class="am-circle am-img-thumbnail" id="card_img"
                                 style="width: 90px; height: 90px;"/>
                        </div>

                    </div>
                </div>
            </li>
        </ul>
    </div>
    <a href="#">
        <button class="save_button verification_button" type="button" name="button" style="display: none">认证</button>
    </a>
</form>
<!-- 学号、姓名、学生证照片等end -->
</body>
<script type="text/javascript" src="<%=request.getContextPath()%>/static/reception/mb/js/jquery-3.4.0.min.js"></script>
<!--友好提示-->
<script src="<%=request.getContextPath()%>/static/reception/plug_in_unit/sweet-alert.js"></script>
<script>

    //页面一被打开就判断用户是否登录
    $(document).ready(function () {
        //获取消息数
        //每隔一秒查看消息
        authentication();
    });

    //用户修改头像，头像预览部分
    $("#student_card_upload").on('change', function () {

        if (typeof (FileReader) != "undefined") {
            var image_holder = $("#card_img");
            image_holder.empty();
            var reader = new FileReader();
            reader.onload = function (e) {
                image_holder.attr("src", e.target.result);
            };
            reader.readAsDataURL($(this)[0].files[0]);
            /*alert("ooooooo")*/
        } else {
            /* alert("你的浏览器不支持FileReader");*/
            var title = "错误";
            var text = "您的的浏览器不支持FileReader";
            friendly_tips(title, text);
        }
    });

    //提交学生认证
    $(".verification_button").click(function () {
        var formData = new FormData($('#student_certification')[0]);
        //图片为不为空时，去到/set_info控制器
        var img = $("#student_card_upload")[0].files[0];
        /*alert("===================")*/
        //如果为空，提示用户上传图片
        if (!img) {
            var title = "错误";
            var text = "请上传学生证正面照片";
            friendly_tips(title, text);
        } else {
            $.ajax({
                type: "POST",
                url: "<%= basePath%>/user/add_certification",
                data: formData,
                //async: false,//要求同步 不是不需看你的需求,
                /*false;避开jQuery对formdata的默认处理*/
                processData: false,
                /*必须false才会自动加上正确的content-type*/
                contentType: false,
                success: function (data) {
                    var title = "成功";
                    var text = "成功上传学生认证信息";
                    friendly_tips(title, text);
                },
                error: function (data) {
                    var title = "错误";
                    var text = "请联系系统管理员";
                    friendly_tips(title, text);
                }
            });

        }
    });


    //查看用户是否以学生认证,如果用户已登录，删除上传按钮
    function authentication() {
        var formData = new FormData();
        var username = "${sessionScope.user.user_name}";
        formData.append("username", username);
        $.ajax({
            type: "POST",
            url: "<%= basePath%>/mb_center/authentication",
            data: formData,
            //async: false,//要求同步 不是不需看你的需求,
            /*false;避开jQuery对formdata的默认处理*/
            processData: false,
            /*必须false才会自动加上正确的content-type*/
            contentType: false,
            success: function (data) {
                var flag = data.flag;
                /*alert(flag.name)*/
                if (flag != null) {
                    var title = "提示";
                    var text = "您已成功学生认证";
                    friendly_tips_timer(title, text);
                    $(".user_true_name").attr("value", flag.name);
                    $(".student_id").attr("value", flag.student_id);
                    $("#card_img").attr("src", flag.road);
                    $(".verification_button").remove();
                    $("#student_card_upload").remove();
                }
            },
            error: function (data) {
                var title = "系统错误";
                var text = "请联系管理员";
                friendly_tips_timer(title, text);
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
