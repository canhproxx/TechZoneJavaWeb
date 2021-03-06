<%@ page language="java" contentType="text/html; charset=UTF-8"
	isELIgnored="false" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page session="false"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">

<title>Update Account</title>

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
<link rel="stylesheet" href="<c:url value="/resources/style/home/css/font-awesome.min.css" />">

<!-- Custom stlylesheet -->
<link type="text/css" rel="stylesheet" href="<c:url value="/resources/style/home/css/style.css" />" />

<link rel="stylesheet" href="<c:url value="/resources/style/home/homepage.css" />">
<script src="<c:url value="/resources/style/home/homepage.js" />"></script>

<!-- CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

</head>



<body>

	<div class="container" style="max-width: 60rem;">
		<div id="header">Update User By Admin</div>
		
		<form:form action="saveUpdate" method="POST" modelAttribute="userForm" class="form-signin">
			<hr>
			<spring:bind path="user.firstName">
				<div class="form-group ${status.error ? 'has-error' : ''}">
				<label>First Name</label>
					<form:input id="myInput" type="text" path="user.firstName" class="form-control"
						placeholder="FirstName" autofocus="true"></form:input>
					<form:errors id="error" path="user.firstName"></form:errors>
				</div>
			</spring:bind>

			<spring:bind path="user.lastName">
				<div class="form-group ${status.error ? 'has-error' : ''}">
					<label>Last Name</label>
					<form:input id="myInput" type="text" path="user.lastName" class="form-control"
						placeholder="LastName" autofocus="true"></form:input>
					<form:errors id="error" path="user.lastName"></form:errors>
				</div>
			</spring:bind>

			<spring:bind path="user.email">
				<div class="form-group ${status.error ? 'has-error' : ''}">
					<label>Email</label>
					<form:input id="myInput" type="text" path="user.email" class="form-control"
						placeholder="Email" autofocus="true"></form:input>
					<form:errors id="error" path="user.email"></form:errors>
				</div>
			</spring:bind>

			<spring:bind path="user.username">
				<div class="form-group ${status.error ? 'has-error' : ''}">
					<label>Username</label>
					<form:input id="myInput" type="text" path="user.username" class="form-control"
						placeholder="Username" autofocus="true"></form:input>
					<form:errors id="error" path="user.username"></form:errors>
				</div>
			</spring:bind>

			<spring:bind path="user.password">
				<div class="form-group ${status.error ? 'has-error' : ''}">
					<label>Password</label>
					<form:input id="myInput" type="password" path="user.password"
						class="form-control" placeholder="Password"></form:input>
					<form:errors id="error" path="user.password"></form:errors>
				</div>
			</spring:bind>

			<spring:bind path="user.passwordConfirm">
				<div class="form-group ${status.error ? 'has-error' : ''}">
					<label>Confirm Password</label>
					<form:input id="myInput" type="password" path="user.passwordConfirm"
						class="form-control" placeholder="Confirm your password"></form:input>
					<form:errors id="error" path="user.passwordConfirm"></form:errors>
				</div>
			</spring:bind>

			<div>
				<security:authorize access="hasRole('ADMIN')">
					<strong>Select Role To Update</strong>
					<hr>
						<td><form:checkboxes path="roles" items="${roles}" />
					<hr>
				</security:authorize>
			</div>
			
			<button id="btn-submit" type="submit" class="btn btn">Update</button>
			<button id="btn-cancel" type="button" onclick="location.href='./list'" class="btn btn">Cancel</button>
			
		</form:form>
		
	</div>

	
	
	<%@include file="../shared/footer.jsp"%>
	

</body>
</html>
