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
<title>Money Transfer</title>
</head>
<body>
<%
String driver = "com.mysql.cj.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/bank";
String userid = "root";
String password = "root";
String date;
Connection connection = null;
PreparedStatement ps = null;
Statement statement = null;
ResultSet resultSet = null;
String balance;
String from=request.getParameter("from");
String to=request.getParameter("to");
int amount = Integer.parseInt(request.getParameter("amount"));
out.println(from + " :" +to+" : " + amount);

int fromBal = 0;
int toBal = 0;
int fromTotal = 0;
int toTotal = 0;

try{
connection = DriverManager.getConnection(connectionUrl, userid, password);
statement=connection.createStatement();
String sql1 ="select balance from users where accno="+'\''+from+'\'';
resultSet = statement.executeQuery(sql1);

if(resultSet.next()){

	fromBal = resultSet.getInt(1);

}

String sql2 ="select balance from users where accno="+'\''+to+'\'';
resultSet = statement.executeQuery(sql2);

if(resultSet.next()){

	toBal = resultSet.getInt(1);

}

fromTotal = fromBal-amount;
toTotal = toBal+amount;

String sql3="Insert into transaction (date,time,account1,account2,debit,credit,total) values (CURRENT_DATE(),CURRENT_TIME(),?,?,?,?,?)";
ps = connection.prepareStatement(sql3); 
ps.setString(1,from);
ps.setString(2, to);
ps.setInt(3,amount);
ps.setInt(4,0);
ps.setInt(5,fromTotal);

int i = ps.executeUpdate();
if(i > 0)
{

	System.out.println(i+ " Rows Inserted Successfully for account1");

}
else
{
//out.print("There is a problem in inserting Records for account1.");
}

String sql4="Insert into transaction (date,time,account1,account2,debit,credit,total) values (CURRENT_DATE(),CURRENT_TIME(),?,?,?,?,?)";
ps = connection.prepareStatement(sql4);
ps.setString(1,to);
ps.setString(2, from);
ps.setInt(3,0);
ps.setInt(4,amount);
ps.setInt(5,toTotal);

int j = ps.executeUpdate();
if(j > 0)
{

System.out.println(j+ " Rows Inserted Successfully for account2");

}
else
{
System.out.println("There is a problem in inserting Records for account2.");
}

String sql5="Update users set balance=? where accno="+'\''+from+'\'';
ps = connection.prepareStatement(sql5);
ps.setInt(1,fromTotal);

int k = ps.executeUpdate();
if(k > 0)
{

System.out.println("Balance Updated Successfully for account1");

}
else
{
System.out.println("There is a problem in updating Records for account1.");
}

String sql6="Update users set balance=? where accno="+'\''+to+'\'';
ps = connection.prepareStatement(sql6);
ps.setInt(1,toTotal);

int l = ps.executeUpdate();
if(l > 0)
{

System.out.println("Balance Updated Successfully for account2");
		out.print("Successfully transferred");

}
else
{
System.out.println("There is a problem in updating Records for account2.");
}

connection.close();
} catch (Exception e) {
e.printStackTrace();
}

%>
</body>
</html>