package pms.controller;

import java.io.IOException;
import javax.servlet.annotation.WebServlet;
import java.security.NoSuchAlgorithmException;
import javax.servlet.*;
import javax.servlet.http.*;

import pms.dao.OrganizerDAO;
import pms.model.OrganizerBean;

/**
 * Servlet implementation class OrganizerController
 */
@WebServlet("/OrganizerController")
public class OrganizerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	//private static String LOGIN = "/login.jsp";
	private static String REGISTER = "/register.jsp";
	private static String UPDATE = "/organizer/updateAccount.jsp";
	//private static String INDEX = "/organizer/index.jsp";
    private static String VIEW = "/organizer/viewAccount.jsp";
    private OrganizerDAO dao;
    String forward="";
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrganizerController() {
        super();
        dao = new OrganizerDAO();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

	if (action.equalsIgnoreCase("updateAccount")){
				forward = UPDATE;
            	String email = request.getParameter("orgEmail");
            	OrganizerBean organizer = dao.getOrganizerByEmail(email);
            	request.setAttribute("organizer", organizer);
        }
	else if (action.equalsIgnoreCase("viewAccount")){
				forward = VIEW;   
				String email= request.getParameter("orgEmail");
				OrganizerBean organizer = dao.getOrganizerByEmail(email);
				request.setAttribute("organizer", organizer);
		}
	else {
	           forward = REGISTER;
	}

	RequestDispatcher view = request.getRequestDispatcher(forward);
    view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	OrganizerBean organizer = new OrganizerBean();
    	organizer.setOrgName(request.getParameter("orgName"));
    	organizer.setOrgPassword(request.getParameter("orgPassword"));
    	organizer.setOrgEmail(request.getParameter("orgEmail"));
    	organizer.setOrgIC(request.getParameter("orgIC"));
    	organizer.setOrgPhone1(request.getParameter("orgPhone1"));
    	organizer.setOrgPhone2(request.getParameter("orgPhone2"));
    	organizer.setTypeOrganization(request.getParameter("typeOrganization"));
    	organizer.setOrganization(request.getParameter("organization"));
		
		
		String email = request.getParameter("orgEmail");
		
		organizer.setOrgEmail(email);
		
		organizer = OrganizerDAO.getOrganizer(organizer);

		if(!organizer.isValid()){
        	try {
				dao.add(organizer);
			} catch (NoSuchAlgorithmException e) {
				e.printStackTrace();
			}
        	
        	response.sendRedirect("login.jsp");
        }
		
        else{
        	try {
    			dao.updateAccount(organizer);
    		} catch (NoSuchAlgorithmException e) {
    			e.printStackTrace();
    		}
        	
            RequestDispatcher view = request.getRequestDispatcher(VIEW);
            request.setAttribute("organizer", dao.getOrganizerByEmail(email));
            view.forward(request, response);
        }
        
	}

}
