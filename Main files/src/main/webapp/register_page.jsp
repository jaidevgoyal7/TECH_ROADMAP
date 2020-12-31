<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page errorPage="error.jsp" %>
<html>
<head>
    <title>Registration</title>

    <%-- css --%>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <%-- Zig-Zag --%>

    <style>
        /*.banner-background {*/
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


<%--start of navbar--%>

<%-- navbar --%>

<nav class="navbar navbar-expand-lg primary-background navbar-dark sticky-top py-2">
    <a class="navbar-brand" style="font-style: italic" href="index.jsp"> <span class="fa fa-map-o"></span>  Tech-Roadmap</a>
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
                <a class="nav-link" href="login_page.jsp"><span class="fa fa-user-circle"></span> Login </a>
            </li>
        </ul>
    </div>
</nav>

<%--end of navbar--%>

<main style="padding-bottom: 70px; padding-top: 25px">

    <div class="container">

        <div class="row">

            <div class="col-md-6 offset-md-3">

                <div class="card">

                    <div class="card-header primary-background text-white text-center">

                        <span class="fa fa-user-plus fa-2x"></span>
                        <br>
                        <p>Let's get started</p>

                    </div>

                    <div class="card-body">

                        <form id="register-form" action="Register_servlet" method="post">
                            <div class="form-group">
                                <label for="user_name">Choose a username *</label>
                                <input name="user_name" type="text" class="form-control" id="user_name"
                                       placeholder="Enter username" required>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1">Your email address *</label>
                                <input name="user_email" type="email" class="form-control" id="exampleInputEmail1"
                                       aria-describedby="emailHelp" placeholder="Enter email" required>
                                <small id="emailHelp" class="form-text text-muted">We'll never share your email with
                                    anyone else.</small>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1">Choose a password *</label>
                                <input name="user_password" type="password" class="form-control"
                                       id="exampleInputPassword1"  placeholder="Enter Password" required>
                            </div>
                            <div class="form-group">
                                <label>Select your gender *</label>
                                <br>
                                <input type="radio" name="gender" value="Male" required> Male
                                <input style="margin-left: 10px" type="radio" name="gender" value="Female" required> Female
                            </div>
                            <div class="form-group">
                                <textarea name="about" class="form-control" id="" cols="30" rows="3"
                                          placeholder="Enter something about yourself">Hey ! I'm using Tech-Roadmap</textarea>
                            </div>

                            <div class="form-check">
                                <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
                                <label class="form-check-label" for="exampleCheck1">Agree terms and conditions *</label>
                            </div>

                        </form>

                    </div>

                    <div class="card-footer primary-background text-white text-center text-center">
                        <div class="container text-center" style="display: none" id="spinner">
                            <span class="fa fa-spinner fa-spin fa-2x" style="margin-bottom: 8px"></span>
                            <p>Loading...</p>
                        </div>
                        <button id="btn-sub" form="register-form" type="submit" class="btn btn-outline-light">Create your account
                        </button>

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

<%-- something important --%>

<script>

    $(document).ready(function(){
        //console.log("loaded...")

        $('#register-form').on('submit',function (event){
            event.preventDefault();

            let form=new FormData(this);

            // send register servler

            $("#spinner").show();
            $("#btn-sub").hide();

            $.ajax({
                url:"Register_servlet",
                type:'POST',
                data: form,
                success: function (data,textStatus,jqXHR) {
                    console.log(data)

                    $("#spinner").hide();
                    $("#btn-sub").show();

                    if(data.trim()==='done'){
                        swal("Registered successfully","","success")
                            .then((value) => {
                                window.location="login_page.jsp"
                            });
                    }
                    else{
                        swal(data,"Account already exists","warning")
                    }
                },
                error: function (jqXHR,textStatus,errorThrown) {
                    console.log(jqXHR)

                    $("#spinner").hide();
                    $("#btn-sub").show();

                    swal("Registered successfully","","error")
                        .then((value) => {
                            window.location="register_page.jsp"
                        });

                },

                processData: false,
                contentType: false

            });

        });
    });

</script>

</body>
</html>
