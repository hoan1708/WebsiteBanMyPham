<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <link rel="icon" type="image/png" sizes="16x16" href="${classpath}/admin/assets/images/favicon.png">
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

	
	<!-- End test -->
    <!-- ============================================================== -->
    <!-- Preloader - style you can find in spinners.css -->
    <!-- ============================================================== -->
    
    <!-- ============================================================== -->
    <!-- Main wrapper - style you can find in pages.scss -->
    <!-- ============================================================== -->
    <div id="main-wrapper" data-theme="light" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full" data-sidebar-position="fixed" data-header-position="fixed" data-boxed-layout="full">
        
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
                        <h4 class="page-title text-truncate text-dark font-weight-medium mb-1">Product List</h4>
                        <div class="d-flex align-items-center">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb m-0 p-0">
                                    <li class="breadcrumb-item"><a href="index.html" class="text-muted">Apps</a></li>
                                    <li class="breadcrumb-item text-muted active" aria-current="page">Product List</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                    <div class="col-5 align-self-center">
                        
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
                            <form method="get">
                                <div class="row">
                                    <!-- Column -->
                                    <div class="col-md-6 col-lg-3 col-xlg-3">
                                        <div class="card card-hover">
                                            <div class="p-2 bg-primary text-center">
                                                <h1 class="font-light text-white">${totalProduct}</h1>
                                                <h6 class="text-white">Total product</h6>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="table-responsive">
                                	
                               	<div class="row">
                       		 		<div class="col-md-2">
										<div class="form-group mb-4">
	                                        <a href="${classpath }/manager/add-product" role="button" class="btn btn-primary">Add Product</a>
                                      	</div>
                                   	</div>
									
                                    <div class="col-md-8">
	                                   <div class="row g-3 align-items-center">
										  <div class="col-auto d-flex" >
										    
										    <input type="text" id="keyword" name="keyword" placeholder="Search keyword" class="form-control" aria-describedby="passwordHelpInline">
									  		
									  		<select class="form-control" name="categoryId" id="categoryId" aria-label="Default select example">
												  <option selected value="">Select category</option>
												  <c:forEach items="${categorys}" var="category">
												 		 <option value="${category.id}">${category.name}</option>
												  </c:forEach>
											</select>
											<button id="btnSearch" name="btnSearch" type="submit" class="btn btn-primary">Search</button>
	                                        
										  </div>
                                    	</div>
                                    </div>
                                    <div class="col-md-2">
                                    	<div style="margin-top:31px; margin-left:10px;">
															<input hidden id="page" name="page" class="form-control"
																value="${productSearch.currentPage }">
														</div>
                                    </div>
                                </div>
                                
                                    <table id="zero_config" class="table table-striped table-bordered no-wrap">
                                        <thead>
                                            <tr>
                                            	<th scope="col">STT</th>
                                            	<th scope="col">Id</th>
                                                <th scope="col">Category</th>
                                                <th scope="col">Product name</th>
                                                <th scope="col">Price</th>
                                                <th scope="col">Sale price</th>
                                                <th scope="col">Avatar</th>
                                                <th scope="col">Description</th>
                                                <th scope="col">Details</th>
                                                <th scope="col">Create by</th>
                                                <th scope="col">Update by</th>
                                                <th scope="col">Create date</th>
                                                <th scope="col">Update date</th> 
                                                <th scope="col">Status</th>   
                                                <th scope="col">Is hot</th> 
                                                <th scope="col">Action</th>      
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<c:forEach var="product" items="${products }" varStatus="loop">
                                        		<tr>
		                                        	<td>${loop.index + 1 }</td>
		                                        	<td>${product.id }</td>
		                                        	<td>${product.category.name }</td>
		                                        	<td>${product.name }</td>
		                                        	<td>
		                                        		<fmt:formatNumber value="${product.price}" minFractionDigits="0"></fmt:formatNumber>
		                                        		
		                                        	</td>
		                                        	<td>
		                                        		<fmt:formatNumber value="${product.salePrice}" minFractionDigits="0"></fmt:formatNumber>
		                                        	</td>
		                                        	<td>
		                                        		<c:if test="${product.avartar!=null}">
		                                        			<img width="40px" height="40px" src="${classpath }/FileUpload/${product.avartar}" class="light-logo">
		                                 				</c:if>     
		                                        	</td>
		                                        	<td>${product.shortDescription }</td>
		                                        	<td>${product.detailDescription }</td>
		                                        	
	                                        		<c:forEach var="user" items="${users}" varStatus="status">
														  <c:if test="${user.id==product.createBy}">
														    <td>${user.username }</td>
														  </c:if>
														</c:forEach>
														
		                                        	<c:forEach var="user" items="${users}" varStatus="status">
													  <c:if test="${user.id==product.updateBy}">
													    <td>${user.username }</td>
													  </c:if>
													</c:forEach>
		                                        	
		                                        	<td>
		                                        		<fmt:formatDate value="${product.createDate}" pattern="dd-MM-yyyy" />
		                                        	</td>
		                                        	<td>
		                                        		<fmt:formatDate value="${product.updateDate }" pattern="dd-MM-yyyy" />
		                                        	</td>
		                                        	<td>${product.status==true?"Active":"No active"}</td>
		                                        	<td>${product.isHot==true?"Hot":"No hot" }</td>
		                                        	<td>
		                                        		
		                                        		<a href="${classpath }/manager/edit-product/${product.id }" role="button" class="btn btn-success">Edit</a>
		                                        	
		                                        	</td>
                                        		</tr>
                                        	</c:forEach>
                                        </tbody>
                                        <tfoot>
                                            <tr>
                                            	<th scope="col">STT</th>
                                            	<th scope="col">Id</th>
                                                <th scope="col">Category</th>
                                                <th scope="col">Product name</th>
                                                <th scope="col">Price</th>
                                                <th scope="col">Sale price</th>
                                                <th scope="col">Avatar</th>
                                                <th scope="col">Description</th>
                                                <th scope="col">Details</th>
                                                <th scope="col">Create by</th>
                                                <th scope="col">Update by</th>
                                                <th scope="col">Create date</th>
                                                <th scope="col">Update date</th> 
                                                <th scope="col">Status</th>   
                                                <th scope="col">Is hot</th> 
                                                <th scope="col">Action</th>      
                                            </tr>
                                        </tfoot>
                                    </table>
                                    
                                    <div class="row">
                                    		<div class="col-md-6">
                                    		</div>
	                        		 		<div class="col-md-6">
												<div class="pagination float-right">
													<div id="paging">
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
			//$("#status").val(${productSearch.status});
			
			$("#paging").pagination({
				currentPage: ${productSearch.currentPage}, 
				items: ${productSearch.totalItems}, 
				itemsOnPage: ${productSearch.sizeOfPage},
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