<%@ page import="com.tech_roadmap.dao.Post_dao" %>
<%@ page import="com.tech_roadmap.helper.Connection_Provider" %>
<%@ page import="java.util.List" %>
<%@ page import="com.tech_roadmap.entities.post" %>
<%@ page import="com.tech_roadmap.helper.Integer_help" %>
<%@ page import="com.tech_roadmap.dao.like_post_dao" %>
<%@ page import="com.tech_roadmap.entities.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page errorPage="error.jsp" %>

<style>

    .a{
        height: 75px;
        overflow: hidden;
        text-overflow: ellipsis;
    }

</style>

<div class="row">

    <%
        User user=(User) session.getAttribute("currentUser");

        Post_dao dao_p=new Post_dao(Connection_Provider.getConnection());

        int cid= Integer_help.convert(request.getParameter("cid"));

        List<post> post_p=null;

        if (cid == 0) {
            post_p=dao_p.getAllPost();
        }
        else{
            post_p=dao_p.getAllPostByCat(cid);
        }

        if (post_p.size()==0){
            out.println("<b class='text-center text-white mt-3'>No post in this category!</b>");
        }


        for (post i: post_p){
    %>

    <div class="col-md-6 mt-3">
        <div class="card">
            <img class="card-img-top" src="Post_img/<%=i.getP_pic()%>" alt="Card image cap">
            <div class="card-body">
                <b><%=i.getTitle()%></b>
                <div class="a">
                <p><%=i.getContent()%></p>
                </div>
            </div>
            <div class="card-footer text-center primary-background">
                <%
                    like_post_dao ldao=new like_post_dao(Connection_Provider.getConnection());
                %>
                <a class="btn btn-outline-light btn-sm" href="show_post.jsp?post_id=<%=i.getPid()%>">Read more</a>
            </div>
        </div>
    </div>
    <%
        }
    %>

</div>