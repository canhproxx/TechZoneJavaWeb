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
<title>Product</title>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Ela Admin - HTML5 Admin Template">
<meta name="viewport" content="width=device-width, initial-scale=1">


<style type="text/css">
.table {
	font-size: 18px;
}

#panigation-info {
	padding: 0.5rem;
	color: #0e3386;
	text-align: center;
}

#btn-index {
	background: #e6e6fa;
	border-radius: 20%;
	color: black;
}
</style>

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
									<li class="active">Products</li>
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

								<div class="row">
									<a href="<c:url value='/admin/product/showForm'/>">
										<button type="button" class="btn btn-success">
											<img id="img-slide"
												src="${pageContext.request.contextPath}/resources/icon/plus.png"
												alt="icon">
										</button>
									</a>


									<c:url value="/admin/product/actionPage" var="prev">
										<c:param name="action" value="prev" />
									</c:url>
									<a href="${prev}">
										<button type="button" class="btn btn-outline">
											<img id="img-slide"
												src="${pageContext.request.contextPath}/resources/icon/previous.png"
												alt="icon">
										</button>
									</a>

									<c:forEach var="i" begin="0" end="${totalPage}">

										<c:url value="/admin/product/goPageIndex" var="goPageIndex">
											<c:param name="index" value="${i}" />
										</c:url>
										<a href="${goPageIndex}">
											<button id="btn-index" type="button" class="btn btn-outline">${i+1}</button>
										</a>

									</c:forEach>

									<c:url value="/admin/product/actionPage" var="next">
										<c:param name="action" value="next" />
									</c:url>
									<a href="${next}">
										<button type="button" class="btn btn-outline">
											<img id="img-slide"
												src="${pageContext.request.contextPath}/resources/icon/next.png"
												alt="icon">
										</button>
									</a>

									<c:set var="indexPageCurrent" value="${indexPage+1}" />
									<c:set var="totalPages" value="${totalPage+1}" />

									<strong id="panigation-info">Page ${indexPageCurrent}
										of ${totalPages}</strong>


									<c:if test="${message != '' }">
										<div style="border-radius: 0%;padding: 1rem;" class="alert alert-success">
											<button type="button" class="close" data-dismiss="alert">&times;</button>
											<strong>${message}</strong>
										</div>
									</c:if>

								</div>


							</div>
							<div class="card-body">
								<table id="bootstrap-data-table"
									class="table table-striped table-bordered">

									<thead>
										<tr>
											<th class="text-info">Name</th>
											<th class="text-info">Price</th>
											<th class="text-info">Inventory</th>
											<th class="text-info">Category</th>
											<th class="text-info">Brand</th>
											<th class="text-info">Sale</th>
											<th class="text-info">Warranty</th>
											<th>Update</th>
											<th>Delete</th>
										</tr>
									</thead>

									<tbody>
										<c:forEach var="tempProduct" items="${products}">
											<tr>
												<td>${tempProduct.name}</td>
												<td>${tempProduct.price}</td>
												<td>${tempProduct.inventory}</td>
												<td>${tempProduct.category.name}</td>
												<td>${tempProduct.brand.name}</td>
												<td>${tempProduct.sale.percent}%</td>
												<td>${tempProduct.productDetail.warranty}</td>

												<td><c:url var="updateLink"
														value="/admin/product/update">
														<c:param name="productId" value="${tempProduct.id}" />
													</c:url> <a href="${updateLink}">
														<button type="button" class="btn btn-outline-info btn-sm">
															<img id="img-slide"
																src="${pageContext.request.contextPath}/resources/icon/edit.png"
																alt="icon">
														</button>
												</a></td>
												<td><c:url var="deleteLink"
														value="/admin/product/delete">
														<c:param name="productId" value="${tempProduct.id}" />
													</c:url> <a href="${deleteLink}"
													onclick="if (!(confirm('Are you sure you want to delete this product?'))) return false">
														<button type="button"
															class="btn btn-outline-danger btn-sm">
															<img id="img-slide"
																src="${pageContext.request.contextPath}/resources/icon/delete.png"
																alt="icon">
														</button>
												</a></td>
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

