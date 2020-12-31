package com.tech_roadmap.servlets;

import com.tech_roadmap.dao.User_dao;
import com.tech_roadmap.entities.User;
import com.tech_roadmap.helper.Connection_Provider;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@MultipartConfig
@WebServlet(name = "Register_servlet")
public class Register_servlet extends HttpServlet {

    protected void Process_request(HttpServletRequest request,HttpServletResponse response) throws IOException, SQLException, InterruptedException,ServletException {
        response.setContentType("text/html");
        try(PrintWriter out=response.getWriter()) {
            String check=request.getParameter("check");

            if(check==null){
                out.println("Please agree terms and conditions");
            }
            else {

                String name = request.getParameter("user_name");
                String email = request.getParameter("user_email");
                String password = request.getParameter("user_password");
                String gender = request.getParameter("gender");
                String about = request.getParameter("about");

//            Create User object and set all data to that object
                User user = new User(name, email, password, gender, about);

//            Create User dao object
                User_dao data = new User_dao(Connection_Provider.getConnection());
                if (data.save_data(user)) {
//                save
                    out.println("done");
                } else {
                    out.println("error");
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
