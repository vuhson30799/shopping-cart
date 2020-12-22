<%@ page pageEncoding="UTF-8"
		 contentType="text/html; charset=UTF-8"
		 isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="navbar.jsp"%>
<html>
<head>
<title>Product Management</title>
<link rel="stylesheet"
	href="<c:url value="/resource/bootstrap/css/custom.css"/>">
<script src="<c:url value="/resource/js/jquery.js"/>"></script>
<script src="<c:url value="/resource/bootstrap/js/bootstrap.min.js"/>"></script>
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resource/css/productList.css"/>">
</head>
<body>
	<div class="container" id="productTable" style="width:1145px;margin-bottom: 180px;">
		<h2>User Management</h2>
		<p>The List of Users in our Database</p>
		<table class="table table-hover" id="productList">
			<thead>
				<tr>
					<th>User Id</th>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Address</th>
					<th>Gender</th>
					<th>State</th>
					<th>City</th>
					<th>Phone Number</th>
					<th>emailId</th>
					<th>password</th>
					<th>RoleType</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${users}" var="user">
					<tr>
						<td>${user.userId}</td>
						<td>${user.firstName}</td>
						<td>${user.lastName}</td>
						<td>${user.address}</td>
						<td>${user.gender}</td>
						<td>${user.state}</td>
						<td>${user.city}</td>
						<td>${user.phNumber}</td>
						<td>${user.emailId}</td>
						<td>${user.password}</td>
						<td>${user.roleType}</td>
						
						<td>
						    <a href="user/delete/${user.userId}"> <span
								class="glyphicon glyphicon-trash"></span></a></td>  
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>
<%@ include file="footer.jsp"%>
