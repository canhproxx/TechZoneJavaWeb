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
<title>Your Profile</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet"
	href="<c:url value="/resources/style/registration/registrationpage.css" />">


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


</head>
<body>


	<hr>
	<ul class="nav nav-tabs nav" id="myTab" role="tablist">


		<li class="nav-item"><a class="nav-link active" id="btn-out"
			data-toggle="tab" href="#home" role="tab" aria-controls="home"
			aria-selected="true">Keep</a></li>

		<li class="nav-item"><a class="nav-link" id="btn-update"
			data-toggle="tab" href="#profile" role="tab" aria-controls="profile"
			aria-selected="false">Update</a></li>

	</ul>
	<c:if test="${message != null }">
		<div style="border-radius: 0%;" class="alert alert-success">
			<button type="button" class="close" data-dismiss="alert">&times;</button>
			<strong>${message}</strong>
		</div>
	</c:if>


	<div class="container" style="max-width: 70rem;">
		<div id="header">Profile Account</div>

		<form:form action="updateAccount" method="POST"
			modelAttribute="userForm" class="form-signin">

			<div class="col-md-12">
				<spring:bind path="user.firstName">
					<div class="form-group ${status.error ? 'has-error' : ''}">
						<label>First Name</label>
						<form:input id="myInput" type="text" path="user.firstName"
							class="form-control" placeholder="FirstName" autofocus="true"></form:input>
						<form:errors path="user.firstName"></form:errors>
					</div>
				</spring:bind>

				<spring:bind path="user.lastName">
					<div class="form-group ${status.error ? 'has-error' : ''}">
						<label>Last Name</label>
						<form:input id="myInput" type="text" path="user.lastName"
							class="form-control" placeholder="LastName" autofocus="true"></form:input>
						<form:errors path="user.lastName"></form:errors>
					</div>
				</spring:bind>

				<spring:bind path="user.email">
					<div class="form-group ${status.error ? 'has-error' : ''}">
						<label>Email</label>
						<form:input id="myInput" type="text" readonly="true"
							path="user.email" class="form-control" placeholder="Email"
							autofocus="true"></form:input>
						<form:errors path="user.email"></form:errors>
					</div>
				</spring:bind>

				<spring:bind path="user.username">
					<div class="form-group ${status.error ? 'has-error' : ''}">
						<label>Username</label>
						<form:input id="myInput" type="text" path="user.username"
							class="form-control" placeholder="Username" autofocus="true"></form:input>
						<form:errors path="user.username"></form:errors>
					</div>
				</spring:bind>

				<div class="form-group" id="zoneChangePassword" class="row">
					<spring:bind path="user.password">
						<div class="form-group ${status.error ? 'has-error' : ''}">
							<label>Password</label>
							<form:input id="pass" type="password" path="user.password"
								class="form-control" placeholder="Password"></form:input>
							<form:errors path="user.password"></form:errors>
						</div>
					</spring:bind>

					<spring:bind path="user.passwordConfirm">
						<div class="form-group ${status.error ? 'has-error' : ''}">
							<label>Password Confirm</label>
							<form:input type="password" path="user.passwordConfirm"
								class="form-control" placeholder="Confirm your password"></form:input>
							<form:errors path="user.passwordConfirm"></form:errors>
						</div>
					</spring:bind>

					<button id="btn-confirmUpdate" class="btn btn" type="submit">Confirm
						Update</button>
				</div>
			</div>

		</form:form>



	</div>

	<div class="container" style="max-width: 70rem;">
		<hr>
		<a href="<c:url value='/'/>">
			<button id="btn-home" type="button" class="btn btn">Home</button>
		</a>
	</div>


	<%@include file="../shared/footer.jsp"%>


</body>

<script>
	$(document).ready(function() {

		$('#zoneChangePassword').hide();
		$('#btn-confirmUpdate').hide();

		$('#btn-update').click(function() {

			$('#zoneChangePassword').show();
			$('#btn-confirmUpdate').show();
			$('#pass').val('');
			$('#btn-update').show();
		});

		$('#btn-out').click(function() {
			$('#btn-update').show();
			$('#btn-confirmUpdate').hide();
			$('#zoneChangePassword').hide();
		});
	});
</script>
</html>



