<%@ page language="java" contentType="text/html; charset=UTF-8"
	isELIgnored="false" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page session="false"%>

<html>
<head>
<title>Bill</title>

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

<style type="text/css">
.image>a>img {
	width: 150px;
	height: auto;
}

#btn-back {
	background-color: #b6fcd5;
	border-radius: 5%;
}

#content {
	margin-top: 2rem;
}
</style>

</head>


<body>


	<div id="content" class="container">
		<h2>List Detail Your Bill</h2>

		<button id="btn-back" type="button" onclick="goBack()"
			class="btn btn-dark">Back</button>
		<script>
			function goBack() {
				window.history.go(-1);
			}
		</script>

		<table class="shopping-cart-table table">
			<thead>
				<tr>
					<th class="text-info">Bill Parent Id</th>
					<th class="text-info">Product</th>
					<th class="text-info">Single Price</th>
					<th class="text-info">Quantity</th>
					<th class="text-info">Sale Off</th>
					<th class="text-info">Image Product</th>
				</tr>
			</thead>
			<tbody>

				<c:forEach var="tempBillDetail" items="${theBillDetails}">
					<tr>
						<td class="details">${tempBillDetail.bill.billId}</td>
						<td class="details">${tempBillDetail.product.name}</td>
						<td class="details">${tempBillDetail.singlePrice}</td>
						<td class="details">${tempBillDetail.quantity}</td>
						<td class="details">${tempBillDetail.salePercent} %</td>
						<td class="image">
							<c:url var="detailProductLink"
								value="/product">
								<c:param name="productId" value="${tempBillDetail.product.id}" />
							</c:url>
							<a href="${detailProductLink}"> <img
								src="./resources/images/${tempBillDetail.product.productDetail.image}"
								alt="Photo">
						</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

	</div>
	
	<!-- Footer -->
	<%@include file="../shared/footer.jsp" %>


</body>

</html>