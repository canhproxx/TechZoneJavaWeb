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
<title>Cart Shopping</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<link rel="stylesheet"
	href="<c:url value="/resources/style/cart/cartpage.css" />">

</head>
<body>


	<div id="header">
		<strong>Your Cart</strong>
	</div>
	<div class="row">
		<div class="col-sm-12">
			<div class="container-fluid content-center">

				<c:choose>
					<c:when test="${!empty cart}">
						<div class="jumbotron jumbotron-fluid"
							style="background-color: #eeeeee;">
							<div class="row h-100 justify-content-center align-items-center">
								<c:forEach items="${cart}" var="item">

									<c:set var='id' value='${item.product.id}' />

									<div class="card" style="width: 15rem; margin: 0.2rem;">
										<img class="card-img-top"
											src="./resources/images/${item.product.productDetail.image}"
											alt="Card image cap">

										<ul class="list-group list-group-flush">
											<li class="list-group-item"><span class="text-info">Name
													:</span> ${item.product.name}</li>
											<li class="list-group-item"><span class="text-info">Quantity</span>

												<input id="btn-down-${id}" class="btn btn-dark btn-down"
												type="submit" name="action" value="-" /> <input
												id="input-quantity-${id}" readonly class="input-quantity"
												style="width: 54px; text-align: center;"
												value="${item.quantity}"> <input id="btn-up-${id}"
												class="btn btn-dark btn-up" type="submit" name="action"
												value="+" />

												<p id="message-${id}" style="color: blue;"></p></li>
											<li class="list-group-item"><c:url
													var="removeProductInCart" value="/cart/removeProductInCart">
													<c:param name="productId" value="${item.product.id}" />
												</c:url> <a href="${removeProductInCart}"
												class="btn btn-outline-danger btn-block">Remove</a></li>

										</ul>
									</div>


									<c:url var="alterDown" value="/cart/alter-quantity-down/${id}" />
									<c:url var="alterUp" value="/cart/alter-quantity-up/${id}" />
									<!----- JQUERY + AJAX ----->
									<script>
									$(document).ready(function(){
										
										$('#message-${id}').hide();
										
										loadFunction();// auto render
										
										function checkFiledInputQuantity(typeChange){
											
											var input = $('#input-quantity-${id}').val();
											
											if (typeChange == 'DOWN'){
												$('#message-${id}').hide();
												$('#btn-up-${id}').prop("disabled",false);
											}
											
											if (typeChange == 'UP'){
												
												if ( isNaN(input) ) {
													$('#message-${id}').show();
													$('#message-${id}').html("Invalid value !! ");
													return false;
												}
												if ( input >= ${item.product.inventory - 1} ){
													$('#message-${id}').show();
													$('#message-${id}').html("Storage has be out of this product");
													$('#btn-up-${id}').prop("disabled",true);
													return true;
												}
												if ( input >= 15 ) {
													$('#message-${id}').show();
													$('#message-${id}').html("To much product");
													return false;
												}
											}
											
											return true;
										}
										
										/************************ Down Quantity ************************/
										function changeDown(){
										var x = parseInt($('#input-quantity-${id}').val());
											if (x == 1){ return x; }
											return (x-1);
										}
										
										$('#btn-down-${id}').click(function(){
											var quantity = $('#input-quantity-${id}').val();
											if (quantity == 1){
												loadFunction();
												return false;
											}
											// process
											var supervisor = checkFiledInputQuantity('DOWN');
											if (supervisor != false){
												$('#input-quantity-${id}').val(changeDown());
											}
											loadFunction();
											console.log($('#input-quantity-${id}').val());
											
											$.ajax({
												type : 'GET',
												url : '${alterDown}',
												dataType : 'json',
												contentType : 'application/json',
												success : function (result) {
													$('#showMe').text(result);
												}
											});
										});
										/************************ Down Quantity ************************/
										
										/************************* Up Quantity *************************/
										function changeUp(){
											var x = parseInt($('#input-quantity-${id}').val());
											return (x+1);
										}
										
										$('#btn-up-${id}').click(function(){
											// process
											var supervisor = checkFiledInputQuantity('UP');
											if (supervisor != false){
												$('#input-quantity-${id}').val(changeUp());
											}
											loadFunction();
											console.log($('#input-quantity-${id}').val());
											
											// check must valid to work
											$.ajax({
												type : 'GET',
												url : '${alterUp}',
												dataType : 'json',
												contentType : 'application/json',
												success : function(result) {
													$('#showMe').text(result);
												}
											});
											
										});
										/************************* Up Quantity *************************/
										
										// AUTO DETECT //
										function loadFunction(){
											
											var quantity = $('#input-quantity-${id}').val();
											if (quantity == 1){
												$('#btn-down-${id}').prop("disabled",true);
											} else {
												$('#btn-down-${id}').prop("disabled",false);
											}
											
											if ( quantity >= ${item.product.inventory} ){
												$('#message-${id}').show();
												$('#message-${id}').html("Storage has be out of this product");
												$('#btn-up-${id}').prop("disabled",true);
											}
											
											if (quantity >= 15) {
												$('#message-${id}').show();
												$('#message-${id}').html("To much product");
												$('#btn-up-${id}').prop("disabled",true);
											}
										}
										
									});
								</script>
									<!----- JQUERY + AJAX ----->


								</c:forEach>
							</div>
						</div>
					</c:when>

					<c:otherwise>
						<div class="jumbotron jumbotron-fluid">
							<div class="container">
								<img id="cart-empty"
									src="./resources/images/common/cart-empty.png" />
								<c:url var="countinueShopping" value="/" />
								<a id="backShopping" href="${countinueShopping}" class="btn btn">Continues
									Shopping</a>
							</div>
						</div>
					</c:otherwise>

				</c:choose>
			</div>
		</div>
	</div>


	<div class="row">
		<div class="col-sm-2"></div>
		<div class="col-sm-8">
			<div class="container">
				<div class="card-body">
					<c:choose>
						<c:when test="${!empty cart}">

							<c:url var="buy" value="/cart/buy" />
							<div class="button_cont" align="center">
								<a href="${buy}" class="example_e">Check Out Shopping</a>
							</div>
							<hr>

							<div class="button_cont" align="center">
								<c:url var="countinueShopping" value="/" />
								<a id="backShopping" href="${countinueShopping}" class="btn btn">Continues Shopping</a>

								<c:url var="clearCart" value="/cart/clearCart" />
								<a id="btn-clearCart" href="${clearCart}" class="btn btn">Clear Cart</a>
							</div>

						</c:when>
					</c:choose>

				</div>
			</div>
		</div>
		<div class="col-sm-2"></div>
	</div>



</body>

<!-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -->


<script>
	$(document).ready(function() {
		
		$('#buttonDemo1').click(function() {
			$.ajax({
				type : 'GET',
				url : '${pageContext.request.contextPath}/api/ajaxrest/demo1',
				success : function(result) {
					$('#result').text(result);
				}
			});
		});
	});
</script>
<!-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -->

</html>



