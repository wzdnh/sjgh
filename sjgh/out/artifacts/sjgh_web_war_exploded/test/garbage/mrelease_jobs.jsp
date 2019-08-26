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
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/reception/mb/garbage/mrelease_jobs.css">
    <title>发布任务_赏金工会</title>
</head>

<body>
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
<!-- 任务信息 陈嘉辉 20190508 20:53 -->
<!-- 任务信息start -->
<main>

    <!-- logo宣传语 陈嘉辉 20190506 16:38 -->
    <!-- logo宣传语start -->
    <div class="empty"></div>
    <div class="logoAndPublicity">
        <span class="Publicity_left">大学生都用</span>
        <img src="<%=request.getContextPath()%>/static/reception/mb/imgs/logo.png" width="123.68px" height="37.49">
        <span class="Publicity_right">交易有保障</span>
    </div>
    <!-- logo宣传语end -->

    <div class="task_distribution">
        <div class="big_title">
            <div class="span_home">
                <span>任务发布大厅</span>
            </div>
        </div>
        <hr>
        <div class="goal_all">
            <!-- 任务类型start -->
            <div class="taskClass">
                <!-- <img class="questionName_img" src="img/mustWrite.png" width="8px" height="8px"> -->
                <span class="questionName">任&nbsp;务&nbsp;类&nbsp;型&nbsp;：</span>
                <ul>
                    <li>
                        <div class="sjdb_home">
                            <label for="sjdb">
                                <input class="a" id="sjdb" type="radio" name="typeOfClass"
                                       checked="true"><span>事件代办</span>
                            </label>
                        </div>
                    </li>
                    <li>
                        <div class="swzl_home">
                            <label for="swzl">
                                <input id="swzl" type="radio" name="typeOfClass"><span>失物招领</span>
                            </label>
                        </div>
                    </li>
                    <li>
                        <div class="swjy_home">
                            <label for="swjy">
                                <input id="swjy" type="radio" name="typeOfClass"><span>事物交易</span>
                            </label>
                        </div>
                    </li>
                </ul>
            </div>
            <!-- 任务类型end -->
            <!-- 任务细节  陈嘉辉 20190420 12:03  -->

            <!--
                作者：陈政
                   时间：2019-04-21
                   描述：此处是点击按钮，隐藏或显示的部分
              -->
            <!--
                事件代办的显示隐藏部分
              任务细节start
              -->
            <form id="sjdb_display_hiding" action="index.html" method="post">
                <div class="taskDetail">
                    <ul>
                        <li>
                            <div class="tastKeyWords_home">
                                <!-- <img src="img/mustWrite.png" width="8px" height="8px"> -->
                                <span class="task_keywords">事件关键词 ：</span>
                                <div class="taskSign_home">
                                    <select class="taskSign">
                                        <option value="代取快递">代取快递</option>
                                        <option value="辅助学习">辅助学习</option>
                                        <option value="代跑腿">代跑腿（吃的、药品等）</option>
                                        <option value="其他任务类型">其他任务类型</option>
                                    </select>
                                </div>
                            </div>
                        </li>
                        <!-- 任务完成时间start -->
                        <!-- <li>
                          <div class="done_time_home">
                            <img src="img/mustWrite.png" width="8px" height="8px">
                            <span class="task_keywords">完成时间 ：</span>
                            <div class="done_time_detail">
                              <input type="time" name="done_time"><span>前</span>
                            </div>
                          </div>
                        </li> -->
                        <!-- 任务完成时间end -->
                        <!-- 接单者要求start -->
                        <li>
                            <div class="tastKeyWords_home">
                                <!-- <img src="img/mustWrite.png" width="8px" height="8px"> -->
                                <span class="task_keywords">接单者要求 ：</span>
                                <div class="taskSign_home">
                                    <input id="askSign_detail_a" type="checkbox" name="ensure_student" value="">
                                    <label for="askSign_detail_a">
                                        <span class="taskSign_detail">学生身份验证</span>
                                    </label>
                                    <div class="askSign_detail_b">
                                        <input id="askSign_detail_b" type="checkbox" name="ensure_student">
                                        <label for="askSign_detail_b">
                                            <span class="taskSign_detail">违约赔偿金</span>
                                        </label>

                                    </div>
                                </div>
                            </div>
                        </li>
                        <!-- 接单者要求end -->
                        <li>
                            <div class="money_amount">
                                <!-- <img src="img/mustWrite.png" width="8px" height="8px"> -->
                                <span class="task_keywords">悬&nbsp;赏&nbsp;金&nbsp;额&nbsp;:</span>
                                <div class="money_amountNumber">
                                    <input type="number" name="money_amount_number" min="0.1"><span>元</span>
                                </div>
                            </div>
                        </li>

                        <li>
                            <div class="otherDemand_home">
                                <div class="otherDemand_words">
                                    <!-- <img src="img/mustWrite.png" width="8px" height="8px"> -->
                                    <span class="task_keywords">其&nbsp;他&nbsp;说&nbsp;明&nbsp;：</span>
                                </div>
                                <div class="otherDemand_detail">

                                    <!--图片上传预览部分-->
                                    <div id="sjdb_pic_upload">
                                        <input id="sjdb_fileUpload" type="file" name="img"/>
                                        <div id="sjdb_image-holder">
                                        </div>
                                    </div>
                                    <textarea class="input_otherRequire" name="otherDemand_detail"
                                              placeholder="下周一上午第一节&nbsp;&nbsp;&nbsp;&nbsp;晚8点送到桃五&#10;去学校对面药店买胃药"></textarea>
                                    <!-- <input class="input_otherRequire" type="text" name="otherDemand_detail" placeholder="下周一上午第一节，晚8点送到桃五，去学校对面药店买胃药"> -->
                                </div>

                            </div>
                        </li>
                        <li>
                            <!-- 提交按钮start -->
                            <input class="ensure_submit" type="button" name="ensure_submit" value="确认提交">
                            <!-- 提交按钮end -->
                        </li>
                    </ul>
                </div>
            </form>
            <!-- 事件代办之任务细节end -->

            <!--
              事物招领的显示隐藏部分
              任务细节start
              -->
            <form id="swzl_display_hiding" action="index.html" method="post" style="display: none;">
                <div class="taskDetail">
                    <ul>
                        <li>
                            <div class="tastKeyWords_home">
                                <!-- <img src="img/mustWrite.png" width="8px" height="8px"> -->
                                <span class="task_keywords">事件关键词 ：</span>
                                <div class="swzl_keywords_home">
                                    <input id="lostSomething" type="radio" name="a" value="">
                                    <label for="lostSomething">
                                        <span>丢了东西</span>
                                    </label>
                                    <div class="findSomething_right">
                                        <input id="findSomething" type="radio" name="a" value="">
                                        <label for="findSomething">
                                            <span>捡到东西</span>
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <!-- <li>
                        <div class="done_time_home">
                          <img src="img/mustWrite.png" width="8px" height="8px">
                          <span class="task_keywords">完成时间 ：</span>
                          <div class="done_time_detail">
                            <input type="time" name="done_time"><span>前</span>
                          </div>
                        </div>
                      </li> -->
                        <li>
                            <div class="money_amount">
                                <!-- <img src="img/mustWrite.png" width="8px" height="8px"> -->
                                <span class="task_keywords">物&nbsp;品&nbsp;类&nbsp;型&nbsp;：</span>
                                <div class="typeOfthing_home">
                                    <select class="typeOfthing">
                                        <option value="schoolCard">
                                            <span>一卡通</span>
                                        </option>
                                        <option value="book">
                                            <span>课本</span>
                                        </option>
                                        <option value="Thekeys">
                                            <span>钥匙</span>
                                        </option>
                                        <option value="other">
                                            <span>其他物品</span>
                                        </option>
                                    </select>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="money_amount">
                                <!-- <img src="img/mustWrite.png" width="8px" height="8px"> -->
                                <span class="task_keywords">有&nbsp;偿&nbsp;意&nbsp;愿&nbsp;：</span>
                                <div class="payOrNot_home">
                                    <input id="payOrNot_yes" type="radio" name="b" value="payOrNot_yes">
                                    <label for="payOrNot_yes">
                                        <span>愿意有偿</span>
                                    </label>
                                    <div class="payOrNot_no_home">

                                        <input id="payOrNot_no" type="radio" name="b" value="payOrNot_no">
                                        <label for="payOrNot_no">
                                            <span>不愿意有偿</span>
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="otherDemand_home">
                                <div class="otherDemand_words">
                                    <!-- <img src="img/mustWrite.png" width="8px" height="8px"> -->
                                    <span class="task_keywords">其&nbsp;他&nbsp;说&nbsp;明&nbsp;：</span>
                                </div>
                                <div class="otherDemand_detail">

                                    <!--图片上传预览部分-->
                                    <div id="swzl_pic_upload">
                                        <input id="swzl_fileUpload" type="file" name="img"/>
                                        <div id="swzl_image-holder">
                                        </div>
                                    </div>
                                    <textarea class="input_otherRequire" name="otherDemand_detail"
                                              placeholder="一卡通/身份证昨天落在三教了，麻烦看到的说一声，号码是201651xx..."></textarea>
                                    <!-- <input class="input_otherRequire" type="text" name="otherDemand_detail"> -->
                                </div>

                            </div>
                        </li>
                        <li>
                            <!-- 提交按钮start -->
                            <input class="ensure_submit" type="button" name="ensure_submit" value="确认提交">
                            <!-- 提交按钮end -->
                        </li>
                    </ul>
                </div>
            </form>
            <!-- 事物交易之任务细节end -->


            <!--
              事物交易的显示隐藏部分
              任务细节start
              -->
            <form id="swjy_display_hiding" action="index.html" method="post" style="display: none;">
                <div class="taskDetail">
                    <ul>
                        <li>
                            <div class="done_time_home">
                                <!-- <img src="img/mustWrite.png" width="8px" height="8px"> -->
                                <span class="task_keywords">物&nbsp;品&nbsp;类&nbsp;型&nbsp;：</span>
                                <div class="deal_home">
                                    <input id="study_thing" type="radio" name="e" value="study_thing">
                                    <label for="study_thing">
                                        <span>学习用品</span>
                                    </label>
                                    <input class="liveThing_otherThing" id="live_thing" type="radio" name="e"
                                           value="live_thing">
                                    <label for="live_thing">
                                        <span>生活用品</span>
                                    </label>
                                    <input class="liveThing_otherThing" id="other_thing" type="radio" name="e"
                                           value="other_thing">
                                    <label for="other_thing">
                                        <span>其他物品</span>
                                    </label>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="money_amount">
                                <!-- <img src="img/mustWrite.png" width="8px" height="8px"> -->
                                <span class="task_keywords">出售金额 :</span>
                                <div class="money_amountNumber">
                                    <input type="number" name="money_amount_number"><span>元</span>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="otherDemand_home">
                                <div class="otherDemand_words">
                                    <!-- <img src="img/mustWrite.png" width="8px" height="8px"> -->
                                    <span class="task_keywords">其&nbsp;他&nbsp;说&nbsp;明&nbsp;：</span>
                                </div>
                                <div class="otherDemand_detail">
                                    <!--图片上传预览部分-->
                                    <div id="swjy_pic_upload">
                                        <input id="swjy_fileUpload" type="file" name="img"/>
                                        <div id="swjy_image-holder">
                                        </div>
                                    </div>
                                    <textarea class="input_otherRequire" name="otherDemand_detail"
                                              placeholder="全新的课本/考研复习资料/化妆品大甩卖啦，可留言小刀"></textarea>
                                    <!-- <input class="input_otherRequire" type="text" name="otherDemand_detail" > -->
                                </div>
                            </div>
                        </li>
                        <li>
                            <!-- 提交按钮start -->
                            <input class="ensure_submit" type="button" name="ensure_submit" value="确认提交">
                            <!-- 提交按钮end -->
                        </li>
                    </ul>
                </div>
            </form>
            <!-- 事物交易之任务细节end -->

        </div>
    </div>
</main>
<!-- 任务信息end -->
<!-- 赔偿流程 陈嘉辉 20190509 03：05 -->
<!-- 赔偿流程start -->
<div class="payForIllegal">
    <img src="<%=request.getContextPath()%>/static/reception/mb/imgs/ensure_out.png" width="314px" height="94px">
</div>
<!-- 赔偿流程end -->
<script type="text/javascript" src="<%=request.getContextPath()%>/static/reception/js/jquery-3.4.0.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/static/reception/mb/js/mrelease.js"></script>
</body>

</html>
