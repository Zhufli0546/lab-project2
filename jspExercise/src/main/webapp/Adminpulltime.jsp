<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.ArrayList,topic.booking.AllTime"
    pageEncoding="UTF-8" import="java.util.*" import="java.sql.*" import="java.util.Date"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

Connection conn;
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
String connUrl = "jdbc:sqlserver://localhost:1433;databaseName=servdb";
conn = DriverManager.getConnection(connUrl,"sa","00000000");
request.setCharacterEncoding("UTF-8");
response.setContentType("text/html;charset=UTF-8");

ArrayList<AllTime> All = (ArrayList<AllTime>)request.getAttribute("PullTime");

Calendar now = Calendar.getInstance();
now.setTime(new Date());
int year = now.get(Calendar.YEAR);
int month = now.get(Calendar.MONTH) +1;
int day = now.get(Calendar.DAY_OF_MONTH);

String today = year+"-"+month+"-"+day;


int H = now.get(Calendar.HOUR_OF_DAY);



for(AllTime e: All){
	
String BH = e.getTime().substring(0,2);
int bh = Integer.parseInt(BH);
	String date = request.getParameter("date");
int peo = Integer.parseInt(request.getParameter("people"));

String sql = "SELECT * FROM BookingData Where Date=? AND Time=?";
PreparedStatement state = conn.prepareStatement(sql);
state.setString(1,request.getParameter("date"));
state.setString(2,e.getTime());
ResultSet rs = state.executeQuery();
int sum=0 ;
while(rs.next()){
	sum += Integer.parseInt(rs.getString("People"));
}
int people = Integer.parseInt(request.getParameter("people"));
if(sum+people<=e.getPeople()&&date.equals(today)&&bh>H){
	out.print("<form method='GET' action='Adminconfirm.jsp'>");
	out.print("<input type='hidden' name='date' value="+date+">");
	out.print("<input type='hidden' name='people' value="+peo+">");
	out.print("<button class='button'  id='button' type='submit' name='time' value="+e.getTime()+"><span>"+e.getTime()+"</span></button>");
	out.print("</form>");

}else if(sum+people<=e.getPeople()&&!date.equals(today)){
	out.print("<form method='GET' action='Adminconfirm.jsp'>");
	out.print("<input type='hidden' name='date' value="+date+">");
	out.print("<input type='hidden' name='people' value="+peo+">");
	out.print("<button class='button'  id='button' type='submit' name='time' value="+e.getTime()+"><span>"+e.getTime()+"</span></button>");
	out.print("</form>");
}
state.close();
}




%>

</body>
</html>