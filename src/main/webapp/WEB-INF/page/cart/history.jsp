<%@ page pageEncoding="UTF-8"
         contentType="text/html; charset=UTF-8"
         isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../navbar.jsp" %>
<html>
<head>
    <title>History</title>
    <link rel="stylesheet"
          href="<c:url value="/resource/bootstrap/css/custom.css"/>">
    <script src="<c:url value="/resource/js/jquery.js"/>"
            type="text/javascript"></script>
    <script src="<c:url value="/resource/bootstrap/js/bootstrap.min.js"/>"
            type="text/javascript"></script>
    <link rel="stylesheet"
          type="text/css"
          href="<c:url value="/resource/css/ProductList.css"/>">
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"
            type="text/javascript"></script>
    <script src="<c:url value="/resource/js/productController.js"/>"
            type="text/javascript"></script>
</head>
<body style="padding: 0;" ng-app="myapp">
<div class="container" style="margin-bottom: 19px">
    <div style="text-align: center;"><h1 class="well">Order History!</h1></div>

    <div class="container"
         id="productTable"
         style="width: 1145px; margin-bottom: 180px;">
        <c:forEach items="${carts}" var="cart">
            <div style="text-align: center;" ng-controller="myController" class="well">
                <h3>
                    Order: ${cart.cartId}
                    <c:if test="${cart.status.equals('TRANSFERRED')}">
                        <security:authorize access="hasAnyRole('USER')">
                            <a href="#" ng-click="confirmOrder(${cart.cartId})"
                               class="btn btn-primary"
                               style="margin-left: 5px; margin-top: -6px;">
                                <span class="glyphicon glyphicon-saved"></span>
                            </a>
                        </security:authorize>
                    </c:if>
                </h3>
            </div>
            <table class="table table-hover" id="productList">
                <thead>
                <tr>
                    <th>Screen-Shot</th>
                    <th>Category</th>
                    <th>Product Name</th>
                    <th>Products Price</th>
                    <th>Stock Unit</th>
                    <th>Description</th>
                    <th>Manufacturer</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${cart.cartItem}" var="cartItem">
                    <tr>
                        <td style="width: 171px"><img
                                src="<c:url value="/resource/images/products/${cartItem.product.image}"/>"
                                style="width: 100px; height: 90px;" alt="${cartItem.product.productName}"/></td>
                        <td>${cartItem.product.productCategory}</td>
                        <td>${cartItem.product.productName}</td>
                        <td>${cartItem.product.productPrice}</td>
                        <td>${cartItem.product.unitStock}</td>
                        <td style="width: 180px">${cartItem.product.productDescription}</td>
                        <td>${cartItem.product.productManufacturer}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </c:forEach>
    </div>

</div>
</body>
</html>
<%@ include file="../footer.jsp" %>
