package com.Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.model.User;

public class UserDao {
	public User checkLogin(String email, String password) throws SQLException,
    ClassNotFoundException {

    	// JDBC driver name and database URL
    	    final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";  
    	    final String DB_URL = "jdbc:mysql://localhost/bank";

    	   //  Database credentials
    	    final String USER = "root";
    	   final String PASS = "root";
    	System.out.println("UserDao");
Connection conn = null;
PreparedStatement stmt = null;

  //STEP 2: Register JDBC driver
  Class.forName(JDBC_DRIVER);

  //STEP 3: Open a connection

  conn = DriverManager.getConnection(DB_URL, USER, PASS);
  String sql = "SELECT * FROM admin WHERE uname = ? and password = ?";
  PreparedStatement statement = conn.prepareStatement(sql);
  statement.setString(1, email);
  statement.setString(2, password);

  ResultSet result = statement.executeQuery();

  User user = null;

  if (result.next()) {
      user = new User();
      user.setUname(result.getString("uname"));
      user.setPassword(result.getString("password"));
  }

  conn.close();

  return user;
    	
  

}

}
