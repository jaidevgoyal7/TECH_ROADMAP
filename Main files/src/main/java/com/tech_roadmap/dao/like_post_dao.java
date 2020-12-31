package com.tech_roadmap.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class like_post_dao {

    Connection conn;

    public like_post_dao(Connection conn) {
        this.conn = conn;
    }

    public boolean insertLike(int pid,int uid){

        boolean f=false;

        try{

            String query="insert into like_post(pid_ref,uid_ref) values(?,?)";
            PreparedStatement smt=this.conn.prepareStatement(query);
            smt.setInt(1,pid);
            smt.setInt(2,uid);
            smt.executeUpdate();

            f=true;

        }catch (Exception e){
            e.printStackTrace();
        }

        return f;

    }

    public int totalLike(int pid){

        int count=0;

        try{

            String query="select count(*) from like_post where pid_ref=?";
            PreparedStatement smt=this.conn.prepareStatement(query);
            smt.setInt(1,pid);
            ResultSet rst=smt.executeQuery();

            if(rst.next()){
                count=rst.getInt("count(*)");
            }

        }catch (Exception e){
            e.printStackTrace();
        }

        return count;

    }

    public boolean isLikedU(int pid,int uid){

        boolean f=false;

        try{
            String query="select * from like_post where pid_ref=? and uid_ref=?";

            PreparedStatement smt=this.conn.prepareStatement(query);
            smt.setInt(1,pid);
            smt.setInt(2,uid);
            ResultSet rst=smt.executeQuery();

            if(rst.next()){
                f=true;
            }

        }catch (Exception e){
            e.printStackTrace();
        }

        return f;

    }

    public boolean deleteLike(int pid,int uid){

        boolean f=false;

        try{

            String query="delete from like_post where pid_ref=? and uid_ref=?";
            PreparedStatement smt=this.conn.prepareStatement(query);
            smt.setInt(1,pid);
            smt.setInt(2,uid);
            smt.executeUpdate();

            f=true;

        }catch (Exception e){
            e.printStackTrace();
        }

        return f;

    }

}
