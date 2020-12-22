<%@ page pageEncoding="UTF-8"
         contentType="text/html; charset=UTF-8"
         isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security"
           uri="http://www.springframework.org/security/tags" %>
<%@ include file="navbar.jsp" %>
<html>
<head>
    <title>Products</title>
    <link rel="icon" type="image/x-icon"
          href="<c:url value="/resource/images/favicon1.png"/>"/>
	<link rel="stylesheet"
		  href="<c:url value="/resource/bootstrap/css/bootstrap.min.css"/>">
    <script
            src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js" type="text/javascript"></script>
    <script src="<c:url value="../resource/js/productController.js"/>" type="text/javascript"></script>
</head>
<body>
<div ng-app="myapp">
    <div class="container" style="width: 829px">
        <h2>Product Details</h2>
        <p>Details of the Product</p>
        <table class="table table-striped" id="prod">
            <tbody>
            <tr>
                <td>Product Image</td>
                <td><img
                        src="<c:url value="/resource/images/products/${productObj.image}"/>"
                        width="40%" alt="${productObj.productName}"/></td>
            </tr>
            <tr>
                <td>Product ID</td>
                <td>${productObj.productId }</td>
            </tr>
            <tr>
                <td>Product Name</td>
                <td>${productObj.productName }</td>
            </tr>
            <tr>
                <td>Product Category</td>
                <td>${productObj.productCategory}</td>
            </tr>
            <tr>
                <td>Product Description</td>
                <td>${productObj.productDescription}</td>
            </tr>
            <tr>
                <td>Product Manufacturer</td>
                <td>${productObj.productManufacturer}</td>
            </tr>
            <tr>
                <td>Product Price</td>
                <td>${productObj.productPrice}</td>
            </tr>
            <tr>
                <td>Stock Available</td>
                <td>${productObj.unitStock}</td>
            </tr>
            <tr>
                <td>Add to Cart:</td>
                <td><c:url value="/cart/add/${productObj.productId}"
                           var="addcart"/>
                    <div ng-controller="myController">
                        <security:authorize access="hasRole('USER')">
                            <a href="#" ng-click="addToCart(${productObj.productId})"
                               class="btn btn-info"
                               style="margin-top: 0px; width: 150px; float: left; margin-right: 31px;">
                                <span class="glyphicon glyphicon-shopping-cart"></span>
                            </a>
                        </security:authorize>
                        <a href="<c:url value="/getAllProducts" />" class="btn btn-info"
                           style="margin-top: 0px; width: 150px; float: right; margin-right: 31px;">
                            <span class="glyphicon glyphicon-arrow-left"></span>
                        </a>
                    </div>
                </td>
            </tr>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
<%@ include file="footer.jsp" %>
