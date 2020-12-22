<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isELIgnored="false" %>
<%@ include file="/WEB-INF/page/navbar.jsp" %>
<html>
<head>
    <title>Insert title here</title>
    <link rel="stylesheet"
          href="/resource/bootstrap/css/bootstrap.min.css">
    <script src="/resource/js/jquery.js" type="text/javascript"></script>
    <script src="/resource/js/customerInfoCollector.js" type="text/javascript"></script>
    <script src="/resource/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="/resource/css/register.css"/>">

</head>
<body style="padding: 0;">
<div class="container" style="margin-bottom: 19px">
    <div style="text-align: center;"><h1 class="well">Customer Details!</h1></div>
    <div class="col-lg-12 well">
        <div class="row">
            <form:form modelAttribute="customerOrder">
                <div class="col-sm-12">
                    <div class="row">
                        <div class="col-sm-6 form-group">
                            <form:hidden path="customerOrderId"/>
                            <form:label path="cart.customer.firstName">First Name</form:label>
                            <form:input type="text" class="form-control"
                                        path="cart.customer.firstName"
                                        readonly="true"/>
                        </div>
                        <div class="col-sm-6 form-group">
                            <form:label path="cart.customer.lastName">Last Name</form:label>
                            <form:input type="text" class="form-control"
                                        path="cart.customer.lastName"
                                        readonly="true"/>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6 form-group">
                            <form:label path="cart.customer.userInfo.emailId">Email Id</form:label>
                            <form:input type="text" class="form-control"
                                        path="cart.customer.userInfo.emailId"
                                        readonly="true"/>
                        </div>
                        <div class="col-sm-6 form-group">
                            <form:label path="cart.customer.customerPhone">Customer Phone</form:label>
                            <form:input type="text" class="form-control"
                                        path="cart.customer.customerPhone"
                                        readonly="true"/>
                        </div>
                    </div>
                    <div style="text-align: center;">Billing Address:</div>
                    <div class="form-group">
                        <form:label path="cart.customer.billingAddress.address">Address</form:label>
                        <form:textarea type="text" class="form-control"
                                       path="cart.customer.billingAddress.address"
                                       readonly="true"/>
                    </div>
                    <div class="row">
                        <div class="col-sm-6 form-group">
                            <form:label path="cart.customer.billingAddress.city">City</form:label>
                            <form:input type="text" class="form-control"
                                        path="cart.customer.billingAddress.city"
                                        readonly="true"/>
                        </div>
                        <div class="col-sm-6 form-group">
                            <form:label path="cart.customer.billingAddress.state">State</form:label>
                            <form:input type="text" class="form-control"
                                        path="cart.customer.billingAddress.state"
                                        readonly="true"/>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6 form-group">
                            <form:label path="cart.customer.billingAddress.country">Country</form:label>
                            <form:input type="text" class="form-control"
                                        path="cart.customer.billingAddress.country"
                                        readonly="true"/>
                        </div>
                        <div class="col-sm-6 form-group">
                            <form:label path="cart.customer.billingAddress.zipcode">Zipcode</form:label>
                            <form:input type="text" class="form-control"
                                        path="cart.customer.billingAddress.zipcode"
                                        readonly="true"/>
                        </div>
                    </div>
                </div>
                <div class="col-sm-12">
                    <div class="row">
                        <div>
                            <div style="text-align: center;">Shipping Address</div>
                        </div>
                        <div class="form-group">
                            <form:label path="cart.customer.shippingAddress.address">Address</form:label>
                            <form:textarea type="text"
                                           class="form-control"
                                           path="cart.customer.shippingAddress.address"/>
                        </div>
                        <div class="row">
                            <div class="col-sm-6 form-group">
                                <form:label path="cart.customer.shippingAddress.city">City</form:label>
                                <form:input type="text"
                                            class="form-control" path="cart.customer.shippingAddress.city"/>
                            </div>
                            <div class="col-sm-6 form-group">
                                <form:label path="cart.customer.shippingAddress.state">State</form:label>
                                <form:input type="text"
                                            class="form-control"
                                            path="cart.customer.shippingAddress.state"/>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6 form-group">
                                <form:label path="cart.customer.shippingAddress.country">Country</form:label>
                                <form:input type="text"
                                            class="form-control"
                                            path="cart.customer.shippingAddress.country"/>
                            </div>
                            <div class="col-sm-6 form-group">
                                <form:label path="cart.customer.shippingAddress.zipcode">Zipcode</form:label>
                                <form:input type="text"
                                            class="form-control"
                                            path="cart.customer.shippingAddress.zipcode"/>
                            </div>
                        </div>

                        <div class="form-actions">
                            <button type="button" style="margin-right: 10px; margin-left: 0"
                                    class="btn btn-lg btn-info" onclick="orderConfirmation(<c:out
                                    value="${customerOrder.cart.cartId}"/>)">Next
                            </button>
                            <button type="button" style="float: right;" class="btn btn-lg btn-default"
                                    onclick="cancelCollectCustomerInfo(<c:out
                                            value="${customerOrder.cart.cartId}"/>)">Cancel
                            </button>
                        </div>
                    </div>
                </div>
            </form:form>
        </div>
    </div>
</div>
</body>
</html>
<%@ include file="/WEB-INF/page/footer.jsp" %>
