/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

// This class can be used to initialize the database connection 
public class DatabaseConnection {

    protected static Connection initializeDatabase()
            throws SQLException, ClassNotFoundException {
        // Initialize all the information regarding 
        // Database Connection 
        String dbURL = "jdbc:mysql://localhost:3306/webprojsp?zeroDateTimeBehavior=CONVERT_TO_NULL";
        // Database name to access 
        String dbUsername = "root";
        String dbPassword = "";

        Class.forName("com.mysql.jdbc.Driver"); 
        Connection con = DriverManager.getConnection(dbURL,
                dbUsername, dbPassword);
        return con;
    }
}
