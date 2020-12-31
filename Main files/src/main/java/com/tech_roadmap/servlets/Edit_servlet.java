package com.tech_roadmap.servlets;

import com.tech_roadmap.dao.User_dao;
import com.tech_roadmap.entities.Message;
import com.tech_roadmap.entities.User;
import com.tech_roadmap.helper.Helper;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@MultipartConfig
@WebServlet(name = "Edit_servlet")
public class Edit_servlet extends HttpServlet {

    protected void Process_request(HttpServletRequest request,HttpServletResponse response) throws IOException, SQLException, InterruptedException,ServletException {

        response.setContentType("text/html");

        try(PrintWriter out=response.getWriter()) {

//            Fetch all data


            String email=request.getParameter("user_email");
            String name=request.getParameter("user_name");
            String password=request.getParameter("user_password");
            String about=request.getParameter("user_about");
            Part part=request.getPart("user_profile_pic");
            String profile_pic_name=part.getSubmittedFileName();

//            get the user from the session................

            HttpSession s=request.getSession();
            User user=(User) s.getAttribute("currentUser");

            user.setEmail(email);
            user.setName(name);
            user.setPassword(password);
            user.setAbout(about);
            String old_Pic_Path=user.getProfile();
            user.setProfile(profile_pic_name);

//            update database

            boolean ans=User_dao.userEdit(user);

            if(ans==true){
                String path=request.getRealPath("/")+"Profile_pics"+File.separator+user.getProfile();
//                String path="C:\\Users\\jaide\\IdeaProjects\\TECH_ROADMAP\\src\\main\\webapp\\Profile_pics"+File.separator+user.getProfile();
                String oldPath=request.getRealPath("/")+"Profile_pics"+File.separator+old_Pic_Path;

                if(!old_Pic_Path.equalsIgnoreCase("default.png")){
                    Helper.deleteFile(oldPath);
                }

                if(Helper.saveFile(part.getInputStream(),path)){

                    Message msg=new Message("Update successfully !","success","alert alert-success");
                    s.setAttribute("msg",msg);

                }

            }
            else{
                Message msg=new Message("Update error !","error","alert alert-danger");
                s.setAttribute("msg",msg);
            }

            response.sendRedirect("profile.jsp");


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
