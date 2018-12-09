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
	
	//list approve program
	public List<ProgramBean> getAllApproveProgram() {
		
	  List<ProgramBean> programs = new ArrayList<ProgramBean>();
	  
	  try {
		currentCon = ConnectionManager.getConnection();
		stmt = currentCon.createStatement();
		String q = "select progname, progstartdate, progenddate from program join status using (progid) where (progid, statusdate) in ( select progid, max(statusdate) from status group by progid) and status='LULUS'";
		ResultSet rs = stmt.executeQuery(q);
	  
		  while (rs.next()) {
			  ProgramBean program = new ProgramBean();
			  program.setProgName(rs.getString("progName"));
			  program.setProgStartDate(rs.getDate("progStartDate"));
			  program.setProgEndDate(rs.getDate("progEndDate"));
			  
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
		  		program.setAdmID(rs.getString("admID"));
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	
	    return program;
	}
	
	//list pending program by id (admin)
		public List<ProgramBean> getAllAdminPendingProgram(String admID) {
			
		  List<ProgramBean> programs = new ArrayList<ProgramBean>();
		  
		  try {
			currentCon = ConnectionManager.getConnection();
			stmt = currentCon.createStatement();
			String q = "select progid, progname from program p join status s using (progid) where (progid, statusdate) in ( select progid, max(statusdate) from status group by progid) and status='DIPROSES' and p.admid='" + admID + "'";
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
		
		//list approve program by id (admin)
		public List<ProgramBean> getAllAdminApproveProgram(String admID) {
				
		  List<ProgramBean> programs = new ArrayList<ProgramBean>();
		  
		  try {
			currentCon = ConnectionManager.getConnection();
			stmt = currentCon.createStatement();
			String q = "select progid, progname from program p join status s using (progid) where (progid, statusdate) in ( select progid, max(statusdate) from status group by progid) and status='LULUS' and p.admid='" + admID + "'";
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
		
		//list reject program by id (admin)
		public List<ProgramBean> getAllAdminRejectProgram(String admID) {
			
		  List<ProgramBean> programs = new ArrayList<ProgramBean>();
		  
		  try {
			currentCon = ConnectionManager.getConnection();
			stmt = currentCon.createStatement();
			String q = "select progid, progname from program p join status s using (progid) where (progid, statusdate) in ( select progid, max(statusdate) from status group by progid) and status='GAGAL' and p.admid='" + admID + "'";
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
