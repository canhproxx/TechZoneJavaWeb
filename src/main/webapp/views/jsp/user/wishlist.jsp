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
<title>Wish List</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<style type="text/css">
.card {
	border-radius: 0;
}

.card .card-header {
	background-color: #fff;
	font-size: 18px;
	padding: 10px 16px;
}

.proviewcard .card-body {
	padding: 0;
}

.cardlist {
	border-bottom: 1px solid #f0f0f0;
}

.cardlist:last-child {
	border: 0;
}

.addcartimg {
	height: 100px;
}

.cartproname {
	font-size: 15px;
	color: #212529;
	line-height: 1;
	display: inline;
}

.cartproname:hover {
	color: #c16302;
	text-decoration: none;
}

.seller {
	font-size: 12px;
	color: #666;
	margin-bottom: 5px;
	line-height: 1;
}

.cartviewprice {
	margin-bottom: 8px;
	line-height: 1;
}

.cartviewprice span {
	display: inline-block;
	padding-right: 10px;
	margin-bottom: 5px;
}

.cartviewprice .amt {
	font-size: 18px;
	font-weight: 600;
}

.cartviewprice .oldamt {
	color: #757575;
	font-weight: 600;
	text-decoration: line-through;
}

.cartviewprice .disamt {
	font-weight: 600;
	color: #c16302;
}

.qty .input-group {
	width: 100%;
	height: 25px;
}

.btn-qty {
	height: 25px;
	color: #fff !important;
	background-color: #555 !important;
	border-color: #555 !important;
	padding: 0px 3px !important;
}

.qty input {
	height: 25px;
}

.addcardrmv {
	font-size: 14px;
	line-height: 1.8;
	text-transform: uppercase;
	color: #212529;
}

.addcardrmv:hover {
	color: #c16302;
	text-decoration: none;
	font-weight: 600;
}

.prostatus .del-time {
	font-size: 12px;
	color: #757575;
	margin-right: 10px;
}

.prostatus .del-time>span {
	font-weight: 600;
	color: #555;
}

.proviewcard .card-footer {
	text-align: center;
	box-shadow: rgba(0, 0, 0, 0.1) 0px -2px 10px 0px;
	padding: 8px 15px;
}

.btn-add-con {
	background-color: #fff;
	color: #212121;
	box-shadow: rgba(0, 0, 0, 0.1) 0px 2px 2px 0px;
	font-size: 16px;
	font-weight: 500;
	padding: 8px 20px;
	border-radius: 2px;
	border-width: 1px;
	border-style: solid;
	border-color: #E0E0E0;
	border-image: initial;
	min-width: 185px;
}

.card .card-footer {
	background-color: #fff;
}

/*Card Footer Fixed*/
@
supports (box-shadow: 2px 2px 2px black ){ .cart-panel-foo-fix {
	position: sticky;
	bottom: 0;
	z-index: 9;
}

}
.btn-cust {
	background-color: #e96125 !important;
	color: #fff !important;
	font-size: 16px;
	padding: 8px 8px;
	min-width: 128px;
}

.btn-cust:hover {
	background-color: #c74b14 !important;
	color: #fff !important;
}

/*********/
button {
	padding: 5px;
	border-radius: 4px;
	border-width: 2px;
	border-color: #3f51b5;
	background-color: #3f51b5;
	color: #fff;
	cursor: pointer;
	border-style: solid;
	transition: 0.25s ease;
	font-family: "Roboto", sans-serif;
}

div button span {
	position: relative;
	z-index: 1;
}

.a1:hover, .a2, .c2, .d2, .e2, .f3, .f4 {
	color: #3f51b5;
	background-color: transparent;
}

.b1:hover, .b2, .b3 {
	color: #3f51b5;
	background-color: transparent;
	border-color: transparent;
}

.c1, .c2, .d1, .d2, .e1, .e2 {
	position: relative;
	overflow: hidden;
}

.c1:after, .c2:after, .d1:after, .d2:after, .e1:after, .e2:after {
	background-color: #3f51b5;
	width: 80px;
	height: 80px;
	content: "";
	position: absolute;
	transition: 0.25s ease;
}

.a2:hover {
	background-color: #3f51b5;
	color: #fff;
}

.c1 {
	background-color: transparent;
}

.c1:hover {
	color: #3f51b5;
}

.c1:after {
	-webkit-transform: translate(-50%);
	-ms-transform: translate(-50%);
	transform: translate(-50%);
	border-radius: 50%;
	top: -100%;
	left: 50%;
}

.c1:hover:after {
	top: 100%;
}

.d1 {
	background-color: transparent;
}

.d1:hover {
	color: #3f51b5;
}

.d1:after {
	-webkit-transform: translateX(-50%);
	-ms-transform: translateX(-50%);
	transform: translateX(-50%);
	top: -100%;
	left: 50%;
}

