<%@ page pageEncoding="UTF-8"
		 contentType="text/html; charset=UTF-8"
		 isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<html>
<head>
<link rel="icon" type="image/x-icon" href="/resource/images/favicon1.png" />
<link rel="stylesheet"
	href="/resource/bootstrap/css/custom.css">
<script src="/resource/js/jquery.js"></script>
<script src="/resource/bootstrap/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="/resource/css/overall.css">

</head>
<body>

	<nav class="navbar navbar-inverse">
	<div class="container-fluid">

		<div class="nav navbar">
			<img class="navbar-brand"
				src="/resource/images/shopieasy-logo.png"
				href="<c:url value="/home"/>" width="200px" height="100px"
				alt="logo-image"/>
		</div>

		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#myNavbar">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="<c:url value="/home" />">ShopIeasy</a>
		</div>
		<div class="collapse navbar-collapse" id="myNavbar">
			<ul class="nav navbar-nav">
				<li><a href=" <c:url value="/home" />">Home</a></li>
				<li><a href=" <c:url value="/getAllProducts" />">Product
						List</a></li>
				<security:authorize access="hasRole('USER')">
					<li><a href=" <c:url value="/cart/history" />">History</a></li>
				</security:authorize>
				
				<!-- 			Only admin can view this link -->
				<security:authorize access="hasRole('ADMIN')">
					<li><a href=" <c:url value="/admin/product/addProduct" />">Add Product</a></li>
					<li><a href=" <c:url value="/cart/orders" />">Orders</a></li>
				</security:authorize>
				<li><a href=" <c:url value="/aboutus" />">About Us</a></li>
			</ul>

			<ul class="nav navbar-nav navbar-right">

				<c:if test="${!empty pageContext.request.userPrincipal.name}">
					<li><a href="<c:url value="/home" /> " ><span
							class="glyphicon glyphicon-shopping-user"></span>
						<c:set value="${fn:split(pageContext.request.userPrincipal.name,'@')[0]}" var="userName"/>
                        <span id="userName">Welcome ${userName}</span></a></li>

					<security:authorize access="hasRole('USER')">
						<li><a href="<c:url value="/cart/getCartById" />"><span
								class="glyphicon glyphicon-shopping-cart"></span> Cart</a></li>
					</security:authorize>
					<li><a href="<c:url value="/logout" />"><span
							class="glyphicon glyphicon-log-out"></span> Logout</a></li>
				</c:if>
			</ul>


			<ul class="nav navbar-nav navbar-right">

				<c:if test="${pageContext.request.userPrincipal.name==null}">
					<li><a href="<c:url value="/login" />"><span
							class="glyphicon glyphicon-shopping-cart"></span>My Cart</a></li>
					<li><a href="<c:url value="/customer/registration" />"><span
							class="glyphicon glyphicon-log-user"></span> SignUp</a></li>
					<li><a href="<c:url value="/login" />"><span
							class="glyphicon glyphicon-log-in"></span> Login</a></li>
				</c:if>
			</ul>
		</div>
	</div>
	</nav>

</body>
</html>
