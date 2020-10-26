<%@ page language="java" contentType="text/html; charset=UTF-8"
	isELIgnored="false" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page session="false"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">

<title>Recovery Password</title>


<link rel="stylesheet"
	href="<c:url value="/resources/style/registration/registrationpage.css" />">


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
	
		<hr>
		<c:if test="${message != null }">
			<div style="border-radius: 0%;" class="alert alert-warning">
				<button type="button" class="close" data-dismiss="alert">&times;</button>
				<strong>${message}</strong>
			</div>
		</c:if>
	
		<div id="header">Recovery your account</div>
		<form:form method="POST" modelAttribute="recovery" class="form-signin">
			<hr>

			<div class="form-group">
				<form:input id="myInput" type="text" path="emailRecovery"
					class="form-control" placeholder="Enter your email" autofocus="true"></form:input>
			</div>

			<button id="btn-submit" type="submit" class="btn btn">Submit</button>

			<a href="<c:url value='/'/>">
				<button id="btn-home" type="button" class="btn btn">Home</button>
			</a>

			<div class="copy-text">
				<a href="<c:url value='/showMyLoginPage'/>">Login</a>
			</div>


		</form:form>

	</div>

	<hr>

	<%@include file="../shared/footer.jsp"%>


</body>
</html>
