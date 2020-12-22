<%@ page pageEncoding="UTF-8"
		 contentType="text/html; charset=UTF-8"
		 isELIgnored="false"%>
<%@ page import="com.model.Product" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%! List<Product> products; %>
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
body, h1, h2, h3, h4, h5 {
	font-family: "Raleway", sans-serif
}

.w3-sidenav a, .w3-sidenav h4 {
	font-weight: bold
}
</style>
</head>
<body>

	<%
		products = (List<Product>) request.getAttribute("products");
		int noOfRows = (int)Math.ceil(products.size()/3.0);
		for(int i=0;i<noOfRows;i++){
	%>
	<div class="w3-row-padding" style="padding:0px 30px; margin-bottom: 20px">
		<%
			for(int j=i*3;j<Math.min(products.size(),i*3+3);j++){
				String[] description = products.get(j).getProductDescription().split("\\|");
		%>
		<div class="w3-third w3-container w3-margin-bottom">
			<a href="/getProductById/<%=products.get(j).getProductId()%>">
				<img src="/resource/images/products/<%=products.get(j).getImage()%>" alt="Norway" style="width: 100%"
					 class="w3-hover-opacity"></a>
			<div class="w3-container w3-white">
				<p>
					<b><%=products.get(j).getProductName()%></b>
				</p>
				<ul>
					<%for(String des:description){ %>
					<li><%=des%></li>
					<%}%>
				</ul>
			</div>
		</div>
		<%}%>
	</div>
	<hr>
	<%}%>
</body>
</html>
