<%@ page pageEncoding="UTF-8"
         contentType="text/html; charset=UTF-8"
         isELIgnored="false"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Add Product</title>
    <link rel="stylesheet"
          href="/resource/bootstrap/css/custom.css">
    <script src="/resource/js/jquery.js"></script>
    <script src="/resource/bootstrap/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css"
          href="/resource/css/register.css">
    <link rel="icon" type="image/x-icon" href="/resource/images/favicon1.png"/>
</head>
<body>
<%@ include file="navbar.jsp" %>
<div class="container" style="margin-bottom:19px">
    <h1 class="well">Add Product !</h1>
    <div class="col-lg-12 well">
        <div class="row">
            <c:url value="/admin/product/addProduct" var="url"/>
            <form:form method="post" action="${url}" modelAttribute="productFormObj" enctype="multipart/form-data">
                <div class="col-sm-12">
                    <div class="row">
                        <div class="col-sm-6 form-group">
                            <form:label path="productId">Product Id</form:label>
                            <form:input type="text"
                                        class="form-control"
                                        path="productId" disabled="true"/>
                        </div>
                        <div class="col-sm-6 form-group">
                            <form:label path="productName">Product Name</form:label>
                            <form:input type="text"
                                        placeholder="Enter Product Name.." class="form-control"
                                        path="productName"/>
                            <form:errors path="productName"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <form:label path="productDescription">Product Description</form:label>
                        <form:textarea type="text"
                                       placeholder="Enter Product Description.." class="form-control"
                                       path="productDescription"/>
                    </div>
                    <div class="form-group">
                        <form:label path="productCategory">Product Category</form:label>
                        <form:radiobutton path="productCategory" value="Android"/>Android
                        <form:radiobutton path="productCategory" value="Windows"/>Windows
                        <form:radiobutton path="productCategory" value="Linux"/>Linux
                        <form:radiobutton path="productCategory" value="Mac"/>Mac
                    </div>
                    <div class="row">
                        <div class="col-sm-4 form-group">
                            <form:label path="productManufacturer">Product Manufacturer</form:label>
                            <form:input type="text"
                                        placeholder="Enter Product Manufacurer.." class="form-control"
                                        path="productManufacturer"/>
                        </div>
                        <div class="col-sm-4 form-group">
                            <form:label path="productPrice">Product Price</form:label>
                            <form:input type="text"
                                        placeholder="Enter Product Price.." class="form-control"
                                        path="productPrice"/>
                            <form:errors path="productPrice"/>
                        </div>
                        <div class="col-sm-4 form-group">
                            <form:label path="unitStock">Number of Products</form:label>
                            <form:input type="text"
                                        placeholder="Number of Products.." class="form-control"
                                        path="unitStock"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <form:label path="productImage">Product Image</form:label>
                        <form:input type="file" path="productImage"/>
                    </div>
                    <div class="form-actions">
                        <button type="submit" class="btn btn-lg btn-info">Submit</button>
                    </div>
                </div>
            </form:form>
        </div>
    </div>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>
