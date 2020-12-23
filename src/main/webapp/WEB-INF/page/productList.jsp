<%@ page pageEncoding="UTF-8"
         contentType="text/html; charset=UTF-8"
         isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="navbar.jsp" %>
<html>
<head>
    <title>Product Management</title>
    <link rel="icon" type="image/x-icon"
          href="<c:url value="/resource/images/favicon1.png"/>"/>
    <link rel="stylesheet"
          href="<c:url value="/resource/bootstrap/css/custom.css"/>">
    <script src="<c:url value="/resource/js/jquery.js"/>"
			type="text/javascript"></script>
    <script src="<c:url value="/resource/bootstrap/js/bootstrap.min.js"/>"
			type="text/javascript"></script>
    <link rel="stylesheet"
		  type="text/css"
          href="<c:url value="../resource/css/ProductList.css"/>">
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"
			type="text/javascript"></script>
    <script src="<c:url value="../resource/js/productController.js"/>"
			type="text/javascript"></script>
</head>
<body ng-app="myapp">
<div class="container" id="productTable"
     style="width: 1145px; margin-bottom: 180px;">
    <h2>Product Management</h2>
    <p>The List of Products in our Database</p>
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
            <th>View <security:authorize access="hasAnyRole('USER')">
                / Add to Cart
            </security:authorize> <!-- 					views only to the admin --> <security:authorize
                    access="hasAnyRole('ADMIN')">
                /Edit/Delete
            </security:authorize>
            </th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${products.content}" var="prod">
            <tr>
                <td style="width: 171px"><img
                        src="<c:url value="/resource/images/products/${prod.image}"/>"
                        style="width: 100px; height: 90px;" alt="${prod.productName}"/></td>
                <td>${prod.productCategory}</td>
                <td>${prod.productName}</td>
                <td class="price">${prod.productPrice}</td>
                <td>${prod.unitStock}</td>
                <td style="width: 180px">${prod.productDescription}</td>
                <td>${prod.productManufacturer}</td>
                <td ng-controller="myController"><a
                        href="getProductById/${prod.productId}" class="btn btn-info"
                        role="button"> <span class="glyphicon glyphicon-info-sign"></span></a>

                    <!-- 						view only for user -->
                    <security:authorize
                            access="hasAnyRole('USER')">
                        <a href="#" ng-click="addToCart(${prod.productId})"
                           class="btn btn-primary" style="margin-left: 5px"> <span
                                class="glyphicon glyphicon-shopping-cart"></span></a>
                    </security:authorize> <!-- 						view only to the admin --> <security:authorize
                            access="hasAnyRole('ADMIN')">
                        <a href="admin/product/editProduct/${prod.productId}"
                           class="btn btn-success" style="margin-left: 5px"> <span
                                class="glyphicon glyphicon-edit"></span></a>
                        <a href="admin/delete/${prod.productId}" class="btn btn-danger"
                           style="margin-left: 5px"> <span
                                class="glyphicon glyphicon-trash"></span></a>
                    </security:authorize></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <c:set var="pageable" value="${products.pageable}"/>
    <c:set var="totalPages" value="${products.totalPages}"/>
    <div style="display: flex; justify-content: center">
        <ul class="pagination">
            <c:if test="${pageable.pageNumber <= 0}" var="disablePrevious"/>
            <li class="page-item <c:if test="${disablePrevious}">disabled</c:if>">
                <a class="page-link"
                   href="<c:url value="/getAllProducts?page=${disablePrevious ? pageable.pageNumber - 1 : 0}"/>">Previous
                </a>
            </li>
            <c:choose>
                <c:when test="${pageable.pageNumber >= 0 && pageable.pageNumber < totalPages - 1}">
                    <c:forEach begin="${pageable.pageNumber}" end="${pageable.pageNumber + 1}" var="index">
                        <c:if test="${pageable.pageNumber == index}" var="active"/>
                        <li class="page-item <c:if test="${active}">active</c:if>">
                            <a class="page-link" href="<c:url value="/getAllProducts?page=${index}"/>">${index + 1}</a>
                        </li>
                    </c:forEach>
                </c:when>
                <c:when test="${pageable.pageNumber >= totalPages - 1}">
                    <c:forEach begin="${totalPages - 2}" end="${totalPages - 1}" var="index">
                        <c:if test="${pageable.pageNumber == index}" var="active"/>
                        <li class="page-item <c:if test="${active}">active</c:if>">

                            <a class="page-link" href="<c:url value="/getAllProducts?page=${index}"/>">${index + 1}</a>
                        </li>
                    </c:forEach>
                </c:when>
            </c:choose>
            <c:if test="${pageable.pageNumber >= totalPages - 1}" var="disableNext"/>
            <li class="page-item <c:if test="${disableNext}">disabled</c:if>">

                <a class="page-link"
                   href="<c:url value="/getAllProducts?page=${disableNext ? totalPages - 1 : pageable.pageNumber + 1}"/>">Next
                </a>
            </li>
        </ul>
    </div>
</div>
<script type="module">
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
<%@ include file="footer.jsp" %>
