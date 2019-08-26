<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!--============================手机端之首页=====================-->

<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
%>

<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="user-scalable=0">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/reception/mb/css/mindex.css">
    <title>主页_赏金工会</title>
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
                    <span class="nav_keywords_orange">主页</span>
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
                    <span class="nav_keywords_gray">我的</span>
                </div>
            </a>
        </li>
    </ul>
</div>
<!-- 底部导航栏end -->
<!-- 头部轮播图 陈嘉辉 20190519 02：15 -->
<!-- 轮播start -->
<header>
    <div class="empty"></div>
    <div class="header_banner">
        <!--轮播模块-->
        <div class="LunBO" id="LunBo">
            <div class="lunbo" id="lun_bo">
                <a href="">
                    <div class="banner-slide slide1 slide-active"><img class="lunbo_image"
                                                                       src="<%=request.getContextPath()%>${sessionScope.officialPicture.get(0).road}"/>
                    </div>
                </a>
                <a href="">
                    <div class="banner-slide slide2"><img class="lunbo_image"
                                                          src="<%=request.getContextPath()%>${sessionScope.officialPicture.get(1).road}"/>
                    </div>
                </a>
                <a href="">
                    <div class="banner-slide slide3"><img class="lunbo_image"
                                                          src="<%=request.getContextPath()%>${sessionScope.officialPicture.get(2).road}"/>
                    </div>
                </a>
                <a href="">
                    <div class="banner-slide slide4"><img class="lunbo_image"
                                                          src="<%=request.getContextPath()%>${sessionScope.officialPicture.get(3).road}"/>
                    </div>
                </a>
                <a href="">
                    <div class="banner-slide slide5"><img class="lunbo_image"
                                                          src="<%=request.getContextPath()%>${sessionScope.officialPicture.get(4).road}"/>
                    </div>
                </a>
            </div>
            <!--五个小按钮-->
            <div class="dots" id="dots">
                <span class="active"></span>
                <span></span>
                <span></span>
                <span></span>
                <span></span>
            </div>
        </div>
        <!-- 轮播图的框end -->

    </div>
</header>
<!-- 轮播end -->
<!-- logo和退款流程 陈嘉辉 20190519 12:11 -->
<!-- logo和退款流程start -->
<div class="logo_backMoney">
    <div class="empty"></div>
    <div class="logoHome">
        <img src="<%=request.getContextPath()%>/static/reception/mb/img/logo.png" width="111.85px" height="33.9px">
    </div>
    <div class="backMoney">
        <img src="<%=request.getContextPath()%>/static/reception/mb/img/ensure_out.png" width="313.6px" height="94.5px">
    </div>
</div>
<!-- logo和退款流程end -->
<!-- 事件代办 陈嘉辉 20190519 14:48 -->
<!-- 事件代办start -->
<div class="task_sjdb">
    <span class="index_big_title">事件代办</span>
    <span class="index_small_title"><span class="index_small_title_line">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>&nbsp;&nbsp;&nbsp;&nbsp;找人帮忙做事&nbsp;&nbsp;&nbsp;&nbsp;<span
            class="index_small_title_line">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span>
    <div class="task_sjdb_deal">
        <c:forEach items="${agentEventList}" var="ael">
            <a href="/mb_detail/sjdb?event_id=${ael.event_id}">
                <div class="event_dedtails" style="float: left; margin-right: 16.9px; margin-bottom: 19px">
                        <%--<div class="real_name">
                            <p>验</p>
                        </div>
                        <div class="insurance">
                            <p>保</p>
                        </div>--%>
                    <div class="empty">
                    </div>
                    <div class="event_img">
                        <img src="" alt="">
                    </div>
                    <div class="money">
                        <p>¥&nbsp;${ael.price}</p>
                    </div>
                    <hr class="hr_up">
                    <div class="event_description">
                        <p>${ael.event_describe}…</p>
                    </div>
                    <hr class="hr_down">
                    <div class="event_keywords">
                        <!-- <div class="event_keywords_time">
                              &lt;%&ndash;<img src="img/time.png" width="12px" height="12px">&ndash;%&gt;
                              <span>{ael.start_time}</span>
                          </div> -->
                        <div class="event_keywords_project">
                            <img src="img/project.png" width="12px" height="12px">
                            <span>${ael.event_tags}</span>
                        </div>
                    </div>
                    <div class="exhibition_details_footer">
                        <div class="user_imformation">
                            <div class="user_imformation_img">
                                <img src="${ael.user_er.head_portrait}" width="15px" height="15px">
                            </div>
                            <div class="Name_LegalTimes">
                                <div class="name_home">
                                    <span class="name">${ael.user_er.user_name}</span>
                                </div>
                                <div class="legaltimes">
                                    <span class="word_times">履约</span>
                                    <span class="times">${ael.user_er.performance}</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </a>
        </c:forEach>
    </div>
