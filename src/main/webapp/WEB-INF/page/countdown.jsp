<%@ page pageEncoding="UTF-8"
		 contentType="text/html; charset=UTF-8"
		 isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>

<html lang="en">
<head>
<title>Thank You</title>
<link type="text/css" href=/resource/countdown/demo.css?v=1.0.0.0" rel="stylesheet">
<link href="http://www.jqueryscript.net/css/jquerysctipttop.css"
	rel="stylesheet" type="text/css">
<link type="text/css" href="/resource/countdown/jquery.countdown.css?v=1.0.0.0"
	rel="stylesheet">
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script type="text/javascript"
	src="/resource/countdown/jquery.countdown.min.js?v=1.0.0.0"></script>
</head>
<body>

	<ul id="example">
		<li><span class="days">00</span>
		<p class="days_text">Days</p></li>
		<li class="seperator">:</li>
		<li><span class="hours">00</span>
		<p class="hours_text">Hours</p></li>
		<li class="seperator">:</li>
		<li><span class="minutes">00</span>
		<p class="minutes_text">Minutes</p></li>
		<li class="seperator">:</li>
		<li><span class="seconds">00</span>
		<p class="seconds_text">Seconds</p></li>
	</ul>

	<script type="text/javascript">
		$('#example').countdown({
			//date format:  month/date/year
			date : '12/22/2020 12:50:59',
			offset : -8,
			day : 'Day',
			days : 'Days'
		}, function() {
			alert('Done!');
		});
	</script>
	<script type="text/javascript">
		var _gaq = _gaq || [];
		_gaq.push([ '_setAccount', 'UA-36251023-1' ]);
		_gaq.push([ '_setDomainName', 'jqueryscript.net' ]);
		_gaq.push([ '_trackPageview' ]);

		(function() {
			var ga = document.createElement('script');
			ga.type = 'text/javascript';
			ga.async = true;
			ga.src = ('https:' == document.location.protocol ? 'https://ssl'
					: 'http://www')
					+ '.google-analytics.com/ga.js';
			var s = document.getElementsByTagName('script')[0];
			s.parentNode.insertBefore(ga, s);
		})();
	</script>

</body>
</html>
