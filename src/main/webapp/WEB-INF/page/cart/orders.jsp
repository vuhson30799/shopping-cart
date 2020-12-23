<%@ page pageEncoding="UTF-8"
         contentType="text/html; charset=UTF-8"
         isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../navbar.jsp" %>
<html>
<head>
    <title>Orders</title>
    <link rel="stylesheet"
          href="/resource/bootstrap/css/custom.css">
    <script src="/resource/js/jquery.js"
            type="text/javascript"></script>
    <script src="/resource/bootstrap/js/bootstrap.min.js"
            type="text/javascript"></script>
    <link rel="stylesheet"
          type="text/css"
          href="/resource/css/ProductList.css">
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"
            type="text/javascript"></script>
    <script src="/resource/js/productController.js"
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
                </h3>
                <div style="text-align: center;">
                    Status: ${cart.status}
                    <c:if test="${cart.status.equals('CHECKOUT')}">
                        <security:authorize access="hasAnyRole('ADMIN')">
                            <a href="#" ng-click="transferOrder(${cart.cartId})"
                               class="btn btn-primary" style="margin-left: 5px; margin-top: -6px;">
                                <span class="glyphicon glyphicon-transfer"></span>
                            </a>
                        </security:authorize>
                    </c:if>
                </div>
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
                    <th>User Info</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${cart.cartItem}" var="cartItem" varStatus="status">
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
                        <c:if test="${status.index == 0}">
                            <td rowspan="${cart.cartItem.size()}">
                                <button type="button"
                                        class="btn btn-primary btn-sm"
                                        data-toggle="modal" data-target="#user${cart.customer.customerId}">
                                    <span class="glyphicon glyphicon-user"></span>
                                </button>
                                <div class="modal fade" id="user${cart.customer.customerId}" role="dialog">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                <h4 class="modal-title">User Information</h4>
                                            </div>
                                            <div class="modal-body">
                                                <ul>
                                                    Customer details:
                                                    <li>First Name: ${cart.customer.firstName}</li>
                                                    <li>Last Name: ${cart.customer.lastName}</li>
                                                    <li>Phone: ${cart.customer.customerPhone}</li>
                                                </ul>
                                                <ul>
                                                    Shipping Address:
                                                    <li>Address: ${cart.customer.shippingAddress.address}</li>
                                                    <li>City: ${cart.customer.shippingAddress.city}</li>
                                                    <li>State: ${cart.customer.shippingAddress.state}</li>
                                                </ul>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </td>
                        </c:if>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </c:forEach>
    </div>
</div>
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
<%@ include file="../footer.jsp" %>
