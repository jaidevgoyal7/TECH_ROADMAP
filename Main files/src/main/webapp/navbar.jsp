<%-- navbar --%>

<nav class="navbar navbar-expand-lg primary-background navbar-dark sticky-top py-2">
    <a class="navbar-brand scrollToTop" style="font-style: italic" href="#"> <span class="fa fa-map-o"></span>  Tech-Roadmap</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link scrollToTop" href="#"><span class="fa fa-home"></span> Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Categories
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="#"onclick="getPosts_home(0)" role="tab">All post</a>
                    <%

                        Post_dao p_new=new Post_dao(Connection_Provider.getConnection());
                        ArrayList<categories> r_new=p_new.getCategories();

                        for(categories j: r_new){

                    %>
                    <a class="dropdown-item" href="#" onclick="getPosts_home(<%=j.getCid()%>)" role="tab"><%=j.getName()%></a>

                    <%}%>
                </div>
            </li>
            <li class="nav-item">
                <a class="nav-link" id="team-btn" href="#"><span class="fa fa-group"></span> Team </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" id="contact-btn" href="#"><span class="fa fa-handshake-o"></span> Contact </a>
            </li>
        </ul>
        <ul class="navbar-nav mr-right">
            <li class="nav-item">
                <a class="nav-link" href="register_page.jsp"><span class="fa fa-user-plus"></span> Signup </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="login_page.jsp"><span class="fa fa-user-circle"></span> Login </a>
            </li>
        </ul>
    </div>
</nav>