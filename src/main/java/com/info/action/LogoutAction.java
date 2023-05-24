package com.info.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

public class LogoutAction extends Action{
	public ActionForward execute(ActionMapping mapping, ActionForm form,
	        HttpServletRequest request, HttpServletResponse response) throws Exception {
				String contextPath = request.getContextPath();
		HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate(); // Invalidate the session to remove all attributes
        }
        try {
			response.sendRedirect(contextPath+"/login.do");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        return null;
        //return mapping.findForward("success");
	}
}
