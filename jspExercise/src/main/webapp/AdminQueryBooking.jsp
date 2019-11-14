<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="topic.booking.*" import="java.util.ArrayList,topic.booking.AllTime"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<style>
.button:active {
	border-style: solid;
	border-color: #0066FF;
	background-color: #0066FF;
	color: black;
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


<div id="DD" class="container">
<h2>訂位查詢</h2>
日期:<input id="ymd" type="text"><button id="D" type="button">查詢</button>
手機:<input id="tel" type="text"><button id="P" type="button">查詢</button>
指定日期時段:<input id="qd" type="text">
<% 
BookingDao Dao = BookingFactory.createBookingDao();
Dao.createConn();
ArrayList<AllTime> PullTime = Dao.PullDateTime();
out.print("<select id='qt' style='height:26px;'>");
out.print("<option value='"+PullTime.get(0).getTime()+"'>"+PullTime.get(0).getTime()+"</option>");
out.print("<option value='"+PullTime.get(1).getTime()+"'>"+PullTime.get(1).getTime()+"</option>");
out.print("<option value='"+PullTime.get(2).getTime()+"'>"+PullTime.get(2).getTime()+"</option>");
out.print("<option value='"+PullTime.get(3).getTime()+"'>"+PullTime.get(3).getTime()+"</option>");
out.print("<option value='"+PullTime.get(4).getTime()+"'>"+PullTime.get(4).getTime()+"</option>");
out.print("<option value='"+PullTime.get(5).getTime()+"'>"+PullTime.get(5).getTime()+"</option>");
out.print("<option value='"+PullTime.get(6).getTime()+"'>"+PullTime.get(6).getTime()+"</option>");
out.print("<option value='"+PullTime.get(7).getTime()+"'>"+PullTime.get(7).getTime()+"</option>");
out.print("</select>"); 
Dao.closeConn();
%>
<button id="DT" type="button">查詢</button>
<table class="table table-striped">
<thead><tr>
<th>訂單編號<th>訂位人<th>訂位日期<th>訂位時間<th>訂位人數<th>手機<th>取消訂位<th>更改訂位
</tr></thead>
<tbody>
<c:forEach var="Booking" items="${Bookings}">
<tr>
<td>${Booking.bookingid}</td>
<td>${Booking.name}</td>
<td>${Booking.date}</td>
<td>${Booking.time}</td>
<td>${Booking.people}</td>
<td>${Booking.phone}</td>
<td><a href="cancelBooking?id=${Booking.bookingid}"><button class="button" type="button" onclick="return confirm('是否刪除');">取消訂位</button></a></td>
<td><a href="QuerySBooking?id=${Booking.bookingid}"><button class="button" type="button">更改訂位</button></a></td>
</tr>
</c:forEach>
</tbody>



</table>
</div>
<script>
$("#D").click(function(){
	$.ajax({
		url:"dateQuery.jsp",
		type:"POST",
		data:{
			date:$("#ymd").val()
		},
		success:function(data){
			$("#DD").html(data);
		}
		
		
	})
});

$("#P").click(function(){
	$.ajax({
		url:"phoneQuery.jsp",
		type:"POST",
		data:{
			phone:$("#tel").val()
		},
		success:function(data){
			$("#DD").html(data);
		}
		
		
	})
});

$("#DT").click(function(){
	$.ajax({
		url:"DateTimeQuery.jsp",
		type:"POST",
		data:{
			date:$("#qd").val(),
			time:$("#qt").val()
		},
		success:function(data){
			$("#DD").html(data);
		}
		
		
	})
});








</script>


</body>
</html>