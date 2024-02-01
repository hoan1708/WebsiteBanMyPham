<style>


body{
	font-family: Arial;
	font-size: 13px;
	margin: 0px;
	padding: 0px;
}

.wrapper{
	width: 1349px;
/*	height: 6953px;*/
	margin: 0px auto;
/*	background: lightgray;*/

	background-color: #ffffff;

}

.wrapper header{
	padding: 0px;
	margin: 0px;
	display: flex;
	line-height: 50px;
	background: #252e4b;
	color: white;
}


header .header-left{
	width: 700px;
}

.header-left ul{
	list-style: none;
	display: flex;
	margin: 0px;
	padding: 0px;
	padding-left: 89px;
}


.header-left ul li a{
	line-height: 15px;
	text-decoration: none;
	padding-top: 20px;
	padding-right: 19px;
	color: #ffffff;
}

.wrapper header .header-right{

	width: 649px;

}

.header-right ul{
	padding:0px;
	margin:0px;
	list-style: none;
	text-align: right;
	padding-right: 104px;
}
.header-right a{
	text-decoration: none;
	color: #ffffff;
}

.box-nav{
	/* width: 1349px; */
	/* width: 1175px; */
	margin: 0px auto;
	background-color: white;
	display: flex;
	height: 100px;
	/* border-bottom: 1px solid gainsboro; */
	margin-bottom: 20px;
	padding-bottom: 20px;
}

.box-nav .nav-left{
	margin-left: 80px;
	padding-left: 12px;
	display: flex;
}

.nav-left .nav-logo{
	padding: 26px 47px 41px 0px;
}


.nav-find .nav-find-menu{
	list-style: none;
	margin: 0px;
	padding: 0px;
	display: flex;


	border-radius: 4px;
	border: 1px solid #e5e6ec;
}

.nav-left .nav-find {
	margin-top: 41px;
	margin-right: 60px;
	width: 555px;
	line-height: 42px;
}

.nav-find .nav-find-menu li a{
	line-height: 15px;
	text-decoration: none;
	color: black;
}

.nav-find>.nav-find-menu>.li-chonDanhMuc{
	position: relative;
}


		.nav-find>.nav-find-menu>li>.sub-menu{
			position: absolute;
			top: 42px;
			left: 0px;
			z-index: 1;
			margin: 0px;
			padding: 0px;
			list-style: none;

			display: none;
			width: 200px;

			background-color: #ffffff;
			transition-property: height;
			transition-duration: 0.9s;
			height: 0px;

		}

		.nav-find>.nav-find-menu>.li-chonDanhMuc:hover .sub-menu{
			height: 368px;
		}


		.nav-find>.nav-find-menu>li>.sub-menu>li{
			line-height: 40px;
		}
		

		.nav-find>.nav-find-menu>li>.sub-menu>li>a{
			padding: 10px;
			text-decoration: none;
			color: black;
		}

		.nav-find>.nav-find-menu>li>.sub-menu>li:hover a{
			color: white;
		}

		.nav-find>.nav-find-menu>li>.sub-menu>li:hover{
			background-color: #ec407a;
		}

		.nav-find>.nav-find-menu>li:hover .sub-menu{
			display: block;
		}


		/* chỉnh màu đỏ chữ và kẻ chữ phía dưới	khi trỏ chuột vào nav*/
		.nav-find>.nav-find-menu>li>a:hover{
			color: red; 
			margin-bottom: 10px; 
			border-bottom: 2px solid red;
		}


.nav-right{
	margin-top: 30px;
	margin-left: -20px;
	width: 575px;
	font-size: 13px;
}

.nav-right .box{
	display: flex;
	margin-left: 38px;
}

.box .box-text{
	width: 125px;
	margin-left: 10px;
}

.box>.box-text a{
	text-decoration: none;
}
.box>.box-text>a>b{
	color: black;
}
.box>.box-text>a>b:hover{
	color: #ec407a;
}

.box>.box-text>p>a>span{
	color: black;
}
.box>.box-text>p>a>span:hover{
	color: #ec407a;
}







/* footer{
	position: absolute;
	top: 4480px;
	left: 0px;
	width: 1349px;
	height: 600px;
	margin: 0px auto;
	background-color: #28221b;
	color: white;
	display: flex;
} */

footer{
	position: relative;
	/*top: 4480px;
	left: 0px;*/
/*	margin-left: 200px;*/
	top: 400px;
	width: 1349px;
	height: 560px;
	background-color: #28221b;
	color: white;
	display: flex;
}

footer .left{
	width: 262px;
	margin-left: 96px;
	margin-top: 54px;
	padding-left: 28px;
}


.left .bogoc{
	display: flex;
}

.left .bogoc i{
	padding-right: 10px;
	padding-bottom: 10px;
	color: #ec407a;
}


.left .dky{
	display: flex;
}

.left .dky img{
	padding-left: 20px;
}

.right{

}

footer .right{
	margin-top: 68px;
	margin-left: 40px;
	display: flex;
}

footer .right .time-open {
	padding-left: 20px;
	padding-right: 40px;
	width: 100px;
}

footer .right .time-open-p p{
	padding-bottom: 5px;
}

footer .right .time-open p{
	padding-bottom: 10px;
}

footer .right .time-open h3{
	padding-bottom: 15px;
}

footer .right .time-open .box{
	border-bottom: 2px solid #ec407a;

}

footer .thongTinChung{
	margin-left: 40px;
}

footer .videoHuongDanLamDep{
	margin-left:40px;
}


.footer-bottom{
	position: absolute;
	top: 350px;
	left: 430px;
	display: flex;

}

.footer-bottom i{
	font-size: 50px;
	margin-top: 20px;
	padding-right: 30px;
}

.footer-bt{
	width: 1352px;

	background-color: #212124;
	margin-top: 490px;
	margin-left: -1240px;

	height: 61px;

	display: flex;
	position: relative;
}


.footer-bt .left{
	margin-top: 22.5px;
	width: 658px;
}

.footer-bt .right{
	position: absolute;
	width: 200px;
	top: -45.5px;
	left: 1030px;
}

.footer-bt .right ul{
	list-style: none;
	margin: 0px;
	padding: 0px;
	display: flex;
}

.footer-bt .right ul li a i{
	color: white; 
}

.footer-bt .right ul li a{
	padding: 10px;
}


.main__products-title{
	text-align: center;
}

.horizontal-line {
  border: 1px solid #000; /* Màu và độ dày của đường kẻ */
  margin: 20px 0; /* Khoảng cách trên và dưới đường kẻ */
}

table td{
	text-align: center;
	vertical-align: middle;
}

/* .nav-left .nav-find{
	margin-bottom: 30px;

} */

/* .nav-right{
	margin-bottom: 40px;
} */

.duong-ke {
  width: 100%;
  height: 1px;
  background-color: gainsboro; /* Màu của đường kẻ */
}

</style>