package pms.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Time;

import pms.connection.ConnectionManager;
import pms.model.ClosedBean;

public class ClosedDAO {
	static Connection currentCon = null;
	static ResultSet rs = null; 
	static PreparedStatement ps=null, ps1=null;
	static Statement stmt=null;

	//add new closed program
	public ClosedBean addClosedProgram(ClosedBean bean){
		
		String progName = bean.getProgName();
		Date progStartDate = bean.getProgStartDate();
		Date progEndDate = bean.getProgEndDate();
		Time progStartTime = bean.getProgStartTime();
		Time progEndTime = bean.getProgEndTime();
		String progType = bean.getProgType();
		String orgID = bean.getOrgID();
		String venueID = bean.getVenueID();
		String admID = bean.getAdmID();
		int numParticipant = bean.getNumParticipant();

		try {
			currentCon = ConnectionManager.getConnection();
			ps=currentCon.prepareStatement("insert into PROGRAM (PROGNAME, PROGSTARTDATE, PROGENDDATE, PROGSTARTTIME, PROGENDTIME, PROGTYPE, ORGID, VENUEID, ADMID)"
					+ "values(?,?,?,?,?,?,?,?,?)");
			ps.setString(1,progName);
			ps.setDate(2,progStartDate);
			ps.setDate(3,progEndDate);
			ps.setTime(4,progStartTime);
			ps.setTime(5,progEndTime);
			ps.setString(6,progType);
			ps.setString(7,orgID);
			ps.setString(8,venueID);
			ps.setString(9,admID);
			ps.executeUpdate();
			
			stmt = currentCon.createStatement();
	  	  	String q = "select PROGID from PROGRAM where PROGNAME = '" + progName + "' and PROGSTARTDATE = TO_DATE('" + progStartDate + "','YYYY/MM/DD')";
	  	  	ResultSet rs = stmt.executeQuery(q);
	  	  	while (rs.next()) {
	  	  		bean.setProgID(rs.getString("progID"));
		  	  	ps1=currentCon.prepareStatement("insert into CLOSED (PROGID, NUMPARTICIPANT)values(?,?)");
		  	  	ps1.setString(1,rs.getString("progID"));
		  	  	ps1.setInt(2,numParticipant);
				ps1.executeUpdate();
	  	  	}	
		}

		catch (Exception ex) {
			System.out.println("failed: An Exception has occurred! " + ex);
		}

		finally {
			if (ps != null) {
				try {
					ps.close();
				} catch (Exception e) {
				}
				ps = null;
			}
			
			if (currentCon != null) {
				try {
					currentCon.close();
				} catch (Exception e) {
				}
				currentCon = null;
			}
		}
		return bean;
		}
	
