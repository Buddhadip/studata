package com.info.action;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.info.dao.*;
import com.info.form.*;

public class UpdateAction extends Action {
	public ActionForward execute(ActionMapping mapping, ActionForm form,HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
	        	
			userDAO stdao=new userDAO();
			
			RegistrationForm userDetails = (RegistrationForm) form;
			
			System.out.println(form);
			System.out.println( userDetails);
			
			stdao.updateStudent(userDetails);
			
			return mapping.findForward("success");
	}
}
