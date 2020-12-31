<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isErrorPage="true"%>
<html>
<head>
    <title>404</title>

    <%-- css --%>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <style>
        img.two {
            height: 180px;
            width: 180px;
        }
    </style>

</head>
<body>
<div class="container text-center" style="margin-top: 200px;color: red;">
    <img class="img-fluid two" style="margin-bottom: 5px" src="img/monkey.png" alt="404">
    <h4>This page isn't available.</h4>
    <h4>Sorry about that.</h4>
    <a href="index.jsp" style="font-style: italic" class="btn btn-outline-light primary-background mt-3"><span class="fa fa-map-o"></span> Tech-Roadmap</a>
</div>
</body>
</html>
