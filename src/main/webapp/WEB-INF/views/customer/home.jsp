<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- directive của JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>


<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Home</title>
	<!-- load font awesome -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
	<!-- biến môi trường  -->
		<jsp:include page="/WEB-INF/views/common/variable.jsp"></jsp:include>
	<!-- /biến môi trường -->


	<!-- css detail  -->
		<jsp:include page="/WEB-INF/views/customer/layout/csshome.jsp"></jsp:include>
	<!-- /css detail -->
	
	

	<!-- Custome css resource file - css cho trang giao dien admin--> 
	<%-- <jsp:include page="/WEB-INF/views/admin/layout/css.jsp"></jsp:include>   --%>
	
	
	<!-- Thêm đường dẫn đến thư viện jQuery từ CDN -->
	 <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>  
	 
</head>
</head>
<body>
	<!-- wrapper -->
	<div class="wrapper">
		

		<!-- header  -->
		<jsp:include page="/WEB-INF/views/customer/layout/header.jsp"></jsp:include>
		<!-- /header -->


		<!-- box-main -->
		<div class="box-main">
			<!-- box-main-left -->
			<div class="box-main-left">
				<ul>
					<li style="background-color: #ec407a;border-radius: 5px 5px 0px 0px;">
						<a href="#" style="font-size:14px; text-decoration: none; color: white; font-weight: bold;">
							Danh mục sản phẩm
							<i class="fas fa-bars" style="padding-left: 56px; "></i>
						</a>
					</li>
					<c:forEach items="${listCategory}" var="category">
						<li class="li-s">
							<a href="${classpath}/shop/${category.id}">
								<i class="fas fa-chevron-circle-right"></i>
								${category.name}
							</a>
						</li>
					</c:forEach>
				</ul>
			</div>
			<!-- /box-main-left -->

			<!-- box-main-main -->
			<div class="box-main-top">
				<!-- box-main-top-left -->
				<div class="box-main-top-left">
					<ul>
						<li><a href="${classpath}/home" style="color: #ec407a;">Trang chủ</a></li>
						<li><a href="#">Giới thiệu</a></li>

						<li><a href="#">Sản phẩm
							<i class="fas fa-chevron-down"></i></a>
							<ul class="sub-menu-l" style="width:200px;">
								<c:forEach items="${listCategory}"  var="category">
									<li class="li-s" style=" padding:5px 10px; border-bottom: 1px solid black;">
										<a href="${classpath}/shop/${category.id}">
											${category.name}</a>
									</li>
								</c:forEach>
							</ul>	
							<li><a href="#">Tin tức <i class="fas fa-chevron-down"></i></a></a>
								<ul class="sub-menu-l" style=" width:200px;padding:5px 10px; ">
									<li class="li-s" ><a href="#">
									Tin tức làm đẹp</a></li>
									<li class="li-s" ><a href="#">
									Sức khỏe</a></li>
								</ul>
							</li>

						<li><a href="#">Liên hệ</a></li>
					</ul>
				</div>
				<!-- /box-main-top-left -->
				<!-- main-content -->
				<div class="main-content">
					<!-- main-content-left -->
					<div class="main-content-left">
						<img src="${classpath}/admin/images/content-1.jpg">
						<p >Tin tức</p>
						<h2>Những thủ thuật làm đẹp giúp cuộc sống của các cô gái dễ dàng hơn bội phần</h2>
						<div class="ct-contact">
							<p><i class="far fa-user"></i>Admin Shop</p> 
							<p style="padding-left: 19px;"><i class="far fa-clock"></i>28/11/2018</p>
						</div>
						<div class="ct-content">
							<p>Những thủ thuật làm đẹp giúp cuộc sống của các cô gái dễ dàng hơn bội phầnLàm đẹp luôn là một công việc mất thời gian, đòi hỏi sự tỉ mỉ và tính kiên nhẫn rất cao. May mắn thay, có một số bí kíp có thể rút ngắn được thời gian dành cho công cuộc chă...</p>
						</div>
					</div>
					<!-- /main-content-left -->

					<!-- main-content-right -->
					<div class="main-content-right">
						<ul>
							<li><img src="${classpath}/admin/images/ctr-1.jpg"  align="left">
								<p>Công dụng của dầu oliu trong làm đẹp không ...</p>
								<p><i class="far fa-clock"></i> 28/11/2018</p>
							</li>
							<li><img src="${classpath}/admin/images/ctr-2.jpg"  align="left">
								<p>Tóc mượt như đi dưỡng spa với cách ...</p>
								<p><i class="far fa-clock"></i> 28/11/2018</p>
							</li>
							<li><img src="${classpath}/admin/images/ctr-3.jpg"  align="left">
								<p>Học lỏm bí quyết dưỡng trắng da...</p>
								<p><i class="far fa-clock"></i> 28/11/2018</p>
							</li>
							<li><img src="${classpath}/admin/images/ctr-4.jpg"  align="left">
								<p>9 loại thực phẩm đốt mỡ thừa trên cơ thể ...</p>
								<p><i class="far fa-clock"></i> 28/11/2018</p>
							</li>
							<li><img src="${classpath}/admin/images/ctr-5.jpg"  align="left">
								<p>Top 5 mascara giá hạt rẻ cho chị em...</p>
								<p><i class="far fa-clock"></i> 28/11/2018</p>
							</li>
							<li><img src="${classpath}/admin/images/ctr-6.jpg"  align="left">
								<p>Những thủ thuật làm đẹp trong cuộc...</p>
								<p><i class="far fa-clock"></i> 28/11/2018</p>
							</li>
						</ul>
					</div>
				</div>
					<!-- /main-content-right -->
				</div>
				<!-- /main-content -->

				<!-- box-main-right -->
			<div class="box-main-right">
				<!-- hotline -->
				<div class="hotline">
						<i class="fas fa-headphones" style="font-size: 40px; color: #ec407a; padding-right: 12px;"></i>
						<h2>Hotline:0912117494</h2>

				</div>
				<!-- /hotline -->
			</div>
			<!-- /box-main-right -->

			</div>
			<!-- /box-main-main -->


			<!-- banner-loaiSP -->
			<div class="banner-loaiSP">
				<!-- bn-conA -->
				<div class="bn-conA">
				
						<!-- bn-img -->
						<div class="bn-img">
							<a href="#">
								<div><img src="${classpath}/admin/images/bn1.jpg"></div>
								<div class="bn-txt"><p>Sơn móng tay</p></div>
							</a>
						</div>
						<!-- /bn-img -->

						 <!-- bn-img -->
						<div class="bn-img">
							<div><img src="${classpath}/admin/images/bn2.jpg"></div>
							<div class="bn-txt"><p>Son môi</p></div>
						</div>
						<!-- /bn-img -->

						<!-- bn-img -->
						<div class="bn-img">
							<div><img src="${classpath}/admin/images/bn3.jpg"></div>
							<div class="bn-txt"><p>Chăm sóc cơ thể</p></div>
						</div>
						<!-- /bn-img -->

						<!-- bn-img -->
						<div class="bn-img">
							<div><img src="${classpath}/admin/images/bn4.jpg"></div>
							<div class="bn-txt"><p>Trang điểm</p></div>
						</div>
						<!-- /bn-img -->


						<!-- bn-img -->
						<div class="bn-img">
							<div><img src="${classpath}/admin/images/bn5.jpg"></div>
							<div class="bn-txt"><p>Phụ kiện</p></div>
						</div>
						<!-- /bn-img -->
				</div>
				<!-- /bn-conA -->
				<img src="${classpath}/admin/images/bn6.jpg" style="padding-left: 70px;">

			<!-- div-son -->
			<div class="son">
				<h2>Son môi</h2>
				<div class="box-son">
				 <c:forEach items="${products5sonMois}" var="product">
					<!-- item -->
					<div class="item">
						<!-- item-img -->
						<div class="item-img">
							<img src="${classpath }/FileUpload/${product.avartar}">
						</div>
						<!-- /item-img -->
						<!-- giamGia -->
						<!-- <div class="giamGia">
							<span>-7%</span>
						</div> -->
						<!-- /giamGia -->
						
						<!-- item-content -->
						<div class="item-content" style="padding-top: 10px;">
							<span style="font-size:13px; color: #7f7f87;">${product.shortDescription }</span>
							<a class="title-name" href="${classpath}/detail/${product.id}"><h4>${product.name }</h4></a>
							<span style="font-size: 12px; margin-right: 15px; text-decoration: line-through;">
								<fmt:formatNumber value="${product.price}" minFractionDigits="0"></fmt:formatNumber>vnđ
		                   </span><span style="font-size: 15px; ">
		                   		<fmt:formatNumber value="${product.salePrice }" minFractionDigits="0"></fmt:formatNumber>vnđ
		                   </span>
							<div class="gioHang" style="margin-top: 20px; ">
								<a href="#" onclick="addToCart(${product.id},1);">
								<i class="fas fa-shopping-bag"></i>
								Giỏ hàng
								</a>
							</div>
						</div>
						<!-- /item-content -->
					</div>
					<!-- /item -->
				</c:forEach>
					
				</div>
			</div>
			<!-- /div-son -->


			<!-- box-banner-img -->
			<div class="box-banner-img">
				<div>
					<img src="${classpath}/admin/images/bn-i1.jpg">
					<img src="${classpath}/admin/images/bn-i2.jpg">
				</div>
			</div>
			<!-- /box-banner-img -->


			<!-- nuochoa -->
			<div class="nuochoa">
				<!-- title -->
				<div class="title">
					<h3>Chăm sóc toàn thân</h3>
				</div>
				<!-- /title -->
				<!-- box-nuochoa -->
				<div class="box-nuochoa">
				
				<c:forEach items="${products5kemDuongDa}" var="product">
					<!-- item -->
						<div class="item">
							<!-- item-img -->
							<div class="item-img">
								<c:if test="${product.avartar!=null}">
	                      			<img src="${classpath }/FileUpload/${product.avartar}" class="light-logo">
	               				</c:if>
							</div>
							<!-- /item-img -->
							<!-- giamGia -->
							<!-- <div class="giamGia">
								<span>-9%</span>
							</div> -->
							<!-- /giamGia -->
							
							<!-- item-content -->
							<div class="item-content" style="padding-top: 10px;">
								<span style="font-size:13px; color: #7f7f87;">${product.shortDescription}</span>
								<a class="title-name" href="${classpath}/detail/${product.id}"><h4>${product.name }</h4></a>
								<span style="font-size: 12px; margin-right: 15px; text-decoration: line-through;">
									<fmt:formatNumber value="${product.price}" minFractionDigits="0"></fmt:formatNumber>
		                        </span><span style="font-size: 15px; ">
		                        	<fmt:formatNumber value="${product.salePrice}" minFractionDigits="0"></fmt:formatNumber>
		                        </span>
								<div class="gioHang" style="margin-top: 10px; margin-bottom:10px; ">
									
									<a href="#" onclick="addToCart(${product.id},1);">
									<i class="fas fa-shopping-bag"></i>
									Giỏ hàng
									</a>
								</div>
							</div>
							<!-- /item-content -->
						</div>
						<!-- /item -->
					</c:forEach>

				</div>
				<!-- /box-nuochoa -->
			</div>
			<!-- /nuochoa -->

			<!-- banner-e -->
			<div class="banner-e">
				<img src="${classpath}/admin/images/bn-e.jpg">
			</div>
			<!-- /banner-e -->

			<!-- tintuc -->
			<div class="tintuc">
				<h2 style="text-align: center; display:block; margin-left: 90px; margin-top: 60px;"><i>Tin tức</i></h2>
				<!-- box -->
				<div class="box">
					<!-- box-tintuc -->
				<div class="box-tintuc">
					<div class="box-1">
						<img src="${classpath}/admin/images/content-1.jpg" id="anhNenTinTuc">
						<span>Tin tức</span>
						<b>Những thủ thuật làm đẹp giúp cuộc sống của các..</b>
						<p>
							Những thủ thuật làm đẹp giúp cuộc sống của các cô gái dễ dàng hơn bội phần. Làm đẹp luôn là công việc mất thời gian, đòi hỏi sự tỉ mỉ và tính kiên nhẫn cao. May mắn...
						</p>
					</div>
				</div>
				<!-- /box-tintuc -->

				<!-- box-tintuc -->
				<div class="box-tintuc">
					<div class="box-1">
						<img src="${classpath}/admin/images/ctr-1.jpg">
						<span>Tin tức</span>
						<b>Những thủ thuật làm đẹp giúp cuộc sống của các..</b>
						<p>
							Những thủ thuật làm đẹp giúp cuộc sống của các cô gái dễ dàng hơn bội phần. Làm đẹp luôn là công việc mất thời gian, đòi hỏi sự tỉ mỉ và tính kiên nhẫn cao. May mắn...
						</p>
					</div>
				</div>
				<!-- /box-tintuc -->

				<!-- box-tintuc -->
				<div class="box-tintuc">
					<div class="box-1">
						<img src="${classpath}/admin/images/ctr-2.jpg">
						<span>Tin tức</span>
						<b>Những thủ thuật làm đẹp giúp cuộc sống của các..</b>
						<p>
							Những thủ thuật làm đẹp giúp cuộc sống của các cô gái dễ dàng hơn bội phần. Làm đẹp luôn là công việc mất thời gian, đòi hỏi sự tỉ mỉ và tính kiên nhẫn cao. May mắn...
						</p>
					</div>
				</div>
				<!-- /box-tintuc -->
				</div>
				<!-- /box -->
			</div>
			<!-- /tintuc -->


			<!-- div-son -->
			<div class="son-2">
				<h2>Son môi</h2>
				<div class="box-son-2">
					 <c:forEach items="${products5sonMois}" var="product">
						<!-- item -->
						<div class="item">
							<!-- item-img -->
							<div class="item-img">
								<img src="${classpath }/FileUpload/${product.avartar}">
							</div>
							<!-- /item-img -->
							<!-- giamGia -->
							<!-- <div class="giamGia">
								<span>-7%</span>
							</div> -->
							<!-- /giamGia -->
							
							<!-- item-content -->
							<div class="item-content" style="padding-top: 10px;">
								<span style="font-size:13px; color: #7f7f87;">${product.shortDescription }</span>
								<a class="title-name" href="${classpath}/detail/${product.id}"><h4>${product.name }</h4></a>
								<span style="font-size: 12px; margin-right: 15px; text-decoration: line-through;">
									<fmt:formatNumber value="${product.price}" minFractionDigits="0"></fmt:formatNumber>vnđ
			                   </span><span style="font-size: 15px; ">
			                   		<fmt:formatNumber value="${product.salePrice }" minFractionDigits="0"></fmt:formatNumber>vnđ
			                   </span>
								<div class="gioHang" style="margin-top: 20px; ">
									<a href="#" onclick="addToCart(${product.id},1);">
										<i class="fas fa-shopping-bag"></i>
										Giỏ hàng
									</a>
								</div>
							</div>
							<!-- /item-content -->
						</div>
						<!-- /item -->
					</c:forEach>
				</div>
			</div>
			<!-- /div-son-2 -->


			<!-- box-banner-img-2 -->
			<div class="box-banner-img-2" style="width:1349px;">
				<div>
					<img src="${classpath}/admin/images/bnt-1.jpg">
					<img src="${classpath}/admin/images/bnt-2.jpg">
				</div>
			</div>
			<!-- /box-banner-img-2 -->
			
			<!-- div-menu-u -->
			<div class="menu-u">
				<div class="box-menu-u">
					<ul>
						<li><a href="#">Sản phẩm bán chạy </a></li>
						<li><a href="#">Sản phẩm mới nhất </a></li>
						<li><a href="#">Xem nhiều nhất</a></li>
					</ul>

					<!-- any-sp -->
					<div class="any-sp">
						<!-- sp1 -->
						<div class="sp1">
							<!-- box-anysp -->
						<div class="box-anysp">
							<img src="${classpath}/admin/images/s1.jpg">
							<!-- sp -->
							<div class="sp">
									<p style="font-weight: bold; color: #48484c; font-size: 15px; ">Son màu maybelline <br/> Bitten 3.9g</p>
									<p><span style="font-size:13px; text-decoration: line-through; color: #76767e; padding-right: 15px;">150.000đ</span><span style="color: #ec407a;font-weight: bold;color: ec407a;">140.000đ</span></p>
							</div>
							<!-- /sp -->
						</div>
						<!-- /box-anysp -->

						<!-- box-anysp -->
						<div class="box-anysp">
							<img src="${classpath}/admin/images/i2.jpg">
							<!-- sp -->
							<div class="sp">
									<p style="font-weight: bold; color: #48484c; font-size: 15px; ">Son màu maybelline <br/> Bitten 3.9g</p>
									<p><span style="font-size:13px; text-decoration: line-through; color: #76767e; padding-right: 15px;">150.000đ</span><span style="color: #ec407a;font-weight: bold;color: ec407a;">140.000đ</span></p>
							</div>
							<!-- /sp -->
						</div>
						<!-- /box-anysp -->

						<!-- box-anysp -->
						<div class="box-anysp">
							<img src="${classpath}/admin/images/i3.jpg">
							<!-- sp -->
							<div class="sp">
									<p style="font-weight: bold; color: #48484c; font-size: 15px; ">Son màu maybelline <br/> Bitten 3.9g</p>
									<p><span style="font-size:13px; text-decoration: line-through; color: #76767e; padding-right: 15px;">150.000đ</span><span style="color: #ec407a;font-weight: bold;color: ec407a;">140.000đ</span></p>
							</div>
							<!-- /sp -->
						</div>
						<!-- /box-anysp -->
						</div>
						<!-- sp1 -->


						<!-- sp1 -->
						<div class="sp1">
							<!-- box-anysp -->
						<div class="box-anysp">
							<img src="${classpath}/admin/images/i4.jpg">
							<!-- sp -->
							<div class="sp">
									<p style="font-weight: bold; color: #48484c; font-size: 15px; ">Son màu maybelline <br/> Bitten 3.9g</p>
									<p><span style="font-size:13px; text-decoration: line-through; color: #76767e; padding-right: 15px;">150.000đ</span><span style="color: #ec407a;font-weight: bold;color: ec407a;">140.000đ</span></p>
							</div>
							<!-- /sp -->
						</div>
						<!-- /box-anysp -->

						<!-- box-anysp -->
						<div class="box-anysp">
							<img src="${classpath}/admin/images/i5.jpg">
							<!-- sp -->
							<div class="sp">
									<p style="font-weight: bold; color: #48484c; font-size: 15px; ">Son màu maybelline <br/> Bitten 3.9g</p>
									<p><span style="font-size:13px; text-decoration: line-through; color: #76767e; padding-right: 15px;">150.000đ</span><span style="color: #ec407a;font-weight: bold;color: ec407a;">140.000đ</span></p>
							</div>
							<!-- /sp -->
						</div>
						<!-- /box-anysp -->

						<!-- box-anysp -->
						<div class="box-anysp">
							<img src="${classpath}/admin/images/i6.jpg">
							<!-- sp -->
							<div class="sp">
									<p style="font-weight: bold; color: #48484c; font-size: 15px; ">Son màu maybelline <br/> Bitten 3.9g</p>
									<p><span style="font-size:13px; text-decoration: line-through; color: #76767e; padding-right: 15px;">150.000đ</span><span style="color: #ec407a;font-weight: bold;color: ec407a;">140.000đ</span></p>
							</div>
							<!-- /sp -->
						</div>
						<!-- /box-anysp -->
						</div>
						<!-- sp1 -->


						<!-- sp1 -->
						<div class="sp1">
							<!-- box-anysp -->
						<div class="box-anysp">
							<img src="${classpath}/admin/images/i7.jpg">
							<!-- sp -->
							<div class="sp">
									<p style="font-weight: bold; color: #48484c; font-size: 15px; ">Son màu maybelline <br/> Bitten 3.9g</p>
									<p><span style="font-size:13px; text-decoration: line-through; color: #76767e; padding-right: 15px;">150.000đ</span><span style="color: #ec407a;font-weight: bold;color: ec407a;">140.000đ</span></p>
							</div>
							<!-- /sp -->
						</div>
						<!-- /box-anysp -->

						<!-- box-anysp -->
						<div class="box-anysp">
							<img src="${classpath}/admin/images/i8.jpg">
							<!-- sp -->
							<div class="sp">
									<p style="font-weight: bold; color: #48484c; font-size: 15px; ">Son màu maybelline <br/> Bitten 3.9g</p>
									<p><span style="font-size:13px; text-decoration: line-through; color: #76767e; padding-right: 15px;">150.000đ</span><span style="color: #ec407a;font-weight: bold;color: ec407a;">140.000đ</span></p>
							</div>
							<!-- /sp -->
						</div>
						<!-- /box-anysp -->

						<!-- box-anysp -->
						<div class="box-anysp">
							<img src="${classpath}/admin/images/i9.jpg">
							<!-- sp -->
							<div class="sp">
									<p style="font-weight: bold; color: #48484c; font-size: 15px; ">Son màu maybelline <br/> Bitten 3.9g</p>
									<p><span style="font-size:13px; text-decoration: line-through; color: #76767e; padding-right: 15px;">150.000đ</span><span style="color: #ec407a;font-weight: bold;color: ec407a;">140.000đ</span></p>
							</div>
							<!-- /sp -->
						</div>
						<!-- /box-anysp -->
						</div>
						<!-- sp1 -->

					</div>
					<!-- /any-sp -->
				</div>

				<div class="tinhnang">
					<div class="box">
						<i class="fas fa-shuttle-van" style="font-size:40px; color: #ec407a; padding-right: 20px;"></i>
						<div class="text">
							<span style="color: black; font-size: 16px; font-weight: bold;">Miễn phí vận chuyển</span>
							<p style="font-size:14px;">Cho đơn hàng từ 500k</p>
						</div>
					</div>

					<div class="box">
						<i class="fas fa-sync-alt" style="font-size:40px; color: #ec407a; padding-right: 20px;"></i>
						<div class="text">
							<span style="color: black; font-size: 16px; font-weight: bold;">Miễn phí vận chuyển</span>
							<p style="font-size:14px;">Cho đơn hàng từ 500k</p>
						</div>
					</div>

					<div class="box">
						<i class="fas fa-headphones-alt" style="font-size:40px; color: #ec407a; padding-right: 20px;"></i>
						<div class="text">
							<span style="color: black; font-size: 16px; font-weight: bold;">Miễn phí vận chuyển</span>
							<p style="font-size:14px;">Cho đơn hàng từ 500k</p>
						</div>
					</div>

					<div class="box">
						<i class="fas fa-shield-alt" style="font-size:40px; color: #ec407a; padding-right: 20px;"></i>
						<div class="text" style="border-right-width: 0px;">
							<span style="color: black; font-size: 16px; font-weight: bold;">Miễn phí vận chuyển</span>
							<p style="font-size:14px;">Cho đơn hàng từ 500k</p>
						</div>
					</div>
				</div>
			</div>
			<!-- /div-menu-u -->
			
			</div>
			<!-- /banner-loaiSP -->


		<!-- footer  -->
		<jsp:include page="/WEB-INF/views/customer/layout/footer.jsp"></jsp:include>
		<!-- /footer -->
		</div>
		</div>
		<!-- /box-main -->
		
		
	<!-- /wrapper -->
</div>

	<script type="text/javascript">
			addToCart = function(productId, quantity) {
				let data = {
					productId: productId, //lay theo id
					quantity: quantity
				};
				
			//$ === jQuery
			jQuery.ajax({
				url : "/add-to-cart",
				type : "POST",
				contentType: "application/json",
				data : JSON.stringify(data),
				dataType : "json", //Kieu du lieu tra ve tu controller la json
				
				success : function(jsonResult) {
					/ alert(jsonResult.code + ": " + jsonResult.message); /
					let totalProducts = jsonResult.totalCartProducts;
					let totalPrice = jsonResult.totalPriceResult;
					$(".totalCartProductsId").html(totalProducts);
					$("#totalPriceInCart").html(totalPrice);
				},
				
				error : function(jqXhr, textStatus, errorMessage) {
					//alert(jsonResult.code + ': Luu thanh cong...!')
				}
				
			});
		}
	</script>

</body>
</html>