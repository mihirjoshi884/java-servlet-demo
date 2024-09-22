<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Servlet</title>
    <link rel="stylesheet" type="text/css" href="main.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <style>
        body {
            background-color: #fdf5e6;
        }
    </style>
</head>
<body>
<h1 style="margin-top:30px;"><center><b>Register</b></center></h1>
<div class="container">
    <form action="register" method="post">
        <div class="row">
            <div class="col" style="margin-top:10px;">
                <label for="firstName"><b>First Name</b></label>
                <input type="text" class="form-control" id="firstName" name="firstName" placeholder="First name" required>
            </div>
            <div class="col" style="margin-top:10px;">
                <label for="lastName"><b>Last Name</b></label>
                <input type="text" class="form-control" id="lastName" name="lastName" placeholder="Last name" required>
            </div>
        </div>
        <div class="form-row">
            <div class="form-group col-md-6" style="margin-top:10px;">
                <label for="inputEmail"><b>Email</b></label>
                <input type="email" class="form-control" id="inputEmail" name="email" placeholder="Email" required>
            </div>
            <div class="form-group col-md-6" style="margin-top:10px;">
                <label for="inputPassword"><b>Password</b></label>
                <input type="password" class="form-control" id="inputPassword" name="password" placeholder="Password" required>
            </div>
        </div>
        <div class="form-row">
            <div class="form-group col-md-6" style="margin-top:10px;">
                <label for="inputUsername"><b>Username</b></label>
                <input type="text" class="form-control" id="inputUsername" name="username" placeholder="Username" required>
            </div>
        </div>
        <div class="form-group" style="margin-top:10px;">
            <label for="inputMobileNumber"><b>Mobile Number</b></label>
            <input type="number" class="form-control" id="inputMobileNumber" name="mobileNumber" placeholder="Mobile number" required>
        </div>
        <center><button type="submit" class="btn btn-dark" style="margin-top:10px;"><b>Submit</b></button></center>
    </form>
</div>
</body>
</html>
