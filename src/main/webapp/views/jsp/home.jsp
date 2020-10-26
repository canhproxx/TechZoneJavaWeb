<%@page import="com.techzone.springmvc.util.SecurityUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	isELIgnored="false" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page session="false"%>

<!DOCTYPE html>

<html>
<head>

<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.6.0/slick.js"></script>
 -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
	integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/"
	crossorigin="anonymous">
	
	
	<!-- Add new -->
	<!-- Google font -->
	<link href="https://fonts.googleapis.com/css?family=Hind:400,700" rel="stylesheet">
	
	<!-- Bootstrap -->
	<link type="text/css" rel="stylesheet" href="<c:url value="/resources/style/home/css/bootstrap.min.css" />" />

	<!-- Slick -->
	<link type="text/css" rel="stylesheet" href="<c:url value="/resources/style/home/css/slick.css" />" />
	<link type="text/css" rel="stylesheet" href="<c:url value="/resources/style/home/css/slick-theme.css" />" />

	<!-- nouislider -->
	<link type="text/css" rel="stylesheet" href="<c:url value="/resources/style/home/css/nouislider.min.css" />" />
	
	<!-- Font Awesome Icon -->
	<link rel="stylesheet" href="<c:url value="/resources/style/home/css/font-awesome.min.css" />">
	
	<!-- Custom stlylesheet -->
	<link type="text/css" rel="stylesheet" href="<c:url value="/resources/style/home/css/style.css" />" />

<!-- Local -->
<link rel="stylesheet"
	href="<c:url value="/resources/style/home/homepage.css" />">
<script src="<c:url value="/resources/style/home/homepage.js" />"></script>



<title>TechZone</title>
</head>
<body style="background-color: rgb(242, 243, 245);">

