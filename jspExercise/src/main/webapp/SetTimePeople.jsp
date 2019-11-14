<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.ArrayList,topic.booking.AllTime"
    pageEncoding="UTF-8" import="java.util.*" import="java.sql.*" import="topic.booking.*"%>
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

height:480px;
width:500px;

margin:0 auto;
text-align:center;

border:2px solid #DDDDDD;

}

.time{

height:35px;
width:150px;

background-color:	#DDDDDD;
font-size:20px;
text-align:center;
border-radius:5px;
color:black;
    text-align: center;
    text-align-last: center;

}

.people{

height:35px;
width:150px;

background-color:	#DDDDDD;
font-size:20px;
text-align:center;
border-radius:5px;
color:black;
    text-align: center;
    text-align-last: center;
}

select{

margin:5px 0;

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
<h2>重設時段及人數</h2>
<form method="post" action="SetTimePeople">

<%
BookingDao Dao = BookingFactory.createBookingDao();
Dao.createConn();
ArrayList<AllTime> PullTime = Dao.PullDateTime();
Dao.closeConn();
%>

	<select class="time" name="time1" class="text">
	<%out.print("<option value='"+PullTime.get(0).getTime()+"' selected>"+PullTime.get(0).getTime()+"</option>"); %>
	<c:forEach var="i" begin="12" end="24" step="1">
	<option value="${i}:00">${i}:00</option>
	</c:forEach>
	</select>
		<select class="people" name="people1" class="text">
		<%out.print("<option value='"+PullTime.get(0).getPeople()+"' selected>"+PullTime.get(0).getPeople()+"位</option>"); %>
	<c:forEach var="i" begin="0" end="50" step="1">
	<option value="${i}">${i}位</option>
	</c:forEach>
	</select><br>
	

		<select class="time" name="time2" class="text">
		<%out.print("<option value='"+PullTime.get(1).getTime()+"' selected>"+PullTime.get(1).getTime()+"</option>"); %>
	<c:forEach var="i" begin="12" end="24" step="1">
	<option value="${i}:00">${i}:00</option>
	</c:forEach>
	</select>
		<select class="people" name="people2" class="text">
		<%out.print("<option value='"+PullTime.get(1).getPeople()+"' selected>"+PullTime.get(1).getPeople()+"位</option>"); %>
	<c:forEach var="i" begin="0" end="50" step="1">
	<option value="${i}">${i}位</option>
	</c:forEach>
	</select><br>

	
		<select class="time" name="time3" class="text">
		<%out.print("<option value='"+PullTime.get(2).getTime()+"' selected>"+PullTime.get(2).getTime()+"</option>"); %>
	<c:forEach var="i" begin="12" end="24" step="1">
	<option value="${i}:00">${i}:00</option>
	</c:forEach>
	</select>
		<select class="people" name="people3" class="text">
		<%out.print("<option value='"+PullTime.get(2).getPeople()+"' selected>"+PullTime.get(2).getPeople()+"位</option>"); %>
	<c:forEach var="i" begin="0" end="50" step="1">
	<option value="${i}">${i}位</option>
	</c:forEach>
	</select><br>
	
		<select class="time" name="time4" class="text">
		<%out.print("<option value='"+PullTime.get(3).getTime()+"' selected>"+PullTime.get(3).getTime()+"</option>"); %>
	<c:forEach var="i" begin="12" end="24" step="1">
	<option value="${i}:00">${i}:00</option>
	</c:forEach>
	</select>
		<select class="people" name="people4" class="text">
		<%out.print("<option value='"+PullTime.get(3).getPeople()+"' selected>"+PullTime.get(3).getPeople()+"位</option>"); %>
	<c:forEach var="i" begin="0" end="50" step="1">
	<option value="${i}">${i}位</option>
	</c:forEach>
	</select><br>


		<select class="time" name="time5" class="text">
		<%out.print("<option value='"+PullTime.get(4).getTime()+"' selected>"+PullTime.get(4).getTime()+"</option>"); %>
	<c:forEach var="i" begin="12" end="24" step="1">
	<option value="${i}:00">${i}:00</option>
	</c:forEach>
	</select>
		<select class="people" name="people5" class="text">
		<%out.print("<option value='"+PullTime.get(4).getPeople()+"' selected>"+PullTime.get(4).getPeople()+"位</option>"); %>
	<c:forEach var="i" begin="0" end="50" step="1">
	<option value="${i}">${i}位</option>
	</c:forEach>
	</select><br>
	
		<select class="time" name="time6" class="text">
		<%out.print("<option value='"+PullTime.get(5).getTime()+"' selected>"+PullTime.get(5).getTime()+"</option>"); %>
	<c:forEach var="i" begin="12" end="24" step="1">
	<option value="${i}:00">${i}:00</option>
	</c:forEach>
	</select>
		<select class="people" name="people6" class="text">
		<%out.print("<option value='"+PullTime.get(5).getPeople()+"' selected>"+PullTime.get(5).getPeople()+"位</option>"); %>
	<c:forEach var="i" begin=0" end="50" step="1">
	<option value="${i}">${i}位</option>
	</c:forEach>
	</select><br>
	
		<select class="time" name="time7" class="text">
		<%out.print("<option value='"+PullTime.get(6).getTime()+"' selected>"+PullTime.get(6).getTime()+"</option>"); %>
	<c:forEach var="i" begin="12" end="24" step="1">
	<option value="${i}:00">${i}:00</option>
	</c:forEach>
	</select>
		<select class="people" name="people7" class="text">
		<%out.print("<option value='"+PullTime.get(6).getPeople()+"' selected>"+PullTime.get(6).getPeople()+"位</option>"); %>
	<c:forEach var="i" begin="0" end="50" step="1">
	<option value="${i}">${i}位</option>
	</c:forEach>
	</select><br>
	
		<select class="time" name="time8" class="text">
		<%out.print("<option value='"+PullTime.get(7).getTime()+"' selected>"+PullTime.get(7).getTime()+"</option>"); %>
	<c:forEach var="i" begin="12" end="24" step="1">
	<option value="${i}:00">${i}:00</option>
	</c:forEach>
	</select>
		<select class="people" name="people8" class="text">
		<%out.print("<option value='"+PullTime.get(7).getPeople()+"' selected>"+PullTime.get(7).getPeople()+"位</option>"); %>
	<c:forEach var="i" begin="0" end="50" step="1">
	<option value="${i}">${i}位</option>
	</c:forEach>
	</select><br>

	<input style="margin-top:10px;width:300px;background-color:#5599FF;color:black" type="submit" value="確定" onclick="return confirm('時段及人數即將變更,是否確定');">
</form>


</div>
</body>
</html>