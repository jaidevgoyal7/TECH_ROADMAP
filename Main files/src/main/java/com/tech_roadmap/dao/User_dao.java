package com.tech_roadmap.dao;

import com.tech_roadmap.entities.User;

import java.sql.*;

public class User_dao {

    private  static Connection conn;

    public User_dao(Connection conn) {
        this.conn = conn;
    }

//    save data...signup_page
    public boolean save_data(User user){

        boolean f=false;

        try{

//            user-->database

            String query="insert into user(name,email,password,gender,about) values(?,?,?,?,?)";
            PreparedStatement smt=this.conn.prepareStatement(query);
            smt.setString(1,user.getName());
            smt.setString(2,user.getEmail());
            smt.setString(3,user.getPassword());
            smt.setString(4,user.getGender());
            smt.setString(5,user.getAbout());
            smt.executeUpdate();
            f=true;

        }
        catch (Exception e) {
            e.printStackTrace();
        }

        return f;

    }


//    Get user email and password...login_page
    public User getUserEmailAndPassword(String email,String password){
        User user=null;

        try{

            String query="select * from user where email=? and password=?";

            PreparedStatement smt=conn.prepareStatement(query);
            smt.setString(1,email);
            smt.setString(2,password);

            ResultSet rst= smt.executeQuery();

            if(rst.next()){
                user=new User();

//              data from db and set to user object

                user.setName(rst.getString("name"));
                user.setId(rst.getInt("id"));
                user.setGender(rst.getString("gender"));
                user.setEmail(rst.getString("email"));
                user.setPassword(rst.getString("password"));
                user.setAbout(rst.getString("about"));
                user.setRegistration_date(rst.getTimestamp("registration_date"));
                user.setProfile(rst.getString("profile"));

            }

        }
        catch (Exception e){
            e.printStackTrace();
        }

        return user;
    }


    public static boolean userEdit(User user){

        boolean f=false;

        try{

            String query="update user set name=?,email=?,password=?,gender=?,about=?,profile=? where id=?";
            PreparedStatement smt=conn.prepareStatement(query);
            smt.setString(1, user.getName());
            smt.setString(2, user.getEmail());
            smt.setString(3, user.getPassword());
            smt.setString(4, user.getGender());
            smt.setString(5, user.getAbout());
            smt.setString(6, user.getProfile());
            smt.setInt(7,user.getId());

            smt.executeUpdate();
            f=true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;

    }

    public User getUserByUserId(int user_id){
        User user=null;

        try{

            String query="select * from user where id=?";

            PreparedStatement smt=conn.prepareStatement(query);
            smt.setInt(1,user_id);

            ResultSet rst= smt.executeQuery();

            if(rst.next()){
                user=new User();

//              data from db and set to user object

                String name=rst.getString("name");
                user.setName(name);

            }

        }
        catch (Exception e){
            e.printStackTrace();
        }

        return user;
    }

}
