<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
      .button {
        background-color: #1c87c9;
        border: none;
        color: white;
        padding: 20px 34px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 20px;
        margin: 4px 2px;
        cursor: pointer;
      }
    </style>
<meta charset="utf-8">
<title>user home</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://kit.fontawesome.com/4ed2628243.js" crossorigin="anonymous"></script>
</head>
<body>
<% response.setHeader("Cache-control","no-cache,no-store,must-revalidate");%>
<% response.setHeader("Program","no-cache");%>
<%response.setHeader("Expires","0");%>

    <div style="text-align: center">
        <h1>Welcome online Banking portal</h1>
        <b>Hi,(${user.uname})</b>
        <br><br>
        <a href="balance.jsp?id=${user.uname}" class="btn btn-info button">Balance inquiry<i class="far fa-edit"></i></a>
       
        <br><br>
        <a href="chngPass.html?id=${user.uname}" class="btn btn-danger button">Change Password<i class="fas fa-sign-out-alt"></i></a>
       
        <br><br>
         <a href="transfer.html" class="btn btn-success button">Money Transfer <i class="fas fa-info-circle"></i></a>
        <br><br>
         <br><br>
         <a href="./Statement?id=${user.uname}" class="btn btn-success button">Statement <i class="fas fa-info-circle"></i></a>
        <br><br>
        <a href="./logoutU">Logout</a>
    </div>
</body>
</html>
