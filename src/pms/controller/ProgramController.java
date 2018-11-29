package pms.controller;

import java.io.IOException;
import javax.servlet.annotation.WebServlet;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.*;
import javax.servlet.http.*;

import pms.dao.ClosedDAO;
import pms.dao.OpenDAO;
import pms.dao.ProgramDAO;
import pms.dao.StatusDAO;
import pms.model.ClosedBean;
import pms.model.OpenBean;
import pms.model.ProgramBean;

/**
 * Servlet implementation class ProgramController
 */
@WebServlet("/ProgramController")
public class ProgramController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static String INSERT = "/organizer/bookProgram.jsp";
    private static String LIST_PROGRAM = "/organizer/myProgram.jsp";
    private static String VIEW_PROGRAM = "/organizer/viewProgram.jsp";
    private static String UPDATE_PROGRAM = "/organizer/updateProgram.jsp";
    private ProgramDAO dao;
    private OpenDAO opendao;
    private ClosedDAO closeddao;
    private StatusDAO statusdao;
    String forward="";
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProgramController() {
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
        
        if (action.equalsIgnoreCase("myProgram")){
            String orgID = request.getParameter("orgID");
            forward = LIST_PROGRAM;
            request.setAttribute("programs", dao.getAllOrganizerProgram(orgID)); 
        }
        else if(action.equalsIgnoreCase("viewProgram")){
        	String progID = request.getParameter("progID");
            forward = VIEW_PROGRAM;
            ProgramBean program = dao.getProgramByID(progID);
            request.setAttribute("program", program);
            request.setAttribute("statusProgram", statusdao.getStatusProgram(progID)); 
            if(program.getProgType().equalsIgnoreCase("Umum")) {
            	OpenBean open = opendao.getOpenProgramByID(progID);
            	request.setAttribute("openProgram", open); 
            	
            }
            else {
            	ClosedBean closed = closeddao.getOpenProgramByID(progID);
            	request.setAttribute("closedProgram", closed); 
            }
        }
        else if(action.equalsIgnoreCase("updateProgram")) {
        	String progID = request.getParameter("progID");
            forward = UPDATE_PROGRAM;
            ProgramBean program = dao.getProgramByID(progID);
            request.setAttribute("program", program); 
            if(program.getProgType().equalsIgnoreCase("Umum")) {
            	OpenBean open = opendao.getOpenProgramByID(progID);
            	request.setAttribute("openProgram", open); 
            }
            else {
            	ClosedBean closed = closeddao.getOpenProgramByID(progID);
            	request.setAttribute("closedProgram", closed); 
            }
        }
        else if(action.equalsIgnoreCase("deleteProgram")) {
        	String progID = request.getParameter("progID");
        	String orgID = request.getParameter("orgID");
        	dao.deleteProgramByID(progID);
        	forward = LIST_PROGRAM;
        	request.setAttribute("programs", dao.getAllOrganizerProgram(orgID)); 
        }
        else {
            forward = INSERT;
        }
        RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		OpenBean open = new OpenBean();
		ClosedBean closed = new ClosedBean();
		
		String progID = request.getParameter("progID");
		String progStartDate = request.getParameter("progStartDate");
		String progEndDate = request.getParameter("progEndDate");
		String progStartTime = request.getParameter("progStartTime");
		String progEndTime = request.getParameter("progEndTime");
		String progType = request.getParameter("progType");
		String orgID = request.getParameter("orgID");
		
		SimpleDateFormat parsedate = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat time = new SimpleDateFormat("hh:mm");
		
		try {  
			 
			java.util.Date pd1 = (java.util.Date)parsedate.parse(progStartDate);
			java.util.Date pd2 = (java.util.Date)parsedate.parse(progEndDate); 
			java.util.Date t1 = (java.util.Date)time.parse(progStartTime); 
			java.util.Date t2 = (java.util.Date)time.parse(progEndTime);
			java.sql.Date startDate = new java.sql.Date(pd1.getTime());
		    java.sql.Date endDate = new java.sql.Date(pd2.getTime());
		    java.sql.Time startTime = new java.sql.Time(t1.getTime());
		    java.sql.Time endTime = new java.sql.Time(t2.getTime());
			
			if(progType.equalsIgnoreCase("Umum")) {
				open.setProgName(request.getParameter("progName"));
				open.setProgStartDate(startDate);
				open.setProgEndDate(endDate);
				open.setProgStartTime(startTime);
				open.setProgEndTime(endTime);
				open.setProgType(progType);
				open.setOrgID(request.getParameter("orgID"));
				open.setVenueID(request.getParameter("venueID"));
				open.setVipName(request.getParameter("vipName"));
				
				if(progID == null || progID.isEmpty()) {
			            open = opendao.addOpenProgram(open);
			            statusdao.addStatusProgram(open.getProgID());
		        }
		        else {
		        	open.setProgID(progID);
		            opendao.updateOpenProgram(open);
		            closeddao.checkClosedProgram(progID);
		        }
			        
		        forward = LIST_PROGRAM;
		        request.setAttribute("programs", dao.getAllOrganizerProgram(orgID)); 
		        RequestDispatcher view = request.getRequestDispatcher(forward);
		        view.forward(request, response);
			}
			else {
				closed.setProgName(request.getParameter("progName"));
				closed.setProgStartDate(startDate);
				closed.setProgEndDate(endDate);
				closed.setProgStartTime(startTime);
				closed.setProgEndTime(endTime);
				closed.setProgType(progType);
				closed.setOrgID(request.getParameter("orgID"));
				closed.setVenueID(request.getParameter("venueID"));
				closed.setNumParticipant(Integer.parseInt(request.getParameter("numParticipant")));
				
				if(progID == null || progID.isEmpty()) {
		            closed = closeddao.addClosedProgram(closed);
		            statusdao.addStatusProgram(closed.getProgID());
		        }
		        else {
		        	closed.setProgID(progID);
		            closeddao.updateClosedProgram(closed);
		            opendao.checkOpenProgram(progID);
		        }
		        
		        forward = LIST_PROGRAM;
		        request.setAttribute("programs", dao.getAllOrganizerProgram(orgID)); 
		        RequestDispatcher view = request.getRequestDispatcher(forward);
		        view.forward(request, response);
			}
		} catch (ParseException e) {
			System.out.println("Failed to convert parameter string to date");
			e.printStackTrace();
		} 
	}
}
