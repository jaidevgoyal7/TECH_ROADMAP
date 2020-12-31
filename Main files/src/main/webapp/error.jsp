<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isErrorPage="true" %>
<html>
<head>
    <title>Error</title>

    <%-- css --%>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <style>
        img.two {
            height: 200px;
            width: 200px;
        }
    </style>

</head>
<body>
<div class="container text-center" style="margin-top: 180px;color: red;">
    <img class="img-fluid two" src="img/error.png" alt="Error">
    <h4>Sorry ! Something went wrong.</h4>
    <%= exception %>
    <br>
    <a href="index.jsp" class="btn btn-outline-light primary-background mt-3" style="font-style: italic"><span class="fa fa-map-o"></span> Tech-Roadmap</a>
</div>
</body>
</html>
