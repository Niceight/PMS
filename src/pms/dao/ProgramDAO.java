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

	//list program by id (organizer)
	public List<ProgramBean> getAllOrganizerProgram(String orgID) {
		
	  List<ProgramBean> programs = new ArrayList<ProgramBean>();
	  
	  try {
		currentCon = ConnectionManager.getConnection();
		stmt = currentCon.createStatement();
		String q = "select * from PROGRAM where ORGID = '" + orgID + "' order by progid desc";
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
