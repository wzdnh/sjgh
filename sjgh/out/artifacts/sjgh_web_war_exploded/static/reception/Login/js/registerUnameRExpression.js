/*
 * 注册用户名正则表达式
 */

// 获取元素
var username = document.getElementById('usernamesignup');
var span = document.getElementById('unames-tip');


// 设置用户名是否满足条件的标志 false 表示没有通过，true表示通过
var isUsernameOk = false;

// 获取焦点，设置提示信息
username.onfocus = function() {
	// 设置提示信息span的类名和信息
	span.className = 'tipMsg';
	span.innerHTML = '中英文均可，最长14个英文或7个汉字';
};

// 失去焦点，判断是否满足条件
username.onblur = function() {
	
	// 去除多余的空白字符
	var uname = this.value.trim();

	// 判断是否为空
	if(uname == '') {
		// 设置错误信息
		span.className = 'error';
		span.innerHTML = '用户名不允许为空';

		// 设置用户名标记为false
		isUsernameOk = false;

		// 终止程序
		return;
	};

	// 判断是否有非法字符(除了中英文、数字、下划线以外的字符)
	var charReg = /[^\u4E00-\u9FA5\w]/;
	var res = charReg.test(uname);
	// 如果res为真，表示有非法字符
	if(res) {
		// 设置错误信息
		span.className = 'error';
		span.innerHTML = '用户名仅支持中英文、数字和下划线';

		// 设置用户名标记为false
		isUsernameOk = false;

		// 终止程序
		return;
	};

	/*// 经过上述判断后，说明都是合法的字符(中英文、下划线、数字)，接下来判断是否为纯数字
	var numReg = /\D/;
	var res = numReg.test(uname);

	// 如果res为false，则表示出了数字以外无其他字符
	if(!res) {
		// 设置错误信息
		span.className = 'error';
		span.innerHTML = '用户名仅支持中英文、数字和下划线,且不能为纯数字';

		// 设置用户名标记为false
		isUsernameOk = false;

		// 终止程序
		return;
	};*/
	
	
	// 满足以上条件后，判断用户名字符串的长度
	var len = 0; // 表示用户名的长度
	for(var i = 0; i < uname.length; i++) {
		// 如果是中文，就+2；否则+1
		if(/[\u4E00-\u9FA5]/.test(uname[i])) {
			len += 2;
		} else {
			len += 1;
		}
		
		// 尽量避免执行过多的次数，一旦len超过14就不满足条件了
		if(len > 14) {
			break;
		}
	};

	// 判断是否满足条件
	if(len > 14) {
		// 设置错误信息
		span.className = 'error';
		span.innerHTML = '用户名不能超过7个汉字或14个字符';

		// 设置用户名标记为false
		isUsernameOk = false;
		// 终止程序
		return;
	} else {
		// 设置成功信息
		span.className = 'success';
		span.innerHTML = 'OK';

		// 设置成功的标志
		isUsernameOk = true;
	};
}



//注册-邮箱部分正则表达式及友好提示
var emial = document.getElementById('emailsignup');
var emial_span = document.getElementById('youmail-tip');

//设置邮箱是否满足条件的标志 false 表示没有通过，true表示通过
var isEmialOk = false;

// 获取焦点，设置提示信息
emial.onfocus = function() {
	// 设置提示信息span的类名和信息
	emial_span.className = 'tipMsg';
	emial_span.innerHTML = '谨慎填写，用于找回密码';
};

// 失去焦点，判断是否满足条件
emial.onblur = function() {
	var emialValue = this.value.trim();
	
	var reg = /[A-Za-z0-9\u4e00-\u9fa5]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+/;
	var res = reg.test(emialValue)
	var emialNull = null;
	if(emialValue == null){
		emial_span.className = 'error';
		emial_span.innerHTML = '请填写邮箱'	
		return;
	}
	
	if(res){
		emial_span.className = 'success';
		emial_span.innerHTML = 'OK'
		isEmialOk = true;
	}
	else{
		emial_span.className = 'error';
		emial_span.innerHTML = '请正确填写邮箱';
		isEmialOk = false;
	}

};

//注册密码-正则表达式及友好提示
var password1 = document.getElementById('passwordsignup');
var password1_span = document.getElementById('youpasswd-tip');
var password2 = document.getElementById('passwordsignup_confirm');
var password2_span = document.getElementById('youpasswd2-tip');

//设置邮箱是否满足条件的标志 false 表示没有通过，true表示通过
var isPassword = false;

// 获取焦点，设置提示信息
password1.onfocus = function() {
	// 设置提示信息span的类名和信息
	password1_span.className = 'tipMsg';
	password1_span.innerHTML = '请填写6到16位数字和字母的混合';
};

// 失去焦点，判断是否满足条件
password1.onblur = function() {
	var password1Value = this.value.trim();
	var regex = /(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,16}/;
	var res = regex.test(password1Value);
	if (res){
		password1_span.className = 'success';
		password1_span.innerHTML = 'OK';	
	}else{
		password1_span.className = 'error';
		password1_span.innerHTML = '不符合规范,请重新填写';	
	}
	
};

//密码确认部分
//获取焦点，设置提示信息
password2.onfocus = function() {
	// 设置提示信息span的类名和信息
	var password1Value = password1.value;
	if(password1Value = null){
		password1_span.className = 'error';
		password1_span.innerHTML = '请先填写密码';	
	}else{
		password2_span.className = 'tipMsg';
		password2_span.innerHTML = '请输入密码';
	}
};

// 失去焦点，判断是否满足条件
password2.onblur = function() {
	var password2Value = this.value;
	var password1Value = password1.value;
	if(password1Value = null){
		password1_span.className = 'error';
		password1_span.innerHTML = '请先填写密码';		
		return;
	}else if(password2Value = null){
		password1_span.className = 'error';
		password1_span.innerHTML = '请确认密码';	
		
	}else if (password2Value == password1Value){
		password2_span.className = 'success';
		password2_span.innerHTML = 'OK';
		isPassword = true;		
	}else{
		password2_span.className = 'error';
		password2_span.innerHTML = '请检查，重新填写';	
	}
	
};



