
<!-- directive của JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login form</title>
    
    <!-- Custome css resource file -->
    <jsp:include page="/WEB-INF/views/customer/css.jsp"></jsp:include>
    
    <style>
    		.btn-color{
			  background-color: #0e1c36;
			  color: #fff;
			  
			}
			
			.profile-image-pic{
			  height: 200px;
			  width: 200px;
			  object-fit: cover;
			}
			
			
			
			.cardbody-color{
			  background-color: #ebf2fa;
			}
			
			a{
			  text-decoration: none;
			}
			
			a:hover{
				text-decoration:underline;
			}
    </style>
    
</head>
<body>
	<!-- Jquery -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	

    <div class="container">
    <div class="row" style="margin-top:-25px;">
      <div class="col-md-6 offset-md-3">
        <h2 class="text-center text-dark mt-5">Login Form</h2>
        <div class="text-center mb-5 text-dark">Welcome to our vegetable shop</div>
        <div class="card my-5">

          <form action="${classpath}/login_processing_url" method="post" class="card-body cardbody-color p-lg-5" style="margin-top:-20px;">
				<c:if test="${not empty param.login_error }">
					<div class="alert alert-danger" role="alert">Login
						attempt was not successful, try again!!!</div>
				</c:if>

	            <div class="text-center">
	              <img src="https://cdn.pixabay.com/photo/2016/03/31/19/56/avatar-1295397__340.png" class="img-fluid profile-image-pic img-thumbnail rounded-circle my-3"
	                width="200px" alt="profile">
	            </div>
	
	            <div class="mb-3">
	              <input id="username" name="username" type="text" class="form-control"  aria-describedby="emailHelp"
	                placeholder="Username">
	            </div>
	            <div class="mb-3">
	              <input id="password" name="password" type="password" class="form-control"  placeholder="Password">
	            </div>
	            <div class="text-center">
	            	<button type="submit" class="btn btn-color px-5 mb-5 w-100">Login</button>
	            </div>
	            <div id="emailHelp" class="form-text text-center mb-5 text-dark">
		            Not Registered? <a href="${classpath}/logup" class="text-dark fw-bold"> <b>Create an
		                Account</b> </a>
            	</div>
          </form>
          
          <div class="alert alert-success" role="alert">
			  ${message }
			</div>
        </div>

      </div>
    </div>
  </div>
  
  
</body>
</html>