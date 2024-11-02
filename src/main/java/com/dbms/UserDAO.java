package com.dbms;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO {
    public static void createUser(String username, String password, Long phone) throws SQLException {
    	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/grocery_db","tazeen","kitkat");
        String sql = "INSERT INTO customer_details VALUES (?, ?, ?)";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, username);
        stmt.setLong(2, phone);
        stmt.setString(3, password);
        stmt.executeUpdate();
        stmt.close();
        conn.close();
    }

    public static boolean validateUser(Long phone, String password) throws SQLException {
    	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/grocery_db","tazeen","kitkat");
        String sql = "SELECT * FROM customer_details WHERE Phone_No = ? AND password = ?";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setLong(1, phone);
        stmt.setString(2, password);
        ResultSet rs = stmt.executeQuery();
        boolean isValidUser = rs.next();
        rs.close();
        stmt.close();
        conn.close();
        return isValidUser;
    }
}