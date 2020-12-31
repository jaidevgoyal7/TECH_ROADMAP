package com.tech_roadmap.helper;

import java.sql.*;

public class Connection_Provider {

    public static Connection conn;

    public static Connection getConnection() {

        try{
            if(conn==null){
                //Load Driver class
               Class.forName("com.mysql.cj.jdbc.Driver");

                //Create a connection
                conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/tech_roadmap", "root", "Jaidev2000@");
            }
        }
        catch (Exception e){
            e.printStackTrace();
        }

        return conn;
    }
}
