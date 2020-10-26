<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	isELIgnored="false" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page session="false"%>
<html>
<head>
<title>ACCESS DENIED</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Local -->
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

	<div class="container">
		<img
			src="${pageContext.servletContext.contextPath}/resources/images/common/404page/404-blue.gif">
		<strong>Access Denied! </strong>
		
		<c:url var="backToShop" value="/" />
			

			<a href="${backToShop}">
				<button class="primary-btn add-to-cart">
					<i class="fa fa-shopping-cart"></i> BACK TO SHOP
				</button>
			</a>
	</div>



</body>
</html>