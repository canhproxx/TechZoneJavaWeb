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
<title>Welcome</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>





<style type="text/css">
#content {
	margin-top: 5rem;
	width: flex;
	align: center;
}

#myImage {
	width: 13rem;
	border: none;
}

#content{
text-align : center;
display: flex;
justify-content: center;
}


</style>



</head>
<body>

	<!-- Header -->
	<%@include file="shared/header.jsp"%>

	
			<div id="content" class="container">
				<div class="card"
					style="width: 18rem; height: auto; margin: 0.2rem;">
					<div class="parent">
						<img id="myImage"
							src="./resources/images/common/bg_register_success.png"
							alt="Card image cap">
					</div>

					<div style="height: 35px; padding: 0;" class="card-body">
						<h5 style="font-size: 18px; text-align: center;"
							class="card-title">Register Successfully</h5>
					</div>

					<div class="card-body" style="background-color: #f5f5f5">

						<c:url var="backHome" value="/" />
										
						<a href="${backHome}"
										class="btn btn-outline-dark btn-block">Go To TechZone</a>

					</div>
				</div>
			</div>


	<!-- Footer -->
	<%@include file="shared/footer.jsp"%>

</body>
</html>



