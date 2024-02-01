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
	border-bottom: 1px solid gainsboro;
	margin-bottom: 10px;
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
	margin-left: -50px;
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

.box-main{
	display: flex;
	font-size: 14px;
	margin-top: 30px;
}

.box-main .box-main-left{
/* 	height: 600px; */
	width: 300px;
	height: 100%;
	margin-right:5px;
}
 
.box-main .box-main-left ul{
	/* width: 250px; */
	margin: 0px;
	padding: 0px;
	list-style: none;
	margin-left: 87px;
	border: 1px solid #e5e6ec;
}

.box-main-left ul li{
	width: 213px;
	padding: 0px 25px; 
	/* width: 212.5px; */
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
	width: 911px;
}


.box-main-top-left ul{
	margin: 0px;
	padding: 0px;
	list-style: none;
	padding-left: 30px;
	line-height: 54px;
	display: flex;
}

.box-main-top-left ul li{
	padding-right: 30px;
	position: relative;
}

.box-main-top-left ul li a{
	text-decoration: none;
	color: #2f2f33;
	font-weight: bold;
	padding-left: 5px;
}

.box-main-top-left>ul>li>a:hover{
	color: #ec407a;
}

.box-main-top-left ul li>.sub-menu-l{
	margin: 0px;
	padding: 0px;
	list-style: none;
	width: 150px;
	background-color: #ffffff;
	display: none;
	position: absolute;
	top: 54px;
	left: 0px;
}

.box-main-top-left>ul>li:hover .sub-menu-l{
	display: block;
}

.box-main-top-left ul li>.sub-menu-l>li{
	line-height: 40px;

}

.box-main-top-left>ul>li>.sub-menu-l>li>a{
	clear: both;
	padding-left: 10px;
	text-decoration: none;
	color: #2f2f33;
	font-weight: lighter;
}

.box-main-top-left>ul>li>.sub-menu-l>li>a:hover{
	text-decoration: none;
	color: #ec407a;
}

.box-main-top-left .navbar-header .header-right{
	font-size: 13px;
	width: 30%;
}

.box-main-top-left .navbar-header .header-left{
	width: 70%;
	height: 48px;
	background-color: white;
	border-bottom: 1px solid lightgrey;
}

.box-main-top-left .navbar-header .header-left h3{
	padding: 0px;
	margin: 0px;
	margin-left: 30px;
}


.box-main-top-left .navbar-header .header-right a{
	color: gray;
	font-weight: lighter;
}

.box-main-top-left .navbar-header .header-right a{
	color: gray;
	font-weight: lighter;
}

.box-main-top-left .navbar-header .header-right{
	border-bottom: 1px solid lightgrey;
	
	height: 47px;
	background-color: white;
}

.box-main-top-lef{
	background-color: white;
	border-bottom: 1px solid lightgrey;
	
}

.box-main-top-left .navbar-header{
	background: white;
	color: black;
}



.main-content{
	/*position: absolute;
	top: 264px;*/
	width: 911px;	
	margin: 0px auto;
	display: block;
/*	padding-top: 30px;*/
	margin-top: 20px;
}


	
.item{
	width: 220px;
	height: 350px;
	margin-bottom: 20px;
	text-align: center;
}

.item img{
	width: 180px;
	height: 170px;
	border-bottom: 1px solid #e5e6ec;
}

.item-content{
	width: 220px;
	height: 0px;
	text-align: center;
}

.item-content .title-name,a{
	text-decoration: none;
}

.item-content .title-name h4{
	color: #48484c;
	margin-bottom: 10px;
	margin-top: 10px;
	font-size: 15px;
}

.item-content>.title-name>h4:hover{
	color: #ec407a;
}

.gioHang{
	width: 105px;
	line-height: 30px;
	border: 1px solid #ec407a;
	border-radius: 7px;
	margin: 0px 55px;
}

.gioHang>a{
	font-size: 14px;
	color: #ec407a;
	font-weight: bold;
}

.item:hover .gioHang{
	background-color: #ec407a;
}

.item:hover .gioHang>a{
	color: #ffffff;
}

.item:hover{
	box-shadow: rgba(0, 0, 0, 0.07) 0px 1px 1px, rgba(0, 0, 0, 0.07) 0px 2px 2px, rgba(0, 0, 0, 0.07) 0px 4px 4px, rgba(0, 0, 0, 0.07) 0px 8px 8px, rgba(0, 0, 0, 0.07) 0px 16px 16px;
}


.item:hover .item-img{
	opacity: 0.7;
}

.item:hover .giamGia{
	opacity: 0.7;
}


.item{
	position: relative;
}

.giamGia{
	width: 50px;
	line-height: 22px;
	background-color: #e42323;
	color: #ffffff;

	position: absolute;
	top: 0px;
	right: 0px;
}


