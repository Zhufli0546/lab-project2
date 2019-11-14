<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.ArrayList,topic.booking.AllTime"
    pageEncoding="UTF-8" import="java.util.*" import="java.sql.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
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
	width:300px;
	margin:0 auto;
	text-align:center;
	border:3px solid #DDDDDD;
	background-color:white;
	opacity:0.8;
	
	

	
}
input{
	margin:3px 0 ;
	height:30px;
	width:200px;
	font-size:15px;
	font-family:微軟正黑體;
	font-weight:bold;
	background-color:#AAAAAA;
	
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

</style>

<script>
	window.onload = function() {
		document.getElementById("A").onblur = checkName;

		document.getElementById("D").onblur = checkPhone;
	}

	var nameValue

	var phoneValue

	function checkName() {

		var theName = document.getElementById("A").value;

		var re = /^[\u4e00-\u9fa5]{2,}$/;

		if (theName.length >= 2) {

			if (re.test(theName)) {

				nameValue = true;

				document.getElementById("a").innerHTML = "<img src='imgs/img1.png'>";

			} else {

				nameValue = false;

				document.getElementById("a").innerHTML = "<img src='imgs/img2.png'>";
			}

		} else {

			nameValue = false;

			document.getElementById("a").innerHTML = "<img src='imgs/img2.png'>";

		}

		buttonDisable();
	}

	function checkPhone() {
		var theCheckphone = document.getElementById("D").value;
		var re = /^(?=.*[0-9]).{10}$/;

		if (theCheckphone.length >= 10) {

			if (re.test(theCheckphone)) {

				phoneValue = true;

				document.getElementById("d").innerHTML = "<img src='imgs/img1.png'>";

			} else {

				phonedValue = false;

				document.getElementById("d").innerHTML = "<img src='imgs/img2.png'>";

			}
		} else {

			phoneValue = false;

			document.getElementById("d").innerHTML = "<img src='imgs/img2.png'>";
		}
		buttonDisable();
	}
	function buttonDisable() {

		if (nameValue && phoneValue) {

			document.getElementById('G').disabled = false;

		} else {

			document.getElementById('G').disabled = true;

		}

	}

</script>



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
		<h2>填寫訂位人資料</h2>
		<form method="post" action="AdminInsertBooking">
			<fieldset>


				<div class="title">

					<label class="s">姓名：</label><input class="aaa" type="text" id="A"
						name="name" /> <span id="a"></span><br></br>

				</div>
				<br></br>



				<div class="title">

					<label class="s">手機：</label><input class="aaa" type="text" id="D"
						name="phone" /> <span id="d"></span><br></br> 

				</div>
				<br></br>






					<input type="hidden" name="date" value="${param.date}" />
					<input type="hidden" name="people" value="${param.people}" />
					<input type="hidden" name="time" value="${param.time}" />
					<input id="G" class="input" type="submit" value="確定" />

			</fieldset>
			
		</form>

	</div>



</body>
</html>