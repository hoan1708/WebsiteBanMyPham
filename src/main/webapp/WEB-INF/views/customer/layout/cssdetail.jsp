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
	width: 100%;
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
	width: 1175px;
	margin: 0px auto;
	background-color: white;
	display: flex;
}

.box-nav .nav-left{
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
	margin-top: 35px;
	/* margin-left: -30px; */
	/* margin-top: 50px; */
	width: 575px;
	font-size: 13px;
}

.nav-right .box{
	display: flex;
	margin-left: 59px;
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


footer{
	position: relative;
	/*top: 4480px;
	left: 0px;*/
/*	margin-left: 200px;*/
	width: 1349px;
	height: 600px;
	background-color: #28221b;
	color: white;
	display: flex;
}

footer .left{
	width: 262px;
	margin-left: 126px;
	margin-top: 54px;
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


.footer-bottom{
	position: absolute;
	top: 350px;
	left: 390px;
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
	margin-top: 540px;
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


footer .thongTinChung{
	margin-left: 40px;
}

footer .videoHuongDanLamDep{
	margin-left: 40px;
}


.navbar-header>.header-right{
	background-color: #ec407a;
}

.navbar-header>.header-left{
	background-color: #ec407a;
}

.navbar-header a{
	font-weight: bold;
}


.navbar-header .header-right{
	font-size: 30px;
}

.header-bar{
	background-color: lightgrey;
}


.header-bar>.header-left{
	background-color: #ec407a;
	font-size: 20px;
}

.header-bar>.header-right{
	background-color: #F8F8F8;
}


.box-main{
	display: flex;
	font-size: 14px;
	margin-top: 30px;
}

.box-main .box-main-left{
/*	height: 600px;*/
}

.box-main .box-main-left ul{
	margin: 0px;
	padding: 0px;
	list-style: none;
	margin-left: 87px;
	border: 1px solid #e5e6ec;
}

.box-main-left ul li{
	padding: 0px 25px;
	width: 212.5px;
	line-height: 48px;
}

.box-main-left ul .li-s a i{
	padding-right: 13px;
}

.box-main-left ul .li-s{
	border-bottom: 1px solid #e5e6ec;
	background-color: #ffffff;
}

.box-main-left ul .li-s a{
	text-decoration: none;
	color: gray;
}

.box-main-left ul .li-s:hover a{
	color: #ec407a;

}


.box-main-top-left{
	margin: 0px;
	padding: 0px;
/*	background-color: #ffffff;*/
	width: 600px;
	background-color: white;
	color: black;
	margin-left: 120px;
}

.box-main-top-left .right{
	margin-left:20px;
}

.box-main .box-main-left .sanPhamBanChay{
	margin-top: 20px;
	border-width: 0px;
	margin-bottom: 30px;
}


.box-main .box-main-left .sanPhamBanChay h2{
	border-bottom: 1px solid lightgrey;
	padding-bottom: 10px;
}

.sanPhamBanChay{
	margin-left: 88px;
}

.sanPhamBanChay .product{
	display: flex;
	margin-bottom: 20px;
}

.sanPhamBanChay .product .imgs img{
	width: 74px;
	height: 74px;
	padding-right: 20px;
	border-right: 1px solid lightgrey;
}

.sanPhamBanChay .product .content{
	width: 145px;
	margin-left: 20px;
	margin-top: -20px;
	font-size: 15px;
}


.box-main-top-left{
	display: flex;
}

.box-main-top-left .left>img{
	
	width: 400px;
	height: 400px;
}

.box-main-top-left .left ul{
	margin: 0px;
	padding: 0px;
	list-style: none;
	display: flex;
}

.box-main-top-left .left li{
	padding: 3px;
	border: 1px solid lightgrey;
	margin-right: 10px;
}

.box-main-top-left .left li img{
	width: 88px;
	height: 88px;
}

.box-main-top-left .left .giamGia {
		width: 50px;
		line-height: 20px;
		background-color: red;
		color: white;
		text-align: center;
		font-size: 13px;

	}

.box-main-top-left .left{
	position: relative;
}

.box-main-top-left .giamGia{
	position: absolute;
	top: 0px;
	right: 20px;
}


.box-main-top-left .right .tinhTrang ul li{
	margin: 10px 0;
}


.choVaoGio .cong{
	width: 205px;
	padding: 0px;
	margin: 0px;
	margin-top: 20px;
}



.choVaoGio{
	display: flex;	
}


.tinhTrang ul{
	padding-bottom: 20px;
	border-bottom: 1px solid lightgrey;
}


.cho{
	width: 156px;
	margin-top: 5px;
	margin-left: 10px;
	padding: 0px;
	background-color: #ec407a;
	color: white;
	text-align: center;
	border-radius: 5px;
	font-size: 13px;
}


.box-main-top .right .content{
	margin-top: 40px;
}

.bottom{
	margin-top: 40px;
	margin-left: 20px;
}

.bottom ul{
	margin: 0px;
	padding: 0px;
	list-style: none;
	display: flex;
}

.bottom ul li{
	padding: 10px;
}

.bottom ul li a{
	text-decoration: none;
	font-size: 14px;
	color: gray;
	font-weight: bold;
}

.bottom .sub-menu{
/*	width: 100%;*/
	border-bottom: 1px solid lightgray;
}

.bottom .content{
	color: gray;
	text-align: justify;
}

.bottom ul>li:hover{
	border-bottom: 2px solid red;
}

.gioHang{
	width: 150px;
	line-height: 40px;
	border: 1px solid #ec407a;
	border-radius: 7px;
	margin: 0px 20px;
	text-align: center;
	text-decoration: none;
	background-color: #ec407a;
}

.gioHang>a{
	font-size: 14px;
	color: white;
	font-weight: bold;
}

/* .choVaoGio .gioHang:hover{
	/* text-decoration: underline; */
	color: #ec407a;
	background-color: #ffffff;
}

.choVaoGio .gioHang>a:hover{
	/* text-decoration: underline; */
	color: black;
} */

/* .choVaoGio .item:hover .gioHang{
	background-color: #ec407a;
}

.choVaoGio  .item:hover .gioHang>a{
	color: #ffffff;
}
 */

























</style>