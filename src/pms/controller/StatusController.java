package pms.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pms.dao.ClosedDAO;
import pms.dao.OpenDAO;
import pms.dao.ProgramDAO;
import pms.dao.StatusDAO;
/*import pms.model.StatusBean;*/
import pms.model.ClosedBean;
import pms.model.OpenBean;
import pms.model.ProgramBean;

/**
 * Servlet implementation class StatusController
 */
@WebServlet("/StatusController")
public class StatusController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private static String LIST_PROGRAM = "/admin/listProgram.jsp";
    private static String VALIDATE_PROGRAM = "/admin/validateProgram.jsp";
    private ProgramDAO dao;
    private OpenDAO opendao;
    private ClosedDAO closeddao;
    private StatusDAO statusdao;
    String forward="";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StatusController() {
        super();
        dao = new ProgramDAO();
        opendao = new OpenDAO();
        closeddao = new ClosedDAO();
        statusdao = new StatusDAO();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String action = request.getParameter("action");
        
        if (action.equalsIgnoreCase("validateProgram")){
        	String progID = request.getParameter("progID");
            forward = VALIDATE_PROGRAM;
            ProgramBean program = dao.getProgramByID(progID);
            request.setAttribute("program", program); 
            request.setAttribute("statusProgram", statusdao.getStatusAndOrgName(progID,program.getOrgID())); 
            if(program.getProgType().equalsIgnoreCase("Umum")) {
            	OpenBean open = opendao.getOpenProgramByID(progID);
            	request.setAttribute("openProgram", open); 
            }
            else {
            	ClosedBean closed = closeddao.getOpenProgramByID(progID);
            	request.setAttribute("closedProgram", closed); 
            }
        }
        else if (action.equalsIgnoreCase("approveProgram")) {
        	String progID = request.getParameter("progID");
        	String admID = request.getParameter("admID");
        	statusdao.approveProgram(progID,admID);
        	forward = LIST_PROGRAM;
        	request.setAttribute("programsDiproses", statusdao.getAllPendingProgram()); 
            request.setAttribute("programsLulus", statusdao.getAllApproveProgram());
            request.setAttribute("programsGagal", statusdao.getAllRejectProgram()); 
        }
        else if (action.equalsIgnoreCase("rejectProgram")) {
        	String progID = request.getParameter("progID");
        	String admID = request.getParameter("admID");
        	statusdao.rejectProgram(progID,admID);
        	forward = LIST_PROGRAM;
        	request.setAttribute("programsDiproses", statusdao.getAllPendingProgram()); 
            request.setAttribute("programsLulus", statusdao.getAllApproveProgram());
            request.setAttribute("programsGagal", statusdao.getAllRejectProgram()); 
        }
        else {
            forward = LIST_PROGRAM;
            request.setAttribute("programsDiproses", statusdao.getAllPendingProgram()); 
            request.setAttribute("programsLulus", statusdao.getAllApproveProgram());
            request.setAttribute("programsGagal", statusdao.getAllRejectProgram());
        }
        RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
