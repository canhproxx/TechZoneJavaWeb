<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	isELIgnored="false" pageEncoding="UTF-8"%>
<html>
<head>
<title>TechZone Login</title>


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

<link rel="stylesheet"
	href="<c:url value="/resources/style/login/loginpage.css" />">


<!-- Google font -->
<link href="https://fonts.googleapis.com/css?family=Hind:400,700"
	rel="stylesheet">

<!-- Bootstrap -->
<link type="text/css" rel="stylesheet"
	href="<c:url value="/resources/style/home/css/bootstrap.min.css" />" />

<!-- Slick -->
<link type="text/css" rel="stylesheet"
	href="<c:url value="/resources/style/home/css/slick.css" />" />
<link type="text/css" rel="stylesheet"
	href="<c:url value="/resources/style/home/css/slick-theme.css" />" />

<!-- nouislider -->
<link type="text/css" rel="stylesheet"
	href="<c:url value="/resources/style/home/css/nouislider.min.css" />" />

<!-- Font Awesome Icon -->
<link rel="stylesheet"
	href="<c:url value="/resources/style/home/css/font-awesome.min.css" />">

<!-- Custom stlylesheet -->
<link type="text/css" rel="stylesheet"
	href="<c:url value="/resources/style/home/css/style.css" />" />

<link rel="stylesheet"
	href="<c:url value="/resources/style/home/homepage.css" />">
<script src="<c:url value="/resources/style/home/homepage.js" />"></script>

<!-- CDN -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

</head>

<body>


	<div class="container" style="max-width: 60rem;">
		<div id="header">Login TechZone</div>
		<hr>
		<c:if test="${param.error ne null}">
			<div id="error-login">Invalid credentials!</div>
		</c:if>
		<c:if test="${param.logout ne null}">
			<!-- ne (not equal) is != ; handle by /jstl/core -->
			<div class="alert alert-success alert-dismissible">
				<button type="button" class="close" data-dismiss="alert">&times;</button>
				<strong>Success!</strong> You have been logged out successfully
			</div>
			<!-- <div style="color: red">You have been logged out.</div> -->
		</c:if>

		<form:form
			action="${pageContext.request.contextPath}/authenticateTheUser"
			method="POST" class="login-form">

			<div class="form-group">
				<label>Username</label> <input id="myInput" type="text"
					id="username" name="username" class="form-control" placeholder="">
			</div>
			<div class="form-group">
				<label>Password</label> <input id="myInput" type="password"
					id="password" name="password" class="form-control" placeholder="">
			</div>

			<div class="form-check">

				<button id="btn-submit" type="submit" class="btn btn">Submit</button>

				<a href="<c:url value='/'/>">
					<button id="btn-home" type="button" class="btn btn">Home</button>
				</a>
			</div>

			<!-- Code Message CSRF Protected Default -->
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
			<!-- Code Message CSRF Protected Default -->

		</form:form>
		<div class="copy-text">
			Create an Account TechZone -> <a
				href="<c:url value='/registration'/>">Register</a>
		</div>
		
		<div class="copy-text">
			<a href="<c:url value='/recoveryPassword'/>">Forgot Password?</a>
		</div>
	</div>



	<%@include file="shared/footer.jsp"%>


</body>
</html>
