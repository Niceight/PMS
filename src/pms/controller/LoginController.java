package pms.controller;

import java.io.IOException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.*;
import javax.servlet.http.*;

import pms.dao.AdminDAO;
import pms.dao.OrganizerDAO;
import pms.model.AdminBean;
import pms.model.OrganizerBean;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	//private OrganizerDAO dao;
    HttpServletRequest request;
    HttpServletResponse response;
    String forward="";
    String action="";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginController() {
        super();
        //dao = new OrganizerDAO();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		action = request.getParameter("action");
		String userType = request.getParameter("userType"); 
		
    	try {
    		if(userType.equalsIgnoreCase("organizer")) {
    			OrganizerBean organizer = new OrganizerBean();
        		organizer.setOrgEmail(request.getParameter("orgEmail"));
        		organizer.setOrgPassword(request.getParameter("orgPassword"));

        		organizer = OrganizerDAO.login(organizer);

    			if(organizer.isValid()) {
    				HttpSession session = request.getSession(true);
    				session.setAttribute("currentSessionOrganizerEmail", organizer.getOrgEmail());
    				session.setAttribute("currentSessionOrganizerName", organizer.getOrgName());
    				session.setAttribute("currentSessionOrganizerID", organizer.getOrgID());
    				response.sendRedirect("/PMS/organizer/index.jsp"); // logged-in page
    			}else {
    				response.sendRedirect("invalidLogin.jsp");
    			}
    		}
    		else if(userType.equalsIgnoreCase("admin")) {
    			AdminBean admin = new AdminBean();
    			admin.setAdmEmail(request.getParameter("admEmail"));
    			admin.setAdmPassword(request.getParameter("admPassword"));

    			admin = AdminDAO.login(admin);

    			if(admin.isValid()) {
    				HttpSession session = request.getSession(true);
    				session.setAttribute("currentSessionAdminEmail", admin.getAdmEmail());
    				session.setAttribute("currentSessionAdminName", admin.getAdmName());
    				session.setAttribute("currentSessionAdminID", admin.getAdmID());
    				response.sendRedirect("/PMS/admin/index.jsp"); // logged-in page
    			}else {
    				response.sendRedirect("invalidLogin.jsp");
    			}
    		}
    		else {
    			response.sendRedirect("invalidLogin.jsp");
    		}
    	}
		catch (Throwable ex) {
			System.out.println(ex);
		}
	}
}
