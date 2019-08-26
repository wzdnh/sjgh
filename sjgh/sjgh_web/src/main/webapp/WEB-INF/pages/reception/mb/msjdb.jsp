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
    <meta name="viewport" content="user-scalable=0">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/reception/mb/css/msjdb.css">
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
            <span id="big_words_up">悬赏榜 — 揭榜</span>
            <div id="big_words_down">
                <hr>
            </div>
        </div>
    </div>
    <!-- 任务细节start -->
    <!-- 任务细节 陈嘉辉 20190406 12:53 -->
    <div class="event_home">
        <div class="event">
            <%--<c:forEach items="${agentEventList}" var="ael">
                <div class="event_dedtails">
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
                        <p>¥&nbsp;300</p>
                    </div>
                    <hr class="hr_up">
                    <div class="event_description">
                        <p>
                            我爱吃西红柿我爱吃西红柿我爱吃西红柿我爱吃西红柿我爱吃西红柿我爱吃西红柿我爱吃西红柿我爱吃西红柿我爱吃西红柿我爱吃西红柿我爱吃西红柿我爱吃西红柿我爱吃西红柿我爱吃西红柿我爱吃西红柿…</p>
                    </div>
                    <hr class="hr_down">
                    <div class="event_keywords">
                        <!-- <div class="event_keywords_time">
                                    &lt;%&ndash;<img src="img/time.png" width="12px" height="12px">&ndash;%&gt;
                                    <span>${ael.start_time}</span>
                                </div> -->
                        <div class="event_keywords_project">
                            <img src="img/project.png" width="12px" height="12px">
                            <span>代取快递</span>
                        </div>
                    </div>
                    <div class="exhibition_details_footer">
                        <div class="user_imformation">
                            <div class="user_imformation_img">
                                <img src="${ael.user_er.head_portrait}" width="15px" height="15px">
                            </div>
                            <div class="Name_LegalTimes">
                                <div class="name_home">
                                    <span class="name">小刘先生</span>
                                </div>
                                <div class="legaltimes">
                                    <span class="word_times">履约</span>
                                    <span class="times">20</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>--%>
            <!-- 查看更多start -->
            <div class="The_more">
                <a class="sjdb_pagination" href="javascript:void(0);" onclick="pagination()"><p class="The_more_word">点击查看更多</p></a>
            </div>
            <!-- 查看更多end -->
        </div>
    </div>
    <!-- 任务细节end -->
</main>

<!-- 发布按钮start -->
<a href="/mb_release/to_add"><button class="put_dusk" type="button">发布任务</button></a>
<!-- 发布按钮end -->

<!-- 底部空白start  防止底部导航上滑下滑时移动-->
<div style="width: 100%;height: 48.5px;"></div>
<!-- 底部空白end  -->
</body>


<script type="text/javascript" src="<%=request.getContextPath()%>/static/reception/mb/js/jquery-3.4.0.min.js"></script>
<script>

    /**
     *
     *
     * 分页部分操作
     * */
    //页面一被打开就开始执行
    $(document).ready(function () {
      $(".sjdb_pagination").click();
    });

    var i = 0;

    function pagination() {
        i++;
        var currentPage = i;
        click_page_number_query(currentPage);
    };


    //事件代办点击分页的页码查询相关的信息
    function click_page_number_query(currentPage) {//回调函数,参数为当前点击的页码
        /*alert(currentPage);*/
        //将页码发到后台,传回分页的列表,在渲染到对应位置
        var formData = new FormData();
        //放入此事件代办的id
        formData.append("currentPage", currentPage)
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
                /*$('.event_dedtails').remove();*/
                var arr = data.agentEvent;
                for (var i = 0; i < data.agentEvent.length; i++) {
                    var id = arr[i].event_id;
                    var name = arr[i].user_er.user_name;
                    var describe = arr[i].event_describe;
                    var tage = arr[i].event_tags;
                    var time = arr[i].create_time;
                    var road = arr[i].road;
                    var price = arr[i].price;
                    var performance = arr[i].user_er.performance;
                    var head_portrait = arr[i].user_er.head_portrait;
                    var deposit = arr[i].deposit;
                    var authentication = arr[i].authentication;
                    $('.event').prepend(
                        "<a href='/mb_detail/sjdb?event_id= " + id + "'>" +
                        "<div class='event_dedtails'>" +
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
                        "<p>" + price + "</p>" +
                        "</div>" +
                        "<hr class='hr_up'>" +
                        "<div class='event_description'>" +
                        "<p style=overflow: 'hidden'>" + describe + "…</p>" +
                        "</div>" +
                        "<hr class='hr_down'>" +
                        "<div class='event_keywords'>" +
                        "<div class='event_keywords_project'>" +
                        "<img src='' width='12px' height='12px'>" +
                        "<span>" + tage + "</span>" +
                        "</div>" +
                        "</div>" +
                        "<div class='exhibition_details_footer'>" +
                        "<div class='user_imformation'>" +
                        "<img src='' width='10px' height='10px'>" +
                        "<div class='Name_LegalTimes'>" +
                        "<span class='name'>" + name + "</span>" +
                        "<div class='legaltimes'>" +
                        "<span class='word_times'>履约次数：" + "</span>" +
                        "<span class='times'>" + performance + "</span>" +
                        "</div>" +
                        "</div>" +
                        "</div>" +
                        "</div>" +
                        "</div>" +
                        "</a>"
                    );

                    //控制  标签：  验和保的显示隐藏  陈政 2019/5/29 19:38
                    if (deposit == 0) {
                        //移除标签
                        $('.bao' + i).remove();
                    }
                    ;

                    if (authentication == 0) {
                        //移除标签
                        $('.yan' + i).remove();
                    }
                    ;

                }
                ;

            },
            error: function (data) {
                alert("erroy")
            }
        });

    };

    /*//将页码发到后台,传回分页的列表,在渲染到对应位置
    function x() {

        var formData = new FormData();
        //放入此事件代办的id
        formData.append("currentPage", 1)
        $.ajax({
            type: "POST",
            url: "%= basePath%>/mb_seconds/sjdb",
            data: formData,
            //async: false,//要求同步 不是不需看你的需求,
            /!*false;避开jQuery对formdata的默认处理*!/
            processData: false,
            /!*必须false才会自动加上正确的content-type*!/
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
                        "<a href='/mb_detail/sjdb?event_id= " + id + "'>" +
                        "<div class='event_dedtails'>" +
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
                        "<p>" + price + "</p>" +
                        "</div>" +
                        "<hr class='hr_up'>" +
                        "<div class='event_description'>" +
                        "<p style=overflow: 'hidden'>" + describe + "…</p>" +
                        "</div>" +
                        "<hr class='hr_down'>" +
                        "<div class='event_keywords'>" +
                        "<div class='event_keywords_project'>" +
                        "<img src='' width='12px' height='12px'>" +
                        "<span>" + tage + "</span>" +
                        "</div>" +
                        "</div>" +
                        "<div class='exhibition_details_footer'>" +
                        "<div class='user_imformation'>" +
                        "<img src='' width='10px' height='10px'>" +
                        "<div class='Name_LegalTimes'>" +
                        "<span class='name'>" + name + "</span>" +
                        "<div class='legaltimes'>" +
                        "<span class='word_times'>履约次数：" + "</span>" +
                        "<span class='times'>" + performance + "</span>" +
                        "</div>" +
                        "</div>" +
                        "</div>" +
                        "</div>" +
                        "</div>" +
                        "</a>"
                    );

                }
                ;

            },
            error: function (data) {
                alert("erroy")
            }
        });
    }*/


</script>

</html>
