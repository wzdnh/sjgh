<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!--============================手机端之事物交易详情首页=====================-->

<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
%>

<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/reception/mb/css/mdetail.css">
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
                    <span class="nav_keywords_orange">闲置交易</span>
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
        <div class="back">

        </div>
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
                        <span class="money">${sessionScope.transactionOfThings.price}</span>
                    </div>
                    <div class="small_event_home">
                        <span class="event_keyword">${sessionScope.transactionOfThings.event_tags}</span>
                        <img src="<%=request.getContextPath()%>/static/reception/img/project.png" width="19px" height="19px">
                    </div>
                </div>
                <hr class="description_hr">
                <div class="description">
                    <p>${sessionScope.transactionOfThings.event_describe}</p>
                </div>
                <div class="description_img">
                    <img src="${sessionScope.transactionOfThings.road}" width="180px" height="163px">
                </div>
                <div class="exhibition_details_footer">
                    <div class="user_imformation">
                        <img src="${sessionScope.transactionOfThings.user_er.head_portrait}" width="32px" height="32px">
                        <div class="Name_LegalTimes">
                            <span class="name">${sessionScope.transactionOfThings.user_er.user_name}</span>
                            <div class="legaltimes">
                                <span class="word_times">履约次数</span>
                                <span class="times">6</span>
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
            <form class="" action="index.html" method="post">
                <button class="ensure_receive" type="button" name="button">领取任务</button>
            </form>
        </div>
    </a>
    <!-- 接单按钮end -->
</main>
</body>

</html>
