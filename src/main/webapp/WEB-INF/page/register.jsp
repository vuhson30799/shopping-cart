<%@ page pageEncoding="UTF-8"
         contentType="text/html; charset=UTF-8"
         isELIgnored="false"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Register Here</title>
    <link rel="icon" type="image/x-icon"
          href="/resource/images/favicon1.png"/>
    <link rel="stylesheet"
          href="/resource/bootstrap/css/custom.css">
    <script src="/resource/js/jquery.js"></script>
    <script src="/resource/bootstrap/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css"
          href="/resource/css/register.css">

</head>
<body>
<%@ include file="navbar.jsp" %>
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
                                        class="form-control" path="firstName" id="fistName" name="firstName"/>
                            <form:errors path="firstName"/>
                        </div>
                        <div class="col-sm-6 form-group">
                            <form:label path="lastName">Last Name</form:label>
                            <form:input type="text" placeholder="Enter Last Name.."
                                        class="form-control" path="lastName" id="lastName"/>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6 form-group">
                            <form:label path="userInfo.emailId">Email Id</form:label>
                            <form:input type="text" placeholder="Enter Email ID.."
                                        class="form-control" path="userInfo.emailId" id="emailId"/>
                            <form:errors path="userInfo.emailId"/>
                        </div>
                        <div class="col-sm-6 form-group">
                            <form:label path="customerPhone">Phone Number</form:label>
                            <form:input type="text" placeholder="Enter Phone Number.."
                                        class="form-control" path="customerPhone" id="phoneNumber"/>
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
                                       class="form-control" path="shippingAddress.address" id="shippingAddress"/>
                    </div>
                    <div class="row">
                        <div class="col-sm-6 form-group">
                            <form:label path="shippingAddress.city">City</form:label>
                            <form:input type="text" placeholder="Enter Current City.."
                                        class="form-control" path="shippingAddress.city" id="shippingCity"/>
                        </div>
                        <div class="col-sm-6 form-group">
                            <form:label path="shippingAddress.state">State</form:label>
                            <form:input type="text" placeholder="Enter your State.."
                                        class="form-control" path="shippingAddress.state" id="shippingState"/>
                            <form:errors path="shippingAddress.state"/>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6 form-group">
                            <form:label path="shippingAddress.country">Country</form:label>
                            <form:input type="text" placeholder="Enter your country.."
                                        class="form-control" path="shippingAddress.country" id="shippingCountry"/>
                        </div>
                        <div class="col-sm-6 form-group">
                            <form:label path="shippingAddress.zipcode">Zipcode</form:label>
                            <form:input type="text" placeholder="Enter zipcode.."
                                        class="form-control" path="shippingAddress.zipcode" id="shippingZipcode"/>
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
                                       class="form-control" path="billingAddress.address" id="billingAddress"/>
                    </div>
                    <div class="row">
                        <div class="col-sm-6 form-group">
                            <form:label path="billingAddress.city">City</form:label>
                            <form:input type="text" placeholder="Enter your City.."
                                        class="form-control" path="billingAddress.city" id="billingCity"/>
                        </div>
                        <div class="col-sm-6 form-group">
                            <form:label path="billingAddress.state">State</form:label>
                            <form:input type="text" placeholder="Enter your state.."
                                        class="form-control" path="billingAddress.state" id="billingState"/>
                            <form:errors path="billingAddress.state"/>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6 form-group">
                            <form:label path="billingAddress.country">Country</form:label>
                            <form:input type="text" placeholder="Enter your City.."
                                        class="form-control" path="billingAddress.country" id="billingCountry"/>
                        </div>
                        <div class="col-sm-6 form-group">
                            <form:label path="billingAddress.zipcode">Zipcode</form:label>
                            <form:input type="text" placeholder="Enter Zipcode.."
                                        class="form-control" path="billingAddress.zipcode" id="billingZipcode"/>
                            <form:errors path="billingAddress.zipcode"/>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6 form-group">
                            <form:label path="userInfo.password">Password</form:label>
                            <form:input type="password" placeholder="******"
                                        class="form-control" path="userInfo.password" id="pass"/>
                        </div>
                        <div class="col-sm-6 form-group">
                            <label for="confirmpass">Confirm Password</label>
                            <input type="password" placeholder="******" class="form-control" id="confirmpass"/>
                        </div>
                    </div>

                    <div class="form-actions">
                        <button type="submit" class="btn btn-lg btn-info"
                                onclick="return(Validate())">Submit
                        </button>
                    </div>
                </div>
            </form:form>
        </div>
    </div>
</div>
<%@ include file="footer.jsp" %>

<!-- Validating Password -->
<script type="text/javascript">
    function Validate() {
        var fistName = document.getElementById("fistName").value;
        var lastName = document.getElementById("lastName").value;
        var emailId = document.getElementById("emailId").value;
        var phoneNumber = document.getElementById("phoneNumber").value;
        var password = document.getElementById("pass").value;
        var confirmpass = document.getElementById("confirmpass").value;

        var shippingAddress = document.getElementById("shippingAddress").value;
        var shippingCity = document.getElementById("shippingCity").value;
        var shippingState = document.getElementById("shippingState").value;
        var shippingCountry = document.getElementById("shippingCountry").value;
        var shippingZipcode = document.getElementById("shippingZipcode").value;

        var billingAddress = document.getElementById("billingAddress").value;
        var billingCity = document.getElementById("billingCity").value;
        var billingState = document.getElementById("billingState").value;
        var billingCountry = document.getElementById("billingCountry").value;
        var billingZipcode = document.getElementById("billingZipcode").value;

        var informKeys = [fistName, lastName, emailId, phoneNumber, password, confirmpass, shippingAddress, shippingCity, shippingState
        , shippingState, shippingCountry, shippingZipcode, billingAddress, billingCity, billingState, billingCountry, billingZipcode];

        var informValues = ["First name", "Last name", "Email Id", "Phone Number", "Password", "Confirm Password", "Shipping Address", "Shipping City", "Shipping State"
        , "Shipping Country", "Shipping Zipcode", "Billing Address", "Billing City", "Billing State", "Billing Country", "Billing Zipcode"];

        for(var i=0; i < informKeys.length; i++) {
            if(informKeys[i] == null || informKeys[i] == "") {
                alert(informValues[i] + " is not null!")
                return false;
            }
        }


        if(!validateEmail(emailId)) {
            alert("Email is not valid!")
            return false;
        }

        if(!validateNumber(phoneNumber)) {
            alert("Phone number is not valid!")
            return false;
        }

        if(!validateNumber(shippingZipcode)) {
            alert("Shipping zipcode is not valid")
            return false
        }

        if(!validateNumber(billingZipcode)) {
            alert("Billing zipcode is not valid")
            return false
        }

        if (password != confirmpass) {
            alert("Password does Not Match!");
            return false;
        }
        return true;
    }

    function validateEmail(email) {
        const re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        return re.test(email);
    }

    function validateNumber(number) {
        const re = /^[0-9]*$/;
        return re.test(number);
    }
</script>
</body>
</html>