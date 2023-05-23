package com.info.form;


import org.apache.struts.action.ActionForm;

public class RegistrationForm  extends ActionForm {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int studentId;
    private String fullName;
    private String collegeName;
    private String universityName;
    private String dateOfBirth;
    private String section;
    private String stream;
    private String gender;
    private String studentEmail;
    private String responsecode;
    

	
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	public String getCollegeName() {
		return collegeName;
	}
	public void setCollegeName(String collegeName) {
		this.collegeName = collegeName;
	}
	public String getUniversityName() {
		return universityName;
	}
	public void setUniversityName(String universityName) {
		this.universityName = universityName;
	}
	public String getDateOfBirth() {
		return dateOfBirth;
	}
	public void setDateOfBirth(String dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}
	public String getSection() {
		return section;
	}
	public void setSection(String section) {
		this.section = section;
	}
	public String getStream() {
		return stream;
	}
	public void setStream(String stream) {
		this.stream = stream;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getStudentEmail() {
		return studentEmail;
	}
	public void setStudentEmail(String studentEmail) {
		this.studentEmail = studentEmail;
	}
	public int getStudentId() {
		return studentId;

	}
	public void setStudentId(int studentId) {
		this.studentId = studentId;
	}
	
	 
    public String getResponsecode() {
		return responsecode;
	}

	public void setResponsecode(String responsecode) {
		this.responsecode = responsecode;
	}
	

}
