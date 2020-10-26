<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	isELIgnored="false" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Form Category</title>

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
									<li class="active">Category Form</li>
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

					<div class="col-lg-5">
						<div class="card">
							<div class="card-header">
								<strong class="card-title">Category Card</strong>
							</div>
							<div class="card-body">
								<!-- Credit Card -->
								<div id="pay-invoice">
									<div class="card-body">
										
										<form:form method="post"
											action="saveCategory?${_csrf.parameterName}=${_csrf.token}"
											modelAttribute="categoryModel" class="form-horizontal"
											enctype="multipart/form-data">

											<form:input path="id" type="hidden" />
											<div class="form-group">
													<form:input path="name" type="text" class="form-control"
														id="name" name="name" placeholder="Enter name of category" />
											</div>
											
											<hr>
											<div>
												<button id="payment-button" type="submit"
													class="btn btn-lg btn-info btn-block">
													<span id="payment-button-amount">Create</span>
												</button>
											</div>

										</form:form>
										
									</div>
								</div>
							</div>
						</div>
						<!-- .card -->

					</div>
					<!--/.col-->

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