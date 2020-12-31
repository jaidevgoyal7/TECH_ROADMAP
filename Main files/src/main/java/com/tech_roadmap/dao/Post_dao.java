package com.tech_roadmap.dao;

import com.tech_roadmap.entities.categories;
import com.tech_roadmap.entities.post;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class Post_dao {

    private static Connection conn;

    public Post_dao(Connection conn) {
        this.conn = conn;
    }

    public ArrayList<categories> getCategories(){

        ArrayList<categories> list=new ArrayList<>();

        try{

            String q="select * from categories";
            Statement smt=conn.createStatement();
            ResultSet rst=smt.executeQuery(q);

            while(rst.next()){

                int cid=rst.getInt("cid");
                String name=rst.getString("name");
                String description=rst.getString("description");
                String  cimg=rst.getString("cimg");

                categories c=new categories(cid,name,description,cimg);
                list.add(c);

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;

    }

    public boolean savePost(post p){

        boolean f=false;

        try{

            String query="insert into post(pTitle,pContent,pCode,pPic,cid_ref,uid_ref) values(?,?,?,?,?,?)";
            PreparedStatement smt=this.conn.prepareStatement(query);
            smt.setString(1,p.getTitle());
            smt.setString(2,p.getContent());
            smt.setString(3,p.getCode());
            smt.setString(4,p.getP_pic());
            smt.setInt(5,p.getCid_ref());
            smt.setInt(6,p.getUid_ref());
            smt.executeUpdate();
            f=true;

        }catch (Exception e){
            e.printStackTrace();
        }

        return f;

    }

    public ArrayList<post> getAllPost(){

        ArrayList<post> list=new ArrayList<>();

        try{

            String q="select * from post order by pid desc";
            Statement smt=conn.createStatement();
            ResultSet rst=smt.executeQuery(q);

            while(rst.next()){

                int pid=rst.getInt("pid");
                String pTitle=rst.getString("pTitle");
                String pContent=rst.getString("pContent");
                String pCode=rst.getString("pCode");
                String pImg=rst.getString("pPic");
                Timestamp pDate=rst.getTimestamp("pDate");
                int cid=rst.getInt("cid_ref");
                int uid=rst.getInt("uid_ref");

                post p=new post(pid,pTitle,pContent,pCode,pImg,pDate,cid,uid);

                list.add(p);

            }

        }catch (Exception e){
            e.printStackTrace();
        }

        return list;

    }

    public List<post> getAllPostByCat(int cid){

        List<post> list=new ArrayList<>();

        try{

            PreparedStatement smt_cat=conn.prepareStatement("select * from post where cid_ref=? order by pid desc");
            smt_cat.setInt(1,cid);
            ResultSet rst_cat=smt_cat.executeQuery();

            while(rst_cat.next()){

                int pid=rst_cat.getInt("pid");
                String pTitle=rst_cat.getString("pTitle");
                String pContent=rst_cat.getString("pContent");
                String pCode=rst_cat.getString("pCode");
                String pImg=rst_cat.getString("pPic");
                Timestamp pDate=rst_cat.getTimestamp("pDate");
                int uid=rst_cat.getInt("uid_ref");

                post p=new post(pid,pTitle,pContent,pCode,pImg,pDate,cid,uid);

                list.add(p);

            }

        }catch (Exception e){
            e.printStackTrace();
        }

        return list;

    }

    public post getSpecificPost(int post_id){

        post P_Specific=null;

        try{

            PreparedStatement smt_cat=conn.prepareStatement("select * from post where pid=?");
            smt_cat.setInt(1,post_id);
            ResultSet rst_cat=smt_cat.executeQuery();

            if (rst_cat.next()){

                int pid=rst_cat.getInt("pid");
                String pTitle=rst_cat.getString("pTitle");
                String pContent=rst_cat.getString("pContent");
                String pCode=rst_cat.getString("pCode");
                String pImg=rst_cat.getString("pPic");
                Timestamp pDate=rst_cat.getTimestamp("pDate");
                int cid=rst_cat.getInt("cid_ref");
                int uid=rst_cat.getInt("uid_ref");

                P_Specific=new post(pid,pTitle,pContent,pCode,pImg,pDate,cid,uid);

            }

        }catch (Exception e){
            e.printStackTrace();
        }

        return P_Specific;

    }

}
