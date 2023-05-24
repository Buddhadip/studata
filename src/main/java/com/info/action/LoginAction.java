package com.info.action;



import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.info.dao.AuthDAO;

public class LoginAction extends Action {

    public ActionForward execute(ActionMapping mapping, ActionForm form,
        HttpServletRequest request, HttpServletResponse response) throws Exception {
            
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String returnable = "failure";
        
        AuthDAO adao = new AuthDAO();
        if(username !=null) {
        try {
            if (adao.authenticate(username, password)) {
                HttpSession session = request.getSession();
                session.setAttribute("loggedInUser", username);
                System.out.println("hey" + username);
                try {
        			response.sendRedirect(request.getContextPath()+"/studentList.do");
        		} catch (IOException e) {
        			// TODO Auto-generated catch block
        			e.printStackTrace();
        		}
                returnable= "success";
            } else {
                request.setAttribute("isNormal", "false");
                request.setAttribute("message", "Incorrect username or password");
                returnable = "failure";
            }
        } catch (Exception e) {
            request.setAttribute("isNormal", "false");
            request.setAttribute("message", "An error occurred");
            returnable = "failure";
        }
        
        }
        else {
        	request.setAttribute("isNormal", "true");
        }
        return mapping.findForward(returnable);
    }
}