<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String user = request.getParameter("id");

String driver = "com.mysql.cj.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/bank";

String userid = "root";
String password = "root";
out.print(user);
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<%
try{
connection = DriverManager.getConnection(connectionUrl, userid, password);
statement=connection.createStatement();
String sql ="select * from users where uname="+'\''+user+'\'';
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<!DOCTYPE html>
<html>
<body>
<h1>Update data from database in jsp</h1>
<form method="post" action="update-process.jsp">
User name<br>
<input type="hidden" name="user" value="<%=resultSet.getString("uname") %>">
<input type="text" name="user" value="<%=resultSet.getString("uname") %>">
<br>
Password<br>
<input type="text" name="password" value="<%=resultSet.getString("password") %>">
<br>
Balance<br>
<input type="text" name="balance" value="<%=resultSet.getString("balance") %>">
<br><br>
<input type="submit" value="Save Changes">
</form>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</body>
</html>
