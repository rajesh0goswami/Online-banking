<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Admin home</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://kit.fontawesome.com/4ed2628243.js" crossorigin="anonymous"></script>
<style>

    * {
        margin: 0;
        padding: 0;
        font-family: Georgia, 'Times New Roman', Times, serif;
    }

    body {
        background-image: url("pexels-juan-pablo-serrano-arenas-1242348.jpg");
    }

      .panel .button {
        
        border: none;
        color: white;
        padding: 20px 34px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 20px;
        font-weight: bold;
        margin: 4px 2px;
        cursor: pointer;
        margin-left: auto;
        margin-right: auto;
        top: 50%;
        left: 50%;
      }

      .panel {
          margin-top: 50px;
          text-align: center;
          justify-items: auto;
      }

     

      .col-4{
        border-block-color: black 2px;
      }

      i{
          margin-left: 10px;
      }

    </style>
</head>
<body>
        <% response.setHeader("Cache-control","no-cache,no-store,must-revalidate");%>
        <% response.setHeader("Program","no-cache");%>
        <%response.setHeader("Expires","0");%>


    <div class="container">
        <div class="row mt-3">
            <div class="col-md-2"></div>
            <div class="col-md-8 text-center">
                <h1>Welcome to the ADMIN panel</h1>
            </div>
            <div class="col-md-2"></div>
        </div>
        <div class="row">
            <div class="col-md-2"></div>
            <div class="col-md-8 text-center">
                <h3>Hi,(${user.uname})</h3>
            </div>
            <div class="col-md-2"></div>
        </div>
        <div class="row panel">
            <div class="col-4">
                <a href="./insert.html" class="btn btn-primary button" > Create Account <i class="fas fa-user-circle"></i></a>
            </div>
            <div class="col-4">
                <a href="./search.html" class="btn btn-secondary button"> Search Account <i class="fas fa-search"></i></a>
            </div>
            <div class="col-4">
                <a href="./delete.html" class="btn btn-warning button">Delete Account <i class="fas fa-trash-alt"></i></a>
            </div>
        </div>
        <div class="row panel">
            <div class="col-4">
                <a href="./up.jsp" class="btn btn-info button">Update Account <i class="far fa-edit"></i></a>
            </div>
            <div class="col-4">
                <a href="./details.html" class="btn btn-success button">Account details <i class="fas fa-info-circle"></i></a>
            </div>
            <div class="col-4">
                <a href="./retrive.html" class="btn btn-dark button">Download pdf report <i class="fas fa-download"></i></a>
            </div>
        </div>
        <div class="row panel">
            <div class="col-4"></div>
            <div class="col-4">
                <a href="./logout"class="btn btn-danger button">Logout <i class="fas fa-sign-out-alt"></i></a>
            </div>
            <div class="col-4"></div>
        </div>
    </div>

    <!-- <div style="text-align: center"> -->
        <!-- <h1>Welcome to my Website Admin Panel</h1> -->
        <!-- <b></b>
        <br><br> -->
        
        <!-- <br><br>
       
        <br><br>
        
        <br><br>
        
        <br><br>
       
        <br><br>
       
        <br><br> -->
        
    <!-- </div> -->


    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>