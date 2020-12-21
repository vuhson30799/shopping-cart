<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register Here</title>
<link rel="icon" type="image/x-icon"
	href="<c:url value="/resource/images/favicon1.png"/>" />
<link rel="stylesheet"
	href="<c:url value="/resource/bootstrap/css/custom.css"/>">
<script src="<c:url value="/resource/js/jquery.js"/>"></script>
<script src="<c:url value="/resource/bootstrap/js/bootstrap.min.js"/>"></script>
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resource/css/register.css"/>">

</head>
<body>
	<%@ include file="navbar.jsp"%>
	<div class="container" style="margin-bottom: 19px">
		<h1 class="well">Register Here !</h1>
		<div class="col-lg-12 well">
			<div class="row">

				<!--  RegisterServlet  form -->
				<c:url value="/customer/registration" var="url"/>
				<form:form method="post" action="${url}" modelAttribute="customer"
					enctype="multipart/form-data">
					<div class="col-sm-12">
						<div class="row">
							<div>
								<div style="text-align: center;">User Details</div>
							</div>
							<div class="col-sm-6 form-group">
								<form:label path="firstName">First Name</form:label>
								<form:input type="text" placeholder="Enter First Name.."
									class="form-control" path="firstName"/>
								<form:errors path="firstName"/>
							</div>
							<div class="col-sm-6 form-group">
								<form:label path="lastName">Last Name</form:label>
								<form:input type="text" placeholder="Enter Last Name.."
									class="form-control" path="lastName"/>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-6 form-group">
								<form:label path="userInfo.emailId">Email Id</form:label>
								<form:input type="text" placeholder="Enter Email ID.."
									class="form-control" path="userInfo.emailId"/>
								<form:errors path="userInfo.emailId"/>
							</div>
							<div class="col-sm-6 form-group">
								<form:label path="customerPhone">Phone Number</form:label>
								<form:input type="text" placeholder="Enter Phone Number.."
									class="form-control" path="customerPhone"/>
								<form:errors path="customerPhone"/>
							</div>
						</div>
						<hr>
						<div>
							<div style="text-align: center;">Shipping Address</div>
						</div>
						<div class="form-group">
							<form:label path="shippingAddress.address">Address</form:label>
							<form:textarea type="text" placeholder="Enter Shipping Address.."
								class="form-control" path="shippingAddress.address"/>
						</div>
						<div class="row">
							<div class="col-sm-6 form-group">
								<form:label path="shippingAddress.city">City</form:label>
								<form:input type="text" placeholder="Enter Current City.."
									class="form-control" path="shippingAddress.city"/>
							</div>
							<div class="col-sm-6 form-group">
								<form:label path="shippingAddress.state">State</form:label>
								<form:input type="text" placeholder="Enter your State.."
									class="form-control" path="shippingAddress.state"/>
								<form:errors path="shippingAddress.state"/>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-6 form-group">
								<form:label path="shippingAddress.country">Country</form:label>
								<form:input type="text" placeholder="Enter your country.."
									class="form-control" path="shippingAddress.country"/>
							</div>
							<div class="col-sm-6 form-group">
								<form:label path="shippingAddress.zipcode">Zipcode</form:label>
								<form:input type="text" placeholder="Enter zipcode.."
									class="form-control" path="shippingAddress.zipcode"/>
								<form:errors path="shippingAddress.zipcode"/>
							</div>
						</div>
						<hr>
						<div>
							<div style="text-align: center;">Billing Address</div>
						</div>
						<div class="form-group">
							<form:label path="billingAddress.address">Address</form:label>
							<form:textarea type="text" placeholder="Enter Billing Address.."
								class="form-control" path="billingAddress.address"/>
						</div>
						<div class="row">
							<div class="col-sm-6 form-group">
								<form:label path="billingAddress.city">City</form:label>
								<form:input type="text" placeholder="Enter your City.."
									class="form-control" path="billingAddress.city"/>
							</div>
							<div class="col-sm-6 form-group">
								<form:label path="billingAddress.state">State</form:label>
								<form:input type="text" placeholder="Enter your state.."
									class="form-control" path="billingAddress.state"/>
								<form:errors path="billingAddress.state"/>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-6 form-group">
								<form:label path="billingAddress.country">Country</form:label>
								<form:input type="text" placeholder="Enter your City.."
									class="form-control" path="billingAddress.country"/>
							</div>
							<div class="col-sm-6 form-group">
								<form:label path="billingAddress.zipcode">Zipcode</form:label>
								<form:input type="text" placeholder="Enter Zipcode.."
									class="form-control" path="billingAddress.zipcode"/>
								<form:errors path="billingAddress.zipcode"/>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-6 form-group">
								<form:label path="userInfo.password">Password</form:label>
								<form:input type="password" placeholder="********"
											class="form-control" path="userInfo.password" id="pass"/>
							</div>
							<div class="col-sm-6 form-group">
								<label for="confirmpass">Confirm Password</label> <input type="password"
									placeholder="********" class="form-control" id="confirmpass" />
							</div>
						</div>

						<div class="form-actions">
							<button type="submit" class="btn btn-lg btn-info"
								onclick="return Validate()">Submit</button>
						</div>
					</div>
				</form:form>
			</div>
		</div>
	</div>
	<%@ include file="footer.jsp"%>

	<!-- Validating Password -->
	<script type="text/javascript">
		function Validate() {
			var password = document.getElementById("pass").value;
			var confirmpass = document.getElementById("confirmpass").value;
			if (password != confirmpass) {
				alert("Password does Not Match.");
				return false;
			}
			return true;
		}
	</script>
</body>
</html>
