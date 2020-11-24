/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.interpixel.webprojsp;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;


/**
 *
 * @author eric
 */
public class Question {
    
    public String getTitle() {
        return title;
    }

    public String getDescription() {
        return description;
    }

    public Question(String title, String description) {
        this.title = title;
        this.description = description;
    }
    
    public String title;
    public String description;
    /**
     * Create user in database
     *
     * @param name user's name
     * @param email user's email
     * @param pass user's pass in plain text
     * @return true if user successfully added
     * @throws SQLException if a servlet-specific error occurs
     * @throws ClassNotFoundException if a servlet-specific error occurs
     */
    static boolean create(String title, String description) {
        System.out.println("CreateQuestion");
        try {
            Connection con = DatabaseConnection.initializeDatabase();
            PreparedStatement st = con.prepareStatement("insert into "
                    + "questions(title,description) "
                    + "values (?, ?)");

            st.setString(1, title);
            st.setString(2, description);
            st.executeUpdate();

            st.close();
            con.close();

            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return false;
    }

}