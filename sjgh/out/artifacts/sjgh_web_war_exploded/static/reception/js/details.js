//详情界面的图片的处理

// 事件图片处理
// 如果图片过大，处理图片大小。使用要求：传递id和宽高要求。示例：autoImgSize('img1',1000)
function autoImgSize(img, width, height) {

    var imgobj = document.getElementById(img); //获取对象
    //imgobj.style.width = "auto";
    //imgobj.style.height = "auto"; //释放图片本来的大小
    var imgwidth = imgobj.width;
    var imgheight = imgobj.height;
    if(imgwidth > imgheight) { //判断是width和height哪一个大。大的先处理。设置最大值size
        if(imgwidth > width) {
            imgobj.style.width = width + "px";
        }
        imgheight = imgobj.height;
        if(imgheight > height) {

            imgobj.style.height = height + "px";
        }
    } else {
        if(imgheight > height) {
            imgobj.style.height = height + "px";
        }
        imgwidth = imgobj.width;
        if(imgwidth > width) {
            imgobj.style.width = width + "px";
        }
    }
}

window.onload = function() {
    autoImgSize('img_id', 302, 273);
}


/*$(function () {
// 此方法为jQuery DOM加载完成触发的事件
    autoImgSize('img_id', 302, 273);
})*/

/*(function () {
    // 此方法会在DOM加载完成之前调用
    autoImgSize('img_id', 302, 273);
})(jQuery)*/
