package com.info.action;

import java.io.IOException;

import javax.servlet.http.*;

import org.apache.struts.action.*;

import com.info.dao.AuthDAO;

public class ChangePassword extends Action {
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response) throws Exception {
        
        // Check if the user is logged in
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("loggedInUser") == null) {
            // User is not logged in, redirect to login page or show an error message
        	try {
    			response.sendRedirect(request.getContextPath()+"/login.do");
    		} catch (IOException e) {
    			// TODO Auto-generated catch block
    			e.printStackTrace();
    		}
        }
        
        // User is logged in, proceed with password reset
        AuthDAO authDAO = new AuthDAO();
        
        String username = (String) session.getAttribute("loggedInUser");
        System.out.println("change pass for"+username);
        String password = request.getParameter("oldpassword");
        String newPassword = request.getParameter("newpassword");
        
        try {
            if (authDAO.authenticate(username, password)) {
            	System.out.println("changepassword Authenticated");
                authDAO.updatePassword(username, newPassword);
                request.setAttribute("isNormal", "true");
//                session = request.getSession(true);
//                session.invalidate();
                try {
        			response.sendRedirect(request.getContextPath()+"/login.do");
        		} catch (IOException e) {
        			// TODO Auto-generated catch block
        			e.printStackTrace();
        		}
               return mapping.findForward("success");
            } else {
                request.setAttribute("isNormal", "false");
                return mapping.findForward("failure");
            }
        } catch (Exception e) {
            request.setAttribute("isNormal", "false");
            return mapping.findForward("failure");
        }
    }
}