	//update closed program
	public void updateClosedProgram(ClosedBean bean) {

		String progID = bean.getProgID();
		String progName = bean.getProgName();
		Date progStartDate = bean.getProgStartDate();
		Date progEndDate = bean.getProgEndDate();
		Time progStartTime = bean.getProgStartTime();
		Time progEndTime = bean.getProgEndTime();
		String progType = bean.getProgType();
		String orgID = bean.getOrgID();
		String venueID = bean.getVenueID();
		String admID = bean.getAdmID();
		int numParticipant = bean.getNumParticipant();
		
		try {
			if(orgID == null) {
				currentCon = ConnectionManager.getConnection();
				
				String searchQuery = "UPDATE PROGRAM SET PROGNAME= '" + progName + "', "
						+ "PROGSTARTDATE= TO_DATE('" + progStartDate + "','YYYY/MM/DD'), "
						+ "PROGENDDATE= TO_DATE('" + progEndDate + "','YYYY/MM/DD') , "
						+ "PROGSTARTTIME= TO_DATE('" + progStartTime + "','HH24-MI-SS'), "
						+ "PROGENDTIME= TO_DATE('" + progEndTime + "','HH24-MI-SS'), "
						+ "PROGTYPE='" + progType 
						+ "', VENUEID='" + venueID 
						+ "', ADMID='" + admID 
						+ "' WHERE PROGID= '" + progID + "'";
				stmt = currentCon.createStatement();
		        stmt.executeUpdate(searchQuery);
				
		    	ps=currentCon.prepareStatement("select * from CLOSED where PROGID=?");
	  			ps.setString(1, progID);
	  			ResultSet rs = ps.executeQuery();
	  			
	  			if (rs.next()) {
	  				String searchQuery1 = "UPDATE CLOSED SET NUMPARTICIPANT= " + numParticipant + " WHERE PROGID= '" + progID + "'";
	  				stmt = currentCon.createStatement();
	  				stmt.executeUpdate(searchQuery1);
	  			}
	  			else {
	  				stmt = currentCon.createStatement();
	  				String q = "select PROGID from PROGRAM where PROGID = '" + progID + "'";
	  		  	  	ResultSet rs1 = stmt.executeQuery(q);
	  		  	  	while (rs1.next()) {
	  			  	  	ps1=currentCon.prepareStatement("insert into CLOSED (PROGID, NUMPARTICIPANT)values(?,?)");
	  			  	  	ps1.setString(1,progID);
	  			  	  	ps1.setInt(2,numParticipant);
	  					ps1.executeUpdate();
	  		  	  	}	
	  			}
			}
			else {
				currentCon = ConnectionManager.getConnection();
				
				String searchQuery = "UPDATE PROGRAM SET PROGNAME= '" + progName + "', "
						+ "PROGSTARTDATE= TO_DATE('" + progStartDate + "','YYYY/MM/DD'), "
						+ "PROGENDDATE= TO_DATE('" + progEndDate + "','YYYY/MM/DD') , "
						+ "PROGSTARTTIME= TO_DATE('" + progStartTime + "','HH24-MI-SS'), "
						+ "PROGENDTIME= TO_DATE('" + progEndTime + "','HH24-MI-SS'), "
						+ "PROGTYPE='" + progType 
						+ "', ORGID='" + orgID 
						+ "', VENUEID='" + venueID 
						+ "' WHERE PROGID= '" + progID + "'";
				stmt = currentCon.createStatement();
		        stmt.executeUpdate(searchQuery);
				
		    	ps=currentCon.prepareStatement("select * from CLOSED where PROGID=?");
	  			ps.setString(1, progID);
	  			ResultSet rs = ps.executeQuery();
	  			
	  			if (rs.next()) {
	  				String searchQuery1 = "UPDATE CLOSED SET NUMPARTICIPANT= " + numParticipant + " WHERE PROGID= '" + progID + "'";
	  				stmt = currentCon.createStatement();
	  				stmt.executeUpdate(searchQuery1);
	  			}
	  			else {
	  				stmt = currentCon.createStatement();
	  				String q = "select PROGID from PROGRAM where PROGID = '" + progID + "'";
	  		  	  	ResultSet rs1 = stmt.executeQuery(q);
	  		  	  	while (rs1.next()) {
	  			  	  	ps1=currentCon.prepareStatement("insert into CLOSED (PROGID, NUMPARTICIPANT)values(?,?)");
	  			  	  	ps1.setString(1,progID);
	  			  	  	ps1.setInt(2,numParticipant);
	  					ps1.executeUpdate();
	  		  	  	}	
	  			}
			}
			
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	}
	
	//get vipName by progID
	public ClosedBean getClosedProgramByID(String progID) {
		ClosedBean closed = new ClosedBean();
	    try {
	    	currentCon = ConnectionManager.getConnection();
	    	ps=currentCon.prepareStatement("select * from CLOSED where PROGID=?");
  			ps.setString(1, progID);
  			ResultSet rs = ps.executeQuery();
  			if (rs.next()) {
  				closed.setNumParticipant(rs.getInt("numParticipant"));
  			}
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return closed;
	}
	
	//check closed program and if exist, delete it
	public void checkClosedProgram(String progID) {
		try {
	    	currentCon = ConnectionManager.getConnection();
	    	ps=currentCon.prepareStatement("select * from CLOSED where PROGID=?");
  			ps.setString(1, progID);
  			ResultSet rs = ps.executeQuery();
  			
  			if (rs.next()) {
  				String searchQuery = "DELETE FROM CLOSED WHERE PROGID= '" + progID + "'"; 
  				stmt = currentCon.createStatement();
  				stmt.executeUpdate(searchQuery);
  			}
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	}
}
