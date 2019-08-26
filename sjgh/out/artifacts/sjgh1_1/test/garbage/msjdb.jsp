<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!--============================手机端事件代办二级页面=====================-->

<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
%>

<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/reception/mb/garbage/msjdbc.css">
    <title>赏金工会_大学生互助悬赏平台</title>
</head>

<body>
<!-- 陈嘉辉 20190504 17:53 -->
<!-- 底部导航栏start -->
<div id="nav_bottom">
    <ul class="nav">
        <li>
            <a href="/mb_home/list">
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
                    <span class="nav_keywords_orange">事件代办</span>
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
                    <span class="nav_keywords_gray">闲置交易</span>
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
                        <span class="hotTask_title">热门任务 ：</span>
                        <span class="hotTask_keywords">辅助学习</span>
                        <span class="hotTask_keywords">代取快递</span>
                        <span class="hotTask_keywords">代跑腿</span>
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
    <div class="event_home">
        <div class="event" style="height: 1000px">

            <%--<c:forEach items="${agentEventList}" var="ael">--%>
                <%--<div class="event_dedtails" style="float: left; margin-right: 35px; margin-bottom: 19px">
                    <div class="real_name">
                        <p>验</p>
                    </div>
                    <div class="insurance">
                        <p>保</p>
                    </div>
                    <div class="empty">
                    </div>
                    <div class="event_img">
                        <img src="" alt="">
                    </div>
                    <div class="money">
                        <p>  </p>
                    </div>
                    <hr class="hr_up">
                    <div class="event_description">
                        <p style="overflow: hidden">   …</p>
                    </div>
                    <hr class="hr_down">
                    <div class="event_keywords">
                        <!-- <div class="event_keywords_time">
                                    &lt;%&ndash;<img src="img/time.png" width="12px" height="12px">&ndash;%&gt;
                                    <span>${ael.start_time}</span>
                                </div> -->
                        <div class="event_keywords_project">
                            <img src="img/project.png" width="12px" height="12px">
                            <span>  </span>
                        </div>
                    </div>
                    <div class="exhibition_details_footer">
                        <div class="user_imformation">
                            <img src="  " width="10px" height="10px">
                            <div class="Name_LegalTimes">
                                <span class="name">  </span>
                                <div class="legaltimes">
                                    <span class="word_times">履约次数：</span>
                                    <span class="times">  </span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>--%>
            <%--</c:forEach>--%>

        </div>
    </div>
    <!-- 任务细节end -->
</main>
</body>

<script type="text/javascript" src="<%=request.getContextPath()%>/static/reception/js/jquery-3.4.0.min.js"></script>
<script>
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

    //将页码发到后台,传回分页的列表,在渲染到对应位置
    function x() {


    var formData = new FormData();
    //放入此事件代办的id
    formData.append("currentPage", 1)
    $.ajax({
        type: "POST",
        url: "<%= basePath%>/mb_seconds/sjdb",
        data: formData,
        //async: false,//要求同步 不是不需看你的需求,
        /*false;避开jQuery对formdata的默认处理*/
        processData: false,
        /*必须false才会自动加上正确的content-type*/
        contentType: false,
        success: function (data) {
            //清空，防止回显的数据叠加
            $('.event_dedtails').remove();
            var arr = data.agentEvent;
            for (var i = 0; i < data.agentEvent.length; i++) {
                var id = arr[i].event_id;
                var name = arr[i].username;
                var describe = arr[i].event_describe;
                var tage = arr[i].event_tags;
                var time = arr[i].create_time;
                var road = arr[i].road;
                var price = arr[i].price;
                var performance = arr[i].user_er.performance;
                var head_portrait = arr[i].user_er.head_portrait;
                $('.event').prepend(
                    "<a class='event_details' href='/mb_detail/sjdb?event_id= "+id+"'>" +
                    "<div class='event_details' style=float: 'left'; margin-right: '35px'; margin-bottom: '19px'>" +
                        "<div class='real_name'>" +
                            "<p>验" + "</p>" +
                        "</div>" +
                        "<div class='insurance'>" +
                            "<p>保" + "</p>" +
                        "</div>" +
                        "<div class='empty'>" +
                        "</div>" +
                        "<div class='event_img'>" +
                            "<img src='' >" +
                        "</div>" +
                        "<div class='money'>" +
                            "<p>" +price+ "</p>" +
                        "</div>" +
                        "<hr class='hr_up'>" +
                        "<div class='event_description'>" +
                            "<p style=overflow: 'hidden'>"  +describe+ "…</p>" +
                        "</div>" +
                        "<hr class='hr_down'>" +
                        "<div class='event_keywords'>" +
                            "<div class='event_keywords_project'>" +
                                "<img src='' width='12px' height='12px'>" +
                                "<span>" +tage+ "</span>" +
                            "</div>" +
                        "</div>" +
                        "<div class='exhibition_details_footer'>" +
                            "<div class='user_imformation'>" +
                                "<img src='' width='10px' height='10px'>" +
                                "<div class='Name_LegalTimes'>" +
                                    "<span class='name'>" +name+ "</span>" +
                                    "<div class='legaltimes'>" +
                                        "<span class='word_times'>履约次数：" + "</span>" +
                                        "<span class='times'>" +performance+ "</span>" +
                                    "</div>" +
                                "</div>" +
                            "</div>" +
                        "</div>" +
                    "</div>" +
                    "</a>"
                );

            };

        },
        error: function (data) {
            alert("erroy")
        }
    });
    }


</script>

</html>
