<%@ page pageEncoding="UTF-8"
         contentType="text/html; charset=UTF-8"
         isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="now" class="java.util.Date"/>
<%@ include file="/WEB-INF/page/navbar.jsp" %>
<html>
<head>
    <title>Insert title here</title>
    <link rel="stylesheet"
          href="/resource/bootstrap/css/bootstrap.min.css">
    <script src="/resource/js/jquery.js"></script>
    <script src="/resource/js/customerInfoCollector.js"></script>
    <script src="/resource/bootstrap/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css"
          href="/resource/css/register.css">

</head>
<body style="padding: 0;">
<div class="container-wrapper">
    <div class="container" style="margin-bottom: 19px">
        <div class="row" style="margin-top: 20px">
            <form:form modelAttribute="order" class="form-horizontal">
                <div class="well col-xs-10 col-sm-10 col-md-6 col-xs-offset-1 col-sm-offset-1 col-md-offset-3"
                     style="width: 100%; margin-left: 0%">
                    <div style="text-align: center;"><h1>Receipt</h1></div>
                    <div class="row">
                        <div class="col-xs-6 col-sm-6 col-md-6">
                            <address>
                                <strong>Shipping Address</strong><br/>
                                    ${order.cart.customer.shippingAddress.address} <br/>
                                    ${order.cart.customer.shippingAddress.city},
                                    ${order.cart.customer.shippingAddress.state} <br/>
                                    ${order.cart.customer.shippingAddress.country},
                                    ${order.cart.customer.shippingAddress.zipcode}
                            </address>
                        </div>
                        <div class="col-xs-6 col-sm-6 col-md-6 text-right">
                            <p>Shipping Date:<fmt:formatDate type="date" value="${now}"/></p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-6 col-sm-6 col-md-6">
                            <address>
                                <strong>Billing Address</strong><br/>
                                    ${order.cart.customer.billingAddress.address} <br/>
                                    ${order.cart.customer.billingAddress.city},
                                    ${order.cart.customer.billingAddress.state} <br/>
                                    ${order.cart.customer.billingAddress.country},
                                    ${order.cart.customer.billingAddress.zipcode}
                            </address>
                        </div>
                    </div>
                    <div class="row">
                        <div class="container">
                            <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th class="text-center">Product</th>
                                    <th class="text-center">Quantity</th>
                                    <th class="text-center">Price</th>
                                    <th class="text-center">Total</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="cartItem" items="${order.cart.cartItem}">
                                    <tr>
                                        <td style="text-align: center"><em>${cartItem.product.productName}</em></td>
                                        <td style="text-align: center">${cartItem.quality}</td>
                                        <td style="text-align: center" class="price">${cartItem.product.productPrice}</td>
                                        <td style="text-align: center" class="total">${cartItem.price}</td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <div>
                            <h4><strong>Grand Total: </strong> <strong
                                    class="text-danger"></strong></h4>
                        </div>

                    </div>

                    <button type="button"
							style="float: left;"
							class="btn btn-lg btn-default"
                            onclick="backToCollectCustomerInfo(<c:out value="${order.cart.cartId}"/>)">Back
                    </button>

                    <button style="margin-left: 200px" type="button"
							class="btn btn-lg btn-info"
							onclick="submitOrder(<c:out value="${order.customerOrderId}"/>)">
						Submit Order
					</button>

                    <button type="button"
							style="float: right;" class="btn btn-lg btn-default"
							onclick="cancelCollectCustomerInfo(<c:out value="${order.cart.cartId}"/>)">Cancel
					</button>
                </div>
            </form:form>
        </div>
    </div>
</div>
<script>
    function f(){
        var x=document.getElementsByClassName("price");
        var t=document.getElementsByClassName("total");
        var sum=0;
        for(var i=0;i<x.length;i++){
            if(x[i].innerHTML.indexOf("E")>0){
                var y=x[i].innerHTML.split("E");
                var price=y[0]*10**y[1];
                x[i].innerHTML=price.toString();
            }
        }
        for(var i=0;i<t.length;i++){
            if(t[i].innerHTML.indexOf("E")>0){
                var y=t[i].innerHTML.split("E");
                var price=y[0]*10**y[1];
                t[i].innerHTML=price.toString();
                sum+=price;
            }
            else sum+=t[i].innerHTML;
        }
        document.getElementsByClassName("text-danger").item(0).innerHTML=sum;
    }
    document.getElementsByTagName("body").item(0).onload=f;
</script>
</body>
</html>


<%@ include file="/WEB-INF/page/footer.jsp" %>
