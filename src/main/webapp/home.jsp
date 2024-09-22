<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <title>Home</title>
  <link rel="stylesheet" type="text/css" href="main.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
  <style>
    .container {
      margin-top: 50px;
    }
    .welcome {
      margin-top: 30px;
      text-align: center;
    }
  </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <a class="navbar-brand" href="#">
    <img src="Team6Logo.jpg" width="60px" height="55px" style="position: fixed; top: -1px; border-radius: 50%;" alt="logo"/>
  </a>
  <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" style="text-align: center;" id="collapsibleNavbar">
    <ul class="navbar-nav ms-auto mb-lg-0">
      <li class="nav-item">
        <a class="nav-link" href="#"><b>Welcome, ${sessionScope.username}</b></a>
      </li>
      <li class="nav-item">
        <form action="${pageContext.request.contextPath}/auth" method="post" style="display: inline;">
          <input type="hidden" name="action" value="logout">
          <button type="submit" class="btn nav-link" style="background: none; border: none; color: white; cursor: pointer;"><b>Logout</b></button>
        </form>
      </li>
    </ul>
  </div>
</nav>
<div class="container">
  <div class="welcome">
    <h1>Welcome, ${sessionScope.username}</h1>
    <p>You have successfully logged in!</p>
  </div>
</div>
</body>
</html>
