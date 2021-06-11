<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" 
import="java.util.Properties"
import="javax.mail.*"
import="javax.mail.internet.*"
import="cone.SendMail"
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Count Rows JSP</title>
</head>
<body>
<%
String driver = "com.mysql.cj.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/bank";
String userid = "root";
String password = "root";
Connection connection = null;
PreparedStatement ps = null;
Statement statement = null;
ResultSet resultSet = null;

String email=request.getParameter("email");
String username=request.getParameter("user");

try
{
Class.forName(driver);
connection = DriverManager.getConnection(connectionUrl, userid, password);
Statement st=connection.createStatement();

String sql = "SELECT count(password) FROM users where uname="+'\''+username+'\'';
ResultSet rs = st.executeQuery(sql);
rs.next();
String Countrow = rs.getString(1);
if(Countrow.equals("1")){
SendMail sendmail = new SendMail();
out.println("Password send to your email id successfully !");
}
else{
out.println("Invalid Email Id !");
}
}
catch (Exception e){
e.printStackTrace();
}
%>
</body>
</html>