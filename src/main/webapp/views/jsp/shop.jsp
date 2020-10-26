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

<!-- Local -->
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

<link rel="stylesheet" href="<c:url value="/resources/style/home/homepage.css" />">
<script src="<c:url value="/resources/style/home/homepage.js" />"></script>

<!-- CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>


<!-- <link type="text/css" rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.css" /> -->


<title>TechZone</title>
</head>
<body style="background-color: rgb(250, 250, 250);">

	<!-- Header -->
	<%@include file="./shared/header.jsp"%>

	<!-- NAVIGATION -->
	<div id="navigation">
		<!-- container -->
		<div class="container">
			<div id="responsive-nav">
				<!-- category nav -->
				<div class="category-nav">
					<span class="category-header">Categories <i
						class="fa fa-list"></i></span>
					<ul class="category-list">
						<li class="dropdown side-dropdown"><a class="dropdown-toggle"
							data-toggle="dropdown" aria-expanded="true">Laptop
								<i class="fa fa-angle-right"></i>
						</a>
							<div class="custom-menu">
								<div class="row">
									<div class="col-md-4">
										<ul class="list-links">
											<li>
												<h3 class="list-links-title">Brand Popular</h3>
											</li>
											<c:choose>
												<c:when test="${!empty listBrand}">
													<c:forEach var="brand" items="${listBrand}">
														<li><a href="<c:url value = "/brandLap-${brand.name}"/>">${brand.name}</a></li>
													</c:forEach>
												</c:when>
											</c:choose>
										</ul>
									</div>

								</div>

							</div></li>
						<li class="dropdown side-dropdown"><a class="dropdown-toggle"
							data-toggle="dropdown" aria-expanded="true"> SmartPhone <i class="fa fa-angle-right"></i>
						</a>
							<div class="custom-menu">
								<div class="row">
									<div class="col-md-4">
										<ul class="list-links">
											<li>
												<h3 class="list-links-title">Sale Percent</h3>
											</li>
											<li><a href="<c:url value = "/saleSmartPhone-${0}-${5}"/>">0 - 5%</a></li>
											<li><a href="<c:url value = "/saleSmartPhone-${5}-${10}"/>">5 - 10%</a></li>
											<li><a href="<c:url value = "/saleSmartPhone-${10}-${15}"/>">10 - 15%</a></li>
											<li><a href="<c:url value = "/saleSmartPhone-${15}-${30}"/>">15 - 30%</a></li>
											
										</ul>
										<hr>
									</div>
									<div class="col-md-4">
										<ul class="list-links">
											<li>
												<h3 class="list-links-title">Price</h3>
											</li>
											<li><a href="<c:url value = "/priceSmartPhone-${0}-${2000000}"/>">0 - 2000000</a></li>
											<li><a href="<c:url value = "/priceSmartPhone-${2000000}-${5000000}"/>">2000000 - 5000000</a></li>
											<li><a href="<c:url value = "/priceSmartPhone-${5000000}-${10000000}"/>">5000000 - 10000000</a></li>
											<li><a href="<c:url value = "/priceSmartPhone-${10000000}-${20000000}"/>">10000000 - 20000000</a></li>
											<li><a href="<c:url value = "/priceSmartPhone-${20000000}-${0}"/>">Over 20000000</a></li>
										</ul>
										<hr>
									</div>
								</div>
							</div></li>

						<li><a href="<c:url value = "/showByCategory-Watch"/>">Watches</a></li>
						<li><a href="<c:url value = "/showByCategory-KeyBoard"/>">KeyBoard</a></li>
						<li><a href="<c:url value = "/showByCategory-Mouse"/>">Mouses</a></li>
						<li><a href="<c:url value = "/showByCategory-Screen"/>">Screen</a></li>
						<li><a href="<c:url value = "/showByCategory-Camera"/>">Camera</a></li>
						<li><a href="<c:url value = '/'/>">View All</a></li>
					</ul>	
				</div>
				<!-- /category nav -->

				<!-- menu nav -->
				<div class="menu-nav">
					<span class="menu-header">Menu <i class="fa fa-bars"></i></span>
					<ul class="menu-list">
						<li><a href="#">Shop</a></li>
						<li><a href="#">About Us</a></li>
						<li><a href="#">Contact</a></li>
						<li class="dropdown default-dropdown"><a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">All Category <i class="fa fa-caret-down"></i></a>
							<ul class="custom-menu">
							
							
								<c:choose>
									<c:when test="${!empty listCategory}">
										<c:forEach var="category" items="${listCategory}">
											<li><a href="<c:url value = "/showByCategory-${category.name}"/>">${category.name}</a></li>
										</c:forEach>
									</c:when>
								</c:choose>

							</ul>
						</li>
					</ul>
				</div>
				<!-- menu nav -->
			</div>
		</div>
		<!-- /container -->
	</div>
	<!-- /NAVIGATION -->


	<!-- HOME -->
	<div id="home">
		<!-- container -->
		<div class="container">
			<!-- home wrap -->
			<div class="home-wrap">
				<!-- home slick -->
				<div id="home-slick">
					<!-- banner -->
					<div class="banner banner-1">
						<img src="./resources/images/common/catalog5.jpg" alt="">
						<div class="banner-caption text-center">
							<h1>Apple sale</h1>
							<h3 class="white-color font-weak">Up to 50% Discount</h3>
							<button class="primary-btn">Shop Now</button>
						</div>
					</div>
					<!-- /banner -->

					<!-- banner -->
					<div class="banner banner-1">
						<img src="./resources/images/common/catalog9.png" alt="">
						<div class="banner-caption">
							<h1 class="primary-color">
								HOT DEAL<br> <span class="white-color font-weak">Up
									to 50% OFF</span>
							</h1>
							<button class="primary-btn">Shop Now</button>
						</div>
					</div>
					<!-- /banner -->

				</div>
				<!-- /home slick -->
			</div>
			<!-- /home wrap -->
		</div>
		<!-- /container -->
	</div>
	<!-- /HOME -->


	<!-- SEARCH -->
	<hr>
	<c:if test="${message != null }">
		<div style="border-radius: 0%;" class="alert alert-success">
			<button type="button" class="close" data-dismiss="alert">&times;</button>
			<strong>${message}</strong>
		</div>
	</c:if>
		<div class="container">
			<c:choose>
				<c:when test="${!empty listProductBySearch}">
					<c:forEach var="tempProduct" items="${listProductBySearch}">

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
									</a> <a href="${detailProductLink}"> <img class="pic-2"
										src="./resources/images/${tempProduct.productDetail.image}">
									</a>
									<ul class="social">
										<li><a href="${detailProductLink}" data-tip="View">
												<i class="fa fa-eye"></i>
										</a></li>
										<li><a href="${addProductToWishList}"
											data-tip="Add to Wishlist"> <i class="fa fa-heart"></i>
										</a></li>
									</ul>
									<span class="product-new-label">New</span>
									<c:if test="${tempProduct.sale.percent > 0}">
										<span class="product-discount-label"> -
											${tempProduct.sale.percent}%</span>
									</c:if>
								</div>
								<div class="product-content">
									<h3 class="title">${tempProduct.name}</h3>

									<script>
										$(document).ready(function() {
											var salePercent = ${tempProduct.sale.percent};
											var priceNow = ${tempProduct.price};

											if (salePercent > 0) {
											var priceOld = priceNow + (priceNow * (salePercent / 100));
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
									<c:if test="${tempProduct.inventory > 0}">
										<a class="add-to-cart" href="${addProductToCart}">ADD TO CART</a>
									</c:if>
									<c:if test="${tempProduct.inventory <= 0}">
										<a class="add-to-cart" href="#">Be out of stock</a>
									</c:if>
								</div>
							</div>
						</div>
						
					</c:forEach>
				</c:when>
			</c:choose>
		</div>
	<hr>
	<!-- SEARCH -->
	
	
	<!-- PRODUCT BY FILTER -->
	<div class="container">
			<c:choose>
				<c:when test="${!empty listProductByFilter}">
					<c:forEach var="tempProduct" items="${listProductByFilter}">

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
									</a> <a href="${detailProductLink}"> <img class="pic-2"
										src="./resources/images/${tempProduct.productDetail.image}">
									</a>
									<ul class="social">
										<li><a href="${detailProductLink}" data-tip="View">
												<i class="fa fa-eye"></i>
										</a></li>
										<li><a href="${addProductToWishList}"
											data-tip="Add to Wishlist"> <i class="fa fa-heart"></i>
										</a></li>
									</ul>
									<span class="product-new-label">New</span>
									<c:if test="${tempProduct.sale.percent > 0}">
										<span class="product-discount-label"> -
											${tempProduct.sale.percent}%</span>
									</c:if>
								</div>
								<div class="product-content">
									<h3 class="title">${tempProduct.name}</h3>

									<script>
										$(document).ready(function() {
											var salePercent = ${tempProduct.sale.percent};
											var priceNow = ${tempProduct.price};

											if (salePercent > 0) {
											var priceOld = priceNow + (priceNow * (salePercent / 100));
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
									
									<c:if test="${tempProduct.inventory > 0}">
										<a class="add-to-cart" href="${addProductToCart}">ADD TO CART</a>
									</c:if>
									<c:if test="${tempProduct.inventory <= 0}">
										<a class="add-to-cart" href="#">Be out of stock</a>
									</c:if>
								</div>
							</div>
						</div>
						
					</c:forEach>
				</c:when>
			</c:choose>
		</div>
	<!-- PRODUCT BY FILTER -->
	
	
	
	
	<!-- BIG SALE -->
	<div class="section">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">
				<!-- section-title -->
				<div class="col-md-12">
					<div class="section-title">
						<h2 class="title">BIG SALE</h2>
					</div>
				</div>
				<!-- /section-title -->
			
				<c:choose>
					<c:when test="${!empty topProductBigSale}">
						<c:forEach var="product" items="${topProductBigSale}">
							<div class="col-md-3 col-sm-6">
							<div class="product-grid4">
								<div class="product-image4">

									<c:url var="detailProductLink" value="/product">
										<c:param name="productId" value="${product.id}" />
									</c:url>

									<c:url var="addProductToWishList" value="/addToWishList">
										<c:param name="productId" value="${product.id}" />
									</c:url>

									<a href="${detailProductLink}"> <img class="pic-1"
										src="./resources/images/${product.productDetail.image}">
									</a> <a href="${detailProductLink}"> <img class="pic-2"
										src="./resources/images/${product.productDetail.image}">
									</a>
									<ul class="social">
										<li><a href="${detailProductLink}" data-tip="Quick View">
												<i class="fa fa-eye"></i>
										</a></li>
										<li><a href="${addProductToWishList}"
											data-tip="Add to Wishlist"> <i class="fa fa-heart"></i>
										</a></li>
									</ul>
									<span class="product-new-label">New</span>
									<c:if test="${product.sale.percent > 0}">
										<span class="product-discount-label"> -
											${product.sale.percent}%</span>
									</c:if>
								</div>
								<div class="product-content">
									<h3 class="title">${product.name}</h3>

									<script>
										$(document).ready(function() {
											var salePercent = ${product.sale.percent};
											var priceNow = ${product.price};
	
											if (salePercent > 0) {
											var priceOld = priceNow+ (priceNow * (salePercent / 100));
											$('#originPrice-${product.id}').text(priceOld);
											}
										});
									</script>
									<div class="price">
										${product.price} <span id="originPrice-${product.id}" style="color: red;"></span>
									</div>

									<c:url var="addProductToCart" value="/cart/addProductToCart">
										<c:param name="productId" value="${product.id}" />
									</c:url>
									<c:if test="${product.inventory > 0}">
										<a class="add-to-cart" href="${addProductToCart}">ADD TO CART</a>
									</c:if>
									<c:if test="${product.inventory <= 0}">
										<a class="add-to-cart" href="#">Be out of stock</a>
									</c:if>
								</div>
							</div>
						</div>
						</c:forEach>
					</c:when>
				</c:choose>

			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- BIG SALE -->
	
	<!-- MOST LIKED -->
	<div class="section">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">
				<!-- section-title -->
				<div class="col-md-12">
					<div class="section-title">
						<h2 class="title">MOST LIKED</h2>
					</div>
				</div>
				<!-- /section-title -->
			
			
				<c:choose>
					<c:when test="${!empty topFourProductBeLiked}">
						<c:forEach var="product" items="${topFourProductBeLiked}">
							<div class="col-md-3 col-sm-6">
							<div class="product-grid4">
								<div class="product-image4">

									<c:url var="detailProductLink" value="/product">
										<c:param name="productId" value="${product.id}" />
									</c:url>

									<c:url var="addProductToWishList" value="/addToWishList">
										<c:param name="productId" value="${product.id}" />
									</c:url>

									<a href="${detailProductLink}"> <img class="pic-1"
										src="./resources/images/${product.productDetail.image}">
									</a> <a href="${detailProductLink}"> <img class="pic-2"
										src="./resources/images/${product.productDetail.image}">
									</a>
									<ul class="social">
										<li><a href="${detailProductLink}" data-tip="Quick View">
												<i class="fa fa-eye"></i>
										</a></li>
										<li><a href="${addProductToWishList}"
											data-tip="Add to Wishlist"> <i class="fa fa-heart"></i>
										</a></li>
									</ul>
									<span class="product-new-label">New</span>
									<c:if test="${product.sale.percent > 0}">
										<span class="product-discount-label"> -
											${product.sale.percent}%</span>
									</c:if>
								</div>
								<div class="product-content">
									<h3 class="title">${product.name}</h3>

									<script>
										$(document).ready(function() {
											var salePercent = ${product.sale.percent};
											var priceNow = ${product.price};
	
											if (salePercent > 0) {
											var priceOld = priceNow+ (priceNow * (salePercent / 100));
											$('#originPrice-${product.id}').text(priceOld);
											}
										});
									</script>
									<div class="price">
										${product.price} <span id="originPrice-${product.id}" style="color: red;"></span>
									</div>

									<c:url var="addProductToCart" value="/cart/addProductToCart">
										<c:param name="productId" value="${product.id}" />
									</c:url>
									<c:if test="${product.inventory > 0}">
										<a class="add-to-cart" href="${addProductToCart}">ADD TO CART</a>
									</c:if>
									<c:if test="${product.inventory <= 0}">
										<a class="add-to-cart" href="#">Be out of stock</a>
									</c:if>
								</div>
							</div>
						</div>
						</c:forEach>
					</c:when>
				</c:choose>

			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- MOST LIKED -->
	
	<!-- BEST MOST PRODUCT PURCHASED -->
	<div class="section">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">
				<!-- section-title -->
				<div class="col-md-12">
					<div class="section-title">
						<h2 class="title">HOT PRODUCT</h2>
					</div>
				</div>
				<!-- /section-title -->
				
				<div class="col-md-4 col-sm-6 col-xs-6"></div>
				
				
				<!-- Product Single -->
				<div class="col-md-4 col-sm-6 col-xs-6">
					<div class="product product-single product-hot">
						<div class="product-thumb">
							<div class="product-label">
								<span class="sale">TOP PRODUCT</span>
							</div>
							<ul class="product-countdown">
								<li><span>05 H</span></li>
								<li><span>00 M</span></li>
								<li><span>00 S</span></li>
							</ul>
							
							<c:url var="detailProductLink" value="/product">
								<c:param name="productId" value="${mostPurchasedProduct.id}" />
							</c:url>
							<a href="${detailProductLink}" data-tip="Quick View">
								<button class="main-btn quick-view">
									<i class="fa fa-search-plus"></i> view
								</button>
							</a>
							
							<img src="./resources/images/${mostPurchasedProduct.productDetail.image}" alt="">
						</div>
						<div class="product-body">
							<h3 class="product-price">
								${mostPurchasedProduct.price}
							</h3>
							<div class="product-rating">
								<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
									class="fa fa-star"></i> <i class="fa fa-star"></i> <i
									class="fa fa-star-o empty"></i>
							</div>
							<h2 class="product-name">
								<a href="#">${mostPurchasedProduct.name}</a>
							</h2>
							<div class="product-btns">
								<button class="main-btn icon-btn">
									<i class="fa fa-exchange"></i>
								</button>


								<c:url var="addProductToWishList" value="/addToWishList">
									<c:param name="productId" value="${mostPurchasedProduct.id}" />
								</c:url>

								<a href="${addProductToWishList}" data-tip="Add to Wishlist">
									<button class="main-btn icon-btn">
										<i class="fa fa-heart"></i>
									</button>
								</a>

								<c:url var="addProductToCart" value="/cart/addProductToCart">
									<c:param name="productId" value="${mostPurchasedProduct.id}" />
								</c:url>
								
								<c:if test="${mostPurchasedProduct.inventory > 0}">
									<a href="${addProductToCart}">
										<button class="primary-btn add-to-cart">
											<i class="fa fa-shopping-cart"></i> ADD TO CART
										</button>
									</a>
								</c:if>
								<c:if test="${mostPurchasedProduct.inventory <= 0}">
									<a href="#">
										<button class="primary-btn add-to-cart">
											<i class="fa fa-shopping-cart"></i> Be out of stock
										</button>
									</a>
								</c:if>

							</div>
						</div>
					</div>
				</div>
				<!-- /Product Single -->

				<div class="col-md-4 col-sm-6 col-xs-6"></div>

			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- BEST MOST PRODUCT PURCHASED -->


	<!-- LAPTOP & SMARTPHONE -->
	<div class="section">
		<!-- container -->
		<div class="container">
		
			<!-- row -->
			<div class="row">
				<!-- section-title -->
				<div class="col-md-12">
					<div class="section-title">
						<h2 class="title">LAPTOP</h2>
						<div class="pull-right">
							<div class="product-slick-dots-1 custom-dots"></div>
						</div>
					</div>
				</div>
				<!-- /section-title -->

				<!-- banner -->
				<div class="col-md-3 col-sm-6 col-xs-6">
					<div class="banner banner-2">
						<img
							src="./resources/images/MacBook-Pro-2019-Retina/b8552e81-99b7-4f2e-b096-7edbeff0c003.png"
							alt="">
						<div class="banner-caption">
							<h2 class="white-color">
								NEW<br>COLLECTION
							</h2>
							<button class="primary-btn">Shop Now</button>
						</div>
					</div>
				</div>
				<!-- /banner -->


				<!-- Product Slick -->
				<div class="col-md-9 col-sm-6 col-xs-6">
					<div class="row">
						<div id="product-slick-1" class="product-slick">

							<c:choose>
								<c:when test="${!empty listProduct_Laptop}">
									<c:forEach var="product" items="${listProduct_Laptop}">

										<!-- Product Single -->
										<div class="product product-single">
											<div class="product-thumb">
												<div class="product-label">
													<span>New</span>
													<c:if test="${product.sale.percent > 0}">
														<span class="sale">-${product.sale.percent}%</span>
													</c:if>
												</div>
												
												<c:url var="detailProductLink" value="/product">
													<c:param name="productId" value="${product.id}" />
												</c:url>
												<a href="${detailProductLink}" data-tip="Quick View">
													<button class="main-btn quick-view">
														<i class="fa fa-search-plus"></i> view
													</button>
												</a>

												<img src="./resources/images/${product.productDetail.image}" alt="">
											</div>
											<div class="product-body">

												<h3 class="product-price">
													${product.price}
													<del id="originPrice-${product.id}"
														class="product-old-price"></del>
													<script>
														$(document)
																.ready(
																		function() {
																			var salePercent = $
																			{
																				product.sale.percent
																			}
																			;
																			var priceNow = $
																			{
																				product.price
																			}
																			;

																			if (salePercent > 0) {
																				var priceOld = priceNow
																						+ (priceNow * (salePercent / 100));
																				$(
																						'#originPrice-${product.id}')
																						.text(
																								priceOld);
																			}
																		});
													</script>
												</h3>
												<div class="product-rating">
													<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
														class="fa fa-star"></i> <i class="fa fa-star"></i> <i
														class="fa fa-star-o empty"></i>
												</div>
												<h2 class="product-name">
													<a href="#">${product.name}</a>
												</h2>
												<div class="product-btns">

													<button class="main-btn icon-btn">
														<i class="fa fa-exchange"></i>
													</button>


													<c:url var="addProductToWishList" value="/addToWishList">
														<c:param name="productId" value="${product.id}" />
													</c:url>

													<a href="${addProductToWishList}"
														data-tip="Add to Wishlist">
														<button class="main-btn icon-btn">
															<i class="fa fa-heart"></i>
														</button>
													</a>

													<c:url var="addProductToCart"
														value="/cart/addProductToCart">
														<c:param name="productId" value="${product.id}" />
													</c:url>
													
													<c:if test="${product.inventory > 0 }">
														<a href="${addProductToCart}">
															<button class="primary-btn add-to-cart">
																<i class="fa fa-shopping-cart"></i> ADD TO CART
															</button>
														</a>
													</c:if>
													
													<c:if test="${product.inventory <= 0 }">
														<a href="#">
															<button class="primary-btn add-to-cart">
																<i class="fa fa-shopping-cart"></i> Be out of stock
															</button>
														</a>
													</c:if>


												</div>
											</div>
										</div>
										<!-- /Product Single -->

									</c:forEach>
								</c:when>
							</c:choose>

						</div>
					</div>
				</div>
				<!-- /Product Slick -->
			</div>
			<!-- /row -->







			<!-- row -->
			<div class="row">
				<!-- section title -->
				<div class="col-md-12">
					<div class="section-title">
						<h2 class="title">Smart Phone</h2>
						<div class="pull-right">
							<div class="product-slick-dots-2 custom-dots"></div>
						</div>
					</div>
				</div>
				<!-- section title -->

				<!-- Product Single -->
				<div class="col-md-3 col-sm-6 col-xs-6">
					<div class="product product-single product-hot">
						<div class="product-thumb">
							<div class="product-label">
								<span>New</span> <span class="sale">-20%</span>
							</div>
							<ul class="product-countdown">
								<li><span>00 H</span></li>
								<li><span>00 M</span></li>
								<li><span>00 S</span></li>
							</ul>
							<button class="main-btn quick-view">
								<i class="fa fa-search-plus"></i> Quick view
							</button>
							<img
								src="./resources/images/Iphone-11-Pro/2fd5da39-73d5-4716-b6e7-289ea6f0bcd0.jpeg"
								alt="">
						</div>
						<div class="product-body">
							<h3 class="product-price">
								$1000.50
								<del class="product-old-price">$1200.00</del>
							</h3>
							<div class="product-rating">
								<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
									class="fa fa-star"></i> <i class="fa fa-star"></i> <i
									class="fa fa-star-o empty"></i>
							</div>
							<h2 class="product-name">
								<a href="#">Iphone 11 Pro</a>
							</h2>
							<div class="product-btns">
								<button class="main-btn icon-btn">
									<i class="fa fa-heart"></i>
								</button>
								<button class="main-btn icon-btn">
									<i class="fa fa-exchange"></i>
								</button>
								<button class="primary-btn add-to-cart">
									<i class="fa fa-shopping-cart"></i> Add to Cart
								</button>
							</div>
						</div>
					</div>
				</div>
				<!-- /Product Single -->

				<!-- Product Slick -->
				<div class="col-md-9 col-sm-6 col-xs-6">
					<div class="row">
						<div id="product-slick-2" class="product-slick">

							<c:choose>
								<c:when test="${!empty listProduct_SmartPhone}">
									<c:forEach var="product" items="${listProduct_SmartPhone}">

										<!-- Product Single -->
										<div class="product product-single">
											<div class="product-thumb">
												<div class="product-label">
													<span>New</span>
													<c:if test="${product.sale.percent > 0}">
														<span class="sale">-${product.sale.percent}%</span>
													</c:if>
												</div>

												<c:url var="detailProductLink" value="/product">
													<c:param name="productId" value="${product.id}" />
												</c:url>
												<a href="${detailProductLink}" data-tip="Quick View">
													<button class="main-btn quick-view">
														<i class="fa fa-search-plus"></i> view
													</button>
												</a> <img
													src="./resources/images/${product.productDetail.image}"
													alt="">
											</div>
											<div class="product-body">

												<h3 class="product-price">
													${product.price}
													<del id="originPrice-${product.id}"
														class="product-old-price"></del>
													<script>
														$(document)
																.ready(
																		function() {
																			var salePercent = $
																			{
																				product.sale.percent
																			}
																			;
																			var priceNow = $
																			{
																				product.price
																			}
																			;

																			if (salePercent > 0) {
																				var priceOld = priceNow
																						+ (priceNow * (salePercent / 100));
																				$(
																						'#originPrice-${product.id}')
																						.text(
																								priceOld);
																			}
																		});
													</script>
												</h3>
												<div class="product-rating">
													<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
														class="fa fa-star"></i> <i class="fa fa-star"></i> <i
														class="fa fa-star-o empty"></i>
												</div>
												<h2 class="product-name">
													<a href="#">${product.name}</a>
												</h2>
												<div class="product-btns">

													<button class="main-btn icon-btn">
														<i class="fa fa-exchange"></i>
													</button>


													<c:url var="addProductToWishList" value="/addToWishList">
														<c:param name="productId" value="${product.id}" />
													</c:url>

													<a href="${addProductToWishList}"
														data-tip="Add to Wishlist">
														<button class="main-btn icon-btn">
															<i class="fa fa-heart"></i>
														</button>
													</a>

													<c:url var="addProductToCart"
														value="/cart/addProductToCart">
														<c:param name="productId" value="${product.id}" />
													</c:url>
													
													<c:if test="${product.inventory > 0}">
														<a href="${addProductToCart}">
															<button class="primary-btn add-to-cart">
																<i class="fa fa-shopping-cart"></i> ADD TO CART
															</button>
														</a>
													</c:if>
													<c:if test="${product.inventory <= 0}">
														<a href="#">
															<button class="primary-btn add-to-cart">
																<i class="fa fa-shopping-cart"></i> Be out of stock
															</button>
														</a>
													</c:if>

												</div>
											</div>
										</div>
										<!-- /Product Single -->

									</c:forEach>
								</c:when>
							</c:choose>


						</div>
					</div>
				</div>
				<!-- /Product Slick -->
			</div>
			<!-- /row -->
			
	
		</div>
		<!-- /container -->
	</div>
	<!-- LAPTOP & SMARTPHONE -->

	<!-- OTHER CATEGORY -->
	<div class="section">
		<!-- container -->
		<div class="container">
		
			<!-- row -->
			<div class="row">
				<!-- section-title -->
				<div class="col-md-12">
					<div class="section-title">
						<h2 class="title">OTHER CATEGORY</h2>
						<div class="pull-right">
							<div class="product-slick-dots-3 custom-dots"></div>
						</div>
					</div>
				</div>
				<!-- /section-title -->

				<!-- banner -->
				<div class="col-md-3 col-sm-6 col-xs-6">
					<div class="banner banner-2">
						<img
							src="./resources/images/MacBook-Pro-2019-Retina/b8552e81-99b7-4f2e-b096-7edbeff0c003.png"
							alt="">
						<div class="banner-caption">
							<h2 class="white-color">
								NEW<br>COLLECTION
							</h2>
							<button class="primary-btn">Shop Now</button>
						</div>
					</div>
				</div>
				<!-- /banner -->


				<!-- Product Slick -->
				<div class="col-md-9 col-sm-6 col-xs-6">
					<div class="row">
						<div id="product-slick-3" class="product-slick">

							<c:choose>
								<c:when test="${!empty listProduct}">
									<c:forEach var="product" items="${listProduct}">

										<!-- Product Single -->
										<div class="product product-single">
											<div class="product-thumb">
												<div class="product-label">
													<span>New</span>
													<c:if test="${product.sale.percent > 0}">
														<span class="sale">-${product.sale.percent}%</span>
													</c:if>
												</div>
												
												<c:url var="detailProductLink" value="/product">
													<c:param name="productId" value="${product.id}" />
												</c:url>
												<a href="${detailProductLink}" data-tip="Quick View">
													<button class="main-btn quick-view">
														<i class="fa fa-search-plus"></i> view
													</button>
												</a>

												<img src="./resources/images/${product.productDetail.image}" alt="">
											</div>
											<div class="product-body">

												<h3 class="product-price">
													${product.price}
													<del id="originPrice-${product.id}"
														class="product-old-price"></del>
													<script>
														$(document)
																.ready(
																		function() {
																			var salePercent = $
																			{
																				product.sale.percent
																			}
																			;
																			var priceNow = $
																			{
																				product.price
																			}
																			;

																			if (salePercent > 0) {
																				var priceOld = priceNow
																						+ (priceNow * (salePercent / 100));
																				$(
																						'#originPrice-${product.id}')
																						.text(
																								priceOld);
																			}
																		});
													</script>
												</h3>
												<div class="product-rating">
													<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
														class="fa fa-star"></i> <i class="fa fa-star"></i> <i
														class="fa fa-star-o empty"></i>
												</div>
												<h2 class="product-name">
													<a href="#">${product.name}</a>
												</h2>
												<div class="product-btns">

													<button class="main-btn icon-btn">
														<i class="fa fa-exchange"></i>
													</button>

													<c:url var="addProductToWishList" value="/addToWishList">
														<c:param name="productId" value="${product.id}" />
													</c:url>

													<a href="${addProductToWishList}"
														data-tip="Add to Wishlist">
														<button class="main-btn icon-btn">
															<i class="fa fa-heart"></i>
														</button>
													</a>

													<c:url var="addProductToCart"
														value="/cart/addProductToCart">
														<c:param name="productId" value="${product.id}" />
													</c:url>
													
													<c:if test="${product.inventory > 0 }">
														<a href="${addProductToCart}">
															<button class="primary-btn add-to-cart">
																<i class="fa fa-shopping-cart"></i> ADD TO CART
															</button>
														</a>
													</c:if>
													
													<c:if test="${product.inventory <= 0 }">
														<a href="#">
															<button class="primary-btn add-to-cart">
																<i class="fa fa-shopping-cart"></i> Be out of stock
															</button>
														</a>
													</c:if>

												</div>
											</div>
										</div>
										<!-- /Product Single -->

									</c:forEach>
								</c:when>
							</c:choose>

						</div>
					</div>
				</div>
				<!-- /Product Slick -->
			</div>
			<!-- /row -->

	
		</div>
		<!-- /container -->
	</div>
	<!-- OTHER CATEGORY -->

	<!-- COLLECTION -->
	<div class="section">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">
			<!-- section-title -->
				<div class="col-md-12">
					<div class="section-title">
						<h2 class="title">NEW COLLECTION</h2>
					</div>
				</div>
				<!-- /section-title -->
				<!-- banner -->
				<div class="col-md-4 col-sm-6">
					<a class="banner banner-1" href="#"> <img
						src="./resources/images/common/collection/MacbookPro-2019.png"
						alt="">
						<div class="banner-caption text-center">
							<!-- <h2 class="white-color">NEW COLLECTION</h2> -->
						</div>
					</a>
				</div>
				<!-- /banner -->

				<!-- banner -->
				<div class="col-md-4 col-sm-6">
					<a class="banner banner-1" href="#"> <img
						src="./resources/images/common/collection/AppleWatch.png" alt="">
						<div class="banner-caption text-center">
							<!-- <h2 class="white-color">NEW COLLECTION</h2> -->
						</div>
					</a>
				</div>
				<!-- /banner -->

				<!-- banner -->
				<div class="col-md-4 col-md-offset-0 col-sm-6 col-sm-offset-3">
					<a class="banner banner-1" href="#"> <img
						src="./resources/images/common/collection/Iphone11-Promax.png"
						alt="">
						<div class="banner-caption text-center">
							<!-- <h2 class="white-color">NEW COLLECTION</h2> -->
						</div>
					</a>
				</div>
				<!-- /banner -->

			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- COLLECTION -->


		<button style="border-radius: 5%;" id="topBtn">
			<img src="${pageContext.request.contextPath}/resources/icon/up-arrow.png" alt="icon">
		</button>
		<script type="text/javascript">
		$(document).ready(function(){
			$(window).scroll(function(){
			
				if($(this).scrollTop() > 80 ){
					$('#topBtn').fadeIn();
				} else {
					$('#topBtn').fadeOut();
				}
			});
			$("#topBtn").click(function(){
				$('html,body').animate({scrollTop : 0},850);
			});
		});
		</script>

	<%@include file="shared/footer.jsp"%>

	<script src="<c:url value="/resources/style/home/js/jquery.min.js" />"></script>
	<script
		src="<c:url value="/resources/style/home/js/bootstrap.min.js" />"></script>
	<script src="<c:url value="/resources/style/home/js/slick.min.js" />"></script>
	<script
		src="<c:url value="/resources/style/home/js/nouislider.min.js" />"></script>
	<script
		src="<c:url value="/resources/style/home/js/jquery.zoom.min.js" />"></script>
	<script src="<c:url value="/resources/style/home/js/main.js" />"></script>



</body>
</html>
