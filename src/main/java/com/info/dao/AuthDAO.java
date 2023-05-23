package com.info.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class AuthDAO {
	private String jdbcURL;
    private String jdbcUsername;
    private String jdbcPassword;
    private Connection jdbcConnection;

    public AuthDAO() {
        this.jdbcURL = "jdbc:mysql://localhost:3306/student_master";
        this.jdbcUsername = "root";
        this.jdbcPassword = "buddhadipm";
    }

    // Establishes a database connection
    protected void connect() throws SQLException {
        if (jdbcConnection == null || jdbcConnection.isClosed()) {
            try {
                Class.forName("com.mysql.jdbc.Driver");
            } catch (ClassNotFoundException e) {
                throw new SQLException(e);
            }
            jdbcConnection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        }
    }

    // Closes the database connection
    protected void disconnect() throws SQLException {
        if (jdbcConnection != null && !jdbcConnection.isClosed()) {
            jdbcConnection.close();
        }
    }

    // Inserts a new student record into the database
    public boolean insertAuth(String username, String password) throws SQLException {
        String sql = "insert into user_credential(username,password) 	values ( ? , ?)";
        connect();

        PreparedStatement statement = jdbcConnection.prepareStatement(sql);
        
        statement.setString(1, username);
        statement.setString(2, this.parseDOB(password) );
       
        boolean rowInserted = statement.executeUpdate() > 0;
        statement.close();
        disconnect();
        return rowInserted;
    }
    
    public boolean authenticate(String username, String password) throws SQLException {
    	
        String sql = "SELECT * FROM user_credential WHERE username = '"+username +"'";
        connect();

        PreparedStatement statement = jdbcConnection.prepareStatement(sql);
        
        String real_password=null;
        ResultSet resultSet = statement.executeQuery();
        if (resultSet.next()) {
            real_password = resultSet.getString("password");
        }
        
        System.out.println(password+", "+ real_password);
        if(password.equals(real_password)) {
        	System.out.println(password+"HEY "+ real_password);
        	resultSet.close();
            statement.close();
            disconnect();
        	return true;
        }else {
        	System.out.println("Error occured");
        	resultSet.close();
            statement.close();
            disconnect();
        	return false;
        }
    }
    
    public boolean updatePassword(String username, String password) throws SQLException {
    	String sql = "update  user_credential set password=? where username=? ";
        connect();

        PreparedStatement statement = jdbcConnection.prepareStatement(sql);
        
        statement.setString(1, password);
        statement.setString(2, username);
       
        boolean updated = statement.executeUpdate() > 0;
        statement.close();
        disconnect();
        System.out.println("Updated"+updated);
        return updated;
    }
    
    public String parseDOB(String date) {
    	System.out.println(date);
    	String[] dateParts = date.split("-");
        String year = dateParts[0];
        String month = dateParts[1];
        String day = dateParts[2];

       

        // Concatenate the day, month, and year strings in the desired order
        String formattedDate = day + month +year ;

    	return formattedDate;
    }
}