<%-- 	<!-- Header -->
	<%@include file="./shared/bar-header.jsp"%> --%>


	<!-- HEADER -->
	<header>
		<!-- top Header -->
		<div id="top-header">
			<div class="container">
				<div class="pull-left">
					<span>Welcome to E-shop!</span>
				</div>
				<div class="pull-right">
					<ul class="header-top-links">
						<li><a href="#">Store</a></li>
						<li><a href="#">Newsletter</a></li>
						<li><a href="#">FAQ</a></li>
						<li class="dropdown default-dropdown">
							<a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">ENG <i class="fa fa-caret-down"></i></a>
							<ul class="custom-menu">
								<li><a href="#">English (ENG)</a></li>
								<li><a href="#">Russian (Ru)</a></li>
								<li><a href="#">French (FR)</a></li>
								<li><a href="#">Spanish (Es)</a></li>
							</ul>
						</li>
						<li class="dropdown default-dropdown">
							<a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">USD <i class="fa fa-caret-down"></i></a>
							<ul class="custom-menu">
								<li><a href="#">USD ($)</a></li>
								<li><a href="#">EUR (€)</a></li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<!-- /top Header -->

		<!-- header -->
		<div id="header">
			<div class="container">
				<div class="pull-left">
					<!-- Logo -->
					<div class="header-logo">
						<a class="logo" href="#">
							<img src="./img/logo.png" alt="">
						</a>
					</div>
					<!-- /Logo -->

					<!-- Search -->
					<div class="header-search">
						<form>
							<input class="input search-input" type="text" placeholder="Enter your keyword">
							<select class="input search-categories">
								<option value="0">All Categories</option>
								<option value="1">Category 01</option>
								<option value="1">Category 02</option>
							</select>
							<button class="search-btn"><i class="fa fa-search"></i></button>
						</form>
					</div>
					<!-- /Search -->
				</div>
				<div class="pull-right">
					<ul class="header-btns">
						<!-- Account -->
						<li class="header-account dropdown default-dropdown">
							<div class="dropdown-toggle" role="button" data-toggle="dropdown" aria-expanded="true">
								<div class="header-btns-icon">
									<i class="fa fa-user-o"></i>
								</div>
								<strong class="text-uppercase">My Account <i class="fa fa-caret-down"></i></strong>
							</div>
							<a href="#" class="text-uppercase">Login</a> / <a href="#" class="text-uppercase">Join</a>
							<ul class="custom-menu">
								<li><a href="#"><i class="fa fa-user-o"></i> My Account</a></li>
								<li><a href="#"><i class="fa fa-heart-o"></i> My Wishlist</a></li>
								<li><a href="#"><i class="fa fa-exchange"></i> Compare</a></li>
								<li><a href="#"><i class="fa fa-check"></i> Checkout</a></li>
								<li><a href="#"><i class="fa fa-unlock-alt"></i> Login</a></li>
								<li><a href="#"><i class="fa fa-user-plus"></i> Create An Account</a></li>
							</ul>
						</li>
						<!-- /Account -->

						<!-- Cart -->
						<li class="header-cart dropdown default-dropdown">
							<a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
								<div class="header-btns-icon">
									<i class="fa fa-shopping-cart"></i>
									<span class="qty">3</span>
								</div>
								<strong class="text-uppercase">My Cart:</strong>
								<br>
								<span>35.20$</span>
							</a>
							<div class="custom-menu">
								<div id="shopping-cart">
									<div class="shopping-cart-list">
										<div class="product product-widget">
											<div class="product-thumb">
												<img src="./img/thumb-product01.jpg" alt="">
											</div>
											<div class="product-body">
												<h3 class="product-price">$32.50 <span class="qty">x3</span></h3>
												<h2 class="product-name"><a href="#">Product Name Goes Here</a></h2>
											</div>
											<button class="cancel-btn"><i class="fa fa-trash"></i></button>
										</div>
										<div class="product product-widget">
											<div class="product-thumb">
												<img src="./img/thumb-product01.jpg" alt="">
											</div>
											<div class="product-body">
												<h3 class="product-price">$32.50 <span class="qty">x3</span></h3>
												<h2 class="product-name"><a href="#">Product Name Goes Here</a></h2>
											</div>
											<button class="cancel-btn"><i class="fa fa-trash"></i></button>
										</div>
									</div>
									<div class="shopping-cart-btns">
										<button class="main-btn">View Cart</button>
										<button class="primary-btn">Checkout <i class="fa fa-arrow-circle-right"></i></button>
									</div>
								</div>
							</div>
						</li>
						<!-- /Cart -->

						<!-- Mobile nav toggle-->
						<li class="nav-toggle">
							<button class="nav-toggle-btn main-btn icon-btn"><i class="fa fa-bars"></i></button>
						</li>
						<!-- / Mobile nav toggle -->
					</ul>
				</div>
			</div>
			<!-- header -->
		</div>
		<!-- container -->
	</header>
	<!-- /HEADER -->


