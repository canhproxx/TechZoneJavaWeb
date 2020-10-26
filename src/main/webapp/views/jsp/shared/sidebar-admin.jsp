<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	isELIgnored="false" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page session="false"%>



<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description"
	content="Responsive sidebar template with sliding effect and dropdown menu based on bootstrap 3">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css"
	rel="stylesheet">

<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->



<link rel="stylesheet" href="<c:url value="/resources/style/dashboard/dashboard.css" />">
<script src="<c:url value="/resources/style/dashboard/dashboard.js" />"></script>



<!-- <div class="page-wrapper chiller-theme toggled"> -->
	<a id="show-sidebar" class="btn btn-sm btn-dark" href="#"> <i
		class="fas fa-bars"></i>
	</a>
	<nav id="sidebar" class="sidebar-wrapper">
		<div class="sidebar-content">
			<div class="sidebar-brand">
				<a style="display: flex; align-items: center;" href="#">
				<form:form action="${pageContext.request.contextPath}/logout" method="post">
					<button type="submit" class="btn btn-outline-danger" style="border-radius: 0%;">LogOut</button>
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
				</form:form>
				&nbsp &nbsp
				<strong style="padding-bottom: 1rem;">DASHBOARD</strong>
				</a>
				
				<div id="close-sidebar">
					<i class="fas fa-times"></i>
				</div>
			</div>
			<div class="sidebar-header">
				<div class="user-pic">
					<img class="img-responsive img-rounded"
						src="${pageContext.request.contextPath}/resources/images/common/admin.png"
						alt="User picture">
				</div>
				<div class="user-info">
					<span class="user-name">Duy<strong>Khanh</strong>
					</span> <span class="user-role">Administrator</span> <span
						class="user-status"> <i class="fa fa-circle"></i> <span>Online</span>
					</span>
				</div>
			</div>
			<!-- sidebar-header  -->
			<div class="sidebar-search">
				<div>
					<div class="input-group">
						<input type="text" class="form-control search-menu"
							placeholder="Search...">
						<div class="input-group-append">
							<span class="input-group-text"> <i class="fa fa-search"
								aria-hidden="true"></i>
							</span>
						</div>
					</div>
				</div>
			</div>
			<!-- sidebar-search  -->
			<div class="sidebar-menu">
				<ul>
					<li class="header-menu"><span>General</span></li>
					<li class="sidebar-dropdown"><a href="#"> <i
							class="fa fa-tachometer-alt"></i> <span>Dashboard</span> <span
							class="badge badge-pill badge-info">Admin</span>
					</a>
						<div class="sidebar-submenu">
							<ul>
								<li><c:url var="productManager" value="/admin/product/" />
									<a href="${productManager}">Product <span
										class="badge badge-pill badge-success">Pro</span>
								</a></li>
								<li><c:url var="categoryManager" value="/admin/category/" />
									<a href="${categoryManager}">Category </a></li>
								<li><c:url var="brandManager" value="/admin/brand/" /> <a
									href="${brandManager}">Brand </a></li>
								<li><c:url var="saleManager" value="/admin/sale/" /> <a
									href="${saleManager}">Sale </a></li>
								<li><c:url var="userManager" value="/admin/user/" /> <a
									href="${userManager}">User </a></li>

								
							</ul>
						</div></li>
					<li class="sidebar-dropdown"><a href="#"> <i
							class="fa fa-shopping-cart"></i> <span>E-commerce</span> <span
							class="badge badge-pill badge-danger">3</span>
					</a>
						<div class="sidebar-submenu">
							<ul>
								<li><c:url var="cartDbManager" value="/admin/cartdb" />
									<a href="${cartDbManager}">CartDB</a>
								</li>
								<li><c:url var="billManager" value="/admin/bill" />
									<a href="${billManager}">Bill Order </a>
								</li>
								<li><c:url var="billDetailManager" value="/admin/billDetail" />
									<a href="${billDetailManager}">BillDetail Order </a>
								</li>
							</ul>
						</div></li>
					<li class="sidebar-dropdown"><a href="#"> <i
							class="far fa-gem"></i> <span>Components</span>
					</a>
						<div class="sidebar-submenu">
							<ul>
								<li><a href="#">General</a></li>
								<li><a href="#">Panels</a></li>
								<li><a href="#">Tables</a></li>
								<li><a href="#">Icons</a></li>
								<li><a href="#">Forms</a></li>
							</ul>
						</div></li>
					<li class="sidebar-dropdown"><a href="#"> <i
							class="fa fa-chart-line"></i> <span>Charts</span>
					</a>
						<div class="sidebar-submenu">
							<ul>
								<li><a href="#">Pie chart</a></li>
								<li><a href="#">Line chart</a></li>
								<li><a href="#">Bar chart</a></li>
								<li><a href="#">Histogram</a></li>
							</ul>
						</div></li>
					<li class="sidebar-dropdown"><a href="#"> <i
							class="fa fa-globe"></i> <span>Maps</span>
					</a>
						<div class="sidebar-submenu">
							<ul>
								<li><a href="#">Google maps</a></li>
								<li><a href="#">Open street map</a></li>
							</ul>
						</div></li>
					<li class="header-menu"><span>Extra</span></li>
					<li>
					<c:url var="listProductPanigation" value="/api/ajax/listProduct" />
					<a href="${listProductPanigation}"> <i class="fa fa-book"></i> <span>Documentation</span>
							<span class="badge badge-pill badge-primary">Beta</span>
					</a>
					</li>
					<li><a href="#"> <i class="fa fa-calendar"></i> <span>Calendar</span>
					</a></li>
					<li><a href="#"> <i class="fa fa-folder"></i> <span>Examples</span>
					</a></li>
				</ul>
			</div>
			<!-- sidebar-menu  -->
		</div>
		<!-- sidebar-content  -->
		<div class="sidebar-footer">
			<c:url var="billConfirm" value="/admin/billConfirm" />
			<a href="${billConfirm}"> <i class="fa fa-check"></i> <span
				class="badge badge-pill badge-info notification">${quantityConfirmBill}</span>
			</a>
			<a href="#"> <i class="fa fa-bell"></i> <span
				class="badge badge-pill badge-warning notification">3</span>
			</a> <a href="#"> <i class="fa fa-envelope"></i> <span
				class="badge badge-pill badge-success notification">7</span>
			</a> <a href="#"> <i class="fa fa-cog"></i> <span class="badge-sonar"></span>
			</a> <a href="${pageContext.request.contextPath}/"> <i
				class="fa fa-power-off"></i>
			</a>
			
		</div>
	</nav>
<!-- </div> -->


<!-- page-wrapper -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
