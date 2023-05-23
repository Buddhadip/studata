package com.info.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.info.form.RegistrationForm;

public class userDAO {

    private String jdbcURL;
    private String jdbcUsername;
    private String jdbcPassword;
    private Connection jdbcConnection;

    public userDAO() {
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
    public boolean insertStudent(RegistrationForm student) throws SQLException {
        String sql = "INSERT INTO student_details (full_name, college_name, university_name, dob, section, department, gender, email ) VALUES ( ?, ?, ?, ?, ?, ?, ?, ?)";
        connect();

        PreparedStatement statement = jdbcConnection.prepareStatement(sql);
        
        statement.setString(1, student.getFullName());
        statement.setString(2, student.getCollegeName());
        statement.setString(3, student.getUniversityName());
        statement.setString(4, student.getDateOfBirth());
        statement.setString(5, student.getSection());
        statement.setString(6, student.getStream());
        statement.setString(7, student.getGender());
        statement.setString(8, student.getStudentEmail());
        
        

        boolean rowInserted = statement.executeUpdate() > 0;
        statement.close();
        disconnect();
        return rowInserted;
    }

    // Retrieves a student record from the database using the student ID
    public RegistrationForm getStudent(String studentId) throws SQLException {
    	RegistrationForm student = null;
        String sql = "SELECT * FROM student_details WHERE student_id = '"+studentId+"'";
        connect();

        PreparedStatement statement = jdbcConnection.prepareStatement(sql);
        

        ResultSet resultSet = statement.executeQuery();
        if (resultSet.next()) {
            String fullName = resultSet.getString("full_name");
            String collegeName = resultSet.getString("college_name");
            String universityName = resultSet.getString("university_name");
            String dateOfBirth = resultSet.getString("dob");
            String section = resultSet.getString("section");
            String department = resultSet.getString("department");
            String gender = resultSet.getString("gender");
            String studentEmail = resultSet.getString("email");
            
            student =this.makeStudent (Integer.parseInt(studentId), fullName, collegeName, universityName, dateOfBirth, section, department, gender, studentEmail);
        }
        resultSet.close();
        statement.close();
        disconnect();
        return student;
    }


    public List<RegistrationForm> getAllStudents() throws SQLException {
        List<RegistrationForm> students = new ArrayList<>();
        String sql = "SELECT * FROM student_details";
        connect();

        PreparedStatement statement = jdbcConnection.prepareStatement(sql);
        

        ResultSet resultSet = statement.executeQuery();
        while (resultSet.next()) {
        	int studentId= resultSet.getInt("student_id");
            String fullName = resultSet.getString("full_name");
            String collegeName = resultSet.getString("college_name");
            String universityName = resultSet.getString("university_name");
            String dateOfBirth = resultSet.getString("dob");
            String section = resultSet.getString("section");
            String department = resultSet.getString("department");
            String gender = resultSet.getString("gender");
            String studentEmail = resultSet.getString("email");
            RegistrationForm  newStudent = this.makeStudent( studentId,fullName, collegeName, universityName, dateOfBirth, section, department, gender, studentEmail);
            students.add(newStudent);
        }
        resultSet.close();
        statement.close();
        disconnect();
//        for(RegistrationForm c:students) {
//        	System.out.println(c.getStudentId() +" | "+c.getFullName()+" | "+c.getStudentEmail());
//        }
    	return students;
    }

    public boolean deleteStudent(String id) throws SQLException {
        String sql = "DELETE from student_details WHERE student_id = '"+id+"'";
        connect();

        PreparedStatement statement = jdbcConnection.prepareStatement(sql);
        int rows = statement.executeUpdate();
        statement.close();
        disconnect();
        if (rows == 0) {
            return false;
        }
        else {
        	return true;
        }
    }
    
    public boolean updateStudent(RegistrationForm student) throws SQLException {
        String sql = "UPDATE student_details SET full_name = ?, college_name = ?,"
        		+ " university_name = ?, dob = ?, section = ?, department = ?,"
        		+ " gender = ? WHERE student_id = ?";
        connect();

        PreparedStatement statement = jdbcConnection.prepareStatement(sql);
        
        statement.setString(1, student.getFullName());
        statement.setString(2, student.getCollegeName());
        statement.setString(3, student.getUniversityName());
        statement.setString(4, student.getDateOfBirth());
        statement.setString(5, student.getSection());
        statement.setString(6, student.getStream());
        statement.setString(7, student.getGender());
        statement.setInt(8, student.getStudentId());
        
        

        boolean rowInserted = statement.executeUpdate() > 0;
        statement.close();
        disconnect();
        return rowInserted;
    }
    
    
    public RegistrationForm makeStudent( int id, String fullName, String collegeName, String universityName,
            String dateOfBirth, String section, String stream , String gender, String studentEmail) {
    	RegistrationForm student = new RegistrationForm();
    	
    	student.setStudentId(id);
    	student.setFullName(fullName);
    	student.setCollegeName(collegeName);
    	student.setUniversityName(universityName);
    	student.setDateOfBirth(dateOfBirth);
    	student.setSection(section);
    	student.setStream(stream);
    	student.setGender(gender);
    	student.setStudentEmail(studentEmail);
    	
    	return student;
    }
    
    
   
}