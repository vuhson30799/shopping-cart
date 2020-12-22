<%@ page pageEncoding="UTF-8"
		 contentType="text/html; charset=UTF-8"
		 isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<link rel="stylesheet"
	href="/resource/bootstrap/css/custom.css">
<script src="/resource/js/jquery.js"></script>
<script src="/resource/bootstrap/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="/resource/css/overall.css">
</head>
<body>
	<footer class="footer-distributed">
	<div class="footer-right">
		<a href="<c:url value="/home"/>"><span
			class="glyphicon glyphicon-home"></span></a>
		<security:authorize access="hasRole('USER')">
			<a href="<spring:url value="/cart/getCartById" />"><span class="glyphicon glyphicon-shopping-cart"></span></a>
		</security:authorize>
		<a href="<c:url value="/login"/>"><span
				class="glyphicon glyphicon-user"></span></a> <a href="#"><span
			class="glyphicon glyphicon-envelope"></span></a>
	</div>
	<div class="footer-left">

		<p class="footer-links">
			<a href="<c:url value="/home"/>">Home</a> · <a
				href="<c:url value="/aboutus"/>">About Us</a> · <a href="<c:url value="/getAllProducts" />">Product
				List</a> · <a href="<c:url value="/contactus"/>">Contact Us</a>
		</p>

		<p>Created by STYLH teams &copy; 2020</p>
	</div>
	</footer>
</body>
</html>
