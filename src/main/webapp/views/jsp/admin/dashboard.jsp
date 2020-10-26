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
<title>DashBoard</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>





<style type="text/css">
.example_e {
	background: #404040;
	color: #f2f2f2 !important;
	font-weight: 100;
	border-radius: 2px;
	padding: 20px;
	text-transform: uppercase;
	border-radius: 0% solid;
	display: inline-block;
	transition: all 0.3s ease 0s;
}

.example_e:hover {
	color: #404040 !important;
	text-decoration: none;
	border-radius: 0%;
	border-color: green;
	font-weight: 700 !important;
	letter-spacing: 3px;
	background: none;
	-webkit-box-shadow: 0px 5px 40px -10px rgba(0, 0, 0, 0.57);
	-moz-box-shadow: 0px 5px 40px -10px rgba(0, 0, 0, 0.57);
	transition: all 0.3s ease 0s;
}
</style>
</head>

<body>

	
	<hr>
	
	<div class="row">
		<div class="col-sm-2">
			<h2>Dash Board Zone</h2>
		</div>
		<div class="col-sm-8">
		<div class="container">
				<div class="row">
					<div class="button_cont" align="center">
						<c:url var="productManager" value="/admin/product/" />
						<a class="example_e" href="${productManager}" title="MANAGER PRODUCT">Product</a>
					</div>
					&nbsp
					<div class="button_cont" align="center">
						<c:url var="categoryManager" value="/admin/category/" />
						<a class="example_e" href="${categoryManager}" title="MANAGER CATEGORY">Category</a>
					</div>
					&nbsp
					<div class="button_cont" align="center">
						<c:url var="brandManager" value="/admin/brand/" />
						<a class="example_e" href="${brandManager}" title="MANAGER BRAND">Brand</a>
					</div>
					&nbsp
					<div class="button_cont" align="center">
						<c:url var="saleManager" value="/admin/sale/" />
						<a class="example_e" href="${saleManager}" title="MANAGER SALE">Sale</a>
					</div>
					&nbsp
					<div class="button_cont" align="center">
						<c:url var="userManager" value="/admin/user/" />
						<a class="example_e" href="${userManager}" title="MANAGER User">User</a>
					</div>
					&nbsp
					<div class="button_cont" align="center">
						<c:url var="cartDbManager" value="/admin/cartdb" />
						<a class="example_e" href="${cartDbManager}" title="MANAGER Cartdb">CartDB</a>
					</div>
					&nbsp
					<div class="button_cont" align="center">
						<c:url var="billManager" value="/admin/bill" />
						<a class="example_e" href="${billManager}" title="MANAGER Bill">Bill</a>
					</div>
					&nbsp
					<div class="button_cont" align="center">
						<c:url var="billDetailManager" value="/admin/billDetail" />
						<a class="example_e" href="${billDetailManager}" title="MANAGER Bill">Bill Detail</a>
					</div>
					
				</div>
			</div>
		
		</div>
		<div class="col-sm-2">
			<form:form action="${pageContext.request.contextPath}/logout"
				method="post">
				<button type="submit" class="btn btn-outline-dark btn-sm">Log
					Out</button>
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" />

				<a href="<c:url value='/'/>"><button type="button"
						class="btn btn-outline-dark btn-sm">Home</button></a>
			</form:form>


		</div>
	</div>

	<%-- 	<div>
		<form:form action="${pageContext.request.contextPath}/logout"
			method="post">
			<button type="submit" class="btn btn-outline-dark btn-sm">Log
				Out</button>
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
		</form:form>
	</div> --%>

	<hr>







<%-- 	<div>
		<c:url var="productManager" value="/admin/product/" />
		<a href="${productManager}" title="MANAGER PRODUCT">Product</a>
	</div>
	<div>
		<c:url var="categoryManager" value="/admin/category/" />
		<a href="${categoryManager}" title="MANAGER CATEGORY">Category</a>
	</div>
	<div>
		<c:url var="brandManager" value="/admin/brand/" />
		<a href="${brandManager}" title="MANAGER BRAND">Brand</a>
	</div>
	<div>
		<c:url var="saleManager" value="/admin/sale/" />
		<a href="${saleManager}" title="MANAGER SALE">Sale</a>
	</div>
	<div>
		<c:url var="userManager" value="/admin/user/" />
		<a href="${userManager}" title="MANAGER User">User</a>
	</div>
	<div>
		<c:url var="cartDbManager" value="/admin/cartdb" />
		<a href="${cartDbManager}" title="MANAGER Cartdb">CartDB</a>
	</div>
	<div>
		<c:url var="billManager" value="/admin/bill" />
		<a href="${billManager}" title="MANAGER Bill">Bill</a>
	</div>
	<div>
		<c:url var="billDetailManager" value="/admin/billDetail" />
		<a href="${billDetailManager}" title="MANAGER Bill">Bill Detail</a>
	</div>
 --%>



	<div class="alert alert-success alert-dismissible">
		<button type="button" class="close" data-dismiss="alert">&times;</button>
		<strong>Access DashBoard Success !</strong> Now you have right manager
		in Page
	</div>

	<div class="jumbotron text-center" style="margin-bottom: 0">
		<p>Footer</p>
	</div>
</body>
</html>