<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE >
<!--
Design by TEMPLATED
http://templated.co
Released for free under the Creative Commons Attribution License

Name       : WellFormed 
Description: A two-column, fixed-width design with dark color scheme.
Version    : 1.0
Released   : 20130731

-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900" rel="stylesheet" />


<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link href="fonts.css" rel="stylesheet" type="text/css" media="all" />
<link href="default.css" rel="stylesheet" type="text/css" media="all" />
<style type="text/css">


* {
	padding: 0%;
	margin: 0%;
}

.calendar {
	overflow: hidden;
	width: 350px;
	height: 380px;
	background-color: 	#DDDDDD;
	box-shadow: 0px 1px 1px rgba(0, 0, 0, .1);
	margin: 0 auto;
	text-align: center;
	color: #003C9D;
	border:2px solid black;

	font-size:20px;
	
	padding:20px;

	margin-right:10px;
	margin-left:25%;
	float:left;
	
}

.calendar1 {
	width: 300px;
	height: 100px;
	margin: 0 auto;
	color: #003C9D;
	text-align: left;
	padding: 30px auto;
	font-size:30px;
	padding:20px;
	float:left;
	border:none;
}

.calendar2 {
	width: 700px;
	heiget:200px;
	margin: 0 auto;
	color: #003C9D;
	text-align: center;
	padding: 30px auto;
	font-size:30px;
	border:none;
}

.title {
	height: 1px;
	position: relative;
	text-align: center;
}

#calendar-title {
	font-size: 20px;
	text-transform: uppercase;
	font-family: Arial, Helvetica, sans-serif;
	
}

#calendar-year {
	font-size: 15px;
	font-family: Arial, Helvetica, sans-serif;
	font-weight: normal;
	color:black;
}

#pre {
	position: absolute;
	top: 0px;
	left: 0px;
	

}

#next {
	position: absolute;
	top: 0px;
	right: 0px;


}

a {
    text-decoration:none;
}



.body-list ul {
	font-size: 14px;
	font-family: Arial, Helvetica, sans-serif;
	font-weight: bold;
	width: 100%;
	box-sizing: border-box;
}

.body-list ul li {
	list-style: none;
	display: block;
	width: 14.28%;
	float: left;
	height: 36px;
	line-height: 36px;
	box-sizing: border-box;
	text-align: center;
	font-size: 20px;
	margin:5px auto;
	

}

.pink {
	color: black;
	font-size:15px;
}

.lightgrey {
	color: white;
	pointer-events: none;
}

.lightgrey ul li  {

background-color:	#DDDDDD;
color:black;
}

.darkgrey ul li{

font-family:cursive;

}

.darkgrey {
	color: black;
}

.box {
	border: 1px solid #003C9D;
	background: #DDDDDD;
	color: black;
}

.button {
	display: inline-block;
	font-family: 微軟正黑體;
	background-color: #DDDDDD;
	width: 100px;
	color: black;
	text-align: center;
	height: 40px;
	font-size: 18px;
	opacity: 0.7;
	font-weight: bold;
	border-radius: 5px;
	padding: 10px 1em;
	margin: 5px 10px;
	 border: 2px solid blue;
}

.button span {
	cursor: pointer;
	display: inline-block;
	position: relative;
	transition: 0.5s;
}

.button span:after {
	content: '»';
	position: absolute;
	opacity: 0;
	top: 0;
	right: -20px;
	transition: 0.5s;
}

.button:hover span {
	padding-right: 25px;
}

.button:hover span:after {
	opacity: 1;
	right: 0;
}

.button:hover {
	background-color: #77DDFF;
	color: black;
}

.button:active {
	background-color: #77DDFF;
}

.button:focus {
	border-style: solid;
	border-color: #03a9f4;
	background-color: #77DDFF;
	box-shadow: 0 0 15px #77DDFF;
	color: black;
}

.li {
	display: inline-block;
	font-family: 微軟正黑體;

}

.li span {
	cursor: pointer;
	display: inline-block;
	position: relative;
	transition: 0.5s;
}

.li span:after {
	content: '»';
	position: absolute;
	opacity: 0;
	top: 0;
	right: -20px;
	transition: 0.5s;
}

.li:hover span {
	padding-right: 25px;
}

.li:hover span:after {
	opacity: 1;
	right: 0;
}

.li:hover {
	color: #003C9D;
	cursor: pointer; 
}





.add{

	border-style: solid;
	border-color: #03a9f4;
	background-color: #77DDFF;
	
	color: black;

}

.remove{
		
background-color: white;

}

#days li {
	outline: solid 1px black;
}



form {
	float: left;
}

.input2{
	margin:3px 0 ;
	height:50px;
	width:200px;
	font-size:15px;
	font-family:微軟正黑體;
	font-weight:bold;
	            background-color:black;
			opacity:0.7;
	color:hotpink;
	border-radius:25px;
}

select{
width:200px;
font-size:28px;
height:30px;
border-radius:25px;
background-color:#DDDDDD;
color:black;
padding: 0 0 0 30%;
}