.d1:hover:after {
	top: 100%;
}

.e1 {
	background-color: transparent;
}

.e1:hover {
	color: #3f51b5;
}

.e1:after {
	-webkit-transform: translate(-50%);
	-ms-transform: translate(-50%);
	transform: translate(-50%);
	width: 240px;
	top: -100%;
	left: 100%;
}

.e1:hover:after {
	left: 220%;
}

.f1:hover {
	border-radius: 12px;
}

.g1:hover {
	opacity: 0.5;
}

.i1:hover {
	box-shadow: 0 3px 6px 0 rgba(0, 0, 0, 0.5);
}

.j1:hover {
	-webkit-transform: scale(1.1);
	-ms-transform: scale(1.1);
	transform: scale(1.1);
}

.k1:hover {
	-webkit-transform: translateY(-6px);
	-ms-transform: translateY(-6px);
	transform: translateY(-6px);
}

.l1:hover {
	-webkit-transform: rotate(-6deg);
	-ms-transform: rotate(-6deg);
	transform: rotate(-6deg);
}

.m1:hover {
	-webkit-transform: skewX(-6deg);
	-ms-transform: skewX(-6deg);
	transform: skewX(-6deg);
}

.n1:hover {
	-webkit-transform: rotateZ(-12deg) skewX(12deg);
	-ms-transform: rotateZ(-12deg) skewX(12deg);
	transform: rotateZ(-12deg) skewX(12deg);
	box-shadow: -3px 3px 6px 0 rgba(0, 0, 0, 0.5);
}
</style>

</head>
<body>


	<div class="container-fluid mt-3 mb-4">

		<div class="col-lg-12">
			<div class="row">
				<div class="col-lg-9 px-0 pr-lg-2 mb-2 mb-lg-0">
					<div class="card border-light bg-white card proviewcard shadow-sm">
						<div class="card-header">Your Wish List</div>
						<div class="card-body">

							<c:choose>
								<c:when test="${!empty wishList}">
									<c:forEach var="item" items="${wishList}">

										<div class="col-lg-12 p-3 cardlist">
											<div class="col-lg-12">
												<div class="row">
													<div class="col-lg-9">
														<div class="row">
															<div class="col-4 col-lg-3 col-xl-2">
																<div class="row">
																	<img
																		src="./resources/images/${item.product.productDetail.image}"
																		class="mx-auto d-block mb-1 addcartimg">
																</div>
															</div>
															<div class="col-8 col-lg-9 col-xl-10">
																<div class="d-block text-truncate mb-1">
																	<a href="cateview.php" class="cartproname">${item.product.name}</a>
																</div>
																<div class="seller d-block">
																	<span>Event: </span> <span>${item.product.sale.event}</span>
																</div>
																<div class="cartviewprice d-block">
																	<span class="amt">${item.product.price}</span> <span
																		class="disamt">${item.product.sale.percent}% off</span>
																</div>


																<c:url var="addProductToCart"
																	value="/cart/addProductToCart">
																	<c:param name="productId" value="${item.product.id}" />
																</c:url>

																<a href="${addProductToCart}" class="a1">
																	<button class="a1">
																		<span>Move to cart</span>
																	</button>
																</a>
															</div>
														</div>
													</div>
													<div
														class="col-lg-3 ml-lg-auto align-self-start mt-2 mt-lg-0">
														<div class="row">
															<div class="prostatus">
																<span class="del-time">Delivered <span>2-3
																		Business Days</span></span>


																<c:url var="deleteLink" value="/removeItemFromWishList">
																	<c:param name="wishListId" value="${item.id}" />
																</c:url>
																<a href="${deleteLink}" >
																	<button type="button"
																		class="btn btn-outline-danger btn-sm">
																		<img id="img-slide"
																			src="${pageContext.request.contextPath}/resources/icon/delete.png"
																			alt="icon">
																	</button>
																</a>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>

									</c:forEach>
								</c:when>
							</c:choose>


						</div>

						<div class="card-footer border-light cart-panel-foo-fix">
							<a href="<c:url value='/'/>" class="btn btn-add-con">Continue Shopping</a>
							
							<c:if test="${!empty wishList}">
								<a href="<c:url value='/cart'/>" class="btn btn-cust">View Cart</a>
							</c:if>
							
						</div>

					</div>
				</div>
			</div>
		</div>

	</div>

	<script type="text/javascript">
		var animateButton = function(e) {

			e.preventDefault;
			//reset animation
			e.target.classList.remove('animate');

			e.target.classList.add('animate');
			setTimeout(function() {
				e.target.classList.remove('animate');
			}, 700);
		};

		var bubblyButtons = document.getElementsByClassName("bubbly-button");

		for (var i = 0; i < bubblyButtons.length; i++) {
			bubblyButtons[i].addEventListener('click', animateButton, false);
		}
	</script>



</body>
</html>



