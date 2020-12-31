<%@ page import="com.tech_roadmap.entities.User" %>
<%@ page import="com.tech_roadmap.entities.Message" %>
<%@ page import="com.tech_roadmap.dao.Post_dao" %>
<%@ page import="com.tech_roadmap.helper.Connection_Provider" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.tech_roadmap.entities.categories" %>
<%@ page import="com.tech_roadmap.entities.post" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page errorPage="error.jsp" %>

<%

    User user=(User) session.getAttribute("currentUser");

    if(user==null){
        response.sendRedirect("login_page.jsp");
    }

%>

<html>
<head>
    <title>Profile</title>

    <%-- css --%>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <style>
        .image-upload > input
        {
            display: none;
        }
        .image-upload span
        {
            cursor: pointer;
        }
        html {
            scroll-behavior: smooth;
        }
        .list-group-item.active, .list-group-item.active:hover, .list-group-item.active:focus {
            z-index:2;
            color:white;
            background-color:#424242;
            border-color:black;
        }
        body{
            background: url("img/profile-background.png");
            background-size: cover;
            background-attachment: fixed;
        }
        div.sticky {
            position: -webkit-sticky;
            position: sticky;
            top: 4rem;
        }
    </style>

</head>
<body>
<%--navbar--%>

<nav class="navbar navbar-expand-lg navbar-dark primary-background sticky-top py-2">
    <a class="navbar-brand" style="font-style: italic" href="#"> <span class="fa fa-map-o"></span>  Tech-Roadmap</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link scrollToTop_profile" href="#"><span class="fa fa-home"></span> Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Categories
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="#" onclick="getPosts(0)" role="tab">All post</a>
                    <%

                        Post_dao p_new=new Post_dao(Connection_Provider.getConnection());
                        ArrayList<categories> r_new=p_new.getCategories();

                        for(categories j: r_new){

                    %>
                    <a class="dropdown-item" href="#" onclick="getPosts(<%=j.getCid()%>)" role="tab"><%=j.getName()%></a>
                    <%}%>
                </div>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#" data-toggle="modal" data-target="#add-post-modal"><span class="fa fa-pencil-square-o"></span> New post </a>
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


<%--Start of main body--%>
<main>
    <div class="container-fluid">

        <div class="row">

            <%--First col--%>
            <div class="col-md-2 mt-3">

                <%--categories--%>

                    <!-- List group -->
                    <div class="list-group sticky" id="List-category" role="tablist">
                        <a class="list-group-item list-group-item-action active" data-toggle="list" href="#" onclick="getPosts(0)" role="tab">All post</a>
                        <%

                            Post_dao p=new Post_dao(Connection_Provider.getConnection());
                            ArrayList<categories> r=p.getCategories();

                            for(categories i: r){
                        %>
                        <a class="list-group-item list-group-item-action " data-toggle="list" href="#" onclick="getPosts(<%=i.getCid()%>)" role="tab"><%=i.getName()%></a>
                        <%
                            }
                        %>
                    </div>

            </div>

            <%--second col--%>
            <div class="col-md-8 offset-1">

                <%--post--%>

                <div class="container text-center text-white mt-3" id="loader_2">
                    <span class="fa fa-spinner fa-3x fa-spin"></span>
                    <h4 class="mt-2">Loading...</h4>
                </div>

                <div class="container-fluid" style="padding-bottom: 20px" id="post-load">

                </div>

            </div>

        </div>

    </div>
</main>

<%--end of main page body--%>


<%--profile-modal--%>

<!-- Modal -->
<div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header primary-background text-white text-center ">
                <h5 class="modal-title" style="font-style: italic" id="exampleModalLabel"><span class="fa fa-map-o"></span> Tech-Roadmap</h5>
                <button style="color: white" type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">

                <div class="container text-center">

                    <img class="img-fluid" style="border-radius: 50%" width="120px" height="120px" src="Profile_pics/<%= user.getProfile() %>" alt="Profile pic">

                    <%-- Profile-image-edit --%>

                    <div class="image-upload" id="user_pic_edit" style="display: none">
                        <label for="pic-edit">
                            <span class="fa fa-camera"></span>
                        </label>
                        <input form="edit-form" id="pic-edit" type="file" name="user_profile_pic" accept="image/*">
                    </div>

                    <%-- End profile-image-edit --%>

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

                    <div id="profile-edit" style="display: none;">