select::-ms-expand { display: none; }

</style>

<!--[if IE 6]><link href="default_ie6.css" rel="stylesheet" type="text/css" /><![endif]-->

</head>
<body style="background: white url() repeat;">

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

	<div class="calendar">
	
	選擇日期:
		<div class="title">
			<h1 class="pink" id="calendar-title">Month</h1>
			<h2 class="pink" id="calendar-year">Year</h2>
			<a href="" id="pre">◀</a> <a href="" id="next">▶</a>
		</div>
		<div class="body">
			<div class="lightgrey body-list">
				<ul>
					<li>日</li>
					<li>一</li>
					<li>二</li>
					<li>三</li>
					<li>四</li>
					<li>五</li>
					<li>六</li>

				</ul>

			</div>

			<div class="darkgrey body-list">
				<ul id="days">

				</ul>
			</div>
		</div>
		
	</div>


	<script type="text/javascript">
		document.onclick = function() {
			var obj = event.srcElement;
			if (obj.type == "submit") {

				var aaa = obj.value;
				document.getElementById("ab").value = aaa;
			}
		}

		var month_olypic = [ 31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 ];
		var month_normal = [ 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 ];
		var month_name = [ "January", "Febrary", "March", "April", "May",
				"June", "July", "Auguest", "September", "October", "November",
				"December" ];

		var holder = document.getElementById("days");
		var prev = document.getElementById("prev");
		var next = document.getElementById("next");
		var ctitle = document.getElementById("calendar-title");
		var cyear = document.getElementById("calendar-year");

		var my_date = new Date();
		var my_year = my_date.getFullYear();
		var my_month = my_date.getMonth();
		var my_day = my_date.getDate();

		function dayStart(month, year) {
			var tmpDate = new Date(year, month, 1);
			return (tmpDate.getDay());
		}

		function daysMonth(month, year) {
			var tmp1 = year % 4;
			var tmp2 = year % 100;
			var tmp3 = year % 400;

			if ((tmp1 == 0 && tmp2 != 0) || (tmp3 == 0)) {
				return (month_olypic[month]);
			} else {
				return (month_normal[month]);
			}
		}
		var today ;
		function refreshDate() {
			var str = "";

			var totalDay = daysMonth(my_month, my_year);
			var firstDay = dayStart(my_month, my_year);

			for (var i = 0; i < firstDay; i++) {
				str += "<li >" + "</li>";
			}
			
			
			for (var i = 1; i <= totalDay; i++) {

				var myclass;
				if ((my_year < my_date.getFullYear())
						|| (my_year == my_date.getFullYear() && my_month < my_date
								.getMonth())
						|| (my_year == my_date.getFullYear()
								&& my_month == my_date.getMonth() && i < my_day)) {
					myclass = " class='lightgrey'";
				} else if (my_year == my_date.getFullYear()
						&& my_month == my_date.getMonth() && i == my_day) {
					today=i-1 ;
					myclass = "class = 'green box'";
				} else {
					myclass = "class = 'li'";

				}
				str += "<li tabindex='1' "+myclass+" >" + i + "</li>";
			}
			holder.innerHTML = str;
			ctitle.innerHTML = month_name[my_month];
			cyear.innerHTML = my_year;
		}

		refreshDate();

		pre.onclick = function(e) {
			e.preventDefault();
			my_month--;
			if (my_month < 0) {
				my_year--;
				my_month = 11;
			}
			refreshDate();
			day();
		}

		next.onclick = function(e) {
			e.preventDefault();
			my_month++;
			if (my_month > 11) {
				my_month = 0;
				my_year++;
			}
			refreshDate();
			day();
		}

		day();


		var date;

		function day() {
			
			var ul = document.getElementById("days");
			var lis = ul.getElementsByTagName("li");

			for (var i = 0; i < lis.length; i++) {

				
				lis[i].onclick = function() {
					
					
					$("#days li").removeClass("add");
					$(this).addClass("add");

					
					date = my_year + "-" + (my_month + 1) + "-"
							+ this.firstChild.nodeValue;
					
					document.getElementById("abc").value=date;
					document.getElementById("slc").value=1;
					$.ajax({
						url:"AdminPullDateTime",
						data:{date:date,people:1},
						type:"POST",
						success:function(data){
							$("#time").html(data);
						}
					})
					
					
				}
			}
		}


		

	</script>

	<div class="calendar1">
	選擇人數及時段:
	<select id="slc" class="text">
	<c:forEach var="i" begin="1" end="50" step="1">
	<option value="${i}">${i}位</option>
	</c:forEach>
	</select>
	</div>
	
	<div class="calendar2" id="time"></div>
	<div>
	<input type="hidden" id="abc" name="date"></input>
	</div>
	
<script>




$("#slc").change(function(){
	$.ajax({
		url:"AdminPullDateTime",
		data:{date:date,people:$(this).children('option:selected').val()},
		type:"POST",
		success:function(data){
			$("#time").html(data);
		}
	})
	

     
});

$("#days li").get(today).click();





</script>



</body>
</html>
