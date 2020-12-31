package com.tech_roadmap.servlets;

import com.tech_roadmap.dao.User_dao;
import com.tech_roadmap.entities.Message;
import com.tech_roadmap.entities.User;
import com.tech_roadmap.helper.Connection_Provider;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@MultipartConfig
@WebServlet(name = "Login_servlet")
public class Login_servlet extends HttpServlet {

    protected void Process_request(HttpServletRequest request,HttpServletResponse response) throws IOException, SQLException, InterruptedException,ServletException {

        response.setContentType("text/html");

        try(PrintWriter out=response.getWriter()) {

//        login
            String userEmail=request.getParameter("email");
            String userPassword=request.getParameter("password");

            User_dao  login_dao=new User_dao(Connection_Provider.getConnection());

            User check=login_dao.getUserEmailAndPassword(userEmail,userPassword);

            if(check==null){
//                login error

                Message msg=new Message("You have entered wrong credentials !","error","alert alert-danger");

                HttpSession s=request.getSession();
                s.setAttribute("msg",msg);

                response.sendRedirect("login_page.jsp");

//                out.println("invalid details");

            }
            else{
//                login success

                HttpSession s=request.getSession();
                s.setAttribute("currentUser",check);

                response.sendRedirect("profile.jsp");

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
