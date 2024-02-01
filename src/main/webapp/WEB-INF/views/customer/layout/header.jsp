<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<!-- header -->
		<header>
			<div class="header-left">
				<ul>
					<li>
						<a href="#">
						<i class="fas fa-headphones-alt"></i>
							Hotline:0912117494
						</a>
					</li>
					<li>
						<a href="#" style="padding-left: 23px">
						<i class="far fa-envelope"></i>
							Email:dualeotheme@gmail.com
						</a>
					</li>
				</ul>
			</div>
			<div class="header-right">
				<ul>
					<li>
						<i class="fas fa-map-marker-alt"></i>
						<a href="#"> Địa điểm các cửa hàng </a>
						<i class="fas fa-angle-down"></i>
					</li>
				</ul>
			</div>
		</header>
		<!-- /header -->



		<!-- box-nav -->
		<div class="box-nav">
			<!-- nav-left -->
			<div class="nav-left">
				<!-- nav-logo -->
				<div class="nav-logo">
					<img src="${classpath}/admin/images/logo.jpg">
				</div>
				<!-- /nav-logo -->
				
				<!-- nav-find -->
				<div class="nav-find">
					<!-- nav-find-menu -->
					<ul class="nav-find-menu">
						<li class="li-chonDanhMuc" style=" width: 200px; height: 42px; background-color: #F7F8FC; "> 
							<a href="#" style="padding-left: 20px; padding-right: 35px; color: #76767E; ">
								Chọn danh mục
								<!-- <i class="fas fa-sort-down" style="width: 8px; height: 4px; color: black; margin-top:-100px; "></i> --> 
							</a> 
							
							
							<!-- sub-menu -->
							<ul class="sub-menu">
								<li><a href="#">Mặt nạ ngủ</a></li>
								<li><a href="#">Mặt nạ gel</a></li>
								<li><a href="#">Mặt nạ bột</a></li>
								<li><a href="#">Mặt nạ ngủ</a></li>
								<li><a href="#">Mặt nạ gel</a></li>
								<li><a href="#">Mặt nạ bột</a></li>
								<li><a href="#">Mặt nạ ngủ</a></li>
								<li><a href="#">Mặt nạ gel</a></li>
								<li><a href="#">Mặt nạ bột</a></li>
							</ul>
							<!-- /sub-menu -->
						</li>
						<li style="width: 286px; margin-left:15px; color: #d4c4d1;">Tìm kiếm sản phẩm</li>
						<li style="background-color: #ec407a; width: 90px; text-align: center; font-weight: bold;"><a href="#" style="color: #fbedff; ">Tìm kiếm</a></li>
					</ul>
					<!-- /nav-find-menu -->
				</div>
				<!-- /nav-find -->
			</div>
			<!-- /nav-left -->

			<!-- nav-right -->
			<div class="nav-right" >
				<!-- box -->
				<div class="box">
					<!-- icon -->
					<div class="icon">
						<a href="${classpath}/cart-view" style="text-decoration:none; color: black;">
							<i class="fas fa-briefcase" style="font-size: 25px; margin-top: 10px;"></i>
						</a>
					</div>
					<!-- /icon -->
					<!-- box-text -->
					<div class="box-text">
							<a href="#">
								<span class = "totalCartProductsId" class="header__bottom-num"
									style="background:red;color:white;border-radius:40px; font-weight:bold;font-size:15px; 
												margin-left:-14px;margin-top:10px; padding: 5px;">
										${totalCartProducts }
								</span>
								<b style="margin-left:20px;">Giỏ hàng</b>
								   <div style="margin-left: 20px; margin-top:-5px;">
									    <p class = "totalCartProductsId" style="color: red;display: inline-block; margin-top: 8px;">
											${totalCartProducts}
										</p>
										<span style="inline-block; color: black;">sản phẩm - </span>
									</div>
									<div style="margin-left: 10px; margin-top:-13px;" >
									    <p id = "totalPriceInCart" style="color: red;display: inline-block; margin-top: 8px;">
											<fmt:formatNumber value="${totalPriceResult}" minFractionDigits="0"></fmt:formatNumber>
										</p>
										<span style="display: inline-block; color: black;"> vnd</span>
									</div>
									
							</a>
					</div>
					<!-- /box-text -->

					<!-- icon -->
					<div class="icon" style="margin-left: 32px;">
						<i class="far fa-user" style="font-size: 25px; margin-top: 4px;"></i>
					</div>
					<!-- /icon -->
					
					<!-- box-text -->
					<div class="box-text">
							<a href="#">
								<b>Đăng ký</b>
							</a>
							<p style="color: #e5e6ec;display: block; margin-top: 8px;">hoặc 
								<a href="#">
									<span>đăng nhập</span>
								</a>
							</p>
					</div>
					<!-- /box-text -->
				</div>
				<!-- /box -->

			</div>
			<!-- /nav-right -->
		</div>
		<!-- /box-nav -->