<%-- 	<nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">

		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li>
					<div class="dropdown">
						<button id="dropdown-language" type="button"
							class="btn btn-outline" data-toggle="dropdown">language</button>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="?lang=en">English</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="?lang=vn">VietNamess</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="#">Another link</a>
						</div>
					</div>
				</li>

				<security:authorize access="isAuthenticated()">
					<li class="nav-item">
						<div>
							<form:form action="${pageContext.request.contextPath}/logout"
								method="post">
								<button id="btn-Logout" type="submit" class="btn btn">
									<spring:message code="home.logout" />
								</button>
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" />
							</form:form>
						</div>
					</li>

				</security:authorize>

				<security:authorize access="isAnonymous()">
					<li class="nav-item"><a id="btn-login" class="nav-link"
						href="<c:url value='/showMyLoginPage'/>"><spring:message
								code="home.login" /></a></li>
					<li class="nav-item"><a id="btn-register" class="nav-link"
						href="<c:url value='/registration'/>"><spring:message
								code="home.register" /></a></li>
				</security:authorize>

				<security:authorize access="hasRole('ADMIN')">
					<li class="nav-item"><a id="btn-admin" class="nav-link"
						title="ADMIN ACCESS" href="<c:url value='/admin/managerment'/>"><spring:message
								code="home.dashboard" /></a></li>
				</security:authorize>
				<security:authorize access="hasRole('STAFF')">
					<li class="nav-item"><a id="btn-staff" class="nav-link"
						title="STAFF ACCESS" href="<c:url value='/staff/managerment'/>"><spring:message
								code="home.staff" /></a></li>
				</security:authorize>

				<security:authorize access="isAuthenticated()">
					<li class="nav-item">
						<div class="dropdown">
							<button id="dropdown-Account" type="button"
								class="btn btn-outline" data-toggle="dropdown">
								<i class="far fa-user"></i>
								<%=SecurityUtil.getPrincipal()%>
							</button>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="<c:url value='/myAccount'/>">
									<spring:message code="home.account" />
								</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="<c:url value='/orderHistory'/>">
									<spring:message code="home.orderhistory" />
								</a>
								<div class="dropdown-divider"></div>
							</div>
						</div>
					</li>
				</security:authorize>

			</ul>

			<form action="./search" method="GET" class="form-inline my-2 my-lg-0">
				<input id="searchInput" class="form-control mr-sm-2" type="search"
					name='searchInfo' placeholder="" aria-label="Search">
				<button id="search-button" class="btn btn my-2 my-sm-0"
					type="submit">
					<spring:message code="home.search" />
				</button>
				<a id="cart-button" class="btn btn btn-sm ml-3" href="<c:url value='/cart'/>"> 
					<img src="./resources/icon/shopping-bag.png" alt="icon">
					<span id="item-in-cart" class="badge badge-light">${sumItemInCart}</span>
				</a>
				
				<a id="cart-button" class="btn btn btn-sm ml-3" href="<c:url value='/wishList'/>"> 
					<img src="./resources/icon/shopping-bag.png" alt="icon">
					<span id="item-in-cart" class="badge badge-light">${sumItemInWishList}</span>
				</a>
			</form>

		</div>
	</nav> --%>





