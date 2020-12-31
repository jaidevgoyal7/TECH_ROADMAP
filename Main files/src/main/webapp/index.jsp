<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.sql.*" %>
<%@ page errorPage="error.jsp" %>
<%@ page import="com.tech_roadmap.helper.Connection_Provider" %>
<%@ page import="com.tech_roadmap.dao.Post_dao" %>
<%@ page import="com.tech_roadmap.entities.categories" %>
<%@ page import="java.util.ArrayList" %>
<html>
<head>
    <title>Home</title>

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
        .list-group-item.active, .list-group-item.active:hover, .list-group-item.active:focus {
            z-index:2;
            color:white;
            background-color:#424242;
            border-color:black;
        }

        html {
            scroll-behavior: smooth;
        }

        .jumbotron {
            background: none
        }
        div.sticky {
            position: -webkit-sticky;
            position: sticky;
            top: 4rem;
            left: 0;
        }

    </style>





<style>


    .our-team-main
    {
    width:100%;
    height:auto;
    border-bottom:5px #323233 solid;
    background:#fff;
    text-align:center;
    border-radius:10px;
    overflow:hidden;
    position:relative;
    transition:0.5s;
    margin-bottom:28px;
    }


    .our-team-main img
    {
    border-radius:50%;
    margin-bottom:20px;
    width: 90px;
    }

    .our-team-main h3
    {
    font-size:20px;
    font-weight:700;
    }

    .our-team-main p
    {
    margin-bottom:0;
    }

    .team-back
    {
    width:100%;
    height:auto;
    position:absolute;
    top:0;
    left:0;
    padding:5px 15px 0 15px;
    text-align:left;
    background:#fff;

    }

    .team-front
    {
    width:100%;
    height:auto;
    position:relative;
    z-index:10;
    background:#fff;
    padding:15px;
    bottom:0px;
    transition: all 0.5s ease;
    }

    .our-team-main:hover .team-front
    {
    bottom:-200px;
    transition: all 0.5s ease;
    }

    .our-team-main:hover
    {
    border-color:#777;
    transition:0.5s;
    }

    /*our-team-main*/


</style>






</head>
<body>

<center>
    <br>
    <h1 class="text-white" style="font-style: italic"><span class="fa fa-map-o"></span> Tech-Roadmap</h1>
    <br>
</center>


<%--navbar--%>

<%@include file="navbar.jsp" %>

<%--banner--%>

<div class="container-fluid p-0 m-0">

    <div class="jumbotron  text-white ">

        <div class="container">

            <h3 class="display-4"> Welcome to Tech-Roadmap </h3>

            <p> A technology roadmap is a flexible planning technique to support strategic and long-range planning, by
                matching short-term and long-term goals with specific technology solutions.It is a plan that
                applies to a new product or process and may include using technology forecasting or technology scouting
                to identify suitable emerging technologies.It is a known technique to help manage the fuzzy
                front-end of innovation.It is also expected that roadmapping techniques may help companies to
                survive in turbulent environments and help them to plan in a more holistic way to include
                non-financial goals and drive towards a more sustainable development.</p>

            <a href="register_page.jsp" class="btn btn-outline-light"><span class="fa fa-user-plus"></span> Start ! it's free </a>
            <a href="login_page.jsp" class="btn btn-outline-light"><span class="fa fa-user-circle fa-spin"></span> Login </a>

        </div>

    </div>

</div>

<%-- cards --%>
<main>
<div class="container-fluid">

    <div class="row">


        <%--First col--%>
        <div class="col-md-2 mt-3">

            <%--categories--%>

            <!-- List group -->
            <div class="list-group sticky" id="List-category" role="tablist">
                <a class="list-group-item list-group-item-action active" data-toggle="list" href="#" onclick="getPosts_home(0)" role="tab">All post</a>
                <%

                    Post_dao p=new Post_dao(Connection_Provider.getConnection());
                    ArrayList<categories> r=p.getCategories();

                    for(categories i: r){
                %>
                <a class="list-group-item list-group-item-action " data-toggle="list" href="#" onclick="getPosts_home(<%=i.getCid()%>)" role="tab"><%=i.getName()%></a>
                <%
                    }
                %>
            </div>

        </div>

        <div class="col-md-8 offset-1">

            <%--post--%>

            <div class="container text-center text-white mt-3" id="loader_3">
                <span class="fa fa-spinner fa-3x fa-spin"></span>
                <h4 class="mt-2">Loading...</h4>
            </div>

            <div class="container-fluid" id="post_load_home">

            </div>

        </div>

    </div>

</div>
</main>

<%--start of contact block--%>

<div id="contact-block" class="container-fluid text-white text-center" style="padding: 100px">

    <h1 style="font-size: 80px">LET'S CHAT!</h1>
    <p class="display-4 mt-5" >We would love to talk with you.</p>

    <div class="row" style="margin-top: 100px">

        <div class="col">
            <span class="fa fa-mobile-phone fa-2x"></span>
            <p class="display-5 mt-1" style="font-style: italic;font-size: 20px">Call us at<br>(+91)9205802590</p>
        </div>

        <div class="col">
            <span class="fa fa-address-card-o fa-2x"></span>
            <p class="display-5 mt-1" style="font-style: italic;font-size: 20px">10/15, Avas vikas, Buddhi vihar,<br>Moradabad, U.P (244103),<br>India</p>
        </div>

        <div class="col">
            <span class="fa fa-envelope-o fa-2x"></span>
            <p class="display-5 mt-1" style="font-style: italic;font-size: 20px">Email us at<br>jaidevgoyal7@gmail.com</p>
        </div>

    </div>

</div>

<%--end of contact block--%>


<%--start of team block--%>

<h1 class="text-center text-white">Our Team</h1>


<div id="team_new" class="container" style="margin-top: 50px">
    <div class="row">

        <div class="col-lg-4"></div>

        <!--team-1-->
        <div class="col-lg-4">
            <div class="our-team-main">

                <div class="team-front">
                    <img src="Profile_pics/Team_img.jpg" class="img-fluid" />
                    <h3>Jaidev Goyal</h3>
                    <p>Developer</p>
                </div>

                <div class="team-back">
	<span>

        Don't know what to write...

	</span>
                </div>

            </div>
        </div>
        <!--team-1-->

    </div>
</div>

<%--end of team block--%>



<%-- javascripts --%>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"
        integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>

<%--Start of load-post--%>

<script>


    function getPosts_home(catId){

        $('#loader_3').show();
        $('#post_load_home').hide();

        $.ajax({
            url: "load_posts.jsp",
            data: {cid: catId},
            success: function (data,textStatus,jqHRX){
                // console.log(data);
                $('#loader_3').hide();
                $('#post_load_home').show();
                $('#post_load_home').html(data);

            }
        })

    }

    $(document).ready(function (e){

        getPosts_home(0)

    })

</script>

<%--end of load-post--%>


<script>

    $("#contact-btn").click(function(event) {
        event.preventDefault();

        $('html, body').stop().animate({
            scrollTop: $("#contact-block").offset().top
        }, 100);
    });

    $("#team-btn").click(function(event) {
        event.preventDefault();

        $('html, body').stop().animate({
            scrollTop: $("#team_new").offset().top
        }, 100);
    });

</script>


</body>
</html>
