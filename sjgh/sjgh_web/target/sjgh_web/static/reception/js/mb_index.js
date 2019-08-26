//识别是手机端后自动跳转
var mobileAgent = new Array("iphone", "ipod", "ipad", "android", "mobile", "blackberry", "webos", "incognito", "webmate", "bada", "nokia", "lg", "ucweb", "skyfire");
var browser = navigator.userAgent.toLowerCase();
var isMobile = false;
for (var i=0; i<mobileAgent.length; i++){
    if (browser.indexOf(mobileAgent[i])!=-1){
        isMobile = true;
        //测试
        location.href = 'http://localhost:1234/mb_home/list';
        //正式
        //location.href = 'https://isjgh.com/mb_home/list';

        break;
    }
}


