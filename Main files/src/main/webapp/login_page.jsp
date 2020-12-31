<%@ page import="com.tech_roadmap.entities.Message" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page errorPage="error.jsp" %>
<html>
<head>
    <title>Login</title>

    <%-- css --%>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <%-- Zig-Zag --%>

    <style>
        /*.banner-background{*/
        /*    clip-path: polygon(0% 15%, 0 0, 15% 0%, 85% 0%, 100% 0, 100% 15%, 100% 94%, 78% 100%, 55% 94%, 35% 100%, 14% 94%, 0 98%);*/
        /*}*/

        body{
            background: url("img/profile-background.png");
            background-size: cover;
            background-attachment: fixed;
        }


    </style>

</head>
<body>


<%-- navbar --%>

<%-- navbar --%>

<nav class="navbar navbar-expand-lg primary-background navbar-dark sticky-top py-2">
    <a class="navbar-brand" href="index.jsp" style="font-style: italic"> <span class="fa fa-map-o"></span>  Tech-Roadmap</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="index.jsp"><span class="fa fa-home"></span> Home <span class="sr-only">(current)</span></a>
            </li>
        </ul>
        <ul class="navbar-nav mr-right">
            <li class="nav-item">
                <a class="nav-link" href="register_page.jsp"><span class="fa fa-user-plus"></span> Signup </a>
            </li>
        </ul>
    </div>
</nav>

<%-- login form --%>

<main class="d-flex align-items-center " style="height: 80vh">

    <div class="container">

        <div class="row mb-4">

            <div class="col-md-4 offset-md-4">

                <div class="card">

                    <div class="card-header primary-background text-white text-center">

                        <span class="fa fa-user-circle fa-2x"></span>
                        <br>
                        <p>Login to your account</p>

                    </div>


                    <%

                        Message msg=(Message)session.getAttribute("msg");
                        if(msg!=null){
                    %>

                    <%-- alert-message --%>
                    <div class="<%= msg.getCssClass()%>" role="alert">
                        <%= msg.getContent() %>
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>


                    <%
                            session.removeAttribute("msg");
                        }

                    %>

                    <div class="card-body">

                        <form id="login_form" action="Login_servlet" method="post">
                            <div class="form-group">
                                <label for="exampleInputEmail1">Email address *</label>
                                <input name="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email" required>
                                <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1">Password *</label>
                                <input name="password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password" required>
                            </div>
                            <div class="form-check">
                                <input type="checkbox" class="form-check-input" id="exampleCheck1" required>
                                <label class="form-check-label" for="exampleCheck1">Agree terms and conditions *</label>
                            </div>
                        </form>

                    </div>

                    <div class="card-footer primary-background text-white text-center text-center">

                        <button form="login_form" type="submit" class="btn btn-outline-light">Submit</button>

                    </div>

                </div>

            </div>

        </div>

    </div>

</main>

<%-- javascripts --%>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"
        integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>


</body>
</html>
