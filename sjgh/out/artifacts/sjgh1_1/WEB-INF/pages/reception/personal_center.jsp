<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!--==============================用户个人中心页面=============================-->

<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
%>

<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/reception/css/personal_base.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/reception/css/personal_Personal_information.css">

    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/reception/css/personal_verification.css">

    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/reception/css/set_up_savety.css">

    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/reception/css/news.css">

    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/reception/css/electronic_bill.css">

    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/reception/css/personal_special_offer.css">

    <%--友好提示--%>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/reception/plug_in_unit/sweet-alert.css">

    <title>详情界面_赏金工会</title>
</head>

<body>
<!-- 陈嘉辉 20190423 00:58 -->
<!-- 用户信息stat -->
<header>
    <div class="center">
        <div class="name_news">
            <div class="name">
                <span>你好，</span>
                <span class="user_name" id="username_span"></span>
            </div>
            <div class="news">
                <span class=bell_img></span>
                <span class="news_word">消息</span>
                <span class="news_number"></span>
            </div>
        </div>
        <div class="PersonalCenter_order">
            <div class="personal_center">
                <a href="/center/list"><span>个人中心</span></a>
            </div>
            <img src="img/header_line.png" width="1" height="25">
            <div class="the_order">
                <a href="javascript:void(0);" onclick="five()"><span>我的订单</span></a>
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
    <!-- 最上面导航end -->
    <!-- 左边导航和右边详细 陈嘉辉 20190511 1:28 -->
    <div class="center">
        <div class="col-main">

            <!--=========个人资料部分================-->
            <div class="main-wrap" id="partOne">

                <div class="user-info">
                    <!--标题 -->
                    <div class="am-cf am-padding">
                        <div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">个人资料</strong> /
                            <small>Personal&nbsp;information</small>
                        </div>
                    </div>
                    <hr/>

                    <!--头像 -->
                    <div class="user-infoPic">

                        <div class="filePic">
                            <input name="img" id="imgUpload" type="file" class="inputPic"
                                   allowexts="gif,jpeg,jpg,png,bmp"
                                   accept="image/*" style="height: 90px; width: 90px; border-radius: 50%">
                            <img style="width: 90px; height: 90px; border-radius: 50px "
                                 class="am-circle am-img-thumbnail" id="user_img"/>
                        </div>

                        <%--<p class="am-form-help">头像</p>

                        <div class="info-m">
                        </div>--%>
                    </div>

                    <!--个人信息 -->
                    <div class="info-main">
                        <form class="am-form am-form-horizontal" id="user_info">

                            <div class="am-form-group">
                                <label for="username" class="am-form-label">用户名</label>
                                <div class="am-form-content">
                                    <input type="text" id="username" name="username">
                                    <small>用户名长度不能超过9个汉字</small>
                                </div>
                            </div>

                            <div class="am-form-group">
                                <!--
                                陈政
                                id进行了修改
                                19-5-11 21：32
                                -->
                                <label for="address" class="am-form-label">地址</label>
                                <div class="am-form-content">
                                    <input type="text" id="address" placeholder="例如西九519" name="address">
                                </div>
                            </div>

                            <div class="am-form-group">
                                <label class="am-form-label">性别</label>
                                <div class="am-form-content sex">
                                    <label class="am-radio-inline">
                                        <input type="radio" name="sex" value="男" data-am-ucheck id="sex_nan"> 男
                                    </label>
                                    <label class="am-radio-inline">
                                        <input type="radio" name="sex" value="女" data-am-ucheck id="sex_nv"> 女
                                    </label>
                                </div>
                            </div>

                            <!-- <div class="am-form-group">
                              <label for="user-birth" class="am-form-label">生日</label>
                              <div class="am-form-content birth">
                                <div class="birth-select">
                                  <select data-am-selected>
                                    <option value="a">2015</option>
                                    <option value="b">1987</option>
                                  </select>
                                  <em>年</em>
                                </div>
                                <div class="birth-select2">
                                  <select data-am-selected>
                                    <option value="a">12</option>
                                    <option value="b">8</option>
                                  </select>
                                  <em>月</em></div>
                                <div class="birth-select2">
                                  <select data-am-selected>
                                    <option value="a">21</option>
                                    <option value="b">23</option>
                                  </select>
                                  <em>日</em></div>
                              </div>

                            </div> -->
                            <div class="am-form-group">
                                <label for="phone_number" class="am-form-label">电话</label>
                                <div class="am-form-content">
                                    <input id="phone_number" type="tel" name="phone_number">
                                </div>
                            </div>
                            <div class="am-form-group">
                                <label for="email" class="am-form-label" placeholder="1398515@qq.com">电子邮件</label>
                                <div class="am-form-content">
                                    <input id="email" type="email" name="email" placeholder="例如：1398515@qq.com">

                                </div>
                            </div>

                            <div class="am-form-group safety">
                                <label for="user-safety" class="am-form-label">账号安全</label>
                                <div class="am-form-content safety">
                                    <a href="safety.html">

                                        <span class="am-icon-angle-right"></span>

                                    </a>

                                </div>
                            </div>
                            <div class="info-btn">
                                <a onclick="update_info()" href="javascript:void(0);">
                                    <div class="am-btn am-btn-danger">保存修改</div>
                                </a>
                            </div>

                        </form>
                    </div>

                </div>

            </div>
            <!--=========个人资料部分    结束================-->
            <!-----------学生认证部分--------------->
            <div class="main-wrap" id="partTwo" style="display: none">
                <div class="user-info">
                    <!--标题 -->
                    <div class="am-cf am-padding">
                        <div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">学生验证</strong> /
                            <small>Student&nbsp;verification</small>
                        </div>
                    </div>
                    <hr/>

                </div>
                <!-- 学生身份验证内容  陈嘉辉 20180512 01:18 -->
                <!-- 学生身份验证内容start -->
                <div class="verification_home  student">
                    <form id="student_certification" method="post">
                        <ul>
                            <li>
                                <div class="big_home">
                                    <span class="big_home_title">学校</span>
                                    <div class="small_home">
                                        <input name="school_name" class="small_home_input" type="text" value="天津商业大学"
                                               readonly="readonly">
                                        <small><span class="small_span">注：需要修改请联系管理员</span></small>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="big_home">
                                    <span class="big_home_title">姓名</span>
                                    <div class="small_home">
                                        <input class="user_true_name" name="name" class="small_home_input" type="text">
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="big_home">
                                    <span class="big_home_title">学号</span>
                                    <div class="small_home">
                                        <input class="student_id" name="student_id" class="small_home_input"
                                               type="number" maxlength="8">
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="big_home_big">
                                    <span class="big_home_title">一卡通验证</span>
                                    <div class="big_home_small">
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
                            <li>
                                <%--<a href="javascript:void(0);" onclick="updateCertification()">--%>
                                <button type="button" class="verification_button">提交验证</button>
                                <%--</a>--%>
                            </li>
                        </ul>
                    </form>
                </div>
                <!-- 学生身份验证内容end -->
            </div>
            <!-----------学生认证部分          end--------------->


            <!--=========安全设置部分================-->
            <div class="main-wrap" id="partThree" style="display: none">
                <div class="user-info">
                    <!--标题 -->
                    <div class="am-cf am-padding">
                        <div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">安全设置</strong> /
                            <small>Set&nbsp;up&nbsp;Safety
                            </small>
                        </div>
                    </div>
                    <hr/>

                </div>
                <!-- 安全设置内容  陈嘉辉 20180512 01:18 -->
                <!-- 安全设置内容start -->
                <div class="verification_home">
                    <form class="" action="index.html" method="post">
                        <ul>
                            <li>
                                <div class="big_home">
                                    <img class="big_home_img" src="img/test.png" width="40px" height="40px">
                                    <div class="big_home_words">
                                        <span class="big_home_title">登录密码</span>
                                        <small><span class="small_span">为更好地保障您的交易安全，建议您定期更改密码以保护账户安全。</span></small>
                                    </div>
                                    <div class="small_home">
                                        <a href="#">
                                            <button class="recompose" type="button" name="button">修改</button>
                                        </a>
                                    </div>

                                </div>
                            </li>
                            <li>
                                <div class="big_home">
                                    <img class="big_home_img" src="img/test.png" width="40px" height="40px">
                                    <div class="big_home_words">
                                        <span class="big_home_title">手机验证</span>
                                        <div>
                                            <small><span class="small_span_phone">您验证的手机:</span><span
                                                    class="small_span_phone" id="phoneTow"></span><span
                                                    class="small_span_phone">若已丢失或停用，请立即更换</span></small>
                                        </div>
                                    </div>
                                    <div class="small_home">
                                        <a href="#">
                                            <button class="recompose" type="button" name="button">换绑</button>
                                        </a>
                                    </div>

                                </div>
                            </li>
                            <li>
                                <div class="big_home">
                                    <img class="big_home_img" src="img/test.png" width="40px" height="40px">
                                    <div class="big_home_words">
                                        <span class="big_home_title">微信绑定</span>
                                        <small><span class="small_span">为更好地保障您的交易安全、方便您快速登录，建议您进行微信登录绑定</span></small>
                                    </div>
                                    <div class="small_home">
                                        <a href="#">
                                            <button class="recompose" type="button" name="button">绑定/换绑</button>
                                        </a>
                                    </div>

                                </div>
                            </li>
                        </ul>
                    </form>
                </div>
                <!-- 安全设置内容end -->
            </div>
            <!--=========安全设置部分   结束================-->

            <!--=========个人消息部分   开始-->
            <div class="main-wrap" id="partFour" style="display: none">
                <div class="user-info">
                    <!--标题 -->
                    <div class="am-cf am-padding">
                        <div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">消息</strong> /
                            <small>
                                News
                            </small>
                        </div>
                    </div>
                    <hr/>

                </div>
                <!-- 消息 陈嘉辉 20190513 19:47 -->
                <!-- 消息start -->
                <div class="news_home">

                    <%--<div class="news_description">
                        <div class="user_face_home">
                            <img class="user_face" src="img/bg2.jpg" width="50px" height="50px">
                        </div>
                        <span class="news_description_detail">
                            陈嘉辉
                            <strong class="news_strong">评论：</strong>
                            我今天不想吃西红柿炒记得拿我今天不想吃西红柿炒西红柿炒西红柿炒西红柿炒西红柿炒西红柿炒记得拿我今天不想吃西西红柿炒记得拿
                        </span>
                        <div class="user_description_img_home">
                            <img src="img/bg2.jpg" width="72px" height="66px">
                        </div>
                        <a href="#">
                            <button class="news_button" type="button">回复</button>
                        </a>
                    </div>--%>

                </div>
            </div>
            <!-- 消息end -->

            <!--=========订单管理======start-->
            <div class="main-wrap" id="partFive" style="display: none">
                <div class="user-info">
                    <!--标题 -->
                    <div class="am-cf am-padding">
                        <div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">订单管理</strong> /
                            <small>Electronic&nbsp;bill
                            </small>
                        </div>
                    </div>
                    <hr/>

                </div>
                <!-- 订单管理 陈嘉辉 20190512 14:30 -->
                <!-- 订单管理start -->
                <!-- 已发订单start -->
                <div class="lucky_money">
                    <div class="lucky_money_title_home">
                        <span class="lucky_money_title">发布的任务</span>
                        <span class="title_status">任务状态</span>
                        <span class="title_typeOf_title">任务类型</span>
                        <span class="title_keyWord_title">任务关键字</span>
                        <span class="title_money_number">金额</span>
                        <span class="title_other_description">其他说明</span>
                        <span class="title_manegement">管理</span>
                    </div>
                    <div class="lucky_money_detail_home" id="send_event">
                        <%--<div class="task_depription">
                            <span class="detail_status_green">未被接单</span>
                            <span class="detail_typeOf_title">事件代办</span>
                            <span class="detail_keyWord_title">代取快递</span>
                            <span class="detail_money_number">5</span>
                            <div class="detail_other_description">
                                <img src="img/logo.png">
                                <span class="detail_other_description_word">我爱吃西红柿炒鸡蛋
                                我爱吃西红柿炒鸡蛋我爱吃西红柿炒鸡蛋我爱吃西红柿炒鸡蛋我爱吃西红柿炒鸡蛋我爱吃西红柿炒鸡蛋我爱吃西红柿炒鸡蛋我爱吃西红柿炒鸡蛋</span>
                            </div>
                            <ul>
                                <li>
                                    <a href="#">
                                        <button class="detail_back" type="button">撤回</button>
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <button class="detail_judge" type="button">工会调解</button>
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <button class="ensure_accomplish" type="button">确认完成</button>
                                    </a>
                                </li>
                            </ul>

                        </div>--%>
                        <%--<div class="task_depription">
                            <span class="detail_status_gray">已完成</span>
                            <span class="detail_typeOf_title">事件代办</span>
                            <span class="detail_keyWord_title">代取快递</span>
                            <span class="detail_money_number">5</span>
                            <div class="detail_other_description">
                                <img src="img/logo.png">
                                <span class="detail_other_description_word">我爱吃西红柿炒鸡蛋
                    我爱吃西红柿炒鸡蛋我爱吃西红柿炒鸡蛋我爱吃西红柿炒鸡蛋我爱吃西红柿炒鸡蛋我爱吃西红柿炒鸡蛋我爱吃西红柿炒鸡蛋我爱吃西红柿炒鸡蛋</span>
                            </div>
                            <ul>
                                <li>
                                    <a href="#">
                                        <button class="detail_back" type="button">撤回</button>
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <button class="detail_judge" type="button">工会调解</button>
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <button class="ensure_accomplish" type="button">确认完成</button>
                                    </a>
                                </li>
                            </ul>


                        </div>--%>
                        <%--<div class="task_depription">
                            <span class="detail_status_orange">已接单未完成</span>
                            <span class="detail_typeOf_title">事件代办</span>
                            <span class="detail_keyWord_title">代取快递</span>
                            <span class="detail_money_number">5</span>
                            <div class="detail_other_description">
                                <img src="img/logo.png">
                                <span class="detail_other_description_word">我爱吃西红柿炒鸡蛋
                    我爱吃西红柿炒鸡蛋我爱吃西红柿炒鸡蛋我爱吃西红柿炒鸡蛋我爱吃西红柿炒鸡蛋我爱吃西红柿炒鸡蛋我爱吃西红柿炒鸡蛋我爱吃西红柿炒鸡蛋</span>
                            </div>
                            <ul>
                                <li>
                                    <a href="#">
                                        <button class="detail_back" type="button">撤回</button>
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <button class="detail_judge" type="button">工会调解</button>
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <button class="ensure_accomplish" type="button">确认完成</button>
                                    </a>
                                </li>
                            </ul>


                        </div>--%>
                    </div>
                </div>
                <!-- 已发订单end -->
                <!-- 已接订单start -->
                <div class="lucky_money">
                    <div class="lucky_money_title_home">
                        <span class="lucky_money_title">领取的任务</span>
                        <span class="title_status">任务状态</span>
                        <span class="title_typeOf_title">任务类型</span>
                        <span class="title_keyWord_title">任务关键字</span>
                        <span class="title_money_number">金额</span>
                        <span class="title_other_description">其他说明</span>
                        <span class="title_manegement">管理</span>
                    </div>
                    <div class="lucky_money_detail_home" id="receive_event">
                        <%--<div class="task_depription">
                            <span class="detail_status_gray">已完成</span>
                            <span class="detail_typeOf_title">失物寻找</span>
                            <span class="detail_keyWord_title">（丢失）一卡通</span>
                            <span class="detail_money_number">有偿</span>
                            <div class="detail_other_description">
                                <img src="img/logo.png">
                                <span class="detail_other_description_word">我爱吃西红柿炒鸡蛋
                                我爱吃西红柿炒鸡蛋我爱吃西红柿炒鸡蛋我爱吃西红柿炒鸡蛋我爱吃西红柿炒鸡蛋我爱吃西红柿炒鸡蛋我爱吃西红柿炒鸡蛋我爱吃西红柿炒鸡蛋</span>
                            </div>
                            <ul>
                                <li>
                                    <a href="#">
                                        <button class="detail_back" type="button">撤回</button>
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <button class="detail_judge" type="button">工会调解</button>
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <button class="ensure_accomplish" type="button">确认完成</button>
                                    </a>
                                </li>
                            </ul>


                        </div>--%>
                        <%--<div class="task_depription">
                            <span class="detail_status_orange">未完成</span>
                            <span class="detail_typeOf_title">失物寻找</span>
                            <span class="detail_keyWord_title">（丢失）一卡通</span>
                            <span class="detail_money_number">有偿</span>
                            <div class="detail_other_description">
                                <img src="img/logo.png">
                                <span class="detail_other_description_word">我爱吃西红柿炒鸡蛋
                       我爱吃西红柿炒鸡蛋我爱吃西红柿炒鸡蛋我爱吃西红柿炒鸡蛋我爱吃西红柿炒鸡蛋我爱吃西红柿炒鸡蛋我爱吃西红柿炒鸡蛋我爱吃西红柿炒鸡蛋</span>
                            </div>
                            <ul>
                                <li>
                                    <a href="#">
                                        <button class="detail_back" type="button">撤回</button>
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <button class="detail_judge" type="button">工会调解</button>
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <button class="ensure_accomplish" type="button">确认完成</button>
                                    </a>
                                </li>
                            </ul>


                        </div>
                    </div>--%>
                    </div>
                    <!-- 已接订单end -->
                    <!-- 订单管理end -->
                </div>
            </div>>
                <!--=============订单管理结束==============-->

                <!--==================我的钱包=========开始-->
                <div class="main-wrap" id="partSex" style="display: none">
                    <div class="user-info">
                        <!--标题 -->
                        <div class="am-cf am-padding">
                            <div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">我的钱包</strong> /
                                <small>Special&nbsp;offer
                                </small>
                            </div>
                        </div>
                        <hr/>

                    </div>
                    <!-- 我的钱包 陈嘉辉 20190512 14:30 -->
                    <!-- 我的钱包start -->
                    <!-- 红包start -->
                    <div class="lucky_money">
                        <div class="lucky_money_title_home">
                            <span class="lucky_money_title">可用红包</span>
                        </div>
                        <div class="lucky_money_detail_home">
                            <div class="lucky_money_detail">
                                <div class="lucky_money_top">
                                    <div class="lucky_money_top_white">
                                    </div>
                                </div>
                                <strong> <span class="lucky_money_number">¥8</span></strong>
                                <span class="lucky_money_precondition">【消费满 3.9元 可用】 </span>
                                <span class="lucky_money_deadline">2015-12-21--2015-12-31</span>
                                <div class="lucky_money_footer">
                                    <div class="empty">
                                    </div>
                                    <span class="lucky_money_from">券&nbsp;来&nbsp;源： 新用户立减</span>
                                    <div class="luckymoney_button_home">
                                        <a href="#">
                                            <button class="lucky_money_use" type="button">立即使用</button>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- 红包end -->
                    <!-- 其他奖励start -->
                    <div class="lucky_money">
                        <div class="lucky_money_title_home">
                            <span class="lucky_money_title">其他奖励</span>
                            <span class="luckyMoney_invite_word">我的邀请码：<span class="luckyMoney_invite_number"
                                                                             id="invitation_code"></span></span>

                        </div>
                        <div class="lucky_money_detail_home">
                            <div class="lucky_money_detail">
                                <div class="lucky_money_top">
                                    <div class="lucky_money_top_white">
                                    </div>
                                </div>
                                <strong> <span class="lucky_money_number">2G流量</span></strong>
                                <span class="lucky_money_precondition">【本校同学 可用】 </span>
                                <span class="lucky_money_deadline">2015-12-21--2015-12-31</span>
                                <div class="lucky_money_footer">
                                    <div class="empty">
                                    </div>
                                    <span class="lucky_money_from">奖&nbsp;励&nbsp;来&nbsp;源： 邀请新用户</span>
                                    <div class="other_special_detail">
                                        <span>编号:12345</span>
                                        <span>充值卡账号:ABCDabcd12345</span>
                                        <span>充值卡密码:12345678</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- 其他奖励end -->
                    <!-- 我的钱包end -->
                </div>

                <!--==================我的钱包   结束-->

                <!--底部-->
                <div class="footer">
                    <div class="footer-hd">
                        <p>
                            <a href="#">赏金工会</a>
                            <b>|</b>
                            <a href="#">永远相信美好事物正在发生&nbsp;&nbsp;忙着长大&nbsp;&nbsp;忙着可爱</a>

                        </p>
                    </div>
                    <div class="footer-bd">
                        <p>

                            广告洽谈微信&nbsp;18376727574&nbsp;
                            <a href="#"><span class="about_us">关于赏金工会</span></a>
                            <!-- <a href="#">联系我们</a> -->
                            <em>© 2019-202029 赏金工会版权所有 </em>
                        </p>
                    </div>
                </div>
            </div>

            <aside class="menu">
                <ul>
                    <li class="person active">
                        <a href="#"><i class="am-icon-user"></i>个人中心</a>
                    </li>

                    <li class="person">
                        <div class="home">
                            <a onclick="one()" href="javascript:void(0);">
                                <p class="font-orange"><i class="am-icon-newspaper-o"></i>个人资料</p>
                            </a>
                        </div>
                        <!-- <ul>
                          <li> <a href="information.html">个人信息</a></li>
                          <li> <a href="safety.html">安全设置</a></li>
                          <li> <a href="address.html">地址管理</a></li>
                          <li> <a href="cardlist.html">快捷支付</a></li>
                        </ul> -->
                    </li>
                    <li class="person">
                        <div class="home">
                            <a onclick="two()" href="javascript:void(0);">
                                <p><i class="am-icon-balance-scale"></i>学生认证</p>
                            </a>
                        </div>
                        <!-- <ul>
                          <li><a href="order.html">订单管理</a></li>
                          <li> <a href="change.html">退款售后</a></li>
                          <li> <a href="comment.html">评价商品</a></li>
                        </ul> -->
                    </li>
                    <li class="person">
                        <div class="home">
                            <a href="javascript:void(0);" onclick="three()">
                                <p><i class="am-icon-dollar"></i>安全设置</p>
                            </a>
                        </div>
                        <!-- <ul>
                          <li> <a href="points.html">我的积分</a></li>
                          <li> <a href="coupon.html">优惠券 </a></li>
                          <li> <a href="bonus.html">红包</a></li>
                          <li> <a href="walletlist.html">账户余额</a></li>
                          <li> <a href="bill.html">账单明细</a></li>
                        </ul> -->
                    </li>

                    <li class="person">
                        <div class="home">
                            <a href="javascript:void(0);" onclick="four()">
                                <p><i class="am-icon-tags"></i>我的消息</p>
                            </a>
                        </div>
                        <!-- <ul>
                          <li> <a href="collection.html">收藏</a></li>
                          <li> <a href="foot.html">足迹</a></li>
                        </ul> -->
                    </li>

                    <li class="person">
                        <div class="home">
                            <a href="javascript:void(0);" onclick="five()">
                                <p><i class="am-icon-qq"></i>订单管理</p>
                            </a>
                        </div>
                        <!-- <ul>
                          <li> <a href="consultation.html">商品咨询</a></li>
                          <li> <a href="suggest.html">意见反馈</a></li>

                          <li> <a href="news.html">我的消息</a></li>
                        </ul> -->
                    </li>
                    <li class="person">
                        <div class="home">
                            <a href="javascript:void(0);" onclick="sex()">
                                <p><i class="am-icon-qq"></i>我的钱包</p>
                            </a>
                        </div>
                        <!-- <ul>
                          <li> <a href="consultation.html">商品咨询</a></li>
                          <li> <a href="suggest.html">意见反馈</a></li>

                          <li> <a href="news.html">我的消息</a></li>
                        </ul> -->
                    </li>
                </ul>

            </aside>
        </div>
