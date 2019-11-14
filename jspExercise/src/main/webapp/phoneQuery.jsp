<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.ArrayList,topic.booking.AllTime"
    pageEncoding="UTF-8" import="java.util.*" import="java.sql.*" import="topic.booking.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.button:active {
	border-style: solid;
	border-color: #0066FF;
	background-color: #0066FF;
	color: black;
}


</style>

<script>

function del() {var msg ="是否刪除";if (confirm(msg)==true){return true;}else{return false;}}

</script>
</head>
<body>
<%
Connection conn;
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
String connUrl = "jdbc:sqlserver://localhost:1433;databaseName=servdb";
conn = DriverManager.getConnection(connUrl,"sa","00000000");
request.setCharacterEncoding("UTF-8");
response.setContentType("text/html;charset=UTF-8");


BookingDao Dao = BookingFactory.createBookingDao();
Dao.createConn();
ArrayList<AllTime> PullTime = Dao.PullDateTime();
Dao.closeConn();

String phone = request.getParameter("phone");
String sql = "Select * From BookingData Where Phone=?";
PreparedStatement state = conn.prepareStatement(sql);
state.setString(1,phone);
ResultSet rs = state.executeQuery();
out.print("<h2>訂位查詢</h2>");
out.print("日期:<input id='ymd' type='text'><button id='D' type='button'>查詢</button>");
out.print("手機:<input id='tel' type='text'><button id='P' type='button'>查詢</button>");
out.print("指定日期時段:<input id='qd' type='text'>");
out.print("<select id='qt' style='height:26px;'>");
out.print("<option value='"+PullTime.get(0).getTime()+"' selected>"+PullTime.get(0).getTime()+"</option>");
out.print("<option value='"+PullTime.get(1).getTime()+"' >"+PullTime.get(1).getTime()+"</option>");
out.print("<option value='"+PullTime.get(2).getTime()+"' >"+PullTime.get(2).getTime()+"</option>");
out.print("<option value='"+PullTime.get(3).getTime()+"' >"+PullTime.get(3).getTime()+"</option>");
out.print("<option value='"+PullTime.get(4).getTime()+"' >"+PullTime.get(4).getTime()+"</option>");
out.print("<option value='"+PullTime.get(5).getTime()+"' >"+PullTime.get(5).getTime()+"</option>");
out.print("<option value='"+PullTime.get(6).getTime()+"' >"+PullTime.get(6).getTime()+"</option>");
out.print("<option value='"+PullTime.get(7).getTime()+"' >"+PullTime.get(7).getTime()+"</option>");
out.print("</select>"); 
out.print("<button id='DT' type='button'>查詢</button>");
out.print("<table class='table table-striped'>");
out.print("<thead><tr><th>訂單編號<th>訂位人<th>訂位日期<th>訂位時間<th>訂位人數<th>手機<th>取消訂位<th>更改訂位</tr></thead><tbody>");
while(rs.next()){
	String id = rs.getString("BookingID");
	System.out.print(id);
	out.print("<tr>");
	out.print("<td>"+rs.getString("BookingID")+"</td>");
	out.print("<td>"+rs.getString("Name")+"</td>");
	out.print("<td>"+rs.getString("Date")+"</td>");
	out.print("<td>"+rs.getString("Time")+"</td>");
	out.print("<td>"+rs.getString("People")+"</td>");
	out.print("<td>"+rs.getString("Phone")+"</td>");
	out.print("<td>"+"<a href='cancelBooking?id="+id+"'>"+"<button class='button' type='button'"+"onclick='return del()'"+">取消訂位</button></a></td>");
	out.print("<td>"+"<a href='QuerySBooking?id="+id+"'>"+"<button class='button' type='button'"+">更改訂位</button></a></td>");
	out.print("</tr>");
}



out.print("</tbody>");
out.print("</table>");

%>

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