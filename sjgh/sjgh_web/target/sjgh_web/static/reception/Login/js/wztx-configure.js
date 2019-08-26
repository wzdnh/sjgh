/**
 * 文字特效配置部分
 */
var vara = new Vara("#container", "Login/fonts/Satisfy/SatisfySL.json", 
	[{
		text: "Our distance is not far away,",
		/* textAlign: "center", */
		strokeWidth: 2.5,
		color: 'lightcoral',
		y: 80,
		duration: 5000
	}, 
	{
		text: "Just two dimensional and three dimensional distance,",
		width: 700,
		strokeWidth: 2.5,
		color: 'lightcoral',
		y: 40,
		/*距离左边盒子的left值*/
		x: 10,
		duration: 6000
	}, 
	{
		text: "Tears slide down.",
		strokeWidth: 2,
		color: 'lightcoral',
		id: "sphinx",
		autoAnimation: true,
		/*x: 80,*/
		y: 20,
		duration: 3500
	}], 
	{
		fontSize: 40
	}
);	



