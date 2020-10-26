<%@page import="com.techzone.springmvc.util.SecurityUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	isELIgnored="false" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page session="false"%>


<!DOCTYPE html>

<html>
<head>

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



<title>TechZone</title>
</head>
<body style="background-color: rgb(242, 243, 245);">


	<!-- NAVIGATION -->
	<div id="navigation">
		<!-- container -->
		<div class="container">
			<div id="responsive-nav">
				<!-- category nav -->
				<div class="category-nav">
					<span class="category-header">
					
					Category
					
					<i class="dropdown default-dropdown">
						<a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
							<i class="fa fa-list"></i>
						</a>
							<ul class="custom-menu">
								<c:choose>
									<c:when test="${!empty listCategory}">
										<c:forEach var="category" items="${listCategory}">
											<li><a
												href="<c:url value = "/showByCategory-${category.name}"/>">${category.name}</a></li>
										</c:forEach>
									</c:when>
								</c:choose>

							</ul>
					</i>
					
					</span>
				</div>
				<!-- /category nav -->

				<!-- menu nav -->
				<div class="menu-nav">
					<span class="menu-header">Menu <i class="fa fa-bars"></i></span>
					<ul class="menu-list">
						<li><a href="<c:url value='/' />">Shop</a></li>
						<li><a href="#">About Us</a></li>
						<li><a href="#">Contact</a></li>
					</ul>
				</div>
				<!-- menu nav -->
			</div>
		</div>
		<!-- /container -->
	</div>
	<!-- /NAVIGATION -->

	<!-- BREADCRUMB -->
	<div id="breadcrumb">
		<div class="container">
			<ul class="breadcrumb">
				<li><a href="#">Home</a></li>
				<li class="active">Checkout</li>
			</ul>
		</div>
	</div>
	<!-- /BREADCRUMB -->

	<c:if test="${message != null }">
		<div style="border-radius: 0%;" class="alert alert-success">
			<button type="button" class="close" data-dismiss="alert">&times;</button>
			<strong>${message}</strong>
		</div>
	</c:if>

	<!-- section -->
	<div class="section">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">
				<form:form id="checkout-form" method="POST" action="confirmPayment"
					modelAttribute="theUserCheckoutModel" class="clearfix">
					<div class="col-md-6">
						<div class="billing-details">
							<!-- <p>Already a customer ? <a href="#">Login</a></p> -->
							<div class="section-title">
								<h3 class="title">Billing Details</h3>
							</div>

							<!-- User Authenticated -->
							<security:authorize access="isAuthenticated()">

								<div class="form-group">
									<form:input id="input-checkout" type="text" disabled="true"
										readonly="readonly" path="user.firstName"
										placeholder="First Name" autofocus="true"></form:input>
								</div>

								<div class="form-group">
									<form:input id="input-checkout" type="text" disabled="true"
										readonly="readonly" path="user.lastName"
										placeholder="Last Name" autofocus="true"></form:input>
								</div>

								<div class="form-group">
									<form:input id="input-checkout" type="email" disabled="true"
										readonly="readonly" path="user.email" placeholder="Email"
										autofocus="true"></form:input>
								</div>

								<div class="form-group">
									<label>City</label>
									<form:select id="listCitiesSelect" path="city"
										items="${cityList}" />
								</div>

								<spring:bind path="address">
									<div class="form-group" ${status.error ? 'has-error' : ''}>
										<form:input id="input-checkout" type="text" path="address"
											placeholder="Address" autofocus="true"></form:input>
									</div>
								</spring:bind>

								<spring:bind path="phone">
									<div class="form-group" ${status.error ? 'has-error' : ''}>
										<form:input id="input-checkout" type="text" path="phone"
											placeholder="Phone" autofocus="true"></form:input>
									</div>
								</spring:bind>

								<label class="text-info">Note To Shop</label>
								<div class="form-group">
									<form:textarea id="noteShop" path="note" rows="2" cols="40" />
								</div>

							</security:authorize>


							<!-- User in Anonymous -->
							<security:authorize access="isAnonymous()">
								<spring:bind path="user.firstName">
									<div class="form-group ${status.error ? 'has-error' : ''}">
										<form:input id="input-checkout" type="text"
											path="user.firstName" placeholder="First Name"
											autofocus="true"></form:input>
										<form:errors path="user.firstName"></form:errors>
									</div>
								</spring:bind>
								<spring:bind path="user.lastName">
									<div class="form-group ${status.error ? 'has-error' : ''}">
										<form:input id="input-checkout" type="text"
											path="user.lastName" placeholder="Last Name" autofocus="true"></form:input>
										<form:errors path="user.lastName"></form:errors>
									</div>
								</spring:bind>
								<spring:bind path="user.email">
									<div class="form-group ${status.error ? 'has-error' : ''}">
										<form:input id="input-checkout" type="text" path="user.email"
											placeholder="Email" autofocus="true"></form:input>
										<form:errors path="user.email"></form:errors>
									</div>
								</spring:bind>
								<spring:bind path="phone">
									<div class="form-group ${status.error ? 'has-error' : ''}">
										<form:input id="input-checkout" type="text" path="phone"
											placeholder="Phone" autofocus="true"></form:input>
										<form:errors path="phone"></form:errors>
									</div>
								</spring:bind>
								<div class="form-group">
									<label>City</label>
									<form:select path="city" items="${cityList}" />
								</div>
								<spring:bind path="address">
									<div class="form-group ${status.error ? 'has-error' : ''}">
										<form:input id="input-checkout" type="text" path="address"
											placeholder="Address" autofocus="true"></form:input>
										<form:errors path="address"></form:errors>
									</div>
								</spring:bind>
								<label class="text-info">Note To Shop</label>
								<div class="form-group">
									<form:textarea id="noteShop" path="note" rows="2" cols="40" />
								</div>

								<hr>
								<strong><span class="badge badge-info">Only once
										, create your account to manager transaction at TechZone</span></strong>
								<spring:bind path="user.username">
									<div class="form-group ${status.error ? 'has-error' : ''}">
										<label class="text-info">Username</label>
										<form:input id="input-checkout" type="text"
											path="user.username" placeholder="Enter your username"
											autofocus="true"></form:input>
										<form:errors path="user.username"></form:errors>
									</div>
								</spring:bind>
								<spring:bind path="user.password">
									<div class="form-group ${status.error ? 'has-error' : ''}">
										<label class="text-info">Password</label>
										<form:input id="input-checkout" type="password"
											path="user.password" placeholder="Enter your password"
											autofocus="true"></form:input>
										<form:errors path="user.password"></form:errors>
									</div>
								</spring:bind>
							</security:authorize>

						</div>
					</div>

					<div class="col-md-6">
						<div class="shiping-methods">
							<div class="section-title">
								<h4 class="title">Shiping Methods</h4>
							</div>
							<div class="input-checkbox">
								<input type="radio" name="shipping" id="shipping-1" checked>
								<label for="shipping-1">Free Shiping - $0.00</label>
								<div class="caption">
									<p>
										The product will be done more than 5 day from place order time
									<p>
								</div>
							</div>
							<div class="input-checkbox">
								<input type="radio" name="shipping" id="shipping-2"> <label
									for="shipping-2">Standard - $4.00</label>
								<div class="caption">
									<p>
									The product will be done less than 3 day from place order time
									<p>
								</div>
							</div>
						</div>

						<div class="payments-methods">
							<div class="section-title">
								<h4 class="title">Payments Methods</h4>
							</div>
							<div class="input-checkbox">
								<input type="radio" name="payments" id="payments-1" checked>
								<label for="payments-1">Direct Bank Transfer</label>
								<div class="caption">
									<p>
									Support for Techcombank , Vietcombank , Viettinbank , BIDV
									<p>
								</div>
							</div>
							<div class="input-checkbox">
								<input type="radio" name="payments" id="payments-2"> <label
									for="payments-2">TechZone Wallet</label>
								<div class="caption">
									<p>
									Sorry, this method in process development
									<p>
								</div>
							</div>
							<div class="input-checkbox">
								<input type="radio" name="payments" id="payments-3"> <label
									for="payments-3">Cash on deliver</label>
								<div class="caption">
									<p>
										Payment when you get product
									<p>
								</div>
							</div>
						</div>
					</div>


					<div class="col-md-12">
						<div class="order-summary clearfix">
							<div class="section-title">
								<h3 class="title">Order Review</h3>
							</div>
							<table class="shopping-cart-table table">
								<thead>
									<tr>
										<th>Product</th>
										<th></th>
										<th class="text-center">Price</th>
										<th class="text-center">Quantity</th>
										<th class="text-center">Total</th>
										<th class="text-right"></th>
									</tr>
								</thead>
								<tbody>

									<c:choose>
										<c:when test="${!empty listItem}">
											<c:forEach items="${listItem}" var="item">
												<tr>
													<td class="thumb"><img
														src="${pageContext.request.contextPath}/resources/images/${item.product.productDetail.image}"
														alt="Image Product"></td>
													<td class="details"><a href="#">${item.product.name}</a>
													</td>

													<td class="price text-center"><strong>${item.product.price}
															(Sale ${item.product.sale.percent}%)</strong><br></td>
													<td class="price text-center"><strong>${item.quantity}</strong>
													<td class="total text-center"><strong
														class="primary-color">${item.quantity * item.product.price}</strong></td>
													<td class="text-right"><button
															class="main-btn icon-btn">
															<i class="fa fa-close"></i>
														</button></td>
												</tr>
											</c:forEach>
										</c:when>
									</c:choose>

								</tbody>
								<tfoot>
									<tr>
										<th class="empty" colspan="3"></th>
										<th>TOTAL</th>
										<th colspan="2" class="total">${totalPayment}</th>
									</tr>
								</tfoot>
							</table>
							<div class="pull-right">
								<button type="submit" class="primary-btn">Place Order</button>
							</div>
						</div>

					</div>
				</form:form>
				<a href="<c:url value='/' />"><button type="submit"
						class="primary-btn">Cancel</button></a>
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /section -->


	<%@include file="../shared/footer.jsp"%>

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
