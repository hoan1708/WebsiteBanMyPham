<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- directive của JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Detail</title>
	<!-- load font awesome -->
	<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" /> -->
	<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">

	<!-- css detail  -->
		<jsp:include page="/WEB-INF/views/customer/layout/cssdetail.jsp"></jsp:include>
	<!-- /css detail -->
	<!-- biến môi trường  -->
		<jsp:include page="/WEB-INF/views/common/variable.jsp"></jsp:include>
	<!-- /biến môi trường -->
	
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

		<!-- <!-- header-navbar -->
		<!-- <header class="navbar-header">
			<div class="header-left">
				<ul>
					<li>
						<a href="#">
							Trang chủ
						</a>
					</li>
					<li>
						<a href="#" style="padding-left: 23px">
							Giới thiệu

						</a>
					</li>
					<li>
						<a href="#">
							Sản phẩm
							<i class="fas fa-angle-down"></i>
						
						</a>
						
					</li>
					<li>
						<a href="#">
							Tin tức
							<i class="fas fa-angle-down"></i>
						
						</a>
					</li>
					<li>
						<a href="#">
							Liên hệ
						</a>
					</li>
				</ul>
			</div>
			<div class="header-right">
				<ul>
					<li>
						<i class="fas fa-headphones-alt"></i>
						<a href="#"> Hotline:0912117494 </a>
					</li>
				</ul>
			</div>
		</header> -->
		<!-- /header-navbar -->

		<!-- header-bar -->
		<header class="header-bar" style="font-size:20px;">
			<div class="header-left">
				<ul>
					<li>
						<a href="${classpath}/home" >
							Trang chủ
							<i class="fas fa-angle-right" style="padding-left:20px; "></i>
						</a>
					</li>
					<li>
						<a href="#"  >
							${sanPhamChiTiet.category.name} 
							<i class="fas fa-angle-right" style="padding-left:20px;"></i>
						</a>
					</li>
					<li>
						<a href="#" >
							
							<b>${sanPhamChiTiet.name} </b>
						</a>
					</li>
					
				</ul>
			</div>
			<!-- <div class="header-right">
				
			</div> -->
		</header>
		<!-- /header-bar -->

		<!-- box-main -->
		<div class="box-main">
			<!-- box-main-left -->
			<div class="box-main-left">
				<ul>
					<li style="background-color: #ec407a;border-radius: 5px 5px 0px 0px;">
						<a href="#" style="font-size:14px; text-decoration: none; color: white; font-weight: bold;">
							Danh mục sản phẩm
						<i class="fas fa-bars" style="padding-left: 58px; "></i>
						</a>
					</li>
					<c:forEach items="${listCategory}" var="category">
						<li class="li-s">
							<a href="${classpath}/shop/${category.id}" >
								<i class="fas fa-chevron-circle-right"></i>
									${category.name}
							</a>
						</li>
					</c:forEach>
					
				</ul>


				<div class="sanPhamBanChay">
					<h2><b>Sản phẩm tương tự</b></h2>
					<c:forEach items="${listProductByCategory_min8Product}" var="products">
						<div class="product">
							<div class="imgs">
								<img src="${classpath}/FileUpload/${products.avartar}">
							</div>
							<div class="content">
								<p style="color: #2F2F33"><b>${products.name}</b></p>
								<p>
									<span style="color: gray; text-decoration: line-through;">
										<fmt:formatNumber value="${products.price}" minFractionDigits="0"></fmt:formatNumber>vnd
		                            </span>  
									<span style="color: #ec407a;"><b>
										<fmt:formatNumber value="${products.salePrice}" minFractionDigits="0"></fmt:formatNumber> vnd
		                            </b></span></p>
							</div>
						</div>
					</c:forEach>
				</div>

			</div>
			<!-- /box-main-left -->

			<!-- box-main-main -->
			<div class="box-main-top">
				<!-- box-main-top-left -->
				<div class="box-main-top-left" >
					<div class="left">
						<img src="${classpath }/FileUpload/${sanPhamChiTiet.avartar}" style="width:320px; height:300px;">
						<ul>
							<c:forEach items="${listUrlOfProductDetail}" var="listUrl">
								<li style="border: 1px solid red;">
									<img src="${classpath}/FileUpload/${listUrl.path}">
								</li>
							</c:forEach>
							<%-- <li><img src="${classpath}/admin/images/dauGoi2.jpg"></li> --%>
						</ul>
						<div class="giamGia">
							<p style="font-size:18px;">
								<fmt:formatNumber value="${((1- sanPhamChiTiet.salePrice/sanPhamChiTiet.price)*100)}" minFractionDigits="0"></fmt:formatNumber> %
							</p> 
						</div>
					</div>
					<div class="right">
						<div class="box">
							<h1>${sanPhamChiTiet.name}</h1>
							<p>
								<span style="color: gray; text-decoration: line-through; font-size: 16px;">
									<fmt:formatNumber value="${sanPhamChiTiet.price}" minFractionDigits="0"></fmt:formatNumber> vnđ
								</span>  
								<span style="color: #ec407a;font-size: 20px; margin-left: 13px;">
								<b>
									<fmt:formatNumber value="${sanPhamChiTiet.salePrice}" minFractionDigits="0"></fmt:formatNumber> vnđ
								</b></span>
							</p>

							<div class="tinhTrang">
								<p>
									<span><b>Tình trạng:</b></span>
									<span style="${sanPhamChiTiet.status==true?'color: green;':'color: red;'}">${sanPhamChiTiet.status==true?'Còn hàng':'Hết hàng'}</span>
								</p>
								<ul style="color: gray; margin: 0px; margin-left: -20px;">
									<li>Thương hiệu: <b>Khác</b></li>
									<li>Thương hiệu: <b>Khác</b></li>
									<li>Miễn phí vận chuyển</li>
								</ul>
							</div>

							<div class="choVaoGio" style="margin-left:-20px;">
								<div class="cong">
										<span style="margin-bottom: 10px;">Số lượng</span>
										
										<input id="quantityInput" type="number" min="1" value="1" style="width:40px; height:30px;"/>
								</div>
								<!-- <div class="cho">
									<p><b>Cho vào giỏ hàng	</b></p>
								</div> -->
								<div class="gioHang" style="margin-top: 20px; margin-left:-70px;">
										<a href="#" onclick="addToCart(${sanPhamChiTiet.id});" style="text-decoration:none;">
										<!-- <i class="fas fa-shopping-bag"></i> -->
										Thêm sản phẩm
										</a>
								</div>
							</div>
							

							<div class="content">
									<p><b style="color:#2F2F33">Tags: </b>
										<span style="color: gray; padding-left: 20px;">${sanPhamChiTiet.category.name}</span> 
										<!-- <span><b style="color:#2F2F33; padding-left:10px;">Chia sẻ</b></span> -->
									</p>
							</div>
						</div>
					</div>
					
				</div>

				<div class="bottom">
					<div class="sub-menu">
						<ul>
							<li><a href="#" style="color:#2F2F33;" class="ttsp">Thông tin sản phẩm</a></li>
							<li><a href="#">Tab tùy chỉnh</a></li>
						</ul>
					</div>

					<div class="content">
						<p>Sữa tắm Sparkling Citrus Luscious Crush – Victoria’s Secret mang đến sức sống căng tràn và vẻ mịn màng tươi trẻ cho làn da nhờ chiết xuất từ quýt và những loài hoa thơm mê đắm.  Các hạt vitamin C nhẹ nhàng làm sạch và nuôi dưỡng làn da giúp cho làn da mịn màng, mềm mại và không kém phần quyến rũ. Hãy đánh thức vẻ đẹp của làn da bạn ngay từ bây giờ!</p>

						<h4>Công dụng</h4>

						<p>
							- Sữa tắm dạng kem với công thức vượt trội về dưỡng mịn & bổ sung độ ẩm giúp da bạn hấp thụ hiệu quả đa dưỡng chất
							<br/>- Sau khi tắm xong, bạn sẽ cảm nhận được trên da mình được bao bọc và bảo vệ bởi một lớp kem mỏng mịn và mùi hương cực kỳ quyến rũ và nồng nàn lưu lại trên cơ thể.
							<br/>- Đặc biệt là rất thích hợp sử dụng cho làn da khô cần được hồi sinh.
						</p>

						<h4>Hướng dẫn sử dụng</h4>
						<p>Lấy 1 lượng sản phẩm vừa đủ thoa đều lên cơ thể, massage nhẹ nhàng</p>
						<p>Tắm sạch lại với nước</p>

						<h4>Thông tin thương hiệu:</h4>
						<p>Victoria’s Secret là một nhãn hiệu nội y nổi tiếng với show thời trang thường niên luôn thu hút được sự quan tâm của hàng chục triệu người trên toàn thế giới. Dòng mỹ phẩm và nước hoa mang tên Victoria’s Secret cũng đầy gợi cảm như các thiên thần của họ trên sàn catwalk</p>
					</div>
				</div>
				
			</div>
		</div>



		<!-- footer  -->
		<jsp:include page="/WEB-INF/views/customer/layout/footer.jsp"></jsp:include>
		<!-- /footer -->
		
		
		
		<!-- /wrapper -->
	</div>
	
	
	<script type="text/javascript">
			addToCart = function(productId) {
				var quantityInput = document.getElementById("quantityInput").value;
				let data = {
					productId: productId, //lay theo id
					quantity: quantityInput
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