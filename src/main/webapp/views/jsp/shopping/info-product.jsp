<%@ page language="java" contentType="text/html; charset=UTF-8"
	isELIgnored="false" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>

<!DOCTYPE html>


<html>
<head>
<title>Info Product</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
	integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/"
	crossorigin="anonymous">

<!-- Local -->

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


<link rel="stylesheet" href="<c:url value="/resources/style/shopping/productdetailpage.css" />">
<script src="<c:url value="/resources/style/shopping/productdetailpage.js" />"></script>

</head>
<body>

	<!-- Header -->
	<%@include file="../shared/header.jsp"%>
	
			

	<div class="container">
		<div class="card">
			<div class="container-fluid">
				<div class="wrapper row">
					<div class="preview col-md-6">

						<div class="preview-pic tab-content">

							<c:choose>
								<c:when test="${!empty images}">
									<c:forEach var="image" varStatus="loop" items="${images}">
										<c:if test="${loop.index == 0}">
											<div class="tab-pane active" id="pic-${loop.index}">
												<img src="./resources/images/${image.path}" />
											</div>
										</c:if>
										<div class="tab-pane" id="pic-${loop.index}">
											<img src="./resources/images/${image.path}" />
										</div>
									</c:forEach>
								</c:when>
							</c:choose>

						</div>

						<ul class="preview-thumbnail nav nav-tabs">
							<c:choose>
								<c:when test="${!empty images}">
									<c:forEach var="image" varStatus="loop" items="${images}">
										<li class="active"><a data-target="#pic-${loop.index}"
											data-toggle="tab"><img
												src="./resources/images/${image.path}" /></a></li>
									</c:forEach>
								</c:when>
							</c:choose>
						</ul>

					</div>
					<div class="details col-md-6">
						<h3 class="product-title">${product.name}</h3>
						<div class="rating">
							<div class="stars">
								<span class="fa fa-star checked"></span> <span
									class="fa fa-star checked"></span> <span
									class="fa fa-star checked"></span> <span class="fa fa-star"></span>
								<span class="fa fa-star"></span>
							</div>
							<span class="review-no">41 reviews</span>
						</div>
						<div id="contentInfo">
							<p class="product-description">${product.productDetail.info}</p>
						</div>
						
						<h4 class="price">
							
						</h4>
						<p class="vote">
							<strong>91%</strong> of buyers enjoyed this product! <strong>(87
								votes)</strong>
						</p>
						<h5 class="sizes">
						current price :
							<fmt:formatNumber value="${product.price}" type="currency" />
						</h5>
						<h5 class="colors"></h5>
						
						<div class="action">
							<c:url var="addProductToCart" value="/cart/addProductToCart">
								<c:param name="productId" value="${product.id}" />
							</c:url>
							<a href="${addProductToCart}" id="add-to-cart" class="btn btn">Add Cart</a>
							
							<c:url var="continueShopping" value="/" />
							<a href="${continueShopping}" id="continueShopping" class="btn btn">Continue Shopping</a>
							
							<c:url var="addProductToWishList" value="/addToWishList">
								<c:param name="productId" value="${product.id}" />
							</c:url>
							<a href="${addProductToWishList}" data-tip="Add to Wishlist">
								<i class="fa fa-heart"></i>
							</a>
							
						</div>
					</div>
				</div>
			</div>
		</div>
		
	</div>
	

	<hr>

	<ul class="nav nav-tabs">
		<li class="nav-item"><a class="nav-link active disabled" href="#">Relative Product</a></li>
	</ul>
	<div class="container">
		<div class="row">
			<div class="MultiCarousel" data-items="1,3,5,6" data-slide="1" id="MultiCarousel"  data-interval="1000">
	            <div class="MultiCarousel-inner">
	            <c:choose>
					<c:when test="${!empty relatedProduct}">
						<c:forEach var="tempProduct" items="${relatedProduct}">
							<div class="item">
	                    		<div class="pad15">
	                        		<div class="parent">
										<img src="./resources/images/${tempProduct.productDetail.image}"
											alt="Card image cap">
									</div>
	                        		<div class="card-body" style="background-color: #f5f5f5">
	                        			<c:url var="detailProductLink" value="/product">
											<c:param name="productId" value="${tempProduct.id}" />
										</c:url>
										<a href="${detailProductLink}" class="btn btn">View</a>
	                        		</div>
	                    		</div>
	                		</div>
							</c:forEach>
						</c:when>
					</c:choose>
	            </div>
	            <button id="control" class="btn btn leftLst">❮</button>
	            <button id="control" class="btn btn rightLst">❯</button>
	        </div>
		</div>
		<div class="row">
		    <div class="col-md-12 text-center">
		        <br/><br/><br/>
		        <hr/>
		        <p>The product is always genuine and has a long wipe warranty</p>
		    </div>
		</div>
	</div>


	<!-- Footer -->
	<%@include file="../shared/footer.jsp"%>
	<!-- Footer -->
		<button id="topBtn">
		<i class="fas fa-arrow-up"></i>
		</button>
</body>

<script>
	var slideIndex = 1;
	showDivs(slideIndex);

	function plusDivs(n) {
		showDivs(slideIndex += n);
	}

	function currentDiv(n) {
		showDivs(slideIndex = n);
	}

	function showDivs(n) {
		var i;
		var x = document.getElementsByClassName("card");
		var dots = document.getElementsByClassName("demo");
		if (n > x.length) {
			slideIndex = 1
		}
		if (n < 1) {
			slideIndex = x.length
		}
		for (i = 0; i < x.length; i++) {
			x[i].style.display = "none";
		}
		for (i = 0; i < dots.length; i++) {
			dots[i].className = dots[i].className.replace(" w3-red", "");
		}
		x[slideIndex - 1].style.display = "block";
		dots[slideIndex - 1].className += " w3-red";
	}
</script>

	<script src="<c:url value="/resources/style/home/js/jquery.min.js" />"></script>
	<script
		src="<c:url value="/resources/style/home/js/bootstrap.min.js" />"></script>
	<script src="<c:url value="/resources/style/home/js/slick.min.js" />"></script>
	<script
		src="<c:url value="/resources/style/home/js/nouislider.min.js" />"></script>
	<script
		src="<c:url value="/resources/style/home/js/jquery.zoom.min.js" />"></script>
	<script src="<c:url value="/resources/style/home/js/main.js" />"></script>


</html>



