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
<title>User</title>


<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Ela Admin - HTML5 Admin Template">
<meta name="viewport" content="width=device-width, initial-scale=1">

<style>
#search{
	border-radius: 2px;
	background: white;
	border: none;
	height: 2.5rem;
	width: 5rem;
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
									<li class="active">Account</li>
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
								<a href="<c:url value='/admin/user/addUser'/>">
									<button type="button" class="btn btn-success">
										<img id="img-slide"
											src="${pageContext.request.contextPath}/resources/icon/plus.png"
											alt="icon">
									</button>
								</a>

							</div>
							<div class="card-body">
								<table id="bootstrap-data-table"
									class="table table-striped table-bordered">

									<thead>
										<tr>
											<th>Id</th>
											<th>Email</th>
											<th>User Name</th>
											<th>First Name</th>
											<th>Last Name</th>
											<th>Earn Money</th>
											<th>Role</th>
											<th>Update</th>
											<th>Delete</th>
										</tr>
									</thead>

									<tbody>
										<c:forEach var="tempUser" items="${users}">
											<tr>
												<td>${tempUser.id}</td>
												<td>${tempUser.email}</td>
												<td>${tempUser.username}</td>
												<td>${tempUser.firstName}</td>
												<td>${tempUser.lastName}</td>
												<td>${tempUser.earnMoney}</td>
												<td><c:forEach items="${tempUser.roles}" var="role">
														<c:if test="${role.roleName == 'ADMIN'}">
															<span class="badge badge-danger">${role.roleName}</span>
														</c:if>
														<c:if test="${role.roleName == 'STAFF'}">
															<span class="badge badge-warning">${role.roleName}</span>
														</c:if>
														<c:if test="${role.roleName == 'USER'}">
															<span class="badge badge-info">${role.roleName}</span>
														</c:if>
													</c:forEach></td>

												<td><c:if test="${tempUser.username != 'default'}">
														<c:url var="updateLink" value="/admin/user/update">
															<c:param name="userId" value="${tempUser.id}" />
														</c:url>
														<a href="${updateLink}">
															<button type="button" class="btn btn-outline">
																<img id="img-slide"
																	src="${pageContext.request.contextPath}/resources/icon/edit.png"
																	alt="icon">
															</button>
														</a>
													</c:if> <c:if test="${tempUser.username == 'default'}">
														<button type="button" disabled class="btn btn-outline">
															<img id="img-slide"
																src="${pageContext.request.contextPath}/resources/icon/edit.png"
																alt="icon">
														</button>
													</c:if></td>

												<td><c:url var="deleteLink" value="/admin/user/delete">
														<c:param name="userId" value="${tempUser.id}" />
													</c:url> <a href="${deleteLink}"
													onclick="if (!(confirm('Are you sure you want to delete this user?'))) return false">
														<button type="button" class="btn btn-outline">
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
