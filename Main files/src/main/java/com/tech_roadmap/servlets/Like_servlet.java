package com.tech_roadmap.servlets;

import com.tech_roadmap.dao.User_dao;
import com.tech_roadmap.dao.like_post_dao;
import com.tech_roadmap.entities.Message;
import com.tech_roadmap.entities.User;
import com.tech_roadmap.helper.Connection_Provider;
import com.tech_roadmap.helper.Helper;
import com.tech_roadmap.helper.Integer_help;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet(name = "Like_servlet")
public class Like_servlet extends HttpServlet {

    protected void Process_request(HttpServletRequest request,HttpServletResponse response) throws IOException, SQLException, InterruptedException,ServletException {

        response.setContentType("text/html");

        try(PrintWriter out=response.getWriter()) {

            String operation=request.getParameter("operation");

            int pid= Integer_help.convert(request.getParameter("pid"));
            int uid= Integer_help.convert(request.getParameter("uid"));
            boolean f=false;

            like_post_dao ldao=new like_post_dao(Connection_Provider.getConnection());
            if(operation.equals("like")){
                if (ldao.isLikedU(pid,uid)==true){
                    ldao.deleteLike(pid,uid);
                    out.println(f);
                }else {
                    f=ldao.insertLike(pid,uid);
                    out.println(f);
                }
            }

        }

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Process_request(request,response);
        } catch (SQLException | InterruptedException throwables) {
            throwables.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Process_request(request,response);
        } catch (SQLException | InterruptedException throwables) {
            throwables.printStackTrace();
        }
    }
}
