package com.tech_roadmap.servlets;

import com.tech_roadmap.dao.Post_dao;
import com.tech_roadmap.entities.Message;
import com.tech_roadmap.entities.User;
import com.tech_roadmap.entities.post;
import com.tech_roadmap.helper.Connection_Provider;
import com.tech_roadmap.helper.Helper;
import com.tech_roadmap.helper.Integer_help;

import javax.mail.MailSessionDefinition;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@MultipartConfig
@WebServlet(name = "NewPost_servlet")
public class NewPost_servlet extends HttpServlet {

    protected void Process_request(HttpServletRequest request,HttpServletResponse response) throws IOException, SQLException, InterruptedException,ServletException {
        response.setContentType("text/html");
        try(PrintWriter out=response.getWriter()) {

//            out.println("serve");
            String title=request.getParameter("pTitle");
            String content=request.getParameter("pContent");
            String code=request.getParameter("pCode");
            Part part = request.getPart("pImg");
            HttpSession s=request.getSession();
            User user=(User)s.getAttribute("currentUser");

            String cid=request.getParameter("cid");
//            out.println(cid);

            post p=new post(title,content,code, part.getSubmittedFileName(), Integer_help.convert(cid),user.getId());
            Post_dao dao=new Post_dao(Connection_Provider.getConnection());

            if(dao.savePost(p)){
                String path=request.getRealPath("/")+"Post_img"+File.separator+part.getSubmittedFileName();
//                String path="C:\\Users\\jaide\\IdeaProjects\\TECH_ROADMAP\\src\\main\\webapp\\Post_img"+File.separator+part.getSubmittedFileName();
                Helper.saveFile(part.getInputStream(),path);
                out.println("done");
            }
            else{
                out.println("error");
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
