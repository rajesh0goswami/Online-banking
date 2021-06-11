<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%
String user = request.getParameter("id");
String currentPassword=request.getParameter("current");
String Newpass=request.getParameter("new");
String conpass=request.getParameter("confirm");
String driver = "com.mysql.cj.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/bank";
Connection connection = null;
PreparedStatement ps = null;
Statement statement = null;
ResultSet resultSet = null;

String username="";
String pass="";


String userid = "root";
String password = "root";

try{
Class.forName("com.mysql.jdbc.Driver");
connection = DriverManager.getConnection(connectionUrl, userid, password);
Statement st=connection.createStatement();
ResultSet rs=st.executeQuery("select * from users where password='"+currentPassword+"'");
while(rs.next()){
username=rs.getString(1);
pass=rs.getString(3);
} System.out.println(username+ " "+pass);
if(pass.equals(currentPassword)){
String sql="update users set password=? where uname="+'\''+username+'\'';
ps = connection.prepareStatement(sql);
ps.setString(1,Newpass);

int i = ps.executeUpdate();
ps.close();
connection.close();
if(i > 0)
{

out.print("Password changed successfully");

}
else
{
out.print("Invalid Current Password");
}
}}
catch(Exception e){
out.println(e);
}
%>