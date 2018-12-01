package pms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import pms.connection.ConnectionManager;
import pms.model.ProgramBean;

public class ProgramDAO {
	static Connection currentCon = null;
	static ResultSet rs = null; 
	static PreparedStatement ps=null;
	static Statement stmt=null;

	//list pending program by id (organizer)
	public List<ProgramBean> getAllOrganizerPendingProgram(String orgID) {
		
	  List<ProgramBean> programs = new ArrayList<ProgramBean>();
	  
	  try {
		currentCon = ConnectionManager.getConnection();
		stmt = currentCon.createStatement();
		String q = "select progid, progname from program join status using (progid) where (progid, statusdate) in ( select progid, max(statusdate) from status group by progid) and status='DIPROSES' and orgid='" + orgID + "'";
		ResultSet rs = stmt.executeQuery(q);
	  
		  while (rs.next()) {
			  ProgramBean program = new ProgramBean();
			  program.setProgID(rs.getString("progID"));
			  program.setProgName(rs.getString("progName"));
			  
		      programs.add(program);
		  }
	  } catch (SQLException e) {
	      e.printStackTrace();
	  }
	  return programs;
	}
	
	//list approve program by id (organizer)
	public List<ProgramBean> getAllOrganizerApproveProgram(String orgID) {
			
	  List<ProgramBean> programs = new ArrayList<ProgramBean>();
	  
	  try {
		currentCon = ConnectionManager.getConnection();
		stmt = currentCon.createStatement();
		String q = "select progid, progname from program join status using (progid) where (progid, statusdate) in ( select progid, max(statusdate) from status group by progid) and status='LULUS' and orgid='" + orgID + "'";
		ResultSet rs = stmt.executeQuery(q);
	  
		  while (rs.next()) {
			  ProgramBean program = new ProgramBean();
			  program.setProgID(rs.getString("progID"));
			  program.setProgName(rs.getString("progName"));
			  
		      programs.add(program);
		  }
	  } catch (SQLException e) {
	      e.printStackTrace();
	  }
	  return programs;
	}
	
	//list reject program by id (organizer)
	public List<ProgramBean> getAllOrganizerRejectProgram(String orgID) {
		
	  List<ProgramBean> programs = new ArrayList<ProgramBean>();
	  
	  try {
		currentCon = ConnectionManager.getConnection();
		stmt = currentCon.createStatement();
		String q = "select progid, progname from program join status using (progid) where (progid, statusdate) in ( select progid, max(statusdate) from status group by progid) and status='GAGAL' and orgid='" + orgID + "'";
		ResultSet rs = stmt.executeQuery(q);
	  
		  while (rs.next()) {
			  ProgramBean program = new ProgramBean();
			  program.setProgID(rs.getString("progID"));
			  program.setProgName(rs.getString("progName"));
			  
		      programs.add(program);
		  }
	  } catch (SQLException e) {
	      e.printStackTrace();
	  }
	  return programs;
	}
	
	//get program by progid
	public ProgramBean getProgramByID(String progID) {
		ProgramBean program = new ProgramBean();
	    try {
	    	currentCon = ConnectionManager.getConnection();
	        ps=currentCon.prepareStatement("select * from PROGRAM where PROGID=?");
	
	        ps.setString(1, progID);
	        ResultSet rs = ps.executeQuery();
	
	        if (rs.next()) {
	        	program.setProgID(rs.getString("progID"));
	        	program.setProgName(rs.getString("progName"));
	        	program.setProgStartDate(rs.getDate("progStartDate"));
		  		program.setProgEndDate(rs.getDate("progEndDate"));
		  		program.setProgStartTime(rs.getTime("progStartTime"));
		  		program.setProgEndTime(rs.getTime("progEndTime"));
		  		program.setProgType(rs.getString("progType"));
		  		program.setOrgID(rs.getString("orgID"));
		  		program.setVenueID(rs.getString("venueID"));
		  		
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	
	    return program;
	}
	
	//delete program by id
	public void deleteProgramByID(String progID) {
		String searchQuery = "DELETE FROM PROGRAM WHERE PROGID= '" + progID + "'";
		
		try {
	
	        currentCon = ConnectionManager.getConnection();
	        stmt = currentCon.createStatement();
	        stmt.executeUpdate(searchQuery);
	        
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	}
}
