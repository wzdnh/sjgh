<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!--===============================员工上传 / 修改头像页面==================================-->
<jsp:include page="top.jsp"/>
<section id="content" class="table-layout animated fadeIn">
    <div class="tray tray-center">
        <div class="content-header">
            <h2> 添加 / 修改员工头像 </h2>
            <p class="lead"></p>
        </div>
        <div class="admin-form theme-primary mw1000 center-block" style="padding-bottom: 175px;">
            <div class="panel heading-border">
                <!--Spring Form标签-->
                <form:form action="/employee/file_upload" modelAttribute="employee" id="admin-form" name="addForm" enctype="multipart/form-data" method="post">
                    <div class="panel-body bg-light">
                        <div class="section-divider mt20 mb40">
                            <span> 头像上传 </span>
                        </div>
                        <div id="wrapper" >
                            <form:input path="head_portrait"   id="fileUpload" type="file"/><br/>
                        </div>
                        <div id="image-holder" style="border: #00a1d9 1px solid; margin-bottom: 20px; width: 200px; height:200px"></div>
                        <div class="panel-footer text-right" style="margin-bottom: 30px">
                            <button type="submit" class="button"> 上传 </button>
                            <button type="button" class="button" onclick="javascript:window.history.go(-1);"> 返回 </button>
                        </div>
                    </div>
                </form:form>
            </div>
        </div>
    </div>
</section>

<!--设置头像预览的大小-->
<style>
    .thumb-image{
        height: 200px;
        width: 200px;
    }
</style>


<!--=======================jQuery实现图片上传加预览功能==================-->
<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript">
    $("#fileUpload").on('change', function() {

        if(typeof(FileReader) != "undefined") {

            var image_holder = $("#image-holder");
            image_holder.empty();

            var reader = new FileReader();
            reader.onload = function(e) {
                $("<img />", {
                    "src": e.target.result,
                    "class": "thumb-image"
                }).appendTo(image_holder);

            }
            image_holder.show();
            reader.readAsDataURL($(this)[0].files[0]);
        } else {
            alert("你的浏览器不支持FileReader.");
        }
    });
</script>
<jsp:include page="bottom.jsp"/>