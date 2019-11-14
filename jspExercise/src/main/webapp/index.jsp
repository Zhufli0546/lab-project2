<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html >


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<meta name="keywords" content="" />
<meta name="description" content="" />
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900" rel="stylesheet" />
<link href="default.css" rel="stylesheet" type="text/css" media="all" />
<link href="fonts.css" rel="stylesheet" type="text/css" media="all" />
<link href="default.css" rel="stylesheet" type="text/css" media="all" />



</head>
<body>
<div id="logo" class="container">
	<h1><a href="#">Well<span>Formed</span></a></h1>
	<p>Design by <a href="http://templated.co" rel="nofollow">TEMPLATED</a></p>
</div>
<div id="menu" class="container">
	<ul>
		<li class="current_page_item"><a href="index.jsp" accesskey="1" title="">首頁</a></li>
		
		<li><a href="#" accesskey="2" title="">About Us</a></li>

		<li><a href="booking.jsp" accesskey="3" title="">線上訂位</a></li>
		
		<li></li>
		<li></li>
		<c:if test="${sessionScope.name==null }">
		<li><a href="Login.html" accesskey="5" title="">會員登入</a></li>
		</c:if>
			<c:if test="${sessionScope.name !=null }">
		            <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#"><span style="color:orange">Hi , ${sessionScope.name}</span>
        <span class="caret"></span></a>
        <ul class="dropdown-menu" style="background-color:	whitesmoke;">
        		<c:if test="${sessionScope.Permission==1}">
		<li><a style="font-size:15px;color:black" href="Admin.jsp" accesskey="1" title="">後台管理</a></li>
		</c:if>
          <li><a style="font-size:15px;color:black" href="QueryPersonalBooking">我的訂位</a></li>
          <li><a style="font-size:15px;color:black" href="Logout">登出</a></li>
        </ul>
      </li>
		</c:if>
	</ul>

	
</div>
<div id="banner" class="container"> <img src="images/bar.jpg" width="1200" height="500" alt="" /></div>
<div id="three-column" class="container">
	<div id="tbox1">
		<h2>Maecenas luctus</h2>
		<p>Nullam non wisi a sem semper eleifend. Donec mattis libero eget urna. Duis pretium velit ac mauris. Proin eu wisi suscipit nulla suscipit interdum.</p>
		<a href="#" class="button">Learn More</a> </div>
	<div id="tbox2">
		<h2>Integer gravida</h2>
		<p>Proin eu wisi suscipit nulla suscipit interdum. Nullam non wisi a sem semper eleifend. Donec mattis libero eget urna. Duis pretium velit ac mauris.</p>
		<a href="#" class="button">Learn More</a> </div>
	<div id="tbox3">
		<h2>Praesent scelerisque</h2>
		<p>Donec mattis libero eget urna. Duis pretium velit ac mauris. Proin eu wisi suscipit nulla suscipit interdum. Nullam non wisi a sem semper eleifend.</p>
		<a href="#" class="button">Learn More</a> </div>
</div>
<!-- <div id="page" class="container">
	<div id="content">
		<div class="title">
			<h2>Welcome <span class="byline">to our website</span></h2>
		</div>
		<a href="#" class="image image-full"><img src="images/pic02.jpg" alt="" /></a>
		<p>This is <strong>WellFormed</strong>, a free, fully standards-compliant CSS template designed by <a href="http://templated.co" rel="nofollow">TEMPLATED</a>. The photos in this template are from <a href="http://fotogrph.com/"> Fotogrph</a>. This free template is released under the <a href="http://templated.co/license">Creative Commons Attribution</a> license, so you're pretty much free to do whatever you want with it (even use it commercially) provided you give us credit for it. Have fun :) </p>
	</div>
	<div id="sidebar">
		<h2 class="title">Mauris vulputate</h2>
		<ul class="style2">
			<li class="first">
				<h3><a href="#">Maecenas luctus lectus</a></h3>
				<p><a href="#">Quisque dictum integer nisl risus, sagittis convallis, rutrum id, congue, and nibh.</a></p>
			</li>
			<li>
				<h3><a href="#">Integer gravida nibh</a></h3>
				<p><a href="#">Quisque dictum integer nisl risus, sagittis convallis, rutrum id, congue, and nibh.</a></p>
			</li>
			<li>
				<h3><a href="#">Nulla luctus eleifend</a></h3>
				<p><a href="#">Quisque dictum integer nisl risus, sagittis convallis, rutrum id, congue, and nibh.</a></p>
			</li>
		</ul>
	</div>
</div>
<div id="footer" class="container">
	<div id="fbox1">
		<h2 class="title">Praesent mattis</h2>
		<p>Pellentesque viverra vulputate enim. Aliquam erat volutpat. Pellentesque tristique ante ut risus. Quisque dictum. Integer nisl risus, sagittis convallis, rutrum id, elementum congue, nibh. Suspendisse dictum porta lectus. </p>
		<a href="#" class="button">Learn More</a> </div>
	<div id="fbox2">
		<h2 class="title">Praesent condimentum</h2>
		<ul class="style1">
			<li class="first"><a href="#">Pellentesque consectetuer gravida blandit.</a></li>
			<li><a href="#">Lorem consectetuer adipiscing elit.</a></li>
			<li><a href="#">Maecenas vitae vitae feugiat eleifend.</a></li>
		</ul>
		<a href="#" class="button">Learn More</a> </div>
	<div id="fbox3">
		<h2 class="title">Social</h2>
		<ul class="style1">
			<li class="first"><a href="#">Twitter</a></li>
			<li><a href="#">Facebook</a></li>
			<li><a href="#">Flickr</a></li>
			<li><a href="#">Google +</a></li>
		</ul>
	</div>
</div>
<div id="copyright" class="container">
	<p>&copy; Untitled. All rights reserved. | Photos by <a href="http://fotogrph.com/">Fotogrph</a> | Design by <a href="http://templated.co" rel="nofollow">TEMPLATED</a>.</p>
</div> -->
</body>
</html>