<!-- 	<div class="row">
		<div class="col-sm-1"></div>
		<div class="col-sm-10">
			<div class="container mt-3">
				<div id="myCarousel" class="carousel slide" data-ride="carousel">
					<ul class="carousel-indicators">
						<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
						<li id="mini" data-target="#myCarousel" data-slide-to="1"></li>
						<li data-target="#myCarousel" data-slide-to="2"></li>
					</ul>
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img id="img-slide" src="./resources/images/common/catalog8.jpg"
								alt="Catalog">
						</div>
						<div class="carousel-item">
							<img id="img-slide" src="./resources/images/common/catalog9.png"
								alt="Catalog">
						</div>
						<div class="carousel-item">
							<img id="img-slide" src="./resources/images/common/catalog10.jpg"
								alt="Catalog">
						</div>
					</div>

					<a id="prev-slide" class="carousel-control-prev" href="#myCarousel"
						data-slide="prev"> <span style="color: rgb(242, 243, 245);"
						class="carousel-control-prev-icon"></span>
					</a> <a id="next-slide" class="carousel-control-next"
						href="#myCarousel" data-slide="next"> <span
						style="color: rgb(242, 243, 245);"
						class="carousel-control-next-icon"></span>
					</a>
				</div>
			</div>
		</div>
		<div class="col-sm-1"></div>
	</div> -->

	<hr>
	<!-- Show Product By Search -->
	<c:if test="${message != null }">
		<div style="border-radius: 0%;" class="alert alert-success">
			<button type="button" class="close" data-dismiss="alert">&times;</button>
			<strong>${message}</strong>
		</div>
	</c:if>
	<div class="container-fluid content-center" style="margin-top: flex;">
		<div class="row h-100 justify-content-center align-items-center">
			<c:choose>
				<c:when test="${!empty listProductBySearch}">
					<c:forEach var="tempProduct" items="${listProductBySearch}">

						<div class="card"
							style="width: 18rem; height: auto; margin: 0.2rem;">
							<div class="parent">
								<img class="card-img-top"
									src="./resources/images/${tempProduct.productDetail.image}"
									alt="Card image cap">
							</div>

							<div style="height: 35px; padding: 0;" class="card-body">
								<h5 style="font-size: 18px; text-align: center;"
									class="card-title">${tempProduct.name}</h5>
							</div>

							<div class="card-body" style="background-color: #f5f5f5">

								<c:url var="addProductToCart" value="/cart/addProductToCart">
									<c:param name="productId" value="${tempProduct.id}" />
								</c:url>
								<a href="${addProductToCart}" id="add-cart"
									class="btn btn btn-block">Add Cart</a>

								<c:url var="detailProductLink" value="/product">
									<c:param name="productId" value="${tempProduct.id}" />
								</c:url>
								<a href="${detailProductLink}"
									class="btn btn-outline-dark btn-block">Detail</a>

							</div>
						</div>
					</c:forEach>
				</c:when>
			</c:choose>
		</div>
	</div>
	<hr>




	<!-- Slide Product Laptop Arrow -->
	<ul class="nav nav-tabs">
		<li class="nav-item"><a class="nav-link active disabled" href="#">Laptop</a></li>
	</ul>
	<div id="demo1" class="carousel slide" data-ride="carousel">

		<!-- The slide show Arrow-->
		<div id="mySlideArrow" class="container carousel-inner no-padding">
			<div class="carousel-item active">
				<div class="container-fluid content-center"
					style="margin-top: flex;">
					<div class="row h-100 justify-content-center align-items-center">
						<c:set var="indexEnd" value="3" />
						<c:choose>
							<c:when test="${!empty listProduct_Laptop}">
								<c:forEach begin="0" end="${indexEnd}" var="tempProduct" items="${listProduct_Laptop}">
									<div class="card"
										style="width: 18rem; height: auto; margin: 0.2rem;">
										<div class="parent">
											<img class="card-img-top"
												src="./resources/images/${tempProduct.productDetail.image}"
												alt="Card image cap">
										</div>

										<div style="height: 35px; padding: 0;" class="card-body">
											<h5 style="font-size: 18px; text-align: center;"
												class="card-title">${tempProduct.name}</h5>
										</div>

										<div class="card-body" style="background-color: #f5f5f5">

											<c:url var="addProductToCart" value="/cart/addProductToCart">
												<c:param name="productId" value="${tempProduct.id}" />
											</c:url>
											<a href="${addProductToCart}" id="add-cart"
												class="btn btn btn-block">Add Cart</a>

											<c:url var="detailProductLink" value="/product">
												<c:param name="productId" value="${tempProduct.id}" />
											</c:url>
											<a href="${detailProductLink}"
												class="btn btn-outline-dark btn-block">Detail</a>

										</div>
									</div>
								</c:forEach>
							</c:when>
						</c:choose>
					</div>
				</div>
			</div>
			<div class="carousel-item">
				<div class="container-fluid content-center"
					style="margin-top: flex;">
					<div class="row h-100 justify-content-center align-items-center">
						<c:choose>
							<c:when test="${!empty listProduct_Laptop}">
								<c:forEach begin="3" var="tempProduct"
									items="${listProduct_Laptop}">
									<div class="card"
										style="width: 18rem; height: auto; margin: 0.2rem;">
										<div class="parent">
											<img class="card-img-top"
												src="./resources/images/${tempProduct.productDetail.image}"
												alt="Card image cap">
										</div>

										<div style="height: 35px; padding: 0;" class="card-body">
											<h5 style="font-size: 18px; text-align: center;"
												class="card-title">${tempProduct.name}</h5>
										</div>

										<div class="card-body" style="background-color: #f5f5f5">

											<c:url var="addProductToCart" value="/cart/addProductToCart">
												<c:param name="productId" value="${tempProduct.id}" />
											</c:url>
											<a href="${addProductToCart}" id="add-cart"
												class="btn btn btn-block">Add Cart</a>

											<c:url var="detailProductLink" value="/product">
												<c:param name="productId" value="${tempProduct.id}" />
											</c:url>
											<a href="${detailProductLink}"
												class="btn btn-outline-dark btn-block">Detail</a>
										</div>
									</div>
								</c:forEach>
							</c:when>
						</c:choose>
					</div>
				</div>
			</div>
		</div>

		<!-- Left and right controls -->
		<a id="prev-laptop" class="carousel-control-prev" href="#demo1"
			data-slide="prev"> <span class="carousel-control-prev-icon"></span>
		</a> <a id="next-laptop" class="carousel-control-next" href="#demo1"
			data-slide="next"> <span class="carousel-control-next-icon"></span>
		</a>
	</div>
	<!-- Slide Product Laptop Arrow -->

	<!-- Slide Product SmartPhone Arrow -->
	<ul class="nav nav-tabs">
		<li class="nav-item"><a class="nav-link active disabled" href="#">SmartPhone</a></li>
	</ul>
	<div id="demo2" class="carousel slide" data-ride="carousel">

		<!-- The slide show Arrow-->
		<div id="mySlideArrow" class="container carousel-inner no-padding">
			<div class="carousel-item active">
				<div class="container-fluid content-center"
					style="margin-top: flex;">
					<div class="row h-100 justify-content-center align-items-center">
						<c:set var="indexEnd" value="2" />
						<c:choose>
							<c:when test="${!empty listProduct_SmartPhone}">
								<c:forEach begin="0" end="${indexEnd}" var="tempProduct"
									items="${listProduct_SmartPhone}">
									<div class="card"
										style="width: 18rem; height: auto; margin: 0.2rem;">
										<div class="parent">
											<img class="card-img-top"
												src="./resources/images/${tempProduct.productDetail.image}"
												alt="Card image cap">
										</div>

										<div style="height: 35px; padding: 0;" class="card-body">
											<h5 style="font-size: 18px; text-align: center;"
												class="card-title">${tempProduct.name}</h5>
										</div>

										<div class="card-body" style="background-color: #f5f5f5">

											<c:url var="addProductToCart" value="/cart/addProductToCart">
												<c:param name="productId" value="${tempProduct.id}" />
											</c:url>
											<a href="${addProductToCart}" id="add-cart"
												class="btn btn btn-block">Add Cart</a>

											<c:url var="detailProductLink" value="/product">
												<c:param name="productId" value="${tempProduct.id}" />
											</c:url>
											<a href="${detailProductLink}"
												class="btn btn-outline-dark btn-block">Detail</a>

										</div>
									</div>
								</c:forEach>
							</c:when>
						</c:choose>
					</div>
				</div>
			</div>
			<div class="carousel-item">
				<div class="container-fluid content-center"
					style="margin-top: flex;">
					<div class="row h-100 justify-content-center align-items-center">
						<c:choose>
							<c:when test="${!empty listProduct_SmartPhone}">
								<c:forEach begin="3" var="tempProduct"
									items="${listProduct_SmartPhone}">
									<div class="card"
										style="width: 18rem; height: auto; margin: 0.2rem;">
										<div class="parent">
											<img class="card-img-top"
												src="./resources/images/${tempProduct.productDetail.image}"
												alt="Card image cap">
										</div>

										<div style="height: 35px; padding: 0;" class="card-body">
											<h5 style="font-size: 18px; text-align: center;"
												class="card-title">${tempProduct.name}</h5>
										</div>

										<div class="card-body" style="background-color: #f5f5f5">

											<c:url var="addProductToCart" value="/cart/addProductToCart">
												<c:param name="productId" value="${tempProduct.id}" />
											</c:url>
											<a href="${addProductToCart}" id="add-cart"
												class="btn btn btn-block">Add Cart</a>

											<c:url var="detailProductLink" value="/product">
												<c:param name="productId" value="${tempProduct.id}" />
											</c:url>
											<a href="${detailProductLink}"
												class="btn btn-outline-dark btn-block">Detail</a>
										</div>
									</div>
								</c:forEach>
							</c:when>
						</c:choose>
					</div>
				</div>
			</div>
		</div>

		<!-- Left and right controls -->
		<a id="prev-phone" class="carousel-control-prev" href="#demo2"
			data-slide="prev"> <span class="carousel-control-prev-icon"></span>
		</a> <a id="next-phone" class="carousel-control-next" href="#demo2"
			data-slide="next"> <span class="carousel-control-next-icon"></span>
		</a>
	</div>
	<!-- Slide Product SmartPhone Arrow -->

	<!-- Slide Product HeadPhone Arrow -->
	<ul class="nav nav-tabs">
		<li class="nav-item"><a class="nav-link active disabled" href="#">HeadPhone</a></li>
	</ul>
	<div id="demo3" class="carousel slide" data-ride="carousel">

		<!-- The slide show Arrow-->
		<div id="mySlideArrow" class="container carousel-inner no-padding">
			<div class="carousel-item active">
				<div class="container-fluid content-center"
					style="margin-top: flex;">
					<div class="row h-100 justify-content-center align-items-center">
						<c:set var="indexEnd" value="2" />
						<c:choose>
							<c:when test="${!empty listProduct_HeadPhone}">
								<c:forEach begin="0" end="${indexEnd}" var="tempProduct"
									items="${listProduct_HeadPhone}">
									<div class="card"
										style="width: 18rem; height: auto; margin: 0.2rem;">
										<div class="parent">
											<img class="card-img-top"
												src="./resources/images/${tempProduct.productDetail.image}"
												alt="Card image cap">
										</div>

										<div style="height: 35px; padding: 0;" class="card-body">
											<h5 style="font-size: 18px; text-align: center;"
												class="card-title">${tempProduct.name}</h5>
										</div>

										<div class="card-body" style="background-color: #f5f5f5">

											<c:url var="addProductToCart" value="/cart/addProductToCart">
												<c:param name="productId" value="${tempProduct.id}" />
											</c:url>
											<a href="${addProductToCart}" id="add-cart"
												class="btn btn btn-block">Add Cart</a>

											<c:url var="detailProductLink" value="/product">
												<c:param name="productId" value="${tempProduct.id}" />
											</c:url>
											<a href="${detailProductLink}"
												class="btn btn-outline-dark btn-block">Detail</a>
										</div>
									</div>
								</c:forEach>
							</c:when>
						</c:choose>
					</div>
				</div>
			</div>
			<div class="carousel-item">
				<div class="container-fluid content-center"
					style="margin-top: flex;">
					<div class="row h-100 justify-content-center align-items-center">
						<c:choose>
							<c:when test="${!empty listProduct_HeadPhone}">
								<c:forEach begin="3" var="tempProduct"
									items="${listProduct_HeadPhone}">
									<div class="card"
										style="width: 18rem; height: auto; margin: 0.2rem;">
										<div class="parent">
											<img class="card-img-top"
												src="./resources/images/${tempProduct.productDetail.image}"
												alt="Card image cap">
										</div>

										<div style="height: 35px; padding: 0;" class="card-body">
											<h5 style="font-size: 18px; text-align: center;"
												class="card-title">${tempProduct.name}</h5>
										</div>

										<div class="card-body" style="background-color: #f5f5f5">

											<c:url var="addProductToCart" value="/cart/addProductToCart">
												<c:param name="productId" value="${tempProduct.id}" />
											</c:url>
											<a href="${addProductToCart}" id="add-cart"
												class="btn btn btn-block">Add Cart</a>

											<c:url var="detailProductLink" value="/product">
												<c:param name="productId" value="${tempProduct.id}" />
											</c:url>
											<a href="${detailProductLink}"
												class="btn btn-outline-dark btn-block">Detail</a>
										</div>
									</div>
								</c:forEach>
							</c:when>
						</c:choose>
					</div>
				</div>
			</div>
		</div>

		<!-- Left and right controls -->
		<a id="prev-phone" class="carousel-control-prev" href="#demo3"
			data-slide="prev"> <span class="carousel-control-prev-icon"></span>
		</a> <a id="next-phone" class="carousel-control-next" href="#demo3"
			data-slide="next"> <span class="carousel-control-next-icon"></span>
		</a>
	</div>
	<!-- Slide Product HeadPhone Arrow -->

	<hr>
	<!-- Slide brand popular -->
