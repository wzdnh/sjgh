<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
%>

</section>
</div>
<style>
    /* demo page styles */
    body { min-height: 2300px; }

    .content-header b,
    .admin-form .panel.heading-border:before,
    .admin-form .panel .heading-border:before {
        transition: all 0.7s ease;
    }
    /* responsive demo styles */
    @media (max-width: 800px) {
        .admin-form .panel-body { padding: 18px 12px; }
    }
</style>

<style>
    .ui-datepicker select.ui-datepicker-month,
    .ui-datepicker select.ui-datepicker-year {
        width: 48%;
        margin-top: 0;
        margin-bottom: 0;

        line-height: 25px;
        text-indent: 3px;

        color: #888;
        border-color: #DDD;
        background-color: #FDFDFD;

        -webkit-appearance: none; /*Optionally disable dropdown arrow*/
    }
</style>



<script src="<%=request.getContextPath()%>/static/reception/js/jquery-3.4.0.min.js"></script>
<!--友好提示-->
<script src="<%=request.getContextPath()%>/static/reception/plug_in_unit/sweet-alert.js"></script>
<script>

    /*var setState = function (id, state) {*/

    <!--处理学生认证的ajax代码-->
    function setState(id, state) {
        var employee_id = "${sessionScope.employee.employee_id}";
        var formData = new FormData();
        formData.append("state", id);
        formData.append("state", state);
        formData.append("employee_id", employee_id);
        alert("==============")
        $.ajax({
            url: "<%=basePath%>/user/set_certification_state",
            type: "post",
            data: formData,
            processData: false,
            /*必须false才会自动加上正确的content-type*/
            contentType: false,
            success: function (data) {
                alert("ok")
                var title = "成功";
                var text = "验证码已成功发送，请注意查看";
                friendly_tips(title, text);
            },
            error: function () {
                alert("shibai")
                var title = "错误";
                var text = "请重新输入电话号码";
                friendly_tips(title, text);
            }
        });
    }

</script>


<script src="<%=request.getContextPath()%>/static/backstage/vendor/jquery/jquery-1.11.1.min.js"></script>
<script src="<%=request.getContextPath()%>/static/backstage/vendor/jquery/jquery_ui/jquery-ui.min.js"></script>
<script src="<%=request.getContextPath()%>/static/backstage/assets/admin-tools/admin-forms/js/jquery.validate.min.js"></script>
<script src="<%=request.getContextPath()%>/static/backstage/assets/admin-tools/admin-forms/js/additional-methods.min.js"></script>
<script src="<%=request.getContextPath()%>/static/backstage/assets/admin-tools/admin-forms/js/jquery-ui-datepicker.min.js"></script>
<script src="<%=request.getContextPath()%>/static/backstage/assets/js/utility/utility.js"></script>
<script src="<%=request.getContextPath()%>/static/backstage/assets/js/demo/demo.js"></script>
<script src="<%=request.getContextPath()%>/static/backstage/assets/js/main.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/static/backstage/js/pages.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/static/backstage/js/items.js"></script>
</body>
</html>


