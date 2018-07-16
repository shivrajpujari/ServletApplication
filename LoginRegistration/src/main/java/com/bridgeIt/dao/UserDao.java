package com.bridgeIt.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.bridgeIt.model.User;

public class UserDao {
	
	public static Connection getConnection(){
		Connection con = null;
		
			try {
				Class.forName("com.mysql.jdbc.Driver");
				con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Shiv", "root", "shiv");
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {

				e.printStackTrace();
			}
	
		return con;
	}
	
	public ResultSet readUsers(){
		ResultSet set=null;
		Connection con= getConnection();
		try {
		Statement statement = con.createStatement();
		 set= statement.executeQuery("select * from Users");
		} catch (SQLException e) {
		
			e.printStackTrace();
		}
		return set;
	}
	
//	public void updateUser(){
//		
//		Connection con = getConnection();
//		try {
//			Statement statement = con.createStatement();
//			
//		} catch (SQLException e) {
//
//			e.printStackTrace();
//		}
//		
//	}
	
	public ResultSet logIn(String email , String password ){
		
		Connection con = getConnection();
		ResultSet set=null;
		try {
		PreparedStatement statement =con.prepareStatement("select * from Users where email=? and password=?");
		statement.setString(1, email);
		statement.setString(2, password);
		set=statement.executeQuery();
		
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return set;
		
	}
	
	public boolean insertUser(User user){
		
		Connection con = getConnection();
		try {
			PreparedStatement statement= con.prepareStatement("insert into Users values (?,?,?,?)");
			statement.setString(1, user.getEmail());
			statement.setString(2, user.getPassword());
			statement.setString(3, user.getUserName());
			statement.setString(4, user.getFullName());
			statement.execute();
			return true;
		} catch (SQLException e) {

			e.printStackTrace();
			return false;
		}
		
	}
	
	public boolean existence (User user){
		Connection con = getConnection();
		
		try {
			
			PreparedStatement statement = con.prepareStatement("select * from Users where email = ?");
			statement.setString(1, user.getEmail());
			ResultSet set = statement.executeQuery();
			set.next();
			System.out.println(set.getString("email"));
			
			return true;
			
		} catch (SQLException e) {
			
			
			e.printStackTrace();
			return false;
		}
		
	}
}
