package com.info.action;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.info.dao.userDAO;


public class DeleteAction extends Action {
	public ActionForward execute(ActionMapping mapping, ActionForm form,
	    HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		userDAO stdao=new userDAO();
		stdao.deleteStudent(request.getParameter("id"));
		
		System.out.println(request.getParameter("id"));
		    
	     return mapping.findForward("success");
	}
}
