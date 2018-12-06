package pms.controller;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pms.dao.AdminDAO;
import pms.model.AdminBean;

/**
 * Servlet implementation class AdminController
 */
@WebServlet("/AdminController")
public class AdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String VIEW = "/admin/viewAccount.jsp";
	private static final String UPDATE = "/admin/updateAccount.jsp";
	private static final String VIEW_ADMINS = "/admin/viewSubordinate.jsp";
	private static String REGISTER = "/admin/registerSubordinate.jsp";
	private AdminDAO admindao;
	String forward="";
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminController() {
        super();
        admindao = new AdminDAO();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");

		if (action.equalsIgnoreCase("updateAccount")){
				forward = UPDATE;
            	String email = request.getParameter("admEmail");
            	AdminBean admin = admindao.getAdminByEmail(email);
            	request.setAttribute("admin", admin);
        }
		else if (action.equalsIgnoreCase("viewAccount")){
				forward = VIEW;
	        	String email = request.getParameter("admEmail");
	        	AdminBean admin = admindao.getAdminByEmail(email);
	        	request.setAttribute("admin", admin);
		}
		else if(action.equalsIgnoreCase("registerAdmins")) {
		        forward = REGISTER;
		}
		else if(action.equalsIgnoreCase("viewAdmins")) {
				forward = VIEW_ADMINS;
				String svID = request.getParameter("admID");
	        	request.setAttribute("admins", admindao.getAdminBySvID(svID));
		}

		RequestDispatcher view = request.getRequestDispatcher(forward);
	    view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AdminBean admin = new AdminBean();
		admin.setAdmName(request.getParameter("admName"));
		admin.setAdmPassword(request.getParameter("admPassword"));
		admin.setAdmEmail(request.getParameter("admEmail"));
		admin.setAdmPhone(request.getParameter("admPhone"));
		admin.setSvID(request.getParameter("svID"));
		
		String email = request.getParameter("admEmail");
		String check = request.getParameter("check");
		
		admin = AdminDAO.getAdmin(admin);

		if(!admin.isValid()){
        	try {
				admindao.add(admin);
			} catch (NoSuchAlgorithmException e) {
				e.printStackTrace();
			}
        	
        	forward = VIEW_ADMINS;
        	request.setAttribute("admins", admindao.getAdminBySvID(admin.getSvID()));
        	RequestDispatcher view = request.getRequestDispatcher(forward);
    	    view.forward(request, response);
        }
		else if(admin.isValid() && check.equalsIgnoreCase("alreadyRegistered")) {
			response.sendRedirect("/admin/registerSubordinate?accountExist=.jsp");
		}
        else {
        	try {
        		admindao.updateAccount(admin);
    		} catch (NoSuchAlgorithmException e) {
    			e.printStackTrace();
    		}
        	
            RequestDispatcher view = request.getRequestDispatcher(VIEW);
            request.setAttribute("admin", admindao.getAdminByEmail(email));
            view.forward(request, response);
        }
	}

}