<!-- 	<div class="container">
		<section class="customer-logos slider">
			<div class="slide">
				<img src="./resources/images/common/logo-brand/apple.png">
			</div>
			<div class="slide">
				<img src="./resources/images/common/logo-brand/dell.png">
			</div>
			<div class="slide">
				<img src="./resources/images/common/logo-brand/razer.png">
			</div>
			<div class="slide">
				<img src="./resources/images/common/logo-brand/logitech.png">
			</div>
			<div class="slide">
				<img src="./resources/images/common/logo-brand/samsung.png">
			</div>
			<div class="slide">
				<img src="./resources/images/common/logo-brand/microsoft.png">
			</div>
			<div class="slide">
				<img src="./resources/images/common/logo-brand/huawei.png">
			</div>
			<div class="slide">
				<img src="./resources/images/common/logo-brand/lenovo.png">
			</div>

		</section>
	</div> -->
	<!-- Slide brand popular -->




	<div class="container">
		<h3 class="h3">List Most Product</h3>
		<div class="row h-100 justify-content-center align-items-center">

			<c:choose>
				<c:when test="${!empty listProduct}">
					<c:forEach var="tempProduct" items="${listProduct}">

						<div class="col-md-3 col-sm-6">
							<div class="product-grid4">
								<div class="product-image4">
								
									<c:url var="detailProductLink" value="/product">
										<c:param name="productId" value="${tempProduct.id}" />
									</c:url>
									
									<c:url var="addProductToWishList" value="/addToWishList">
										<c:param name="productId" value="${tempProduct.id}" />
									</c:url>
								
									<a href="${detailProductLink}"> <img class="pic-1"
										src="./resources/images/${tempProduct.productDetail.image}">
									</a>
									<a href="${detailProductLink}"> <img class="pic-2"
										src="./resources/images/${tempProduct.productDetail.image}">
									</a>
									<ul class="social">
										<li>
											<a href="${detailProductLink}" data-tip="Quick View">
											<i class="fa fa-eye"></i>
											</a>
										</li>
										<li>
											<a href="${addProductToWishList}" data-tip="Add to Wishlist">
												<i class="fa fa-heart"></i>
											</a>
										</li>
									</ul>
									<span class="product-new-label">New</span>
									<c:if test="${tempProduct.sale.percent > 0}">
										<span class="product-discount-label"> - ${tempProduct.sale.percent}%</span>
									</c:if>
								</div>
								<div class="product-content">
									<h3 class="title">
										${tempProduct.name}
									</h3>
									
									<script>
										$(document).ready(function(){
											var salePercent = ${tempProduct.sale.percent};
											console.log(salePercent);
											var priceNow = ${tempProduct.price};
											console.log(priceNow);
											
											if (salePercent > 0){
												var priceOld = priceNow + (priceNow*(salePercent/100));
												$('#originPrice-${tempProduct.id}').text(priceOld);
											}
										});
									</script>
									<div class="price">
										${tempProduct.price} <span id="originPrice-${tempProduct.id}"></span>
									</div>
									
									<c:url var="addProductToCart" value="/cart/addProductToCart">
										<c:param name="productId" value="${tempProduct.id}" />
									</c:url>
									<a class="add-to-cart" href="${addProductToCart}">ADD TO CART</a>
								</div>
							</div>
						</div>
						
					</c:forEach>
				</c:when>
			</c:choose>





		</div>
	</div>
	<hr>


	<%@include file="shared/footer.jsp"%>
	<button id="topBtn">
		<i class="fas fa-arrow-up"></i>
	</button>
	
	
	
	
	
	<script src="<c:url value="/resources/style/home/js/jquery.min.js" />"></script>
	<script src="<c:url value="/resources/style/home/js/bootstrap.min.js" />"></script>
	<script src="<c:url value="/resources/style/home/js/slick.min.js" />"></script>
	<script src="<c:url value="/resources/style/home/js/nouislider.min.js" />"></script>
	<script src="<c:url value="/resources/style/home/js/jquery.zoom.min.js" />"></script>
	<script src="<c:url value="/resources/style/home/js/main.js" />"></script>



</body>
</html>


