package pms.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Time;

import pms.connection.ConnectionManager;
import pms.model.OpenBean;

public class OpenDAO {
	static Connection currentCon = null;
	static ResultSet rs = null; 
	static PreparedStatement ps=null, ps1=null;
	static Statement stmt=null;
	
	//add new open program
	public OpenBean addOpenProgram(OpenBean bean){
		
		String progName = bean.getProgName();
		Date progStartDate = bean.getProgStartDate();
		Date progEndDate = bean.getProgEndDate();
		Time progStartTime = bean.getProgStartTime();
		Time progEndTime = bean.getProgEndTime();
		String progType = bean.getProgType();
		String orgID = bean.getOrgID();
		String venueID = bean.getVenueID();
		String vipName = bean.getVipName();

		try {
			currentCon = ConnectionManager.getConnection();
			ps=currentCon.prepareStatement("insert into PROGRAM (PROGNAME, PROGSTARTDATE, PROGENDDATE, PROGSTARTTIME, PROGENDTIME, PROGTYPE, ORGID, VENUEID)"
					+ "values(?,?,?,?,?,?,?,?)");
			ps.setString(1,progName);
			ps.setDate(2,progStartDate);
			ps.setDate(3,progEndDate);
			ps.setTime(4,progStartTime);
			ps.setTime(5,progEndTime);
			ps.setString(6,progType);
			ps.setString(7,orgID);
			ps.setString(8,venueID);
			ps.executeUpdate();

			stmt = currentCon.createStatement();
	  	  	String q = "select PROGID from PROGRAM where PROGNAME = '" + progName + "' and PROGSTARTDATE = TO_DATE('" + progStartDate + "','YYYY/MM/DD')";
	  	  	ResultSet rs = stmt.executeQuery(q);
	  	  	while (rs.next()) {
	  	  		bean.setProgID(rs.getString("progID"));
		  	  	ps1=currentCon.prepareStatement("insert into OPEN (PROGID, VIPNAME)values(?,?)");
		  	  	ps1.setString(1,rs.getString("progID"));
				ps1.setString(2,vipName);
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

	//update open program
	public void updateOpenProgram(OpenBean bean) {

		String progID = bean.getProgID();
		String progName = bean.getProgName();
		Date progStartDate = bean.getProgStartDate();
		Date progEndDate = bean.getProgEndDate();
		Time progStartTime = bean.getProgStartTime();
		Time progEndTime = bean.getProgEndTime();
		String progType = bean.getProgType();
		String orgID = bean.getOrgID();
		String venueID = bean.getVenueID();
		String vipName = bean.getVipName();
		
		
		
		try {
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
			
	    	ps=currentCon.prepareStatement("select * from OPEN where PROGID=?");
  			ps.setString(1, progID);
  			ResultSet rs = ps.executeQuery();
  			
  			if (rs.next()) {
  				String searchQuery1 = "UPDATE OPEN SET VIPNAME= '" + vipName + "' WHERE PROGID= '" + progID + "'";
  				stmt = currentCon.createStatement();
  				stmt.executeUpdate(searchQuery1);
  			}
  			else {
  				stmt = currentCon.createStatement();
  				String q = "select PROGID from PROGRAM where PROGID = '" + progID + "'";
  		  	  	ResultSet rs1 = stmt.executeQuery(q);
  		  	  	while (rs1.next()) {
  			  	  	ps1=currentCon.prepareStatement("insert into OPEN (PROGID, VIPNAME)values(?,?)");
  			  	  	ps1.setString(1,progID);
  					ps1.setString(2,vipName);
  					ps1.executeUpdate();
  		  	  	}	
  			}
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	}
	
	//get vipName by progID
	public OpenBean getOpenProgramByID(String progID) {
		OpenBean open = new OpenBean();
	    try {
	    	currentCon = ConnectionManager.getConnection();
	    	ps=currentCon.prepareStatement("select * from OPEN where PROGID=?");
  			ps.setString(1, progID);
  			ResultSet rs = ps.executeQuery();
  			if (rs.next()) {
  				open.setVipName(rs.getString("vipName"));
  			}
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return open;
	}
	
	//check open program and if exist, delete it
	public void checkOpenProgram(String progID) {
		try {
	    	currentCon = ConnectionManager.getConnection();
	    	ps=currentCon.prepareStatement("select * from OPEN where PROGID=?");
  			ps.setString(1, progID);
  			ResultSet rs = ps.executeQuery();
  			
  			if (rs.next()) {
  				String searchQuery = "DELETE FROM OPEN WHERE PROGID= '" + progID + "'"; 
  				stmt = currentCon.createStatement();
  				stmt.executeUpdate(searchQuery);
  			}
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	}
}
