<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	isELIgnored="false" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Form Product</title>


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<link rel="stylesheet"
	href="<c:url value="/resources/style/form/vendor/mdi-font/css/material-design-iconic-font.min.css" />">
<link rel="stylesheet"
	href="<c:url value="/resources/style/form/vendor/font-awesome-4.7/css/font-awesome.min.css" />">
<link rel="stylesheet"
	href="<c:url value="/resources/style/form/vendor/select2/select2.min.css" />">
<link rel="stylesheet"
	href="<c:url value="/resources/style/form/vendor/datepicker/daterangepicker.css" />">
<link rel="stylesheet"
	href="<c:url value="/resources/style/form/css/main.css" />">

<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i"
	rel="stylesheet">

</head>
<body>


	<c:if test="${message != null }">
		<div style="border-radius: 0%;" class="alert alert-warning">
			<button type="button" class="close" data-dismiss="alert">&times;</button>
			<strong>${message}</strong>
		</div>
	</c:if>

	<div class="page-wrapper bg-gra-03 p-t-45 p-b-50">
		<div class="wrapper wrapper--w790">
			<div class="card card-5">
				<div class="card-heading">
					<h2 class="title">Add New Product</h2>
				</div>
				<div class="card-body">

					<form:form method="post"
						action="saveProduct?${_csrf.parameterName}=${_csrf.token}"
						modelAttribute="productModel" class="form-horizontal"
						enctype="multipart/form-data">

						<form:input path="product.id" type="hidden" />

						<spring:bind path="product.name">
							<div class="form-row">
								<div class="name">Name Product</div>
								<div class="value">
									<div class="input-group">
										<form:input path="product.name" type="text"
											class="input--style-5" id="name" name="name"
											placeholder="Enter name of product" />
										<form:errors id="error" path="product.name"></form:errors>
									</div>
								</div>
							</div>
						</spring:bind>

						<div class="form-row m-b-55">
							<div class="name">Info</div>
							<div class="value">
								<div class="row row-space">
								
									<spring:bind path="product.price">
										<div class="col-2">
											<div class="input-group-desc">
												<form:input path="product.price" type="text"
													class="input--style-5" id="price" name="price"
													placeholder="Enter price of product" />
												<form:errors id="error" path="product.price"></form:errors>
												<label class="label--desc">Price</label>
											</div>
										</div>
									</spring:bind>

									<spring:bind path="product.inventory">
										<div class="col-2">
											<div class="input-group-desc">
												<form:input path="product.inventory" type="text"
													class="input--style-5" id="inventory" name="inventory"
													placeholder="Enter inventory" />
												<form:errors id="error" path="product.inventory"></form:errors>
												<label class="label--desc">Inventory</label>
											</div>
										</div>
									</spring:bind>

								</div>
							</div>
						</div>

						<spring:bind path="productDetail.info">
							<div class="form-row">
								<div class="name">Detailed Specifications</div>
								<div class="value">
									<div class="input-group">
										<form:input path="productDetail.info" type="text"
											class="input--style-5" id="info" name="info"
											placeholder="Enter detail product" />
										<form:errors id="error" path="productDetail.info"></form:errors>
									</div>
								</div>
							</div>
						</spring:bind>

						<div class="form-row">
							<div class="name">Category</div>
							<div class="value">
								<div class="input-group">
									<div class="rs-select2 js-select-simple select--no-search">
										<form:select path="product.category.id" name="subject">
											<option disabled="disabled" selected="selected">Choose category</option>
											<form:options items="${categorys}" itemLabel="name"
												itemValue="id" />
										</form:select>
										<div class="select-dropdown"></div>
									</div>
								</div>
							</div>
						</div>

						<div class="form-row">
							<div class="name">Brand</div>
							<div class="value">
								<div class="input-group">
									<div class="rs-select2 js-select-simple select--no-search">
										<form:select path="product.brand.id" name="subject">
											<option disabled="disabled" selected="selected">Choose brand</option>
											<form:options items="${brands}" itemLabel="name"
												itemValue="id" />
										</form:select>
										<div class="select-dropdown"></div>
									</div>
								</div>
							</div>
						</div>

						<div class="form-row">
							<div class="name">Sale</div>
							<div class="value">
								<div class="input-group">
									<div class="rs-select2 js-select-simple select--no-search">
										<form:select path="product.sale.id" name="subject">
											<option disabled="disabled" selected="selected">Choose sale</option>
											<form:options items="${sales}" itemLabel="event"
												itemValue="id" />
										</form:select>
										<div class="select-dropdown"></div>
									</div>
								</div>
							</div>
						</div>

						<div class="form-row m-b-55">
							<div class="name">More</div>
							<div class="value">
								<div class="row row-refine">

									<spring:bind path="productDetail.warranty">
										<div class="col-3">
											<div class="input-group-desc">
												<form:input path="productDetail.warranty" type="text"
													class="input--style-5" id="warranty" name="warranty"
													placeholder="Enter warranty of product" />
												<form:errors id="error" path="productDetail.warranty"></form:errors>
												<label class="label--desc">Warranty</label>
											</div>
										</div>
									</spring:bind>

									<spring:bind path="images">
										<div class="col-9">
											<div class="input-group-desc">
												<div class="form-group">
													<input class="input--style-5" type="file" name="images"
														multiple="multiple" />
													<form:errors path="images"></form:errors>
												</div>
												<label class="label--desc">Photo Selected</label>
											</div>
										</div>
									</spring:bind>
								</div>
							</div>
						</div>

						<div>
							<button class="btn btn--radius-2 btn--blue" type="submit">OK</button>
							<button class="btn btn--radius-2 btn--red" type="button" onclick="location.href='./list'" >Cancel</button>
						</div>

					</form:form>
					
				</div>
			</div>
		</div>
	</div>







	<script
		src="<c:url value="/resources/style/form/vendor/jquery/jquery.min.js" />"></script>
	<!-- Vendor JS-->
	<script
		src="<c:url value="/resources/style/form/vendor/select2/select2.min.js" />"></script>
	<script
		src="<c:url value="/resources/style/form/vendor/datepicker/moment.min.js" />"></script>
	<script
		src="<c:url value="/resources/style/form/vendor/datepicker/daterangepicker.js" />"></script>

	<!-- Main JS-->
	<script src="<c:url value="/resources/style/form/js/global.js" />"></script>

</body>
</html>