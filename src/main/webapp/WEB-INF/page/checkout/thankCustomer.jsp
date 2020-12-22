<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ include file="/WEB-INF/page/navbar.jsp"%>
<%@ page isELIgnored="false"%>
<html>
<head>
<title>Insert title here</title>
<link rel="stylesheet"
	href="/resource/bootstrap/css/bootstrap.min.css">
<script src="/resource/js/jquery.js"></script>
<script src="/resource/bootstrap/js/bootstrap.min.js"></script>

</head>
<body style="padding: 0;">

	<div class="container-wrapper">
		<div class="container" >
			<section>
			<div class="jumbotron">
				<div class="container">
					<h1>Thank you for your business!</h1>

					<p>Your order will be delivered within two days</p>
				</div>
			</div>
<%@ include file="/WEB-INF/page/countdown.jsp"%>
			</section>
			<section class="container" style="margin-bottom: 30px;">
			<p style="text-align: center;">
				<a href="<spring:url value="/" />" class="btn btn-default">OK</a>
			</p>
			</section>
		</div>
	</div>
</body>
</html>

<%@ include file="/WEB-INF/page/footer.jsp"%>
