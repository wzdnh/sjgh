<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!--=====================手机端事物交易二级页面=================-->

<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
%>

<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/reception/mb/garbage/mswjy.css">
    <title>赏金工会_大学生互助悬赏平台</title>
</head>

<body>
<!-- 陈嘉辉 20190504 17:53 -->
<!-- 底部导航栏start -->
<div id="nav_bottom">
    <ul class="nav">
        <li>
            <a href="#">
                <div class="home">
                    <img src="<%=request.getContextPath()%>/static/reception/mb/imgs/home_gray.png" width="20.71px"
                         height="19px">
                    <span class="nav_keywords_gray">主页</span>
                </div>
            </a>
        </li>
        <li>
            <a href="/mb_seconds/sjdb_page">
                <div class="sjdb">
                    <img src="<%=request.getContextPath()%>/static/reception/mb/imgs/sjdb_gray.png" width="21.5px"
                         height="21.5px">
                    <span class="nav_keywords_gray">事件代办</span>
                </div>
            </a>
        </li>
        <li>
            <a href="/mb_seconds/swzl_page">
                <div class="swxz">
                    <img src="<%=request.getContextPath()%>/static/reception/mb/imgs/swxz_gray.png" width="22.454px"
                         height="21.5px">
                    <span class="nav_keywords_gray">失物寻找</span>
                </div>
            </a>
        </li>
        <li>
            <a href="/mb_seconds/swjy_page">
                <div class="xzjy">
                    <img src="<%=request.getContextPath()%>/static/reception/mb/imgs/xzjy_gray.png" width="21.5px"
                         height="21.5px">
                    <span class="nav_keywords_orange">闲置交易</span>
                </div>
            </a>
        </li>
        <li>
            <a href="#">
                <div class="myself">
                    <img src="<%=request.getContextPath()%>/static/reception/mb/imgs/myself_gray.png" width="20px"
                         height="20px">
                    <span class="nav_keywords_gray">我的</span>
                </div>
            </a>
        </li>
    </ul>
</div>
<!-- 底部导航栏end -->
<main>
    <div class="empty"></div>
    <!-- 头部导航start -->
    <nav>
        <div class="nav_center">
            <div class="empty">
            </div>
            <div class="main_img_home">
                <div class="main_img">
                    <img src="">
                </div>
            </div>
            <div class="location_home">
                <div class="location_center">
                    <div class="rank">
                        <span class="rank_title">排列方式 ：</span>
                        <span class="rank_keywords">默认排序</span>
                        <span class="rank_keywords">赏金排序</span>
                        <span class="rank_keywords">时间排序</span>
                    </div>
                    <div class="hotTask">
                        <span class="hotTask_title">商品分类 ：</span>
                        <span class="hotTask_keywords">学习用品</span>
                        <span class="hotTask_keywords">生活用品</span>
                        <span class="hotTask_keywords">其他</span>
                    </div>
                </div>
            </div>
        </div>
    </nav>
    <!-- 头部导航end -->
    <div class="big_words_home">
        <div class="big_words">
            <span id="big_words_up">悬 赏 榜 — 揭 榜</span>
            <div id="big_words_down">
                <hr>
            </div>
        </div>
    </div>
    <!-- 任务细节start -->
    <!-- 任务细节 陈嘉辉 20190406 12:53 -->
    <div class="event_home" style="height: 1000px">
        <%--<div class="event">
            <div class="task_all">
                <div class="money_event">
                    <div class="money_home">
                        <span class="money">¥</span>
                        <span class="money">5</span>
                    </div>
                    <div class="small_event_home">
                        <img src="img/event.png" width="10.5px" height="10.5px">
                        <span class="event_keyword">我的裤子</span>
                    </div>
                </div>
                <hr class="description_hr">
                <div class="description">
                    <p>这是我穿过了10年的原味是哇这是我穿过了10年的原味是哇这是我穿过了10年的原味是哇这是我穿过了10年的原味是哇这是我穿过了10年的原味是哇这</p>
                </div>
                <div class="description_img">
                    <img src="img/test.png" width="82px" height="74px">
                </div>
                <div class="exhibition_details_footer">
                    <div class="user_imformation">
                        <img src="img/user.png" width="14.064px" height="14.064px">
                        <div class="Name_LegalTimes">
                            <span class="name">小吴同学</span>
                            <div class="legaltimes">
                                <span class="word_times">履约</span>
                                <span class="times">6</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>--%>
    </div>
    <!-- 任务细节end -->
