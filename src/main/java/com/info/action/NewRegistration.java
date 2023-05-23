package com.info.action;




import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.info.dao.*;
import com.info.form.*;



public class NewRegistration extends Action {
	public ActionForward execute(ActionMapping mapping, ActionForm form,HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
	        	
			userDAO stdao=new userDAO();
			AuthDAO adao= new AuthDAO();
			
			
			
			RegistrationForm userDetails = (RegistrationForm) form;
			try {
				stdao.insertStudent(userDetails);
				adao.insertAuth(userDetails.getStudentEmail(), userDetails.getDateOfBirth());
				System.out.println("working");
				request.setAttribute("isNormal", "true");
          	  	request.setAttribute("message","" );
				
				return mapping.findForward("success");
			}catch(SQLException e) {
				
				request.setAttribute("isNormal", "false");
          	  	request.setAttribute("message", "Email already exists");
          	   
				return mapping.findForward("failure");
			}
			
		
	}
};
