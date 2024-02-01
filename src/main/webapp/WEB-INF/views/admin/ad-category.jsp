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

	<%-- <c:set var="currentPage" value="${currentPage }" scope="session"></c:set>
	<c:set var="totalPage" value="${totalPage }" scope="session"></c:set>
 --%>
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
							class="page-title text-truncate text-dark font-weight-medium mb-1"> Category list</h4>
						<div class="d-flex align-items-center">
							<nav aria-label="breadcrumb">
								<ol class="breadcrumb m-0 p-0">
									<li class="breadcrumb-item"><a href="index.html"
										class="text-muted">Apps</a></li>
									<li class="breadcrumb-item text-muted active"
										aria-current="page">Category list</li>
								</ol>
							</nav>
						</div>
					</div>
					<div class="col-5 align-self-center">
						<div class="customize-input float-right">
							
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
					<div class="col-md-12">
						<h2 style="color: black; margin-bottom: 30px;">
							<b>List category</b>
						</h2>
					</div>
					<div class="col-12">
						<div class="card">
							<div class="card-body">
								<form action="${classpath }/manager/showCategory"
									method="get">
									<div class="table-responsive">

									<div class="row">
	                       		 		
                                    <div class="col-md-12">
												<div class="row g-3 align-items-center">

													<div class="col-auto d-flex">
														
														


														<div class="form-group mb-4" style="margin-left: 10px;">
															<label for="createdate">Search keyword: </label> <input
																class="form-control" type="text" id="keyword"
																name="keyword" placeholder="Enter keyword to search" />
														</div>

														<div class="form-group mb-4" style="margin-left: 10px;">
															<label>Status: </label> 
															<select class="form-control" name="status" id="status"
																aria-label="Default select example">
																<option value="2">Tất cả</option>
																<option value="0">Ngừng hoạt động</option>
																<option value="1">Đang hoạt động</option>
															</select>
														</div>
														<div class="form-group mb-4"
															style="margin-left: 10px; margin-top: 32px;">

															<button id="btnSearch" name="btnSearch" class="btn btn-primary">Search</button>
														</div>
														<div style="margin-top:31px; margin-left:10px;">
															<input id="page" name="page" class="form-control"
																value="${categorySearch.currentPage }" hidden>
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
													<th scope="col">Name</th>
													<th scope="col">Description</th>
													<th scope="col">Create by</th>
													<th scope="col">Update by</th>
													<th scope="col">Create date</th>
													<th scope="col">Update date</th>
													<th scope="col">Status</th>
													<th scope="col">Action Edit</th>
													<th scope="col">Action Delete</th>
												</tr>

											</thead>
											<tbody>
												<c:forEach var="category" items="${dsCategory }"
													varStatus="loop">
													<tr>
														<td>${loop.index + 1 }</td>
														<td>${category.name }</td>
														<td>${category.description }</td>
														
															<c:forEach var="user" items="${users}" varStatus="status">
															  <c:if test="${user.id==category.createBy}">
															    <td>${user.username }</td>
															  </c:if>
															</c:forEach>
														
															<c:forEach var="user" items="${users}" varStatus="status">
															  <c:if test="${user.id==category.updateBy}">
															    <td>${user.username }</td>
															  </c:if>
															</c:forEach>
														
														<td><fmt:formatDate value="${category.createDate}"
																pattern="dd-MM-yyyy" /></td>
														<td><fmt:formatDate value="${category.updateDate }"
																pattern="dd-MM-yyyy" /></td>
														<td>${category.status==true?"Đang hoạt động":"Ngưng hoạt động"}</td>
														<td>
															<a href="${classpath }/manager/edit-category/${category.id }"
															role="button" class="btn btn-success">Edit</a> 
														</td>
														<td>
															<a href="${classpath }/manager/delete-category/${category.id }"
															role="button" class="btn btn-danger">Delete</a>
														</td>
													</tr>
												</c:forEach>
											</tbody>
											<tfoot>
												<tr>
													<th scope="col">STT</th>
													<th scope="col">Name</th>
													<th scope="col">Description</th>
													<th scope="col">Create by</th>
													<th scope="col">Update by</th>
													<th scope="col">Create date</th>
													<th scope="col">Update date</th>
													<th scope="col">Status</th>
													<th scope="col">Edit</th>
													<th scope="col">Delete</th>
												</tr>
											</tfoot>
										</table>

										<div class="row">
											<div class="col-md-6">
												<div class="form-group mb-4"
															style="margin-left: 10px; margin-top: 32px;">
															<a href="${classpath }/manager/add-category" class="btn btn-primary">Add category</a>
														</div>
											</div>

											<div class="col-md-6">
												<div class="form-group mb-4"
																style="margin-left: 10px; margin-top: 32px;">
													<div class="pagination float-right">
														<div id="paging"></div>
													</div>
												</div>
											</div>
										</div>
								</form>
								
                                </div>
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
			$("#status").val(${categorySearch.status});
			
			$("#paging").pagination({
				currentPage: ${categorySearch.currentPage}, //Trang hien tai
				items: ${categorySearch.totalItems}, //Tong so don hang (total sale orders)
				itemsOnPage: ${categorySearch.sizeOfPage},
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