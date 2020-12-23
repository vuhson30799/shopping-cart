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
			var x=document.getElementById("userName");
			if(x.innerText.indexOf("@")>0){
				x.innerText=x.innerText.split("@")[0];
			}
		}
		document.getElementsByTagName("body").item(0).onload=f;
	</script>
</body>
</html>