</main>
<style>
    /*设置铃铛的背景图*/
    /*    .bell_img{
            !*background-image: url(..





    %=request.getContextPath()%>





                        /static/reception/img/bell.jpg);*!
                                background-image: url(..);
                            }*/
    /*设置铃铛*/
    .bell_img {
        width: 28px;
        height: 28px;
        background: url(..<%=request.getContextPath()%>/static/reception/img/bell.jpg);
        display: block;
        float: left;
    }
</style>

<script type="text/javascript" src="<%=request.getContextPath()%>/static/reception/js/jquery-3.4.0.min.js"></script>
<!--友好提示-->
<script src="<%=request.getContextPath()%>/static/reception/plug_in_unit/sweet-alert.js"></script>
<script>

    //页面一被打开就判断用户是否登录
    $(document).ready(function () {
        //获取消息数
        //每隔一秒查看消息
        window.setInterval(getNewsNum, 1000);
    });

    /**
     * 点击左侧导航实现内容变化部分
     *
     * */
    //隐藏函数
    function hidden() {
        $(".main-wrap").hide();
    }

    //左侧第一个导航点击触发函数
    function one() {
        hidden();
        $("#partOne").show();

    }

    //左侧第二个导航点击触发函数  学生认证
    function two() {
        hidden();
        //判断用户是否已认证
        //如果已认证，则友好提示，并且显示用户的认证信息
        authentication();

    }

    //左侧第三个导航点击触发函数
    function three() {
        hidden();
        $("#partThree").show();
    }

    //左侧第四个导航点击触发函数.我的信息
    function four() {
        hidden();
        $("#partFour").show();
        //;
        news_list();
    }

    //左侧第五个导航点击触发函数
    function five() {
        hidden();
        $("#partFive").show();

        //查询用户已发订单的列表
        get_event();

        //查询用户的揭榜的订单列表
        get_receive_event();

    }

    //左侧第六个导航点击触发函数
    function sex() {
        hidden();
        $("#partSex").show();
    }

    //页面一被打开就开始执行查询用户相关信息操作
    $(document).ready(function () {
        //查询用户相关信息函数
        getUserInfo();
    });

    //查询用户相关信息函数
    function getUserInfo() {
        var formData = new FormData();
        formData.append("username", "${sessionScope.get("user").user_name}");
        $.ajax({
            type: "POST",
            url: "<%= basePath%>/center/get_info",
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

                //最顶上写入用户名
                $("#username_span").text(username);
                $("#user_img").attr("src", head_portrait);
                $("#username").attr("value", username);
                //$("#username").attr("readOnly", "readOnly");
                $("#phone_number").attr("value", phone_number);
                $("#phone_number").attr("readOnly", "readOnly");
                $("#email").attr("value", email);
                $("#invitation_code").text(invitation_code);
                $("#address").attr("value", address);
                $("#phoneTow").text(phone_number);
                if (sex == "男") {
                    $("#sex_nan").attr("checked", true);
                } else if (sex == "女") {
                    $("#sex_nv").attr("checked", true);
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


    //用户修改头像，头像预览部分
    $("#imgUpload").on('change', function () {

        if (typeof (FileReader) != "undefined") {
            var image_holder = $("#user_img");
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

    //上传的一卡通预览部分
    $("#student_card_upload").on('change', function () {

        /*alert("ok")*/
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
            /*alert("你的浏览器不支持FileReader");*/
            var title = "错误";
            var text = "您的的浏览器不支持FileReader";
            friendly_tips(title, text);
        }
    });

    //用户提交个人资料函数
    function update_info() {
        var formData = new FormData($('#user_info')[0]);
        //图片为不为空时，去到/set_info控制器
        var imgUpload = $("#imgUpload")[0].files[0];
        //先判断用户是否有填写空值
        //if ()

        if (imgUpload) {
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
    }

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
        formData.append("username", $("#username_span").text());
        /*alert($("#username_span").text())*/
        $.ajax({
            type: "POST",
            url: "<%= basePath%>/center/authentication",
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
                    $("#partTwo").show();
                    $(".user_true_name").attr("value", flag.name);
                    $(".student_id").attr("value", flag.student_id);
                    $("#card_img").attr("src", flag.road);
                    $(".verification_button").remove();
                } else {
                    $("#partTwo").show();
                }
            },
            error: function (data) {
                var title = "系统错误";
                var text = "请联系管理员";
                friendly_tips_timer(title, text);
            }
        });
    }


    //用户查看所有的消息
    function news_list() {
        var formData = new FormData();
        formData.append("user_id", ${sessionScope.user.user_id});
        $.ajax({
            type: "POST",
            url: "<%= basePath%>/center/get_news",
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
                    if(title == "接单提示"){
                            username = "接单提示";//official_news[i].receive_user_er.user_name;//
                    }else if(title == "失物寻找"){
                        username = "失物招领";
                    }else{
                        username = " "
                    }

                    var content = official_news[i].content;
                    $('.news_home').append(
                        "<div class='news_description'>" +
                        "<div class='user_face_home'>" +
                        "<img class='user_face' src='' width='50px' height='50px'>" +
                        "</div>" +
                        "<span class='news_description_detail'>" + title + ":<strong class='news_strong'>" + "  " + username + "  " + "</strong>" + content + "</span>" +
                        /*"<div class='user_description_img_home'>" +
                        "<img src='' width='72px' height='66px'>" +
                        "</div>" +*/
                        /*"<a href='/re_detail/swzl?id=" + swzl_id + "'>" +
                        "<button" + " class" + "='" + "news_button" + " official_swzl_reply_btn" + i + "'" + "type" + "='" + "button" "'" + ">回复" + "</button>"
                        "</a>" +*/
                        "</div>"
                    );

                    /*//只有有关事务招领的信息，才有回复按钮
                    if(title != "失物寻找"){
                        $('.official_swzl_btn' + i).remove();
                    }*/
                };



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
                    $('.news_home').append(
                        "<div class='news_description'>" +
                        "<div class='user_face_home'>" +
                        "<img class='user_face' src=" + img + " width='50px' height='50px'>" +
                        "</div>" +
                        "<span class='news_description_detail'>" + username + "<strong class='news_strong'>评论：" + "</strong>" + content + "</span>" +
                        "<div class='user_description_img_home'>" +
                        "<img src=" + sjdb_img + " width='72px' height='66px'>" +
                        "</div>" +
                        "<a href='/center/reply?type=sjdb&event_id=" + sjdb_id + "&comment_id=" + comment_id + "'>" +
                        "<button class='news_button' type='button'>回复" + "</button>" +
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
                    $('.news_home').append(
                        "<div class='news_description'>" +
                        "<div class='user_face_home'>" +
                        "<img class='user_face' src=" + img + " width='50px' height='50px'>" +
                        "</div>" +
                        "<span class='news_description_detail'>" + username + "<strong class='news_strong'>评论：" + "</strong>" + content + "</span>" +
                        "<div class='user_description_img_home'>" +
                        "<img src=" + swjy_img + " width='72px' height='66px'>" +
                        "</div>" +
                        "<a href='/re_detail/swjy?id=" + swjy_id + "'>" +
                        "<button class='news_button' type='button'>回复" + "</button>" +
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
                    $('.news_home').append(
                        "<div class='news_description'>" +
                        "<div class='user_face_home'>" +
                        "<img class='user_face' src=" + img + " width='50px' height='50px'>" +
                        "</div>" +
                        "<span class='news_description_detail'>" + username + "<strong class='news_strong'>评论：" + "</strong>" + content + "</span>" +
                        "<div class='user_description_img_home'>" +
                        "<img src=" + swzl_img + " width='72px' height='66px'>" +
                        "</div>" +
                        "<a href='/re_detail/swzl?id=" + swzl_id + "'>" +
                        "<button class='news_button' type='button'>回复" + "</button>" +
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
    }

    /**
     * 获取用户的发布任务
     * 自己的发布部分
     *
     * */
    function get_event() {
        var formData = new FormData();
        formData.append("state", 3);//3表示未删除的事件,此处查询所有的为删除的列表
        $.ajax({
            url: "<%=basePath%>/center/re_get_event",
            type: "post",
            data: formData,
            processData: false,
            /*必须false才会自动加上正确的content-type*/
            contentType: false,
            success: function (data) {
                /*console.log("==================================")*/
                var sjdb_event = data.sjdb_event;
                var swzl_event = data.swzl_event;
                var swjy_event = data.swjy_event;
                //事件代办部分
                for (var i = 0; i < data.sjdb_event.length; i++) {
                    var keywords = sjdb_event[i].event_tags;
                    var money = sjdb_event[i].price;
                    var road = sjdb_event[i].road;
                    var describe = sjdb_event[i].event_describe;
                    var state = sjdb_event[i].state;

                    //$("#send_event").append("<div" + " class" +  "='" + "a"+  + i +"'" + ">" + keywords + "</div>");
                    $("#send_event").append(
                        "<div class='task_depription sjdb_send'>" +
                        "<span" + " class" + "='" + "detail_status_gray" + " sjdb_a" + i + "'" + ">" + "</span>" +
                        /*"<span class='detail_status_green" + i + "'>" + "</span>" +*/
                        "<span class='detail_typeOf_title'>事件代办" + "</span>" +
                        "<span class='detail_keyWord_title'>" + keywords + "</span>" +
                        "<span class='detail_money_number'>" + money + "</span>" +
                        "<div class='detail_other_description'>" +
                        "<img src=" + road + ">" +
                        "<span class='detail_other_description_word'>" + describe + "</span>" +
                        "</div>" +
                        "<ul>" +
                        "<li>" +
                        "<a href='#'>" +
                        /*"<button" + " class" + "='" + "detail_back" + " " + "sjdb_a" + i + "'" + "type" + "='" + "button" + "'" + ">撤回" + "</button>" +*/
                        "<button" + " class" + "='" + "detail_back" + " " + "sjdb_b" + i + "'" + "type" + "='" + "button" + "'" + ">撤回" + "</button>" +
                        "</a>" +
                        "</li>" +
                        "<li>" +
                        "<a href='#'>" +
                        "<button" + " class" + "='" + "detail_judge" + " " + "sjdb_c" + i + "'" + "type" + "='" + "button" + "'" + ">工会调解" + "</button>" +
                        "</a>" +
                        "</li>" +
                        "<li>" +
                        "<a href='#'>" +
                        "<button" + " class" + "='" + "ensure_accomplish" + " " + "sjdb_d" + i + "'" + "type" + "='" + "button" + "'" + ">确认完成" + "</button>" +
                        "</a>" +
                        "</li>" +
                        "</ul>" +
                        "</div>"
                    );

                    //事件代办之，显示订单的状态，按钮显示隐藏
                    if (state == 0) {
                        //未接单，可撤回
                        $('.sjdb_a' + i).text("未接单")
                        //$('.sjdb_b' + i).remove();
                        $('.sjdb_c' + i).remove();
                        $('.sjdb_d' + i).remove();
                    } else if (state == 1) {
                        //已接单未完成，工会调解，确认完成
                        $('.sjdb_a' + i).text("已接单")
                        $('.sjdb_b' + i).remove();
                        //$('.sjdb_c' + i).remove();
                        //$('.sjdb_d' + i).remove();
                    } else if (state == 2) {
                        //已完成
                        $('.sjdb_a' + i).text("已完成")
                        $('.sjdb_b' + i).remove();
                        $('.sjdb_c' + i).remove();
                        //$('.sjdb_d' + i).remove();
                    }

                }
                ;

                //事物交易部分
                for (var i = 0; i < data.swjy_event.length; i++) {
                    var keywords = swjy_event[i].event_tags;
                    var money = swjy_event[i].price;
                    var road = swjy_event[i].road;
                    var describe = swjy_event[i].event_describe;
                    var state = swjy_event[i].state;
                    /*console.log("==================================");*/
                    $("#send_event").append(
                        "<div class='task_depription'>" +
                        "<span" + " class" + "='" + "detail_status_gray" + " swjy_a" + i + "'" + ">" + "</span>" +
                        /*"<span class='detail_status_green" + i + "'>" + "</span>" +*/
                        "<span class='detail_typeOf_title'>事物交易" + "</span>" +
                        "<span class='detail_keyWord_title'>" + keywords + "</span>" +
                        "<span class='detail_money_number'>" + money + "</span>" +
                        "<div class='detail_other_description'>" +
                        "<img src=" + road + ">" +
                        "<span class='detail_other_description_word'>" + describe + "</span>" +
                        "</div>" +
                        "<ul>" +
                        "<li>" +
                        "<a href='#'>" +
                        /*"<button" + " class" + "='" + "detail_back" + " " + "sjdb_a" + i + "'" + "type" + "='" + "button" + "'" + ">撤回" + "</button>" +*/
                        "<button" + " class" + "='" + "detail_back" + " " + "swjy_b" + i + "'" + "type" + "='" + "button" + "'" + ">撤回" + "</button>" +
                        "</a>" +
                        "</li>" +
                        "<li>" +
                        "<a href='#'>" +
                        "<button" + " class" + "='" + "detail_judge" + " " + "swjy_c" + i + "'" + "type" + "='" + "button" + "'" + ">工会调解" + "</button>" +
                        "</a>" +
                        "</li>" +
                        "<li>" +
                        "<a href='#'>" +
                        "<button" + " class" + "='" + "ensure_accomplish" + " " + "swjy_d" + i + "'" + "type" + "='" + "button" + "'" + ">确认完成" + "</button>" +
                        "</a>" +
                        "</li>" +
                        "</ul>" +
                        "</div>"
                    );

                    //事物交易之，显示订单的状态，按钮显示隐藏
                    if (state == 0) {
                        //未接单，可撤回
                        $('.swjy_a' + i).text("未接单")
                        //$('.swjy_b' + i).remove();
                        $('.swjy_c' + i).remove();
                        $('.swjy_d' + i).remove();
                    } else if (state == 1) {
                        //已接单未完成，工会调解，确认完成
                        $('.swjy_a' + i).text("已接单")
                        $('.swjy_b' + i).remove();
                        //$('.swjy_c' + i).remove();
                        //$('.swjy_d' + i).remove();
                    } else if (state == 2) {
                        //已完成
                        $('.swjy_a' + i).text("已完成")
                        $('.swjy_b' + i).remove();
                        $('.swjy_c' + i).remove();
                        //$('.swjy_d' + i).remove();
                    }

                }
                ;


                //失物招领部分
                for (var i = 0; i < data.swzl_event.length; i++) {
                    var keywords = swzl_event[i].event_tags;
                    var money = swzl_event[i].free;
                    var road = swzl_event[i].road;
                    var describe = swzl_event[i].event_describe;
                    var state = swzl_event[i].state;
                    $("#send_event").append(
                        "<div class='task_depription'>" +
                        "<span" + " class" + "='" + "detail_status_gray" + " swzl_a" + i + "'" + ">" + "</span>" +
                        /*"<span class='detail_status_green" + i + "'>" + "</span>" +*/
                        "<span class='detail_typeOf_title'>失物招领" + "</span>" +
                        "<span class='detail_keyWord_title'>" + keywords + "</span>" +
                        "<span class='detail_money_number'>" + money + "</span>" +
                        "<div class='detail_other_description'>" +
                        "<img src=" + road + ">" +
                        "<span class='detail_other_description_word'>" + describe + "</span>" +
                        "</div>" +
                        "<ul>" +
                        "<li>" +
                        "<a href='#'>" +
                        /*"<button" + " class" + "='" + "detail_back" + " " + "sjdb_a" + i + "'" + "type" + "='" + "button" + "'" + ">撤回" + "</button>" +*/
                        "<button" + " class" + "='" + "detail_back" + " " + "swzl_b" + i + "'" + "type" + "='" + "button" + "'" + ">撤回" + "</button>" +
                        "</a>" +
                        "</li>" +
                        "<li>" +
                        "<a href='#'>" +
                        "<button" + " class" + "='" + "detail_judge" + " " + "swzl_c" + i + "'" + "type" + "='" + "button" + "'" + ">工会调解" + "</button>" +
                        "</a>" +
                        "</li>" +
                        "<li>" +
                        "<a href='#'>" +
                        "<button" + " class" + "='" + "ensure_accomplish" + " " + "swzl_d" + i + "'" + "type" + "='" + "button" + "'" + ">确认完成" + "</button>" +
                        "</a>" +
                        "</li>" +
                        "</ul>" +
                        "</div>"
                    );

                    //失物招领之，显示订单的状态，按钮显示隐藏
                    if (state == 0) {
                        //未接单，可撤回
                        $('.swzl_a' + i).text("未接单")
                        //$('.swzl_b' + i).remove();
                        $('.swzl_c' + i).remove();
                        $('.swzl_d' + i).remove();
                    } else if (state == 1) {
                        //已接单未完成，工会调解，确认完成
                        $('.swzl_a' + i).text("已接单")
                        $('.swzl_b' + i).remove();
                        //$('.swzl_c' + i).remove();
                        //$('.swzl_d' + i).remove();
                    } else if (state == 2) {
                        //已完成
                        $('.swzl_a' + i).text("已完成")
                        $('.swzl_b' + i).remove();
                        $('.swzl_c' + i).remove();
                        //$('.swzl_d' + i).remove();
                    }

                }
                ;
            },
            error: function () {
                var title = "错误";
                var text = "请联系系统管理员 ";
                friendly_tips(title, text);
            }
        });

    };

    /**
     * 用户揭榜部分处理
     *
     *
     * @author 陈政
     * @DateTime 2019-5-29 20:43
     *
     * */
    function get_receive_event() {
        var formData = new FormData();
        formData.append("state", 3);//3表示未删除的事件,此处查询所有的为删除的列表
        $.ajax({
            url: "<%=basePath%>/center/re_get_receive_event",
            type: "post",
            data: formData,
            processData: false,
            /*必须false才会自动加上正确的content-type*/
            contentType: false,
            success: function (data) {
                console.log("================接单ok==================");
                var sjdb_event = data.sjdb_event;
                var swzl_event = data.swzl_event;
                var swjy_event = data.swjy_event;

                //事件代办部分
                for (var i = 0; i < data.sjdb_event.length; i++) {
                    var keywords = sjdb_event[i].event_tags;
                    var money = sjdb_event[i].price;
                    var road = sjdb_event[i].road;
                    var describe = sjdb_event[i].event_describe;
                    var state = sjdb_event[i].state;
                    console.log("================接单ok==================");
                    //$("#send_event").append("<div" + " class" +  "='" + "a"+  + i +"'" + ">" + keywords + "</div>");
                    $("#receive_event").append(
                        "<div class='task_depription sjdb_send'>" +
                        "<span" + " class" + "='" + "detail_status_gray" + " sjdb_a_re" + i + "'" + ">" + "</span>" +
                        /*"<span class='detail_status_green" + i + "'>" + "</span>" +*/
                        "<span class='detail_typeOf_title'>事件代办" + "</span>" +
                        "<span class='detail_keyWord_title'>" + keywords + "</span>" +
                        "<span class='detail_money_number'>" + money + "</span>" +
                        "<div class='detail_other_description'>" +
                        "<img src=" + road + ">" +
                        "<span class='detail_other_description_word'>" + describe + "</span>" +
                        "</div>" +
                        "<ul>" +
                        "<li>" +
                        "<a href='#'>" +
                        /*"<button" + " class" + "='" + "detail_back" + " " + "sjdb_a" + i + "'" + "type" + "='" + "button" + "'" + ">撤回" + "</button>" +*/
                        "<button" + " class" + "='" + "detail_back" + " " + "sjdb_b_re" + i + "'" + "type" + "='" + "button" + "'" + ">撤回" + "</button>" +
                        "</a>" +
                        "</li>" +
                        "<li>" +
                        "<a href='#'>" +
                        "<button" + " class" + "='" + "detail_judge" + " " + "sjdb_c_re" + i + "'" + "type" + "='" + "button" + "'" + ">工会调解" + "</button>" +
                        "</a>" +
                        "</li>" +
                        "<li>" +
                        "<a href='#'>" +
                        "<button" + " class" + "='" + "ensure_accomplish" + " " + "sjdb_d_re" + i + "'" + "type" + "='" + "button" + "'" + ">确认完成" + "</button>" +
                        "</a>" +
                        "</li>" +
                        "</ul>" +
                        "</div>"
                    );

                    //事件代办之，显示订单的状态，按钮显示隐藏
                    if (state == 0) {
                        //未接单，可撤回
                        $('.sjdb_a_re' + i).text("未接单")
                        //$('.sjdb_b_re' + i).remove();
                        $('.sjdb_c_re' + i).remove();
                        $('.sjdb_d_re' + i).remove();
                    } else if (state == 1) {
                        //已接单未完成，工会调解，确认完成
                        $('.sjdb_a_re' + i).text("已接单")
                        $('.sjdb_b_re' + i).remove();
                        //$('.sjdb_c_re' + i).remove();
                        //$('.sjdb_d_re' + i).remove();
                    } else if (state == 2) {
                        //已完成
                        $('.sjdb_a_re' + i).text("已完成")
                        $('.sjdb_b_re' + i).remove();
                        $('.sjdb_c_re' + i).remove();
                        //$('.sjdb_d_re' + i).remove();
                    };

                };

                //事物交易部分
                for (var i = 0; i < data.swjy_event.length; i++) {
                    var keywords = swjy_event[i].event_tags;
                    var money = swjy_event[i].price;
                    var road = swjy_event[i].road;
                    var describe = swjy_event[i].event_describe;
                    var state = swjy_event[i].state;
                    /*console.log(state)*/
                    $("#receive_event").append(
                        "<div class='task_depription'>" +
                        "<span" + " class" + "='" + "detail_status_gray" + " swjy_a_re" + i + "'" + ">" + "</span>" +
                        "<span class='detail_typeOf_title'>事物交易" + "</span>" +
                        "<span class='detail_keyWord_title'>" + keywords + "</span>" +
                        "<span class='detail_money_number'>" + money + "</span>" +
                        "<div class='detail_other_description'>" +
                        "<img src=" + road + ">" +
                        "<span class='detail_other_description_word'>" + describe + "</span>" +
                        "</div>" +
                        "<ul>" +
                        "<li>" +
                        "<a href='#'>" +
                        "<button" + " class" + "='" + "detail_back" + " " + "swjy_b_re" + i + "'" + "type" + "='" + "button" + "'" + ">撤回" + "</button>" +
                        "</a>" +
                        "</li>" +
                        "<li>" +
                        "<a href='#'>" +
                        "<button" + " class" + "='" + "detail_judge" + " " + "swjy_c_re" + i + "'" + "type" + "='" + "button" + "'" + ">工会调解" + "</button>" +
                        "</a>" +
                        "</li>" +
                        "<li>" +
                        "<a href='#'>" +
                        "<button" + " class" + "='" + "ensure_accomplish" + " " + "swjy_d_re" + i + "'" + "type" + "='" + "button" + "'" + ">确认完成" + "</button>" +
                        "</a>" +
                        "</li>" +
                        "</ul>" +
                        "</div>"
                    );

                    //事物交易之，显示订单的状态，按钮显示隐藏
                    if (state == 0) {
                        //未接单，可撤回
                        $('.swjy_a_re' + i).text("未接单");
                        //$('.swjy_b_re' + i).remove();
                        $('.swjy_c_re' + i).remove();
                        $('.swjy_d_re' + i).remove();
                    } else if (state == 1) {
                        //已接单未完成，工会调解，确认完成
                        $('.swjy_a_re' + i).text("已接单");
                        $('.swjy_b_re' + i).remove();
                        //$('.swjy_c_re' + i).remove();
                        //$('.swjy_d_re' + i).remove();
                    } else if (state == 2) {
                        //已完成
                        $('.swjy_a_re' + i).text("已完成");
                        $('.swjy_b_re' + i).remove();
                        $('.swjy_c_re' + i).remove();
                        //$('.swjy_d_re' + i).remove();
                    };

                };


                //失物招领部分
                for (var i = 0; i < data.swzl_event.length; i++) {
                    var keywords = swzl_event[i].event_tags;
                    var money = swzl_event[i].free;
                    var road = swzl_event[i].road;
                    var describe = swzl_event[i].event_describe;
                    var state = swzl_event[i].state;
                    $("#receive_event").append(
                        "<div class='task_depription'>" +
                        "<span" + " class" + "='" + "detail_status_gray" + " swzl_a_re" + i + "'" + ">" + "</span>" +
                        "<span class='detail_typeOf_title'>失物招领" + "</span>" +
                        "<span class='detail_keyWord_title'>" + keywords + "</span>" +
                        "<span class='detail_money_number'>" + money + "</span>" +
                        "<div class='detail_other_description'>" +
                        "<img src=" + road + ">" +
                        "<span class='detail_other_description_word'>" + describe + "</span>" +
                        "</div>" +
                        "<ul>" +
                        "<li>" +
                        "<a href='#'>" +
                        "<button" + " class" + "='" + "detail_back" + " " + "swzl_b_re" + i + "'" + "type" + "='" + "button" + "'" + ">撤回" + "</button>" +
                        "</a>" +
                        "</li>" +
                        "<li>" +
                        "<a href='#'>" +
                        "<button" + " class" + "='" + "detail_judge" + " " + "swzl_c_re" + i + "'" + "type" + "='" + "button" + "'" + ">工会调解" + "</button>" +
                        "</a>" +
                        "</li>" +
                        "<li>" +
                        "<a href='#'>" +
                        "<button" + " class" + "='" + "ensure_accomplish" + " " + "swzl_d_re" + i + "'" + "type" + "='" + "button" + "'" + ">确认完成" + "</button>" +
                        "</a>" +
                        "</li>" +
                        "</ul>" +
                        "</div>"
                    );

                    //失物招领之，显示订单的状态，按钮显示隐藏
                    if (state == 0) {
                        //未接单，可撤回
                        $('.swzl_a_re' + i).text("未接单");
                        //$('.swzl_b_re' + i).remove();
                        $('.swzl_c_re' + i).remove();
                        $('.swzl_d_re' + i).remove();
                    } else if (state == 1) {
                        /*alert("事物交易已接单")*/
                        //已接单未完成，工会调解，确认完成
                        $('.swzl_a_re' + i).text("已接单");
                        $('.swzl_b_re' + i).remove();
                        //$('.swzl_c_re' + i).remove();
                        //$('.swzl_d_re' + i).remove();
                    } else if (state == 2) {
                        //已完成
                        $('.swzl_a_re' + i).text("已完成");
                        $('.swzl_b_re' + i).remove();
                        $('.swzl_c_re' + i).remove();
                        //$('.swzl_d_re' + i).remove();
                    };

                };
            },
            error: function (data) {
                var title = "错误";
                var text = "请联系系统管理员 ";
                friendly_tips(title, text);
            }
        });
    }


    //动态获取消息数
    function getNewsNum() {
        /*var formData = new FormData();*/
        var user_name = $(".user_name").val();
        /*formData.append("username", user_name);*/

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
