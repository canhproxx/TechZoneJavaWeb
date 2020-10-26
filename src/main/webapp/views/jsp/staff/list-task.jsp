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
<title>Task List</title>

<meta name="viewport" content="width=device-width, initial-scale=1">

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

<style type="text/css">
.table {
	font-size: 15px;
}

#btn-setDoneBill {
	background-color: #40e0d0;
	color: black;
	border: none;
	border-radius: 0%;
	width: 10rem;
}

#btn-setFailBill {
	background-color: #f6546a;
	color: black;
	border: none;
	border-radius: 0%;
	width: 10rem;
}
#finish{
background-color: #20b2aa;
color: black;
}
#cancel{
background-color: #f6546a;
color: black;
}
#waiting{
background-color: #bada55;
color: black;
}
#getDetail{
	background-color: #b6fcd5;
	color: black;
}
#back{
	background-color: #b0e0e6;
	color: black;
}
body{
	background-color: rgb(252, 252, 252);
}
/*****/

</style>

</head>


<body>

	<div id="content" class="container">
		<h2>Task List</h2>

		
		<a href="<c:url value="/" />">
		<button id="back" type="button" class="btn btn">Back Home</button>
		</a>
				
				
		<table class="shopping-cart-table table">
			<thead>
				<tr>
					<th class="details">Bill Id</th>
					<th class="details">Date Order</th>
					<th class="details">Total</th>
					<th class="details">Sum Item</th>
					<th class="details">Ship Status</th>
					<th class="details">Address</th>
					<th class="details">Phone</th>
					<th class="details">Note</th>
					<th class="details">Customer</th>
					<th class="details">Employee</th>
					<th class="details">Detail Bill</th>
				</tr>
			</thead>
			<tbody>

				<c:forEach var="tempBill" items="${theBills}">
					<tr>
						<td class="text-success">${tempBill.billId}</td>
						<td>${tempBill.dateOrder}</td>
						<td>${tempBill.total}</td>
						<td>${tempBill.revenue}</td>

						<c:if test="${tempBill.shipStatus == 'SHIPPING' }">
							<td>
								<c:url var="setDoneBill" value="/staff/setDoneBill">
									<c:param name="theBillId" value="${tempBill.id}" />
								</c:url>
								<a id="btn-setDoneBill" class="btn btn" href="${setDoneBill}">Done Bill</a>
								
								<c:url var="setFailBill" value="/staff/setFailBill">
									<c:param name="theBillId" value="${tempBill.id}" />
								</c:url>
								<a id="btn-setFailBill" class="btn btn" href="${setFailBill}">Failed Bill</a>
							</td>
						</c:if>
						
						<c:if test="${tempBill.shipStatus == 'WAITING' }">
							<td><span id="waiting" class="badge badge-warning">${tempBill.shipStatus}</span>
							</td>
						</c:if>

						<c:if test="${tempBill.shipStatus == 'FINISH' }">
							<td><span id="finish" class="badge badge-success">${tempBill.shipStatus}</span>
							</td>
						</c:if>
						<c:if test="${tempBill.shipStatus == 'CANCEL' }">
							<td><span id="cancel" class="badge badge-danger">${tempBill.shipStatus}</span>
							</td>
						</c:if>

						<td>${tempBill.address}</td>
						<td>${tempBill.phone}</td>
						<td>${tempBill.note}</td>
						<td>${tempBill.customer.lastName}</td>
						<td>${tempBill.employee.lastName}</td>
						<td><c:url var="getDetailBill"
								value="/staff/getDetailBill">
								<c:param name="theBillId" value="${tempBill.id}" />
							</c:url> <a id="getDetail" class="btn btn" href="${getDetailBill}">Get Detail</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	


</body>

</html>