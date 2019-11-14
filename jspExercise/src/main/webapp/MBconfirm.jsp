<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<jsp:useBean id="guess" class="topic.booking.BookingData" scope="request"/>
<jsp:setProperty name="guess" property="*"/>
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

<style>
.div{
	width:500px;
	margin:0 auto;
	text-align:center;
	border:3px solid orange;
	background-color:black;
	opacity:0.8;
	}
h2{
	background-color:orange;
	opacity:0.8;
	color:black;
	height:46px;
	box-shadow: 0 0 15px orange; 
	
	margin:10px auto 50px auto;

}

table{
	margin:35px auto;
	font-size:23px;

}

</style>
<title>Insert title here</title>
</head>
<body>
	<div id="logo" class="container">
		<h1>
			<a href="#">Well<span>Formed</span></a>
		</h1>
		<p>
			Design by <a href="http://templated.co" rel="nofollow">TEMPLATED</a>
		</p>
	</div>
	<div id="menu" class="container">
	<ul>
		<li class="current_page_item"><a href="index.jsp" accesskey="1" title="">首頁</a></li>
		
		<li><a href="#" accesskey="2" title="">About Us</a></li>
		<c:if test="${sessionScope.Permission==1}">
		<li><a href="Admin.jsp" accesskey="1" title="">後台管理</a></li>
		</c:if>
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
          <li><a style="font-size:15px;color:black" href="QueryPersonalBooking">我的訂位</a></li>
          <li><a style="font-size:15px;color:black" href="Logout">登出</a></li>
        </ul>
      </li>
		</c:if>
	</ul>
	</div>
	<div class="div">
	<h2>已收到您的訂位</h2>
	<table>
	<tr><td>訂位編號  :</td><td>${Booking.bookingid}</td></tr>
<tr><td>姓名  :</td><td>${Booking.name}</td></tr>
<tr><td>手機  :</td><td>${Booking.phone}</td></tr>
<tr><td>訂位日期  :</td><td style="color:red">${Booking.date}</td></tr>
<tr><td>訂位時間  :</td><td style="color:red">${Booking.time}</td></tr>
<tr><td>訂位人數  :</td><td>${Booking.people}</td></tr>

</table>
	
	</div>
</body>
</html>