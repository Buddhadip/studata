package com.info.action;

import javax.mail.MessagingException;
import javax.servlet.http.*;

import org.apache.struts.action.*;

public class ForgotPassword extends Action {

    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response) {
        
        // Get the user's email address from the submitted form
        String email = request.getParameter("email");

        // Generate OTP
        String otp = OTPGenerator.generateOTP(6);

        try {
            // Send email with OTP
            EmailUtil.sendEmail(email, otp);
            
            // Store the OTP in session for validation later
            request.getSession().setAttribute("email",email);
            request.getSession().setAttribute("otp", otp);
        } catch (MessagingException e) {
            // Handle email sending error
            e.printStackTrace();
            // Display appropriate error message to the user
        }
        
        // Proceed with further processing or redirect to a confirmation page
        
        return mapping.findForward("success");
    }
}