</div>
<!-- 事件代办end -->
<!-- 失物寻找和二手交易start -->
<div class="task_swzl_home">
    <div class="empty">
    </div>
    <div class="task_swzl">
        <span class="index_big_title">失物寻找</span>
        <span class="index_small_title"><span class="index_small_title_line">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>&nbsp;&nbsp;&nbsp;&nbsp;丢了东西/捡到东西&nbsp;&nbsp;&nbsp;&nbsp;<span
                class="index_small_title_line">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span>
        <div class="task_swzl_deal">

            <c:forEach items="${lostAndFoundList}" var="laf">
                <a href="/mb_detail/swzl?id=${laf.id}">
                    <div class="task_all">
                        <div class="money_event">
                            <div class="money_home">
                                <span class="money">¥</span>
                                <span class="money">5</span>
                            </div>
                            <div class="small_event_home">
                                <img src="img/event.png" width="10.5px" height="10.5px">
                                <span class="event_keyword">${laf.event_tags}</span>
                            </div>
                        </div>
                        <hr class="description_hr">
                        <div class="description">
                            <p>${laf.event_describe}</p>
                        </div>
                        <div class="description_img">
                            <img src="img/test.png" width="82px" height="74px">
                        </div>
                        <div class="exhibition_details_footer">
                            <div class="user_imformation">
                                <img src="<%=request.getContextPath()%>${laf.user_er.head_portrait}" width="14.064px"
                                     height="14.064px">
                                <div class="Name_LegalTimes">
                                    <span class="name">${laf.user_er.user_name}</span>
                                    <div class="legaltimes">
                                        <span class="word_times">履约</span>
                                        <span class="times">${laf.user_er.performance}</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </a>
            </c:forEach>

        </div>
    </div>
</div>


<div class="task_swxz_home">
    <div class="empty">
    </div>
    <div class="task_swzl">
        <span class="index_big_title">闲置交易</span>
        <span class="index_small_title"><span class="index_small_title_line">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>&nbsp;&nbsp;&nbsp;&nbsp;同校闲置物品交易&nbsp;&nbsp;&nbsp;&nbsp;<span
                class="index_small_title_line">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span>
        <div class="task_swzl_deal">

            <c:forEach items="${transactionOfThingsList}" var="tot">
                <a href="/mb_detail/swjy?id=${tot.id}">
                    <div class="task_all">
                        <div class="money_event">
                            <div class="money_home">
                                <span class="money">¥</span>
                                <span class="money">${tot.price}</span>
                            </div>
                            <div class="small_event_home">
                                <img src="img/event.png" width="10.5px" height="10.5px">
                                <span class="event_keyword">${tot.event_tags}</span>
                            </div>
                        </div>
                        <hr class="description_hr">
                        <div class="description">
                            <p>${tot.event_describe}</p>
                        </div>
                        <div class="description_img">
                            <img src="img/test.png" width="82px" height="74px">
                        </div>
                        <div class="exhibition_details_footer">
                            <div class="user_imformation">
                                <img src="<%=request.getContextPath()%>${tot.user_er.head_portrait}" width="14.064px" height="14.064px">
                                <div class="Name_LegalTimes">
                                    <span class="name">${tot.user_er.user_name}</span>
                                    <div class="legaltimes">
                                        <span class="word_times">履约</span>
                                        <span class="times">${tot.user_er.performance}</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </a>
            </c:forEach>

        </div>
    </div>
</div>
<!-- 失物招领和二手交易end -->
<footer>
    <p>赏金工会：永远相信美好的事物正在发生 忙着可爱 忙着长大</p>
    <div class="empty">
    </div>
</footer>

<!-- 发布按钮start -->
<a href="/mb_release/to_add"><button class="put_dusk" type="button">发布任务</button></a>
<!-- 发布按钮end -->

<!-- 底部空白start  防止底部导航上滑下滑时移动-->
<div style="width: 100%;height: 48.5px;"></div>
<!-- 底部空白end  -->

<script type="text/javascript" src="<%=request.getContextPath()%>/static/reception/mb/js/jquery-3.4.0.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/static/reception/js/lun_bo.js"></script>
<script>
    //页面一被打开就判断用户是否登录
    $(document).ready(function () {
        var username = "${sessionScope.user.user_name}";
        if (username == ""){
            $(".put_dusk").remove();
        }
    });
</script>
</body>




</html>
