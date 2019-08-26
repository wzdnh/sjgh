/*事件代办被选中时的处理*/

$('#sjdb').click(function(){
	$('#sjdb_display_hiding').show();
	$('#swzl_display_hiding').hide();
	$('#swjy_display_hiding').hide();
	
});

/*失物招领被选中时的处理*/
$('#swzl').click(function(){
	$('#swzl_display_hiding').show();
	$('#sjdb_display_hiding').hide();	
	$('#swjy_display_hiding').hide();
});

/*失物招领被选中时的处理*/
$('#swjy').click(function(){
	$('#swjy_display_hiding').show();
	$('#sjdb_display_hiding').hide();
	$('#swzl_display_hiding').hide();
});


/*事件代办图片预加载处理*/
$("#sjdb_fileUpload").on('change', function() {

				if(typeof(FileReader) != "undefined") {

					var image_holder = $("#sjdb_image-holder");
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
			
			
/*失物招领图片预加载处理*/	
$("#swzl_fileUpload").on('change', function() {

				if(typeof(FileReader) != "undefined") {

					var image_holder = $("#swzl_image-holder");
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
			
/*事物交易图片预加载处理*/	
$("#swjy_fileUpload").on('change', function() {

				if(typeof(FileReader) != "undefined") {

					var image_holder = $("#swjy_image-holder");
					image_holder.empty();

					var reader = new FileReader();
					reader.onload = function(e) {
						$("<img />", {
							"src": e.target.result,
							"class": "swjy_thumb-image"
						}).appendTo(image_holder);

					}
					image_holder.show();
					reader.readAsDataURL($(this)[0].files[0]);
				} else {
					alert("你的浏览器不支持FileReader.");
				}
			});
			
