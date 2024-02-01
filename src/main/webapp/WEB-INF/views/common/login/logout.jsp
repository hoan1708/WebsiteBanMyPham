<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- directive của JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Logup</title>
    
	<!-- LINEARICONS -->
	<link rel="stylesheet" href="${classpath}/customer/fonts/linearicons/style.css">
	
	<!-- STYLE CSS -->
	<link rel="stylesheet" href="${classpath}/customer/css/style.css">
	
	<!-- variables -->
    <jsp:include page="../variable.jsp"></jsp:include>
    
    
</head>
<body>
    <div class="wrapper">
			<div class="inner">
				<img src="${classpath}/customer/images/image-1.png" alt="" class="image-1">
				<sf:form action="${classpath}/logup" method="post" modelAttribute="user">
					<h3><b>New Account?</b></h3>
					<div class="form-holder">
						<span class="lnr lnr-user"></span>
						<sf:input path="username" type="text" class="form-control" placeholder="Username"></sf:input>
					</div>
					<div class="form-holder">
						<span class="lnr lnr-lock"></span>
						<sf:input path="password" type="password" class="form-control" placeholder="Password"></sf:input>
					</div>
					<div class="form-holder">
						<span class="lnr lnr-lock"></span>
						<input name="confirmPassword"  type="password" class="form-control" placeholder="Confirm Password">
					</div>
					<div class="form-holder">
						<span class="lnr lnr-phone-handset"></span>
						<sf:input path="mobile" type="text" class="form-control" placeholder="Phone Number"></sf:input>
					</div>
					<div class="form-holder">
						<span class="lnr lnr-envelope"></span>
						<sf:input path="email" type="text" class="form-control" placeholder="Mail"></sf:input>
					</div>
					
					<button>
						<span>Register</span>
					</button>
				</sf:form>
				<img src="${classpath}/customer/images/image-2.png" alt="" class="image-2">
			</div>
		</div>
		
		<script src="${classpath}/customer/js/jquery-3.3.1.min.js"></script>
		<script src="${classpath}/customer/js/main.js"></script>
</body>
</html>