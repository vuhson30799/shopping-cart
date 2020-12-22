<%@ page pageEncoding="UTF-8"
		 contentType="text/html; charset=UTF-8"
		 isELIgnored="false"%>
<html>
<head>
<title>User Info</title>
</head>
<body>
	<jsp:include page="navbar.jsp"/>
	
	<h3>Hello: ${user.EmailId}</h3>
	
 	User Name: <b>${user.EmailId}</b><br />

	<jsp:include page="footer.jsp"/>
</body>
</html>
