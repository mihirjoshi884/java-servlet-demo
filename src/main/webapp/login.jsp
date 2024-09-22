<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" type="text/css" href="main.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <style>
        body {
            background-color: #fdf5e6;
        }
    </style>
</head>
<body>
<h1 style="margin-top:30px;"><center><b>Login</b></center></h1>
<div class="container">
    <form action="${pageContext.request.contextPath}/auth" method="post">
        <div class="form-group" style="margin-top:10px;">
            <label for="username"><b>Username</b></label>
            <input type="text" class="form-control" id="username" name="username" placeholder="Username" required>
        </div>
        <div class="form-group" style="margin-top:10px;">
            <label for="password"><b>Password</b></label>
            <input type="password" class="form-control" id="password" name="password" placeholder="Password" required>
        </div>
        <center><button type="submit" class="btn btn-dark" style="margin-top:10px;"><b>Login</b></button></center>
    </form>
    <c:if test="${not empty errorMessage}">
        <p style="color:red; text-align: center;">${errorMessage}</p>
    </c:if>
</div>
</body>
</html>
