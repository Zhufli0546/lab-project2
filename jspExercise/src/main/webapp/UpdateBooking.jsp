<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.ArrayList,topic.booking.AllTime"
    pageEncoding="UTF-8" import="java.util.*" import="java.sql.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<jsp:useBean id="guess" class="topic.booking.BookingData" scope="request"/>
<jsp:setProperty name="guess" property="*"/>
<!DOCTYPE html>
<html>
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<title></title>


<style>
.div{
	width:500px;
	margin:0 auto;
	text-align:center;
	border:3px solid #DDDDDD;
	background-color:#AAAAAA;
	opacity:0.8;
	font-size:26px;
	
	

	
}
input{
	margin:3px 0 ;
	height:30px;
	width:150px;
	font-size:15px;
	font-family:微軟正黑體;
	font-weight:bold;
	background-color:white;
	border:1px solid black;
	border-radius:5px;
	text-align:center;
	
}



h2{
	background-color:#DDDDDD;
	opacity:0.7;
	color:black;
	height:46px;
	box-shadow: 0 0 15px #DDDDDD; 
	
	margin:10px auto 10px auto;

}

.aaa:focus { 
     border-style:solid;  
    border-color: #CCEEFF;  
    box-shadow: 0 0 15px #DDDDDD; 
}



span{
	right:10px;


}

.a{
font-size:15px;
color:#888888;

}
.s{
color:black;
}

fieldset{
border:none;

}

	
.title{
height:30px;

}

.input{
height:30px;
width:100px;



}
.aaa{

margin:1px auto;
}

table{
margin:0 auto;

}

</style>




</head>
<body>
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="Admin.jsp">後台管理</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="index.jsp">首頁</a></li>
      <li><a href="#">#</a></li>
      <li><a href="#">#</a></li>
            <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">訂位管理
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="QueryBooking">訂位查詢</a></li>
          <li><a href="Adminbooking.jsp">來電訂位</a></li>
          <li><a href="SetTimePeople.jsp">設定時段及人數</a></li>
        </ul>
      </li>
      	<c:if test="${sessionScope.name==null }">
      	<li><a href="Login.html" accesskey="5" title="">會員登入</a></li>
		</c:if>
		<c:if test="${sessionScope.name !=null }">
		<li><a href="Logout" accesskey="6" title=""><span style="color:blue">登出</span></a></li><span style="color:blue;font-size:26px">${sessionScope.name}</span>
		</c:if>
    </ul>
  </div>
</nav>
	<div class="div">
	<h2 style="color:red">更改訂位</h2>
	<form method="post" action="UpdateBooking">
	<table>
<tr><td>訂位編號  :</td><td><input style="background-color:#888888" type="text" name="id" disabled value="${Booking.bookingid}"></td></tr>
<tr><td>姓名  :</td><td><input type="text" name="name" value="${Booking.name}"></td></tr>
<tr><td>手機  :</td><td><input type="text" name="phone" value="${Booking.phone}"></td></tr>
<tr><td>訂位日期  :</td><td><input type="text" name="date" value="${Booking.date}"></td></tr>
<tr><td>訂位時間  :</td><td><input type="text" name="time" value="${Booking.time}"></td></tr>
<tr><td>訂位人數  :</td><td><input type="text" name="people" value="${Booking.people}"></td></tr>

</table>
	<input type="hidden" name="id" value="${Booking.bookingid}">
	<input type="submit" onclick="return confirm('是否更改');" value="更改">
	</form>
	</div>
</body>
</html>