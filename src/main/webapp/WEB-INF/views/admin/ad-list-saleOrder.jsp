<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- directive của JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html dir="ltr" lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- Tell the browser to be responsive to screen width -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="${classpath}/admin/assets/images/favicon.png">
<title>${projectTittle }</title>


<!-- variables -->
<jsp:include page="/WEB-INF/views/common/variable.jsp"></jsp:include>

<!-- Custome css resource file -->
<jsp:include page="/WEB-INF/views/admin/layout/css.jsp"></jsp:include>

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
</head>

<body>

	<c:set var="currentPage" value="${currentPage }" scope="session"></c:set>
	<c:set var="totalPage" value="${totalPage }" scope="session"></c:set>

	<!-- End test -->
	<!-- ============================================================== -->
	<!-- Preloader - style you can find in spinners.css -->
	<!-- ============================================================== -->

	<!-- ============================================================== -->
	<!-- Main wrapper - style you can find in pages.scss -->
	<!-- ============================================================== -->
	<div id="main-wrapper" data-theme="light" data-layout="vertical"
		data-navbarbg="skin6" data-sidebartype="full"
		data-sidebar-position="fixed" data-header-position="fixed"
		data-boxed-layout="full">

		<!-- Topbar header - style you can find in pages.scss -->
		<jsp:include page="/WEB-INF/views/admin/layout/header.jsp"></jsp:include>
		<!-- End Topbar header -->

		<!-- Left Sidebar - style you can find in sidebar.scss  -->
		<jsp:include page="/WEB-INF/views/admin/layout/menuleft.jsp"></jsp:include>
		<!-- End Left Sidebar - style you can find in sidebar.scss  -->

		<!-- Page wrapper  -->
		<!-- ============================================================== -->
		<div class="page-wrapper">
			<!-- ============================================================== -->
			<!-- Bread crumb and right sidebar toggle -->
			<!-- ============================================================== -->
			<div class="page-breadcrumb">
				<div class="row">
					<div class="col-7 align-self-center">
						<h4
							class="page-title text-truncate text-dark font-weight-medium mb-1">Ticket
							List</h4>
						<div class="d-flex align-items-center">
							<nav aria-label="breadcrumb">
								<ol class="breadcrumb m-0 p-0">
									<li class="breadcrumb-item"><a href="index.html"
										class="text-muted">Apps</a></li>
									<li class="breadcrumb-item text-muted active"
										aria-current="page">Ticket List</li>
								</ol>
							</nav>
						</div>
					</div>
					<div class="col-5 align-self-center">
						<div class="customize-input float-right">
							<select
								class="custom-select custom-select-set form-control bg-white border-0 custom-shadow custom-radius">
								<option selected>Aug 19</option>
								<option value="1">July 19</option>
								<option value="2">Jun 19</option>
							</select>
						</div>
					</div>
				</div>
			</div>
			<!-- ============================================================== -->
			<!-- End Bread crumb and right sidebar toggle -->
			<!-- ============================================================== -->
			<!-- ============================================================== -->
			<!-- Container fluid  -->
			<!-- ============================================================== -->
			<div class="container-fluid">
				<!-- ============================================================== -->
				<!-- Start Page Content -->
				<!-- ============================================================== -->
				<!-- basic table -->
				<div class="row">
					<div class="col-12">
						<div class="card">
							<div class="card-body">
								<form action="${classpath }/manager/list-saleOrder"
									method="get">
									<div class="table-responsive">

										<div class="row">
											<div class="col-md-12">
												<h2 style="color: black; margin-bottom: 30px;">
													<b>Order Checking</b>
												</h2>
											</div>
											

											<div class="col-md-12">
												<div class="row g-3 align-items-center">

													<div class="col-auto d-flex">

														<div class="form-group mb-4">
															<label for="createdate">From date: </label> <input
																class="form-control" type="date" id="beginDate"
																name="beginDate" />
														</div>
														<div class="form-group mb-4" style="margin-left: 10px;">
															<label for="createdate">To date:</label> <input
																class="form-control" type="date" id="endDate"
																name="endDate" />
														</div>
														<div class="form-group mb-4" style="margin-left: 10px;">
															<label for="createdate">Keyword: </label> <input
																class="form-control" type="text" id="keyword"
																name="keyword" placeholder="Enter keyword to search" />
														</div>

														<div class="form-group mb-4" style="margin-left: 10px;">
															<label>Status: </label> 
															<select class="form-control" name="status" id="status"
																aria-label="Default select example">
																<option value="2">Tất cả</option>
																<option value="0">Chưa giao hàng</option>
																<option value="1">Đã giao hàng</option>
															</select>
														</div>
														<div class="form-group mb-4"
															style="margin-left: 10px; margin-top: 32px;">

															<button id="btnSearch" name="btnSearch" class="btn btn-primary">Search</button>
														</div>
														<div style="margin-top:31px; margin-left:10px;">
															<input id="page" name="page" class="form-control"
																value="${saleOrderSearch.currentPage }">
														</div>

													</div>
												</div>
											</div>
										</div>

										<table id="zero_config"
											class="table table-striped table-bordered no-wrap">
											<thead>
												<tr>

													<th scope="col">STT</th>
													<th scope="col">Code</th>
													<th scope="col">Customer name</th>
													<th scope="col">Phone number</th>
													<th scope="col">Address</th>
													<th scope="col">Total price</th>
													<th scope="col">Create by</th>
													<th scope="col">Create date</th>
													<th scope="col">Delivery Date</th>
													<th scope="col">Status</th>
													<th scope="col">Edit</th>
												</tr>

											</thead>
											<tbody>
												<c:forEach var="saleOrder" items="${ds_saleOrder }"
													varStatus="loop">
													<tr>
														<td>${loop.index + 1 }</td>
														<td>${saleOrder.code }</td>
														<td>${saleOrder.customer_name }</td>
														<td>${saleOrder.customer_mobile }</td>
														<td>${saleOrder.customer_address }</td>
														<td>${saleOrder.total }</td>
														
														<c:forEach var="user" items="${users}" varStatus="status">
														  <c:if test="${user.id==saleOrder.createBy}">
														    <td>${user.username }</td>
														  </c:if>
														</c:forEach>
														
															
			                                        	<c:forEach var="user" items="${users}" varStatus="status">
														  <c:if test="${user.id==saleOrder.updateBy}">
														    <td>${user.username }</td>
														  </c:if>
														</c:forEach>
			                                        	
														
														<td><fmt:formatDate value="${saleOrder.createDate}"
																pattern="dd-MM-yyyy" /></td>
														<td><fmt:formatDate value="${saleOrder.updateDate }"
																pattern="dd-MM-yyyy" /></td>
														<td>${saleOrder.status==true?"Đã giao hàng":"Chưa giao hàng"}</td>
														<td>
															<a href="${classpath }/manager/showEditSaleOrder/${saleOrder.id }"
															role="button" class="btn btn-success">Edit</a> 
															
														</td>
													</tr>
												</c:forEach>
											</tbody>
											<tfoot>
												<tr>
													<th scope="col">STT</th>
													<th scope="col">ID Sale order</th>
													<th scope="col">Product name</th>
													<th scope="col">Description</th>
													<th scope="col">Create by</th>
													<th scope="col">Update by</th>
													<th scope="col">Create date</th>
													<th scope="col">Update date</th>
													<th scope="col">Status</th>
													<th scope="col">Quantity</th>
													<th scope="col">Edit</th>
												</tr>
											</tfoot>
										</table>

										<div class="row">
											<div class="col-md-6">
												<div class="form-group mb-4 d-flex">
													<p>Total prices: 
														<fmt:formatNumber type = "number" maxFractionDigits = "0" value = "${totalSales }" /></p>
														 <span style="margin-left:5px;">vnđ</span>
													</p>
												</div>
											</div>

											<div class="col-md-6">
												<div class="pagination float-right">
													<div id="paging"></div>
												</div>
											</div>
										</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- ============================================================== -->
			<!-- End Container fluid  -->
			<!-- ============================================================== -->
			<!-- ============================================================== -->
			<!-- footer -->
			<!-- ============================================================== -->
			<jsp:include page="/WEB-INF/views/admin/layout/footer.jsp"></jsp:include>
			<!-- ============================================================== -->
			<!-- End footer -->
			<!-- ============================================================== -->
		</div>
		<!-- ============================================================== -->
		<!-- End Page wrapper  -->
		<!-- ============================================================== -->
	</div>
	<!-- ============================================================== -->
	<!-- End Wrapper -->
	<!-- ============================================================== -->
	<!-- End Wrapper -->
	<!-- ============================================================== -->

	<!-- Slider js: All Jquery-->
	<jsp:include page="/WEB-INF/views/admin/layout/js.jsp"></jsp:include>

	<script type="text/javascript">
		$( document ).ready(function() {
			//Dat gia tri cua status ung voi dieu kien search truoc do
			$("#status").val(${saleOrderSearch.status});
			
			$("#paging").pagination({
				currentPage: ${saleOrderSearch.currentPage}, //Trang hien tai
				items: ${saleOrderSearch.totalItems}, //Tong so don hang (total sale orders)
				itemsOnPage: ${saleOrderSearch.sizeOfPage},
				cssStyle: 'light-theme',
				
				onPageClick: function(pageNumber, event) {
					$('#page').val(pageNumber);
					$('#btnSearch').trigger('click');
				},
			});
		});
	</script>
</body>

</html>