<%@ page pageEncoding="UTF-8"
         contentType="text/html; charset=UTF-8"
         isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>AboutUs</title>
    <link rel="stylesheet"
          href="resource/bootstrap/css/bootstrap.min.css">
    <script src="/resource/js/jquery.js"></script>
    <script src="/resource/bootstrap/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css"
          href="/resource/css/aboutus.css">
    <link rel="icon" type="image/x-icon" href="/resource/images/favicon1.png"/>
</head>

<body>

<!-- importing navigation bar -->
<%@ include file="navbar.jsp" %>

<!-- Content -->
<div class="row" style="margin: 4px 0 19px;">
    <div class="col-sm-4" style="margin-top:0px">
        <div class="container-fluid bg-1 text-center">
            <h3>Who Am I?</h3>
            <img src="/resource/images/aboutImage.png" class="img-circle" alt="AboutUs" width="350"
                 height="350">
            <h3>ShopIeasy a WorldWide E-Commerce Site</h3>
        </div>

    </div>

    <div class="container-fluid bg-2 text-center">
        <h3>What Am I?</h3>
        <div><p>ShopIeasy's vision is to create India's most reliable and
            frictionless commerce ecosystem that creates life-changing
            experiences for buyers and sellers.</p>
        </div>
        <div><p>We have always taken pride in our culture. There are some core
            values that have been inherent and are an integral part of our
            success story. These values are a pure reflection of what is
            important to us as a Team and Business..</p>
        </div>
    </div>
</div>

<!-- 	importing footer  -->
<%@ include file="footer.jsp" %>

</body>
</html>
