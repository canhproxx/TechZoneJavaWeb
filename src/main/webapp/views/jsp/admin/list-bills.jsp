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
<title>Bills</title>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Ela Admin - HTML5 Admin Template">
<meta name="viewport" content="width=device-width, initial-scale=1">

</head>



<body>


	<%@include file="../admin/dashboard/side-bar.jsp"%>


	<div id="right-panel" class="right-panel">

		<!-- Header-->
		<header id="header" class="header">
			<div class="top-left">
				<div class="navbar-header">
					<a class="navbar-brand" href="./">TECHZONE ADMIN</a> <a
						class="navbar-brand hidden" href="./"><img
						src="images/logo2.png" alt="Logo"></a> <a id="menuToggle"
						class="menutoggle"><i class="fa fa-bars"></i></a>
				</div>
			</div>
		</header>
		<!-- /header -->
		<!-- Header-->

		<div class="breadcrumbs">
			<div class="breadcrumbs-inner">
				<div class="row m-0">
					<div class="col-sm-4">
						<div class="page-header float-left">
							<div class="page-title">
								<h1>Dashboard</h1>
							</div>
						</div>
					</div>
					<div class="col-sm-8">
						<div class="page-header float-right">
							<div class="page-title">
								<ol class="breadcrumb text-right">
									<li><a href="#">Dashboard</a></li>
									<li><a href="#">Table</a></li>
									<li class="active">Bills</li>
								</ol>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="content">
			<div class="animated fadeIn">
				<div class="row">

					<div class="col-md-12">
						<div class="card">
							<div class="card-header">
								<strong class="card-title">Data Table</strong>
							</div>
							<div class="card-body">
								<table id="bootstrap-data-table"
									class="table table-striped table-bordered">

									<thead>
										<tr>
											<th>Bill Id</th>
											<th>Date Order</th>
											<th>Total</th>
											<th>Revenue</th>
											<th>Ship Status</th>
											<th>Address</th>
											<th>Phone</th>
											<th>Note</th>
											<th>Customer</th>
											<th>Employee</th>
											<th>Detail Bill</th>
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
													<td><span class="badge badge-info">${tempBill.shipStatus}</span>
													</td>
												</c:if>

												<c:if test="${tempBill.shipStatus == 'WAITING' }">
													<td><span class="badge badge-warning">${tempBill.shipStatus}
															Confirm</span></td>
												</c:if>

												<c:if test="${tempBill.shipStatus == 'FINISH' }">
													<td><span class="badge badge-success">${tempBill.shipStatus}</span>
													</td>
												</c:if>
												<c:if test="${tempBill.shipStatus == 'CANCEL' }">
													<td><span class="badge badge-danger">${tempBill.shipStatus}</span>
													</td>
												</c:if>

												<td>${tempBill.address}</td>
												<td>${tempBill.phone}</td>
												<td>${tempBill.note}</td>
												<td>${tempBill.customer.lastName}</td>
												<td>${tempBill.employee.lastName}</td>
												<td><c:url var="getDetailBill"
														value="/admin/bill/getDetailBill">
														<c:param name="theBillId" value="${tempBill.id}" />
													</c:url> <a id="btn-Detail" class="btn btn-outline-warning"
													href="${getDetailBill}">Get Detail</a></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>


				</div>
			</div>
			<!-- .animated -->
		</div>
		<!-- .content -->


		<div class="clearfix"></div>

		<footer class="site-footer">
			<div class="footer-inner bg-white">
				<div class="row">
					<div class="col-sm-6">Copyright &copy; 2018 Ela Admin</div>
					<div class="col-sm-6 text-right">
						Designed by <a href="https://colorlib.com">Colorlib</a>
					</div>
				</div>
			</div>
		</footer>

	</div>
	<!-- /#right-panel -->

	<!-- Right Panel -->


</body>
</html>
