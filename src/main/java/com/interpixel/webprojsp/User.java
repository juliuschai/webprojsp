package com.interpixel.webprojsp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author Julius
 */
public class User {

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
    static boolean register(String name, String email, String pass) {
        System.out.println("register");
        try {
            Connection con = DatabaseConnection.initializeDatabase();
            PreparedStatement st = con.prepareStatement("insert into "
                    + "users(name, email, pass) "
                    + "values (?, ?, ?)");

            st.setString(1, name);
            st.setString(2, email);
            st.setString(3, WebUtil.getMd5(pass));
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

    /**
     * Check if email is available to register
     *
     * @param email user's email
     * @throws SQLException if a servlet-specific error occurs
     * @throws ClassNotFoundException if a servlet-specific error occurs
     */
    static boolean checkEmail(String email) {
        try {
            Connection con = DatabaseConnection.initializeDatabase();
            PreparedStatement st = con.prepareStatement("SELECT COUNT(*) FROM users "
                    + "WHERE email = ?");

            st.setString(1, email);
            ResultSet rs = st.executeQuery();

            rs.next();
            int count = rs.getInt(1);

            rs.close();
            st.close();
            con.close();

            return count <= 0;

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return false;
    }
}
