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
	<title>Cart view</title>
	<!-- load font awesome -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />

	<!-- css detail  -->
		<jsp:include page="/WEB-INF/views/user/layout/css_cart_view.jsp"></jsp:include>
	<!-- /css detail -->
	<!-- biến môi trường  -->
		<jsp:include page="/WEB-INF/views/common/variable.jsp"></jsp:include>
	<!-- /biến môi trường -->
	
	<!-- css -->
    <jsp:include page="/WEB-INF/views/user/layout/css.jsp"></jsp:include>
    
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

		<div class="duong-ke"></div>

		<!-- main -->
        <main class="main">
	        <form action="${classpath}/place-order" method="post">
	            <!-- Danh mục sản phẩm -->
	            <div class="main__products">
	                <div class="container">
	                    <div class="main__products-title" style="margin-top:20px;">
	                        <h2>Danh sách sản phẩm</h2>
	                    </div>
	                    
	                   	<div class="page-breadcrumb">
	                    <c:if test="${not empty message }">
							<div class="row">
								
								<div class="col-12" style="margin-bottom: 15px;">
									<h4 align="center"
										class="page-title text-truncate text-dark font-weight-medium mb-1">
										Giỏ hàng của bạn : ${message }</h4>
								</div>
			
							</div>
					
							<div class="row">
								<div class="col-12">
									<div class="card">
										<div class="card-body">
											<div class="row">
												
												<div class="col-12">
													<table id="zero_config"
														class="table table-striped table-bordered no-wrap">
														<thead>
															<tr>
																<th scope="col" class="text-center">No.</th>
																<th scope="col" class="text-center">Image</th> 
																<th scope="col" class="text-center">Product</th>
																<th scope="col" class="text-center">Quantity</th>
																<th scope="col" class="text-center">Price</th>
																<th scope="col" class="text-center">Total</th>
																<th scope="col" class="text-center">Delete</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach var="item" items="${cart.ds_cartproduct}"
																varStatus="loop">
																<tr>
																	<th scope="row">${loop.index + 1 }</th>
																	 <td>
																		<img width="60px" height="60px" src="${classpath}/FileUpload/${item.avatar}" class="zoom-img">
																		
																		
					                                				</td>
																	
																	<td>${item.name }</td>
																	<td align="right">
																		<input type="number" id="quantityProduct" min="1" value="${item.quantity}" />
																		<%-- onclick="deleteToCart(${item.productId});" />  --%>
																		
																	</td>
																	<td align="right"><fmt:formatNumber
																			value="${item.price }" minFractionDigits="0" /></td>
																	<td align="right"><fmt:formatNumber
																			value="${item.price * item.quantity }"
																			minFractionDigits="0" /></td>
																	<td><a href="" onclick="deleteToCart(${item.productId});"
																		role="button" class="btn btn-secondary">Delete</a>
																</tr>
															</c:forEach>
														</tbody>
														<tfoot>
			
														</tfoot>
													</table>
												</div>
												
											</div>
											<div class="row">
												<div class="col-1"></div>
												<div class="col-2"></div>
			
												<div class="col-5">
													<%-- <h4 class="page-title text-truncate text-dark font-weight-medium mb-1">${message }</h4> --%>
												</div>
												<div class="col-4" style="margin-top:20px;">
													<h4
														class="page-title text-truncate text-dark font-weight-medium mb-1">
														Cart Total:
														<fmt:formatNumber value="${totalCartPrice }" minFractionDigits="0"></fmt:formatNumber>
														<span>vnđ</span>
													</h4>
												</div>
												<div class="col-1"></div>
											</div>
			
										</div>
									</div>
								</div>
							</div>
						</c:if>
						<c:if test="${not empty errorMessage }">
							<div class="col-12">
								<h3 align="center"
									class="page-title text-truncate text-dark font-weight-medium mb-1">
									Your cart: ${errorMessage }</h3>
		
							</div>
						</c:if>
					</div>
					
					<hr class="horizontal-line">
					
				<!-- Thong tin khach hang -->
				<div class="page-breadcrumb" style="margin-top:20px;">
					<div class="row">
						<div class="col-12">
							<h2 align="center" class="page-title text-truncate text-dark font-weight-medium mb-1">
								<b>Enter your personal information</b>
							</h2>
						</div>
					</div>
					<div class="row">
						<div class="col-1"></div>
						<div class="col-10">
							<div class="card">
								<div class="card-body">
										<div class="form-body">
											<div class="row">
		
												<div class="col-md-12">
													<div class="form-group mb-4">
														<label for="name">Customer name</label> <input type="text"
															class="form-control" id="txtName" name="txtName"
															placeholder="your name" />
													</div>
												</div>
											</div>
		
											<div class="row">
		
												<div class="col-md-12">
													<div class="form-group mb-4">
														<label for="phone">Customer phone</label> <input type="text"
															class="form-control" id="txtPhone" name="txtPhone"
															placeholder="your phone number" />
													</div>
												</div>
											</div>
		
											<div class="row">
		
												<div class="col-md-12">
													<div class="form-group mb-4">
														<label for="phone">Customer email</label> <input
															type="email" class="form-control" id="txtEmail"
															name="txtEmail" placeholder="your email" />
													</div>
												</div>
											</div>
		
											<div class="row">
		
												<div class="col-md-12">
													<div class="form-group mb-4">
														<label for="phone">Customer address</label> <input
															type="text" class="form-control" id="txtAddress"
															name="txtAddress" placeholder="your address" />
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-md-12">
													<div class="form-group mb-4">
														<a href="${rootpath }/home" class="btn btn-primary active"
															role="button" aria-pressed="true"> Back to shop </a>
														<button type="submit" class="btn btn-primary">Place
															orders</button>
													</div>
												</div>
											</div>
										</div>
								</div>
							</div>
						</div>
						<div class="col-1"></div>
					</div>
				</div>
	                </div>
	            </div>
	            
	     </form>
        </main>
		

		<!-- footer  -->
		<jsp:include page="/WEB-INF/views/customer/layout/footer.jsp"></jsp:include>
		<!-- /footer -->
		
	</div>
	<!-- /wrapper -->
</div>

		<script type="text/javascript">
			deleteToCart = function(productId) {
				
				//var quantity = document.getElementById("quantityProduct").value;
				let data = {
					productId: productId
					//, //lay theo id
					//quantity: quantity
				};
				
			//$ === jQuery
			jQuery.ajax({
				url : "/delete-to-cart/"+productId,
				type : "POST",
				contentType: "application/json",
				data : JSON.stringify(data),
				dataType : "json", //Kieu du lieu tra ve tu controller la json
				
				success : function(jsonResult) {
					/ alert(jsonResult.code + ": " + jsonResult.message); /
					//let totalProducts = jsonResult.totalCartProducts;
					//let totalPrice = jsonResult.totalPriceResult;
					//$(".totalCartProductsId").html(totalProducts);
					//$("#totalPriceInCart").html(totalPrice);
				},
				
				error : function(jqXhr, textStatus, errorMessage) {
					//alert(jsonResult.code + ': Luu thanh cong...!')
				}
				
			});
		}
	</script>

</body>
</html>