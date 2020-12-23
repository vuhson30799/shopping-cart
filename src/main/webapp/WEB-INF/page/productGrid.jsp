<%@ page pageEncoding="UTF-8"
         contentType="text/html; charset=UTF-8"
         isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="security"
           uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <link rel="stylesheet"
          href="<c:url value="/resource/bootstrap/css/custom.css"/>">
    <script src="<c:url value="/resource/js/jquery.js"/>"></script>
    <script src="<c:url value="/resource/bootstrap/js/bootstrap.min.js"/>"></script>
    <link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
    <style>
        .w3-sidenav a, .w3-sidenav h4 {
            font-weight: bold
        }
    </style>
</head>
<body>
<c:forEach items="${products.content}" var="product" varStatus="status">
    <c:set var="descriptions" value="${fn:split(product.productDescription, '|')}"/>
    <c:if test="${status.index % 3 == 0}">
        <div class="w3-row-padding" style="padding:0 30px; margin-bottom: 20px">
    </c:if>
    <div class="w3-third w3-container w3-margin-bottom">
        <a href="/getProductById/${product.productId}">
            <img src="/resource/images/products/${product.image}"
				 alt="Norway"
				 style="width: 30vw; height: 50vh;"
                 class="w3-hover-opacity">
		</a>
        <div class="w3-container w3-white">
            <p>
                <p style="font-weight: bold">${product.productName}</p>
            </p>
            <ul>
                <c:forEach items="${descriptions}" var="description">
                    <li>${description}</li>
                </c:forEach>
            </ul>
        </div>
    </div>
    <c:if test="${status.index % 3 == 2 || status.last}">
        </div>
        <hr/>
    </c:if>
</c:forEach>
<c:set var="pageable" value="${products.pageable}"/>
<c:set var="totalPages" value="${products.totalPages}"/>
<div style="display: flex; justify-content: center">
    <ul class="pagination">
        <c:if test="${pageable.pageNumber <= 0}" var="disablePrevious"/>
        <li class="page-item <c:if test="${disablePrevious}">disabled</c:if>">
            <a class="page-link"
               href="<c:url value="/home?page=${disablePrevious ? pageable.pageNumber - 1 : 0}"/>">Previous
            </a>
        </li>
        <c:choose>
            <c:when test="${pageable.pageNumber >= 0 && pageable.pageNumber < totalPages - 1}">
                <c:forEach begin="${pageable.pageNumber}" end="${pageable.pageNumber + 1}" var="index">
                    <c:if test="${pageable.pageNumber == index}" var="active"/>
                    <li class="page-item <c:if test="${active}">active</c:if>">
                        <a class="page-link" href="<c:url value="/home?page=${index}"/>">${index + 1}</a>
                    </li>
                </c:forEach>
            </c:when>
            <c:when test="${pageable.pageNumber >= totalPages - 1}">
                <c:forEach begin="${totalPages - 2}" end="${totalPages - 1}" var="index">
                    <c:if test="${pageable.pageNumber == index}" var="active"/>
                    <li class="page-item <c:if test="${active}">active</c:if>">

                        <a class="page-link" href="<c:url value="/home?page=${index}"/>">${index + 1}</a>
                    </li>
                </c:forEach>
            </c:when>
        </c:choose>
        <c:if test="${pageable.pageNumber >= totalPages - 1}" var="disableNext"/>
        <li class="page-item <c:if test="${disableNext}">disabled</c:if>">

            <a class="page-link"
               href="<c:url value="/home?page=${disableNext ? totalPages - 1 : pageable.pageNumber + 1}"/>">Next
            </a>
        </li>
    </ul>
</div>

</body>
</html>