.box-son .item{
	display: inline-block;
	position: relative;
}

/*box-banner-img*/
.box-banner-img{
	position: absolute;
	top: 658px;
	left: 0px;
	width: 1348px;
	display: flex;
	text-align: center;
}

.box-banner-img div{
	margin-left: 98px;
}

.box-banner-img div img{
	padding: 0px 15px;
}

/*--------/ box banner img*/

.nuochoa{
	position: absolute;
	top: 896px;
	left: 0px;
	width: 1200px;
	margin: 0px 98px;
	margin-top: 47px;
}



.box-nuochoa{
	display: flex;
	margin-left: -10px;
}

.banner-e{	
	position: absolute;
	top: 1346px;
	left: 98px;
}

.tintuc{
	width: 1346px;
	height: 592px;
	position: relative;
	top: 1532px;
	left: -1269.5px;
	margin: 0px;
	padding: 0px ;
	padding-right: 62px;
/*	padding-left: 30px;*/
/*margin-left: -30px;*/
	margin: auto;
	background-color: #f9f4f6;
	text-align: left;
}

.box{
	display: flex;
	padding-left: 98px;
/*	margin-top: 18px;*/
}

.box-tintuc{
	width: 363px;
	height: 373px;
	padding: 9px;
	margin-right: 15px;
	background-color: white;
/*	border: 1px solid lightgray;*/
}


.box-1 img{
	width: 360px;
	height: 183px;
}

.box-1 span{
	display: block;
	padding-bottom: 19px;
	padding-top: 5px;
	color: #ec407a;
}

.box-1 p{
	color: #9b9b9d;
}


.son-2{
	position: absolute;
	top: 2124px;
	width: 1200px;
	margin: 0px 98px;
}

.box-son-2{
	display: flex;
	position: relative;
}


.box-banner-img-2{
	position: absolute;
	top: 2588px;
	left: 0px;
	width: 1348px;
	display: flex;
	text-align: center;
}

.box-banner-img-2 div{
	margin-left: 98px;
}

.box-banner-img-2 div img{
	padding: 0px 15px;
	width: 570px;
	height: 163px;
}

.menu-u{
	position: absolute;
	top: 2771px;
	left: 98px;
}


.box-menu-u ul{
	margin: 0px;
	padding: 0px;

	list-style: none;
	display: flex;

	padding-left: 16px;
	padding-top: 15px;
}


.box-menu-u ul li{
	width: 369px;
	border-bottom: 2px solid #575454;
	margin-right: 31px;

}

.box-menu-u ul li a{
	text-decoration: none;
	font-size: 18px;
	font-weight: bold;
	color: #575454;
}

.box-menu-u>ul>li:hover a{
	color: #ec407a;
}


.timTheo{
	margin-left: 87px;
	border-bottom: 1px solid black;
}

.khoangGia{
	border-width: 0px;
	margin: 0px;
	padding: 0px;
	list-style: none;
}

.box-main .box-main-left .khoangGia{
	border-width: 0px;
	margin: 0px;
	padding: 0px;
	list-style: none;
	margin-left: 87px;
	margin-top: 5px;
}

.box-main .box-main-left .khoangGia li{
	padding: 0px;
	height: 25px;
}

.box-main .box-main-left .khoangGia li a{
	color: gray;
	font-size: 14px;
}

.images{
	margin-left: 87px;
	margin-top: 40px;
}

.images img{

	width: 270px;
	height: 190px;
}

.navigation ul{
	
	margin: 0px;

	padding: 0px;
	list-style: none;
	display: flex;
	margin-top: 10px;
	margin-left: 400px;
	padding-bottom: 40px;
}

.navigation ul li{
}

.navigation ul li a{
	font-size: 15px;
	padding: 10px;
	background-color: lightgrey;
	margin-left: 2px;
	color: black;
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
	/* top: 3800px; */
	width: 1349px;
	height: 560px;
	background-color: #28221b;
	color: white;
	display: flex;
}

footer .left{
	width: 262px;
	margin-left: 96px; 
	margin-top: 0px; 
	padding-left: 28px;
	padding-top: 0px;
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
	margin-top: 70px;
	margin-left: 50px;
	
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

	/* width: 1352px;  */
	position: relative;
	top: 500px;
	left: 0px;
	
	width:100%;
	height: 100%;
	background-color: #212124;
	 margin-top: 490px; 
	 margin-top: 0px; 
	margin-left: -1240px;
	height: 61px; 
	display: flex;
}


.footer-bt .left{
	 margin-top: 20.5px;
	margin-left: 45px;
	 width: 658px; 
}

.footer-bt .right{
	position: absolute;
	width: 200px;
	top: -45px;
	left: 1000px;
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

/* * {
  /* border-radius: 10px;  *//* Đặt giá trị bo tròn theo mong muốn */
  border: 1px solid red;
} */

</style>