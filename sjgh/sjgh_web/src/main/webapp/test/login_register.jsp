<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!--==============================用户登录注册界面=============================-->

<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<title>Login&register</title>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/static/reception/css/auth.css">
</head>

<body>
<div id="login_register" style="width: 360px; margin: 0px auto">
	<div class="lowin">
		<div class="lowin-brand">
			<img src="<%=request.getContextPath()%>/static/reception/img/80.png" alt="logo" width="80px" height="80px">
		</div>
		<div class="lowin-wrapper">
			<div class="lowin-box lowin-login">
				<div class="lowin-box-inner">
					<form>
						<p>赏&nbsp;金&nbsp;工&nbsp;会</p>
						<div class="lowin-group">
							<label>用户名 <a href="#" class="login-back-link">Sign in?</a></label>
							<input type="email" autocomplete="email" name="email" class="lowin-input">
						</div>
						<div class="lowin-group password-group">
							<label>密码 <a href="#" class="forgot-link">忘了密码?</a></label>
							<input type="password" name="password" autocomplete="current-password" class="lowin-input">
						</div>
						<button class="lowin-btn login-btn">
							登录
						</button>

						<div class="text-foot">
							还没账号? <a href="" class="register-link">注册</a>
						</div>
					</form>
				</div>
			</div>

			<div class="lowin-box lowin-register">
				<div class="lowin-box-inner">
					<form>
						<p class="lowin-box-inner_title">赏金工会注册</p>
						<div class="lowin-group">
							<label>学校</label>
							<select>
								<option value="tjcu">天津商业大学</option>
								<!-- <option value="tjcu">天津商业大学</option>
								<option value="tjcu">天津商业大学</option> -->
							</select>
							<!-- <input type="text" name="school" class="lowin-input"> -->
						</div>
						<div class="lowin-group">
							<label>用户名</label>
							<input type="text" name="name" class="lowin-input">
						</div>
						<div class="lowin-group">
							<label>密码</label>
							<input type="password" name="password" class="lowin-input">
						</div>
						<div class="lowin-group">
							<label>确认密码</label>
							<input type="password" name="password" class="lowin-input">
						</div>
						<div class="lowin-group">
							<label>邀请码（选填)</label>
							<input type="text" class="lowin-input">
						</div>
						<div class="lowin-group">
							<label>手机</label>
							<input type="number" class="lowin-input_phoneNumber" style="-moz-appearance:textfield" placeholder="请输入常用手机号码">
							<a href="#"><span class="lowin-input_requireNumber">获取验证码</span></a>
							<input type="number" class="lowin-input" style="-moz-appearance:textfield" placeholder="请输入验证码">
						</div>
						<button class="lowin-btn">
							注&nbsp;册
						</button>

						<div class="text-foot">
							已经账号? <a href="" class="login-link">登录</a>
						</div>
					</form>
				</div>
			</div>
		</div>

		<footer class="lowin-footer">
			赏金工会——永远相信美好事物正在发生 忙着长大 忙着可爱
		</footer>
	</div>
</div>
	<script src="<%=request.getContextPath()%>/static/reception/js/auth.js"></script>
	<script>
		Auth.init({
			login_url: '#login',
			forgot_url: '#forgot'
		});
	</script>
</body>

</html>
