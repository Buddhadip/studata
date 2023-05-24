package com.info.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.info.dao.*;
import com.info.form.*;

public class DetailsAction  extends Action {
	public ActionForward execute(ActionMapping mapping, ActionForm form,
	        HttpServletRequest request, HttpServletResponse response) throws Exception {  
		
		userDAO stdao=new userDAO();
		List<RegistrationForm> studentList = stdao.getAllStudents();
		
		 request.setAttribute("studentList", studentList);
		    
	     return mapping.findForward("success");
	       
	}
}
