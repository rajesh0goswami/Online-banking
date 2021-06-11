<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.cj.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/bank";%>
<%!String user = "root";%>
<%!String psw = "root";%>
<%
String username = request.getParameter("user");
String password=request.getParameter("password");
int balance=Integer.parseInt(request.getParameter("balance"));

if(user != null)
{
Connection con = null;
PreparedStatement ps = null;
try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
String sql="Update users set password=?,balance=? where uname="+'\''+username+'\'';
ps = con.prepareStatement(sql);
ps.setString(1,password);
ps.setInt(2,balance);

int i = ps.executeUpdate();
if(i > 0)
{

out.print("Record Updated Successfully");

}
else
{
out.print("There is a problem in updating Record.");
}
}
catch(SQLException sql)
{
request.setAttribute("error", sql);
out.println(sql);
}
}
%>
<a href="./up.jsp">Show updated record</a>