<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Servlet</title>
    <link rel="stylesheet" type="text/css" href="main.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
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
        }
        .slideshow-container {
            position: relative;
            max-width: 100%;
            margin: auto;
        }
        .mySlides {
            display: none;
            text-align: center;
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
                <a class="nav-link" href="#"><b>Team 6- Servlet</b></a>
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
                    <h1>Servlets - Life Cycle, Client Request, Form Data & Database Access</h1>

                </div>
                <div class="mySlides">
                    <p>
                        Servlets are Java programs that run on a server and handle client requests.
                        They are primarily used to create dynamic web content and interact with web clients via HTTP.

                        Servlets act as middle layers between a client (browser) and a server (databases, applications).

                    </p>
                </div>
                <div class="mySlides">
                    <p>
                        1. Initialization (init): The servlet is initialized by calling the init() method when it is first loaded.
                        2. Request Handling (service): The servlet responds to client requests by executing the service() method.
                        3. Destruction (destroy): The servlet is terminated and removed from memory using the destroy() method when it is no longer needed.

                    </p>
                </div>
                <div class="mySlides">
                    <p>The properties of Servlets are as follows:<br><br>
                        Servlets work on the server side.<br>
                        Servlets are capable of handling complex requests obtained from the web server.</p>
                </div>
                <div class="mySlides">
                    <p>Servlets provide a component-based, platform-independent method for building Web-based applications, without the performance limitations of CGI programs.</p>
                </div>
                <div class="mySlides">
                    <p>Servlets have access to the entire family of Java APIs, including the JDBC API to access enterprise databases.</p>
                </div>
                <a class="slideshow-btn prev" onclick="plusSlides(-1)">&#10094;</a>
                <a class="slideshow-btn next" onclick="plusSlides(1)">&#10095;</a>
            </div>
            <div class="card-btns">
                <a href="Register.jsp" class="btn btn-dark">Register</a>
                <a href="login.jsp" class="btn btn-dark">Login</a>
            </div>
        </div>
    </div>
</div>

<footer>
    <div class="container">
        <div class="column">
            <center>
                <ul>
                    <li><h3><b>Astha Singh</b> - 24MCA10048</h3></li>
                    <li><h3><b>Mihir Joshi</b> - 24MCA10049</h3></li>
                </ul>
            </center>

        </div>
        <div class="column">
            <center>
                <ul>
                    <li><h3><b>Saurav Sevda</b> - 24MCA10054</h3></li>
                    <li><h3><b>Rishab Singh</b> - 24MCA10057</h3></li>
                </ul>
            </center>
        </div>
    </div>
</footer>

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
            "Advantages of Servlets",
            "Database Access with Servlets"
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