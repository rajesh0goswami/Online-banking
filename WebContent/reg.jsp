<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration Page</title>
</head>
<body>
<form action="./regdata" method="post">
<p>Enter Name:</p>
<input type="text" name="n1"/>
<br/>
<p>Enter UserName</p>
<input type="text" name="un1"/>
<br/>
<p>Enter Password</p>
<input type="password" name="pass"/>
<br/>
<p>Enter Mobile No</p>
<input type="text" name="mno1"/>
<br/><br/>
<input type="submit" Value=Register>
</form>
<a href=login.jsp>LogIn</a>
</body>
</html>
