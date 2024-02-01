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
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="${classpath}/admin/assets/images/favicon.png">
    <title>Shop</title>
    
    <!-- load font awesome -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
	
	<!-- css detail  -->
		<jsp:include page="/WEB-INF/views/customer/layout/cssshop.jsp"></jsp:include>
	<!-- /css detail -->
	<!-- biến môi trường  -->
		<jsp:include page="/WEB-INF/views/common/variable.jsp"></jsp:include>
	<!-- /biến môi trường -->
	
	<!-- Thêm đường dẫn đến thư viện jQuery từ CDN -->
  	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	
 	<!-- Thêm vào phần đầu của tệp HTML -->
	<!-- CSS của Bootstrap -->
	<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	 -->

</head>
<body>
	<!-- wrapper -->
	<div class="wrapper">
	
		<!-- header  -->
		<jsp:include page="/WEB-INF/views/customer/layout/header.jsp"></jsp:include>
		<!-- /header -->


		<!-- header-bar -->
		<header class="header-bar" style="font-size: 20px; background-color:#ec407a;">
			<div class="header-left">
				<ul>
					<li>
						<a href="${classpath}/home">
							Trang chủ
						</a>
					</li>
					
					<li>
						<a href="#" style=" ">
							<i class="fas fa-angle-right" style="margin:0px 10px;"></i>
							Tất cả sản phẩm
						</a>
					</li>
				</ul>
			</div>
			<div class="header-right">
				
			</div>
		</header>
		<!-- /header-bar -->

		<!-- box-main -->
		<div class="box-main">
		
			<!-- box-main-left -->
			<div class="box-main-left">
				<ul>
					<li style="background-color: #ec407a;border-radius: 5px 5px 0px 0px;" width="250px" height="100px">
						<a href="#" style="font-size:14px; text-decoration: none; color: white; font-weight: bold;">Danh mục sản phẩm
							<i class="fas fa-bars" style="padding-left: 5px; "></i>
						</a>
					</li>
					<c:forEach items="${categorys}" var="category">
						<li class="li-s"><a href="${classpath}/shop/${category.id}">
							<i class="fas fa-chevron-circle-right"></i>
							${category.name }
							</a></li>
					</c:forEach>
				</ul>

				<div class="timTheo" style="margin-top:20px;">
					<h3>Tìm theo</h3>
				</div>

				<ul class="khoangGia">
					<li><a href="#" style="color: black;"><h3><b>Khoảng giá</b></h3></a></li>
					<li><a href="#"><i class="far fa-square"></i> Giá dưới 100.000đ</a></li>
					<li><a href="#"><i class="far fa-square"></i> 100.000đ - 200.000đ</a></li>
					<li><a href="#"><i class="far fa-square"></i> 200.000đ - 300.000đ </a></li>
					<li><a href="#"><i class="far fa-square"></i> 300.000đ - 500.000đ </a></li>
					<li><a href="#"><i class="far fa-square"></i> 500.000đ - 1.000.000đ</a></li>
					<li><a href="#"><i class="far fa-square"></i> Giá trên 1.000.000đ</a></li>
				</ul>


				<ul class="khoangGia">
					<li><a href="#" style="color: black;"><h3><b>Thương hiệu</b></h3></a></li>
					<li><a href="#"><i class="far fa-square"></i> Khác</a></li>
					<li><a href="#"><i class="far fa-square"></i> Marc Jacobs</a></li>
					<li><a href="#"><i class="far fa-square"></i> AHA</a></li>
					<li><a href="#"><i class="far fa-square"></i> YVES SAINT LAURENT</a></li>
					<li><a href="#"><i class="far fa-square"></i> Shiseido</a></li>
					<li><a href="#"><i class="far fa-square"></i> Burberry</a></li>
					<li><a href="#"><i class="far fa-square"></i> bareMinerals</a></li>
					<li><a href="#"><i class="far fa-square"></i> Benefit</a></li>
					<li><a href="#"><i class="far fa-square"></i> Chloé</a></li>
					<li><a href="#"><i class="far fa-square"></i> Make Up for Ever</a></li>
					<li><a href="#"><i class="far fa-square"></i> USA Store Salon</a></li>
				</ul>

				<ul class="khoangGia">
					<li><a href="#" style="color: black;"><h3><b>Màu sắc</b></h3></a></li>
					<li><a href="#"><i class="far fa-square"></i> Vàng</a></li>
					<li><a href="#"><i class="far fa-square"></i> Tím</a></li>
					<li><a href="#"><i class="far fa-square"></i> Đỏ</a></li>
					<li><a href="#"><i class="far fa-square"></i> Xanh</a></li>
					<li><a href="#"><i class="far fa-square"></i> Hồng</a></li>
					<li><a href="#"><i class="far fa-square"></i> Cam</a></li>
				</ul>

				<div class="images">
					<img src="${classpath}/admin/images/bn6.jpg" style="width: 300px; margin-bottom: 20px;">
				</div>
			</div>
			<!-- /box-main-left -->

			<!-- box-main-main -->
			<div class="box-main-top" style="margin-left: 50px;">
				<!-- box-main-top-left -->
				<div class="box-main-top-left" style="margin-left: 20px;">
						<!-- header-navbar -->
					<header class="navbar-header">
							<div class="header-left">
								<h3 style="margin-left: -4px;"><b>Tất cả sản phẩm</b></h3>
							</div>
							
						<div class="header-right" style="margin-right: 50px;">
							<ul>
								<li>
									<a href="#"> Sắp xếp</a>
								</li>
								<li>
									<a href="#" class="he"> Mặc định
										<i class="fas fa-sort-down" style="padding-left: 40px;"></i>
									</a>
								</li>
							</ul>
						</div>
					</header>
					<!-- /header-navbar -->
				</div>
				<!-- /box-main-top-left -->
				<!-- main-content -->
				<div class="main-content">
					<!-- div-son -->
					<div class="son">
						<div class="box-son">
						
						<c:forEach items="${products}" var="product"> 
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
									<span style="font-size:13px; color: #7f7f87;">${product.detailDescription }</span>
									<a class="title-name" href="${classpath }/detail/${product.id}"><h4><b>${product.name }</b></h4></a>
									<span style="font-size: 12px; margin-right: 15px; text-decoration: line-through;">
										<fmt:formatNumber value="${product.price}" minFractionDigits="0"></fmt:formatNumber>
		                                        		
									</span><span style="font-size: 15px; ">
										<fmt:formatNumber value="${product.salePrice }" minFractionDigits="0"></fmt:formatNumber>
		                            </span>
									<div class="gioHang" style="margin-top: 20px; ">
										<a href="#" onclick="addToCart(${product.id}, 1);">
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

					 <!-- <div class="navigation">
						<ul>
							<li><a href="#" style="background: #ec407a; color: white; margin-left: -20px;">1</a></li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#"><i class="fas fa-arrow-right"></i></a></li>
						</ul>
					</div>  -->
					
					<form action="${classpath}/shop" method="get">
						<div class="pagination" style="margin-left:400px; width:50px; height:50px;">
							<div id="paging" style="height:20px;">
		                    </div>
		                    
						</div>
						<!-- <div class="pagination float-right">
							<div id="paging">
							</div>
						</div> -->
						<div>
							<input id="page" name="page" class="form-control"
											value="${productShowViewUser.currentPage }">
							<button id="btnSearch" name="btnSearch" type="submit" class="btn btn-primary">Search</button>
				        </div>
						
					</form>
					
				</div>
			</div>
		</div>

		
		<!-- footer  -->
		<jsp:include page="/WEB-INF/views/customer/layout/footer.jsp"></jsp:include>
		<!-- /footer -->
		
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