</main>
<script type="text/javascript" src="<%=request.getContextPath()%>/static/reception/js/jquery-3.4.0.min.js"></script>
<script type="text/javascript">

    //下滑到底部时自动加载
    $(window).scroll(
        function () {
            var scrollTop = $(this).scrollTop();
            var scrollHeight = $(document).height();
            var windowHeight = $(this).height();
            if (scrollTop + windowHeight == scrollHeight) {
                // 此处是滚动条到底部时候触发的事件，在这里写要加载的数据，或者是拉动滚动条的操作
                alert("自动加载");
                x();

            }
        }
    );

    function x() {


        /*alert(currentPage);*/
        //将页码发到后台,传回分页的列表,在渲染到对应位置
        var formData = new FormData();
        //放入此事件代办的id
        formData.append("currentPage", 1)
        $.ajax({
            type: "POST",
            url: "<%= basePath%>/mb_seconds/swjy",
            data: formData,
            //async: false,//要求同步 不是不需看你的需求,
            /*false;避开jQuery对formdata的默认处理*/
            processData: false,
            /*必须false才会自动加上正确的content-type*/
            contentType: false,
            success: function (data) {
                var arr = data.transactionOfThings;
                var fuzzySelectCount = data.fuzzySelectCount;
                //清空，防止回显的数据叠加
                $('.event_dedtails').remove();
                for (var i = 0; i < data.transactionOfThings.length; i++) {
                    var id = arr[i].id;
                    var name = arr[i].username;
                    var describe = arr[i].event_describe;
                    var tage = arr[i].event_tags;
                    var time = arr[i].create_time;
                    var road = arr[i].road;
                    var price = arr[i].price;
                    var performance = arr[i].user_er.performance;
                    var head_portrait = arr[i].user_er.head_portrait;
                    $('.event_home').prepend(
                        "<div class='event'>" +
                        "<div class='task_all'>" +
                        "<div class='money_event'>" +
                        "<div class='money_home'>" +
                        "<span class='money'>¥" + "</span>" +
                        "<span class='money'>" +price+"</span>" +
                        "</div>" +
                        "<div class='small_event_home'>" +
                        "<img src= width='10.5px' height='10.5px'>" +
                        "<span class='event_keyword'>" +tage+ "</span>" +
                        "</div>" +
                        "</div>" +
                        "<hr class='description_hr'>" +
                        "<div class='description'>" +
                        "<p>" +describe+ "</p>" +
                        "</div>" +
                        "<div class='description_img'>" +
                        "<img src= "+road+" width='82px' height='74px'>" +
                        "</div>" +
                        "<div class='exhibition_details_footer'>" +
                        "<div class='user_imformation'>" +
                        "<img src= "+head_portrait+" width='14.064px' height='14.064px'>" +
                        "<div class='Name_LegalTimes'>" +
                        "<span class='name'>" +name+ "</span>" +
                        "<div class='legaltimes'>" +
                        "<span class='word_times'>履约" + "</span>" +
                        "<span class='times'>" +performance+ "</span>" +
                        "</div>" +
                        "</div>" +
                        "</div>" +
                        "</div>" +
                        "</div>" +
                        "</div>"
                    );


                }
                ;

            },
            error: function (data) {
                alert("erroy")
            }
        });
    };
</script>

</body>


</html>
