<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title></title>
<style>
.div{
	width:300px;
	margin:0 auto;
	text-align:center;
	border:3px solid orange;
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
	background-color:orange;
	opacity:0.7;
	color:black;
	height:46px;
	box-shadow: 0 0 15px orange; 
	
	margin:10px auto 10px auto;

}

.aaa:focus { 
     border-style:solid;  
    border-color: orange;  
    box-shadow: 0 0 15px orange; 
    
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
	margin:3px 0 ;
	height:30px;
	width:200px;
	font-size:15px;
	font-family:微軟正黑體;
	font-weight:bold;
	background-color:orange;
	border-radius:25px;
	color:black;

}
.aaa{

margin:1px auto;
background-color:white;
color:black;

}

</style>

<script>
	window.onload = function() {
		document.getElementById("A").onblur = checkName;

		document.getElementById("D").onblur = checkPhone;
	}

	</script>
	<script>
	var nameValue

	var phoneValue
	
	function buttonDisable() {

		if (nameValue && phoneValue) {

			document.getElementById('G').disabled = false;

		} else {

			document.getElementById('G').disabled = true;

		}

	}

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
		var re = /^09\d{8}$/;

		if (theCheckphone.length = 10) {

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
	
	
</script>



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
		<li><a href="#" accesskey="1" title="">Services</a></li>
		<li><a href="#" accesskey="2" title="">About Us</a></li>
		<li><a href="booking.jsp" accesskey="3" title="">線上訂位</a></li>
		<li></li>
		<li></li>
		<c:if test="${sessionScope.name==null }">
		<li><a href="Login.html" accesskey="4" title="">會員登入</a></li>
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
		<h2>填寫訂位人資料</h2>
		<form method="post" action="InsertBooking">
			<fieldset>


				<div class="title">

					<label class="s">姓名：</label><input class="aaa" type="text" id="A"
						name="name" /> <span id="a"></span><br></br> <label class="a">(至少兩個字且必須中文字)</label>

				</div>
				<br></br>



				<div class="title">

					<label class="s">手機：</label><input class="aaa" type="text" id="D"
						name="phone" /> <span id="d"></span><br></br> <label class="a">(ex:0912345678)</label>

				</div>
				<br></br>






					<input type="hidden" name="date" value="${param.date}" />
					<input type="hidden" name="people" value="${param.people}" />
					<input type="hidden" name="time" value="${param.time}" />
					<input id="G" class="input" disabled="disabled" type="submit" value="確定" />

			</fieldset>
			
		</form>

	</div>



</body>
</html>