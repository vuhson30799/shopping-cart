<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page isELIgnored="false"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="<c:url value="/resource/bootstrap/css/custom.css"/>">
<script src="<c:url value="/resource/js/jquery.js"/>"></script>
<script src="<c:url value="/resource/bootstrap/js/bootstrap.min.js"/>"></script>
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resource/css/overall.css"/>">
</head>
<body>
	<footer class="footer-distributed">
	<div class="footer-right">
		<a href="<c:url value="/index1"/>"><span
			class="glyphicon glyphicon-home"></span></a>
		<security:authorize access="hasRole('USER')">
			<a href="<spring:url value="/cart/getCartById" />"><span class="glyphicon glyphicon-shopping-cart"></a>
		</security:authorize>
		<a href="<c:url value="/login"/>"><span
				class="glyphicon glyphicon-user"></span></a> <a href="#"><span
			class="glyphicon glyphicon-envelope"></span></a>
	</div>
	<div class="footer-left">

		<p class="footer-links">
			<a href="<c:url value="/index1"/>">Home</a> · <a
				href="<c:url value="/aboutus"/>">About Us</a> · <a href="<c:url value="/getAllProducts" />">Product
				List</a> · <a href="<c:url value="/contactus"/>">Contact Us</a>
		</p>

		<p>Created by STYLH teams &copy; 2020</p>
	</div>
	</footer>
</body>
</html>
