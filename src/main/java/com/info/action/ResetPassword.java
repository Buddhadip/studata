package com.info.action;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.http.*;

import org.apache.struts.action.*;

import com.info.dao.AuthDAO;
public class ResetPassword extends Action {
	
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response) throws SQLException {
        
    	AuthDAO authDAO = new AuthDAO();
        // Get the entered OTP from the submitted form
        String enteredOTP = request.getParameter("otp");
        
        // Get the stored OTP from the session
        String storedOTP = (String) request.getSession().getAttribute("otp");
        System.out.println(storedOTP);
        
        if (enteredOTP.equals(storedOTP)) {
            // OTP is valid, allow password reset
        	 String email = (String) request.getSession().getAttribute("email");
             String newPassword = request.getParameter("newPassword");
             
            // Proceed with password reset logic
             boolean passwordUpdated = authDAO.updatePassword(email, newPassword);
             
             if (passwordUpdated) {
                 // Clear the OTP and email from the session
                 request.getSession().removeAttribute("otp");
                 request.getSession().removeAttribute("email");
                 try {
         			response.sendRedirect(request.getContextPath()+"/login.do");
         		} catch (IOException e) {
         			// TODO Auto-generated catch block
         			e.printStackTrace();
         		}
                 // Redirect to a success page or appropriate view
                 return mapping.findForward("success");
             } else {
                 // Handle password update failure
                 // Display appropriate error message to the user
                 return mapping.findForward("failure");
             }
         } else {
             // OTP is invalid
             // Display appropriate error message to the user
             return mapping.findForward("invalidOTP");
         }
    }
}
