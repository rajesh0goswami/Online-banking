package com.Daou;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.modelu.UserU;

public class UserDaoU {
	
	public UserU checkLogin(String email, String password) throws SQLException,
    ClassNotFoundException {

    	// JDBC driver name and database URL
    	    final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";  
    	    final String DB_URL = "jdbc:mysql://localhost/bank";

    	   //  Database credentials
    	    final String USER = "root";
    	   final String PASS = "root";
    	System.out.println("UserDaoU");
Connection conn = null;
PreparedStatement stmt = null;

  //STEP 2: Register JDBC driver
  Class.forName(JDBC_DRIVER);

  //STEP 3: Open a connection

  conn = DriverManager.getConnection(DB_URL, USER, PASS);
  String sql = "SELECT * FROM users WHERE uname = ? and password = ?";
  PreparedStatement statement = conn.prepareStatement(sql);
  statement.setString(1, email);
  statement.setString(2, password);

  ResultSet result = statement.executeQuery();

  UserU user = null;

  if (result.next()) {
      user = new UserU();
      user.setUname(result.getString("uname"));
      user.setPassword(result.getString("password"));
  }

  conn.close();

  return user;
    	
  

}

}
