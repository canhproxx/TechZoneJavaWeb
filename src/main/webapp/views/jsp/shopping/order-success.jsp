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

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>


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


<title>Order Success</title>
</head>
<body>

	<hr>


	<div class="container">
		<div class="row">
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
				<strong>YOUR ORDER SUCCESSFULLY !</strong>
				<div class="jumbotron">
					<strong class="text-success">Your Bill Id : </strong> <span>${theResponseInfoShopping.billId}</span><br>
					<strong>Thank's ${theResponseInfoShopping.user.lastName}
						for Shopping at TechZone </strong>
				</div>

				<table class="shopping-cart-table table">

					<thead>
						<tr>
							<th>Product</th>
							<th>Name</th>
							<th class="text-center">Quantity</th>
						</tr>
					</thead>
					<tbody>

						<c:choose>
							<c:when test="${!empty theResponseInfoShopping.items}">
								<c:forEach var="item" items="${theResponseInfoShopping.items}">
									<tr>
										<td class="thumb"><img
											src="${pageContext.request.contextPath}/resources/images/${item.product.productDetail.image}"
											alt="Image Product"></td>

										<td class="details"><a href="#">${item.product.name}</a></td>
										<td class="price text-center"><strong>${item.quantity}</strong>
									</tr>
								</c:forEach>
							</c:when>
						</c:choose>

					</tbody>
					<tfoot>
						<tr>
							<th class="empty" colspan="3"></th>
							<th>Please Ready Money</th>
							<th colspan="2" class="total">${theResponseInfoShopping.readyMoney}</th>
						</tr>
					</tfoot>
				</table>
				<a href="<c:url value='/' />"><button type="submit" class="primary-btn">Go Back TechZone</button></a>
			</div>

			<div class="col-sm-3"></div>
		</div>
	</div>

	<!-- Footer -->
	<%@include file="../shared/footer.jsp"%>

</body>
</html>



