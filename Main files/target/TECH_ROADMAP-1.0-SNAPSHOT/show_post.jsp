<%@ page import="com.tech_roadmap.helper.Integer_help" %>
<%@ page import="com.tech_roadmap.entities.User" %>
<%@ page import="com.tech_roadmap.dao.Post_dao" %>
<%@ page import="com.tech_roadmap.helper.Connection_Provider" %>
<%@ page import="com.tech_roadmap.entities.post" %>
<%@ page import="com.tech_roadmap.entities.categories" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.tech_roadmap.entities.Message" %>
<%@ page import="com.tech_roadmap.dao.User_dao" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.tech_roadmap.dao.like_post_dao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page errorPage="error.jsp" %>


<%

    User user=(User) session.getAttribute("currentUser");

    if(user==null){
        response.sendRedirect("login_page.jsp");
    }

%>


<%

    int post_id= Integer_help.convert(request.getParameter("post_id"));

    Post_dao d=new Post_dao(Connection_Provider.getConnection());

    post p=d.getSpecificPost(post_id);

%>

<html>
<head>
    <title><%=p.getTitle()%></title>

    <%-- css --%>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <div id="fb-root"></div>
    <script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v8.0" nonce="jumhUhVT"></script>

    <style>

        .post-title{
            font-weight: 100;
            font-size: 30px;
        }

        .post-content{
            font-weight: 100;
            font-size: 25px;
        }

        .post-user-info{
            font-style: italic;
            font-weight: bold;
        }
        .post-date{
            font-style: italic;
            font-weight: bold;
        }
        .row-user{
            border: 1px solid #424242;
            padding-top: 15px;
        }
        body{
            background: url("img/profile-background.png");
            background-size: cover;
            background-attachment: fixed;
        }

    </style>

</head>
<body>

<%--navbar--%>

<nav class="navbar navbar-expand-lg navbar-dark primary-background sticky-top py-2">
    <a class="navbar-brand" style="font-style: italic" href="profile.jsp"> <span class="fa fa-map-o"></span>  Tech-Roadmap</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="profile.jsp"><span class="fa fa-home"></span> Home <span class="sr-only">(current)</span></a>
            </li>
        </ul>

        <ul class="navbar-nav mr-right">
            <li class="nav-item">
                <a class="nav-link" href="#" data-toggle="modal" data-target="#profile-modal"><span class="fa fa-user-circle"></span> <%= user.getName() %> </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="Logout_servlet"><span class="fa fa-sign-out"></span> Logout </a>
            </li>

        </ul>

    </div>
</nav>

<%-- navbar-end --%>

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


<%--start of main body--%>


<div class="container">

    <div class="row my-4">

        <div class="col-md-8 offset-md-2">

            <div class="card">

                <div class="card-header primary-background text-white">

                    <h4 class="post-title"><%=p.getTitle()%></h4>

                </div>

                <div class="card-body">

                    <img class="card-img-top mb-3" src="Post_img/<%=p.getP_pic()%>" alt="Card image cap">

                    <div class="row my-3 row-user">
                        <div class="col-md-8">
                            <%

                                User_dao ud=new User_dao(Connection_Provider.getConnection());

                                SimpleDateFormat  formatter = new SimpleDateFormat("MMM dd, yyyy");
                                String strDate = formatter.format(p.getP_date());

                            %>
                            <p class="post-user-info"><a href="#"><span class="fa fa-user-circle-o"></span> <%=ud.getUserByUserId(p.getUid_ref()).getName()%></a> has posted on :</p>
                        </div>
                        <div class="col-md-4 text-right">
                            <p class="post-date"><%=strDate%></p>
                        </div>
                    </div>

                     <p class="post-content"><%=p.getContent()%></p>

                    <br>
                    <br>

                    <div class="post-code">
                    <pre><%=p.getCode()%></pre>
                    </div>

                </div>


                <%

                    like_post_dao ldao=new like_post_dao(Connection_Provider.getConnection());

                %>


                <div class="card-footer text-center primary-background">
                    <a href="#" onclick="doLike(<%=p.getPid()%>,<%=user.getId()%>)" class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-o-up"> </i><span class="like-counter"> <%=ldao.totalLike(p.getPid())%></span></a>
                </div>
                <div class="card-footer">
                    <div class="fb-comments" data-href="http://localhost:9494/TECH_ROADMAP_war/show_post.jsp?post_id=<%=p.getPid()%>" data-numposts="5" data-m trdeffffffff,mg y67width="10"></div>
                </div>

            </div>

        </div>

    </div>


</div>


<%--end of main body--%>

<%--profile-modal--%>

<!-- Modal -->
<div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header primary-background text-white text-center ">
                <h5 class="modal-title" id="exampleModalLabel"><span class="fa fa-map-o"></span> Tech-Roadmap</h5>
                <button style="color: white" type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">

                <div class="container text-center">

                    <img class="img-fluid" style="border-radius: 50%" width="120px" height="120px" src="Profile_pics/<%= user.getProfile() %>" alt="Profile pic">

                    <h5 class="modal-title mt-2"><%= user.getName() %></h5>

                    <%-- table --%>

                    <div id="profile-details">
                        <table class="table table-striped table-dark mt-2">
                            <tbody>
                            <tr>
                                <th scope="row"> ID :</th>
                                <td> <%= user.getId() %> </td>
                            </tr>
                            <tr>
                                <th scope="row"> Email :</th>
                                <td> <%= user.getEmail() %> </td>
                            </tr>
                            <tr>
                                <th scope="row"> Gender :</th>
                                <td> <%= user.getGender() %></td>
                            </tr>
                            <tr>
                                <th scope="row"> Status :</th>
                                <td> <%= user.getAbout() %></td>
                            </tr>
                            <tr>
                                <th scope="row"> Registered on :</th>
                                <td> <%= user.getRegistration_date() %></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-outline-light primary-background" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
</div>
<%--end of profile-modal--%>

<!--javascripts-->
<script
        src="https://code.jquery.com/jquery-3.4.1.min.js"
        integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
<script src="js/myjs.js"></script>


</body>
</html>
