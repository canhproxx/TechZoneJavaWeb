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
<title>History Order Of You</title>

<meta name="viewport" content="width=device-width, initial-scale=1">

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
<link rel="stylesheet" href="<c:url value="/resources/style/home/css/font-awesome.min.css" />">

<!-- Custom stlylesheet -->
<link type="text/css" rel="stylesheet" href="<c:url value="/resources/style/home/css/style.css" />" />

<link rel="stylesheet" href="<c:url value="/resources/style/home/homepage.css" />">
<script src="<c:url value="/resources/style/home/homepage.js" />"></script>

<!-- CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>


</head>


<style type="text/css">
.parent {
	width: 17rem;
	height: 17rem;
}
.parent img {
	height: 100%;
	width: 100%;
	align-items: center;
}
#btn-back{
	border-radius: 0%;
}
#content{
margin-top: 5rem;
}
#shipping{
background-color: #ffa500;
color: black;
}
#waitting{
background-color: #b0e0e6;
color: black;
}
#finish{
background-color: #20b2aa;
color: black;
}
#cancel{
background-color: #f6546a;
color: black;
}
#btn-back{
background-color: black;
color: white;
}
#getDetail{
	background-color: #b6fcd5;
	color: black;
}
</style>

<body>


	<div id="content" class="container">
		<h2>Order History</h2>
		
		<button id="btn-back" type="button" onclick="goBack()" class="btn btn">Back</button>
		<script>
			function goBack() {
				window.history.go(-1);
			}
		</script>

		<table class="table table-bordered">
			<thead>
				<tr>
					<th class="text-info">Bill Id</th>
					<th class="text-info">Date Order</th>
					<th class="text-info">Total</th>
					<th class="text-info">Ship Status</th>
					<th class="text-info">Address</th>
					<th class="text-info">Phone</th>
					<th class="text-info">Note</th>

					<th class="text-info">Detail Bill</th>
				</tr>
			</thead>
			<tbody>

				<c:forEach var="tempBill" items="${theBills}">
				
					<tr>
						<td class="text-success">${tempBill.billId}</td>
						<td>${tempBill.dateOrder}</td>
						<td>${tempBill.total}</td>

						<c:if test="${tempBill.shipStatus == 'SHIPPING' }">
							<td>
								<span id="shipping" class="badge badge-warning">${tempBill.shipStatus}</span>
							</td>
						</c:if>
						<c:if test="${tempBill.shipStatus == 'WAITING' }">
							<td>
								<span id="waitting" class="badge badge-info">${tempBill.shipStatus}</span>
							</td>
						</c:if>
						<c:if test="${tempBill.shipStatus == 'FINISH' }">
							<td>
								<span id="finish" class="badge badge-success">${tempBill.shipStatus}</span>
							</td>
						</c:if>
						<c:if test="${tempBill.shipStatus == 'CANCEL' }">
							<td>
								<span id="cancel" class="badge badge-danger">${tempBill.shipStatus}</span>
							</td>
						</c:if>

						<td>${tempBill.address}</td>
						<td>${tempBill.phone}</td>
						<td>${tempBill.note}</td>
						<td>
							<c:url var="getDetailBill" value="/getDetailBill">
									<c:param name="theBillId" value="${tempBill.id}" />
							</c:url>
							<a id="getDetail" class="btn btn" href="${getDetailBill}">Get Detail</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>



</body>

</html>