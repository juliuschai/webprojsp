/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.interpixel.webprojsp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author KresnaAdhiPramana
 */
class Answer {
    public String getAnswer() {
        return answer;
    }

    public Answer(String answer) {
        this.answer = answer;
    }
    
    public String answer;
    
    static boolean create(String answer) {
        System.out.println("CreateAnswer");
        try {
            Connection con = DatabaseConnection.initializeDatabase();
            PreparedStatement st = con.prepareStatement("insert into "
                    + "answers(answer) "
                    + "values (?)");

            st.setString(1, answer);
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
