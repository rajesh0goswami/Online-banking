<!DOCTYPE html>
<html>

<head>
    <title>Login</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://kit.fontawesome.com/4ed2628243.js" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css2?family=Raleway:wght@500&display=swap" rel="stylesheet">
    <style>
        body {
            margin: 0;
            padding: 0;
            background-image: linear-gradient(45deg, whitesmoke, azure);
            font-family: 'Raleway', sans-serif;
            color: #67CBF7;
        }
        /* .panel {
                margin-top: 40px;
            }
    
            .panel img{
                width: 50%;
                margin-left: auto;
                margin-right: auto;
                margin-top: 40px;
            } */
        
        card {
            width: 100%;
        }
        
        .l-form {
            margin-top: 40px;
        }
        
        .entire {
            margin-top: 10em;
        }
        
        .btn i {
            padding-right: 10px;
        }
        
        a {}
        
        a:hover {
            text-decoration: none;
            color: red;
            transition: 0.6s;
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.0/dist/jquery.validate.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function() {
            $("#loginForm").validate({
                rules: {
                    un1: {
                        required: true,
                        un1: true
                    },

                    pass: "required",
                },

                messages: {
                    un1: {
                        required: "Please enter email",
                        un1: "Please enter a valid email address"
                    },

                    pass: "Please enter password"
                }
            });

        });
    </script>
    <meta charset="ISO-8859-1">

</head>

<body>


    <div class="container entire">

        <div class="row">
            <div class="col-md-4"></div>
            <div class="col-md-4 col-sm-12 text-center">
               
            </div>
            <div class="col-md-4"></div>

        </div>
        <div class="row mt-3">
            <div class="col-md-2"></div>
            <div class="col-md-8">
                <h5 class="text-center text-muted">Hello Admin!</h5>
                <h6 class="text-center text-muted">Please fill out the form below to get started</h6>
            </div>
            <div class="col-md-2"></div>

        </div>

        <div class="row l-form">
            <div class="col-md-3 col-sm-0"></div>
            <div class="col-md-6 col-sm-12">
                <form action="./logdata" method="post">

                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="basic-addon1"><i class="fas fa-user"></i></span>
                        </div>
                        <input type="text" name="un1" class="form-control" placeholder="Username" aria-label="Username" aria-describedby="basic-addon1">
                    </div>

                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="basic-addon1"><i class="fas fa-lock"></i></span>
                        </div>
                        <input type="password" name="pass" class="form-control" id="exampleInputPassword1" placeholder="Password">
                    </div>



                    <div class="form-group">
                        ${message}
                        <button type="submit" class="btn btn-success float-right"><i class="fas fa-sign-in-alt"></i>Sign In</button>
                    </div>

                </form>
                <p class="text-muted">No account? <span> <a href=reg.jsp>Register</a></span></p>

            </div>
            <div class="col-md-3 col-sm-0"></div>

        </div>


    </div>



    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    <!-- <body>
        <div>
            <form action="./logdata" method="post">
                <p>Enter user name</p>
                <input type="text" name="un1" />
                <br/>
                <p>Enter Password</p>
                <input type="password" name="pass" />
                <br/><br/>${message}
                <input type="submit" value="Login">
            </form>
            <a href=reg.jsp>Register now</a>
        </div>
    </body> -->
    <footer class="page-footer font-small special-color-dark pt-4">

        <!-- Footer Elements -->
        <div class="container">

            <!-- Social buttons -->
            <ul class="list-unstyled list-inline text-center">
                <li class="list-inline-item">
                    <a class="btn-floating btn-fb mx-1">
                        <i class="fab fa-facebook-f"> </i>
                    </a>
                </li>
                <li class="list-inline-item">
                    <a class="btn-floating btn-tw mx-1">
                        <i class="fab fa-twitter"> </i>
                    </a>
                </li>
                <li class="list-inline-item">
                    <a class="btn-floating btn-gplus mx-1">
                        <i class="fab fa-google-plus-g"> </i>
                    </a>
                </li>
                <li class="list-inline-item">
                    <a class="btn-floating btn-li mx-1">
                        <i class="fab fa-linkedin-in"> </i>
                    </a>
                </li>
                <li class="list-inline-item">
                    <a class="btn-floating btn-dribbble mx-1">
                        <i class="fab fa-dribbble"> </i>
                    </a>
                </li>
            </ul>
            <!-- Social buttons -->

        </div>
        <!-- Footer Elements -->

        <!-- Copyright -->
        <div class="footer-copyright text-center py-3">© 2020 Copyright:
            <a href="#"> bankonline.com</a>
        </div>
        <!-- Copyright -->

    </footer>
    <!-- Footer -->
</body>

</html>