<%--edit--%>

                        <p class="mt-2">Please edit carefully.</p>
                        <form  id="edit-form" action="Edit_servlet" method="post" enctype="multipart/form-data">
                        <table class="table table-striped table-dark mt-2">
                            <tr>
                                <th>ID :</th>
                                <td><%= user.getId() %></td>
                            </tr>
                            <tr>
                                <th>Email :</th>
                                <td><input type="email" class="form-control" value="<%= user.getEmail() %>" name="user_email" required></td>
                            </tr>
                            <tr>
                                <th>Name :</th>
                                <td><input type="text" class="form-control" value="<%= user.getName() %>" name="user_name" required></td>
                            </tr>
                            <tr>
                                <th>Password :</th>
                                <td><input type="password" class="form-control" value="<%= user.getPassword() %>" name="user_password" required></td>
                            </tr>
                            <tr>
                                <th>Gender :</th>
                                <td><%= user.getGender() %></td>
                            </tr>
                            <tr>
                                <th>Status :</th>
                                <td>
                                    <textarea rows="2" class="form-control" name="user_about" required><%= user.getAbout() %> </textarea>
                                </td>
                            </tr>
                        </table>

                            <div class="container">
                                <button type="submit" class="btn btn-outline-dark">Save</button>
                            </div>

                        </form>

                    </div>

                </div>

<%--edit--%>

            </div>
            <div class="modal-footer">
                <button id="profile-edit-button" type="button" class="btn btn-outline-light primary-background">Edit</button>
                <button type="button" class="btn btn-outline-light primary-background" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>

<%--end of profile-modal--%>


<%--Start of new-post modal--%>

<!-- Modal -->
<div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="add-post-modal" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header primary-background text-white text-center">
                <h5 class="modal-title" id="ModalLabel">Upload new post</h5>
                <button style="color: white" type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">

                <form id="new-post-form" action="NewPost_servlet" method="post">

                    <div class="form-row">

                        <div class="col">
                        <label>Categories :</label>
                        <select class="form-control" name="cid">
                            <option selected disabled>---Select Category---</option>

                            <%
                                Post_dao c = new Post_dao(Connection_Provider.getConnection());
                                ArrayList<categories> list = c.getCategories();
                                for (categories j : list) {
                            %>
                            <option value="<%=j.getCid()%>"> <%= j.getName() %>
                            </option>
                            <% } %>

                        </select>
                        </div>

                        <div class="col">
                            <label>Title :</label>
                            <input name="pTitle" type="text" placeholder="Enter post Title" class="form-control" required/>
                        </div>

                    </div>

                    <div class="form-row mt-2">

                        <div class="col">
                        <label>Content :</label>
                        <textarea name="pContent" class="form-control" style="height: 180px;" placeholder="Enter your content" required></textarea>
                        </div>

                    </div>

                    <div class="form-row mt-2">

                        <div class="col">
                        <label>Code :</label>
                        <textarea name="pCode" class="form-control" style="height: 180px;" placeholder="Enter your program (if any)"></textarea>
                        </div>

                    </div>

                    <div class="form-row mt-2">

                        <div class="col">
                        <label>Upload image(Image related to post) :</label>
                        <br>
                        <input type="file" name="pImg">
                        </div>

                    </div>

                    <div class="container text-center mt-2">
                        <button type="submit" class="btn btn-outline-dark">Post</button>
                    </div>

                </form>
            </div>
        </div>
    </div>
</div>

<%--End of ne-post modal--%>

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


<%--starting back button edit details edit button js--%>

<script>

    $(document).ready(function (){

        let Edit_Status=false;

        $('#profile-edit-button').click(function (){

            if(Edit_Status==false){
                $('#profile-details').hide();
                $('#profile-edit').show();
                $('#user_pic_edit').show();
                Edit_Status=true;
                $(this).text("Back");
            }
            else {
                $('#profile-details').show();
                $('#profile-edit').hide();
                $('#user_pic_edit').hide();
                Edit_Status=false;
                $(this).text("Edit");
            }

        });
    });

</script>

<%--end back button edit details edit button js--%>


<%--start ajax for new post js--%>

<script>

    // e means event handling function

    $(document).ready(function (e){

        // this code will called when form is submitted......

       $("#new-post-form").on("submit",function (event){
           event.preventDefault();

           let form=new FormData(this);

           // now requesting to server

           //console.log("clicllll");

           $.ajax({
               url: 'NewPost_servlet',
               type:'POST',
               data: form,
               success: function (data,textStatus,jqXHR){

                   // success
                   console.log(data);

                   if(data.trim()=='done'){
                       swal("Good job!", "Successfully posted!", "success")
                           .then((value) => {
                               window.location="profile.jsp"
                           });
                   }
                   else{
                       swal("Error!", "Something went wrong!", "error");
                   }
                   // console.log("helll");

               },
               error: function (jqXHR,textStatus,errorThrown){
                   // error
                   swal("Error!", "Something went wrong!", "error");

               },
               processData: false,
               contentType : false
           })
       })
    })

</script>

<%--end ajax for new post js--%>

<%--Start of load-post--%>

<script>


    function getPosts(catId){

        $('#loader_2').show();
        $('#post-load').hide();

        $.ajax({
            url: "load_posts.jsp",
            data: {cid: catId},
            success: function (data,textStatus,jqHRX){
                // console.log(data);
                $('#loader_2').hide();
                $('#post-load').show();
                $('#post-load').html(data);

            }
        })

    }

    $(document).ready(function (e){

        getPosts(0)

    })

</script>

<%--end of load-post--%>

</body>
</html>
