<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Servlet</title>
    <link rel="stylesheet" type="text/css" href="main.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .body {
            height: 100vh;
            width: 100%;
        }
        .container {
            height: 403px;
        }
        .card {
            margin-top: 30px;
            margin-bottom: 30px;
            background-color: #bcb88a;
        }
        .card-header {
            color: white;
            text-align: center;
            background-color: #a5a178;
        }
        .card-body {
            background-color: #bcb88a;
            padding: 20px;
            height: 350px;
        }
        .slideshow-container {
            position: relative;
            max-width: 100%;
            margin: auto;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 250px;
        }
        .mySlides {
            display: none;
            text-align: center;
            height: 50%;
            width: 60%;
        }
        li {
            list-style: none;
        }
        .mySlides h2 {
            font-size: 20px;
        }
        .slideshow-btn {
            cursor: pointer;
            position: absolute;
            top: 50%;
            width: auto;
            padding: 16px;
            margin-top: -22px;
            color: white;
            font-weight: bold;
            font-size: 18px;
            transition: 0.6s ease;
            border-radius: 0 3px 3px 0;
            user-select: none;
            background-color: rgba(0,0,0,0.8);
            opacity: 0.2;
        }
        .slideshow-btn:hover{
            opacity: 1;
        }
        .next {
            right: 0;
            border-radius: 3px 0 0 3px;
        }
        .prev {
            left: 0;
        }
        .card-btns {
            display: flex;
            justify-content: space-around;
            margin-top: 20px;
        }
        #footer {
            text-align: left;
            padding: 15px;
            background-color: #3D3937;
            color: white;
            width: 33%;
            bottom: 0;
            font-size: 20px;
            position: absolute;
        }
        #footer2{
            text-align: center;
            padding: 15px;
            background-color: #3D3937;
            color: white;
            bottom: 0;
            font-size: 20px;
            position: absolute;
            width: 35%;
            left: 33%;
            height: 121.19px;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        #footer1 {
            text-align: right;
            padding: 15px;
            background-color: #3D3937;
            color: white;
            width: 33%;
            bottom: 0;
            font-size: 20px;
            position: absolute;
            right: 2px;
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
    <div class="collapse navbar-collapse" id="collapsibleNavbar">
        <ul class="navbar-nav mx-auto">
            <li class="nav-item">
                <a class="nav-link" href="#"><b>Team 6 - Servlet</b></a>
            </li>
        </ul>
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <a href="Register.jsp" class="btn btn-dark nav-link">Register</a>
            </li>
            <li class="nav-item">
                <a href="login.jsp" class="btn btn-dark nav-link">Login</a>
            </li>
        </ul>
    </div>
</nav>

<div class="container">
    <div class="card">
        <div class="card-header">
            <h4 id="slide-title"><b>What is Servlet?</b></h4>
        </div>
        <div class="card-body">
            <div class="slideshow-container">
                <div class="mySlides">
                    <h2>Servlets - Life Cycle, Client Request, Form Data & Database Access</h2>
                </div>
                <div class="mySlides">
                    <h2>
                        Servlets are Java programs that run on a server and handle client requests.
                        They are primarily used to create dynamic web content and interact with web clients via HTTP.
                        Servlets act as middle layers between a client (browser) and a server (databases, applications).
                    </h2>
                </div>
                <div class="mySlides">
                    <h2>
                        1. Initialization (init): The servlet is initialized by calling the init() method when it is first loaded.<br>
                        2. Request Handling (service): The servlet responds to client requests by executing the service() method.<br>
                        3. Destruction (destroy): The servlet is terminated and removed from memory using the destroy() method when it is no longer needed.
                    </h2>
                </div>
                <div class="mySlides">
                    <img src="ServletLifeCycle.png" height="220px" width="420px">
                </div>
                <div class="mySlides">
                    <ul>
                        <li><h3>1. Servlets handle client requests through HTTP methods such as GET and POST.</h3></li>
                        <li><h3>2. HTTP GET: Retrieves data from the server. Used for fetching resources like HTML pages, images.</h3></li>
                        <li><h3>3. HTTP POST: Sends data to the server, typically used when submitting form data.</h3></li>
                    </ul>
                </div>
                <div class="mySlides">
                    <h2>
                        1. Form data is passed to the servlet as part of the HTTP request, typically using GET or POST methods.<br>
                        2. Form data can be accessed in a servlet using request.getParameter() to retrieve the values entered by the user.<br>
                        3. Example: String username = request.getParameter("username");
                    </h2>
                </div>
                <div class="mySlides">
                    <img src="accessingDataForm.png" height="220px" width="420px">
                </div>
                <div class="mySlides">
                    <h2>
                        Servlets can connect to databases to store or retrieve information using JDBC (Java Database Connectivity).<br>
                        1. Load JDBC Driver: Class.forName("com.mysql.jdbc.Driver");<br>
                        2. Establish Connection: Connection con = DriverManager.getConnection(url, username, password);<br>
                        3. Execute SQL Query: PreparedStatement stmt = con.prepareStatement("SELECT * FROM users WHERE id=?");
                    </h2>
                </div>
                <div class="mySlides">
                    <h2>
                        1. Servlets play a crucial role in web development by handling client requests, processing form data, and interacting with databases.<br>
                        2. Their lifecycle management and ability to connect with databases make servlets powerful tools for building dynamic web applications.
                    </h2>
                </div>
                <a class="slideshow-btn prev" onclick="plusSlides(-1)">&#10094;</a>
                <a class="slideshow-btn next" onclick="plusSlides(1)">&#10095;</a>
            </div>
        </div>
    </div>
</div>

<div id="footer">
    <ul>
        <h3><b>Astha Singh</b> - 24MCA10048</h3>
        <h3><b>Mihir Joshi</b> - 24MCA10049</h3>
    </ul>
</div>
<div id="footer2">
    <h4>All Rights Reserved @ Copyright 2024</h4>
</div>
<div id="footer1">
    <ul>
        <h3><b>Saurav Sevda</b> - 24MCA10054</h3>
        <h3><b>Rishab Singh</b> - 24MCA10057</h3>
    </ul>
</div>

<script>
    let slideIndex = 1;
    showSlides(slideIndex);

    function plusSlides(n) {
        showSlides(slideIndex += n);
    }

    function showSlides(n) {
        let i;
        let slides = document.getElementsByClassName("mySlides");
        let titles = [
            " ",
            "Introduction to Servlets",
            "Servlet Life Cycle",
            " ",
            "Handling Client Requests",
            "Accessing Form Data",
            "",
            "Database Access with Servlets",
            "Conclusion"
        ];
        if (n > slides.length) {slideIndex = 1}
        if (n < 1) {slideIndex = slides.length}
        for (i = 0; i < slides.length; i++) {
            slides[i].style.display = "none";
        }
        slides[slideIndex-1].style.display = "block";
        document.getElementById("slide-title").innerHTML = "<b>" + titles[slideIndex-1] + "</b>";
    }
</script>
</body>
</html>
