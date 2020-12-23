<%@ page pageEncoding="UTF-8"
		 contentType="text/html; charset=UTF-8"
		 isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>Login</title>
	<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<link rel="icon" type="image/x-icon" href="<c:url value="/resource/images/favicon1.png"/>" />
	<link rel="stylesheet" href="bootstrap/css/custom.css">
	<script src="js/jquery-3.1.0.min.js"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
	<link rel="stylesheet" type="text/css" href="css/header.css">
	<style>
        @import url('https://fonts.googleapis.com/css?family=Mukta');
        body{
            font-family: 'Mukta', sans-serif;
            height:100vh;
            min-height:550px;
            background-image: url(http://www.planwallpaper.com/static/images/Free-Wallpaper-Nature-Scenes.jpg);
            background-repeat: no-repeat;
            background-size:cover;
            background-position:center;
            position:relative;
            overflow-y: hidden;
        }
        a{
            text-decoration:none;
            color:#444444;
        }
        .login-reg-panel{
            position: relative;
            top: 50%;
            transform: translateY(-50%);
            text-align:center;
            width:70%;
            right:0;left:0;
            margin:auto;
            height:400px;
            background-color: rgb(33,25,53);
        }
        .white-panel{
            background-color: rgba(255,255, 255, 1);
            height:500px;
            position:absolute;
            top:-50px;
            width:50%;
            right:calc(50% - 50px);
            transition:.3s ease-in-out;
            z-index:0;
            box-shadow: 0 0 15px 9px #00000096;
        }
        .login-reg-panel input[type="radio"]{
            position:relative;
            display:none;
        }
        .login-reg-panel{
            color:#B8B8B8;
        }
        .login-reg-panel #label-login,
        .login-reg-panel #label-register{
            border:1px solid #9E9E9E;
            padding:5px 5px;
            width:150px;
            display:block;
            text-align:center;
            border-radius:10px;
            cursor:pointer;
            font-weight: 600;
            font-size: 18px;
        }
        .login-info-box{
            width:30%;
            padding:0 50px;
            top:20%;
            left:0;
            position:absolute;
            text-align:left;
        }
        .register-info-box{
            width:30%;
            padding:0 50px;
            top:20%;
            right:0;
            position:absolute;
            text-align:left;

        }
        .right-log{right:50px !important;}

        .login-show,
        .register-show{
            z-index: 1;
            display:none;
            opacity:0;
            transition:0.3s ease-in-out;
            color:#242424;
            text-align:left;
            padding:50px;
        }
        .show-log-panel{
            display:block;
            opacity:0.9;
        }
        .login-show input[type="text"], .login-show input[type="password"]{
            width: 100%;
            display: block;
            margin:20px 0;
            padding: 15px;
            border: 1px solid #b5b5b5;
            outline: none;
        }
        .login-show input[type="submit"] {
            width: 100%;
            background: #444444;
            color: #f9f9f9;
            border: none;
            padding: 10px;
            text-transform: uppercase;
            border-radius: 2px;
            float:right;
            cursor:pointer;
        }

        .credit {
            position:absolute;
            bottom:10px;
            left:10px;
            color: #3B3B25;
            margin: 0;
            padding: 0;
            font-family: Arial,sans-serif;
            text-transform: uppercase;
            font-size: 12px;
            font-weight: bold;
            letter-spacing: 1px;
            z-index: 99;
        }
        a{
            text-decoration:none;
            color:#2c7715;
        }

        .register-info-box a:hover {
            text-decoration-line: none;
        }
    </style>
</head>
<body>
<div class="login-reg-panel">
    <div class="register-info-box">
        <h2>Don't have an account?</h2>
        <a id="label-login" for="log-login-show" href="<c:url value="/customer/registration"/>">Register</a>
    </div>

    <div class="white-panel">
        <form class="login-show" name="loginForm"  action="<c:url value="/j_spring_security_check"/>" method="post">
            <h2>LOGIN</h2>
            <input type="text"  placeholder="E-mail" name="j_username" type="text">
            <input type="password" placeholder="Password" name="j_password" type="password">
            <input type="submit" value="Login">
        </form>
        <c:if test="${not empty error}">
            <div class="error" style="color: #ff0000">${error}</div>
        </c:if>

        <c:if test="${!empty querySuccess}">
            <div class="error" style="color: #ff0000;">${querySuccess}</div>
        </c:if>

        <!-- will display after registration form registerd successfully -->
        <c:if test="${not empty registrationSuccess}">
            <div class="error" style="color: #ff0000;">${registrationSuccess}</div>
        </c:if>
        <!-- will display after logged out successfull -->
        <c:if test="${not empty logout}">
            <div class="error" style="color: #ff0000;">${logout}</div>
        </c:if>
    </div>
</div>
<script>
    $(document).ready(function(){
        $('.login-info-box').fadeOut();
        $('.login-show').addClass('show-log-panel');
    });
</script>
</body>
</html>
