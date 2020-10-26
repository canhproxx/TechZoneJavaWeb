<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@page import="com.techzone.springmvc.util.SecurityUtil"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
#btn-logout{
	background: #003366;
	margin-bottom: 1px;
	border-radius : 0px;
	color: white;
}
</style>


<!-- HEADER -->
	<header>
		<!-- top Header -->
		<div id="top-header">
			<div class="container">
				<div class="pull-left">
					<span>Welcome <strong class="text-uppercase"><%=SecurityUtil.getPrincipal()%></strong> come to TechZone!</span>
				</div>
				<div class="pull-right">
					<ul class="header-top-links">
					
						<security:authorize access="hasRole('ADMIN')">
						<li><a href="<c:url value='/admin/managerment'/>"><spring:message code="home.dashboard" /></a></li>
						</security:authorize>
						
						<security:authorize access="hasRole('STAFF')">
						<li><a href="<c:url value='/staff/managerment'/>"><spring:message code="home.staff" /></a></li>
						</security:authorize>
					
						<li class="dropdown default-dropdown">
							<a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">LANGUAGE <i class="fa fa-caret-down"></i></a>
							<ul class="custom-menu">
								<li><a href="?lang=en">English (ENG)</a></li>
								<li><a href="?lang=vn">Vietnamesee (VI)</a></li>
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
						<a class="logo" href="<c:url value='/' />">
							<img src="./resources/images/common/signage.png" alt="">
						</a>
					</div>
					<!-- /Logo -->
					
					
					

					<!-- Search -->
					<div class="header-search">
					
						<form action="./search" method="GET">
						
							<input class="input search-input" name='searchInfo' type="text" placeholder="<spring:message code="home.search" />">
							
							<button type="submit" class="search-btn"><i class="fa fa-search"></i></button>
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
								<strong class="text-uppercase">My Account</strong>
							</div>
							<a href="<c:url value='/showMyLoginPage'/>" class="text-uppercase">Login</a> /
							<a href="<c:url value='/registration'/>" class="text-uppercase">join</a>
							
							<ul class="custom-menu">
							
							<security:authorize access="isAuthenticated()">
								<li><a href="<c:url value='/myAccount'/>"><i class="fa fa-user-o"></i> My Account</a></li>
								<li><a href="<c:url value='/wishList'/>"><i class="fa fa-heart-o"></i> My Wishlist</a></li>
								<li><a href="<c:url value='/orderHistory'/>"><i class="fa fa-file-o"></i> Order History</a></li>
							</security:authorize>
							
								
								<li><a href="#"><i class="fa fa-exchange"></i> Compare</a></li>
								
								<security:authorize access="isAuthenticated()">
								
								<c:if test="${sumItemInCart > 0}">
									<li><a href="<c:url value="/cart/buy" />"><i class="fa fa-check"></i>Checkout</a></li>
								</c:if>
								
								<c:if test="${sumItemInCart == 0}">
									<li><a id="app" href="#"><i class="fa fa-check"></i>Checkout</a></li>
									<script>
										$(document).ready(function(){
											$('#app').click(function(){
												alert('Your cart is empty');
											});
										});
									</script>
								</c:if>
								
								<li>
									<form:form action="${pageContext.request.contextPath}/logout" method="post">
									<button id="btn-logout" type="submit" class="btn btn">
										<spring:message code="home.logout" />
									</button>
									<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
									</form:form>
								</li>
								</security:authorize>
								
								<security:authorize access="isAnonymous()">
									<li><a href="<c:url value='/registration'/>"><i class="fa fa-user-plus"></i>
									<spring:message code="home.register" /></a></li>
								</security:authorize>
								
								
							</ul>
						</li>
						<!-- /Account -->

						<!-- Cart -->
						<li class="header-cart dropdown default-dropdown">
							<a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
								<div class="header-btns-icon">
									<i class="fa fa-shopping-cart"></i>
									<span class="qty">${sumItemInCart}</span>
								</div>
								<strong class="text-uppercase"><spring:message code="home.cart" /></strong>
								<br>
								<span id = "SumPrice">${total}</span>
							</a>
							<div class="custom-menu">
								<div id="shopping-cart">
									<div class="shopping-cart-list">
									
										<c:choose>
											<c:when test="${!empty cart}">
												<c:forEach items="${cart}" var="item">
													<div class="product product-widget">
														<div class="product-thumb">
															<img src="./resources/images/${item.product.productDetail.image}" alt="">
														</div>
														<div class="product-body">
															<h3 class="product-price">${item.product.price} <span class="qty">x ${item.quantity}</span></h3>
															<h2 class="product-name"><a href="#">${item.product.name}</a></h2>
														</div>
														
														<c:url var="removeProductInCart" value="/cart/removeProductInCart">
															<c:param name="productId" value="${item.product.id}" />
														</c:url>
														
														<a href="${removeProductInCart}">
															<button class="cancel-btn"><i class="fa fa-trash"></i></button>
														</a>
														
													</div>
												</c:forEach>
											</c:when>
										</c:choose>
										
									</div>
									<div class="shopping-cart-btns">
									
									

									<a href="<c:url value='/cart'/>"> 
										<button class="main-btn">View Cart</button>
									</a>
									
									<c:if test="${sumItemInCart > 0}">
										<a href="<c:url value='/cart/buy'/>"> 
										<button class="primary-btn">Checkout <i class="fa fa-arrow-circle-right"></i></button>
									</a>
									</c:if>

										
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