<%@ page pageEncoding="UTF-8"
		 contentType="text/html; charset=UTF-8"
		 isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ page isELIgnored="false"%>
<html>
<head>
<title>Cart</title>
<link rel="icon" type="image/x-icon" href="/resource/images/favicon1.png" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
<script src="/resource/js/productController.js"></script>
</head>
<body>
	<%@ include file="navbar.jsp"%>

	<div class="container"
		style="width: 1145px; margin-top: 20px; margin-bottom: 180px;">
		<div ng-app="myapp" ng-controller="myController"
			style="margin-bottom: 30px">
			<div ng-init="getCart(${cartId})">
				<br> List of Products Purchased
				<div>

					<a class="btn btn-danger pull-left" ng-click="clearCart()"
						style="margin-top: 15px; margin-left: 20px"> <span
						class="glyphicon glyphicon-remove-sign"> </span>Clear Cart
					</a>
				</div>
				<div>
					<c:url value="/order/${cartId}" var="url1"/>
					<a href="${url1}" class="btn btn-danger pull-left"
						style="margin-top: 15px; margin-left: 20px"> <span
						class="glyphicon glyphicon-shipping-cart"> </span>Check Out
					</a>
				</div>
				<table class="table table-hover" id="productList">
					<thead>
						<tr>
							<th>Product Name</th>
							<th>Quantity</th>
							<th>Price</th>
							<th>Total Price</th>
						</tr>
					</thead>
					<tbody>
						<tr ng-repeat="cart in carts.cartItem">
							<td>{{cart.product.productName}}</td>
							<td>{{cart.quality}}</td>
							<td>{{cart.product.productPrice}}</td>
							<td>{{cart.price}}</td>
							<td><a href="#" class="btn btn-danger"
								ng-click="removeFromCart(cart.cartItemId)"
								style="margin-top: 0px;"><span
									class="glyphicon glyphicon-trash"></span>remove</a></td>
					</tbody>
				</table>
				Grand Total Price: {{calculateGrandTotal()}}
			</div>
			<c:url value="/getAllProducts" var="url"/>
			<a href="${url}" class="btn btn-default" style="margin-left: 20px">Continue
				Shopping</a>
		</div>
	</div>
	
	<%@ include file="footer.jsp"%>
	<script>
		function f(){
			var x=document.getElementsByClassName("price");
			for(var i=0;i<x.length;i++){
				if(x[i].innerHTML.indexOf("E")>0){
					var y=x[i].innerHTML.split("E");
					var price=y[0]*10**y[1];
					x[i].innerHTML=price.toString()+" VND";
				}
			}
		}
		document.getElementsByTagName("body").item(0).onload=f;
	</script>
</body>
</html>
