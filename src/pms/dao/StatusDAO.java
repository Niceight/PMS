package pms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import pms.connection.ConnectionManager;
import pms.model.AdminBean;
import pms.model.OrganizerBean;
import pms.model.ProgramBean;
import pms.model.StatusAdminOrganizerBean;
import pms.model.StatusBean;

public class StatusDAO {
	static Connection currentCon = null;
	static ResultSet rs = null; 
	static PreparedStatement ps=null;
	static Statement stmt=null;
	
	//add program to status table with progID
	public void addStatusProgram(String progID) {
		try {
			currentCon = ConnectionManager.getConnection();
			ps=currentCon.prepareStatement("insert into STATUS (PROGID)values(?)");
			ps.setString(1,progID);
			ps.executeUpdate();
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
	}

	//list all program with progID desc order
	public List<ProgramBean> getAllProgram() {
		
	  List<ProgramBean> programs = new ArrayList<ProgramBean>();
	  
	  try {
		currentCon = ConnectionManager.getConnection();
		stmt = currentCon.createStatement();
		String q = "select PROGID, PROGNAME from PROGRAM order by 1 desc";
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
	
	
	//get newest status program and its organizer name
	public StatusAdminOrganizerBean getStatusAndOrgName(String progID, String orgID) {
		StatusBean status = new StatusBean();
		AdminBean admin = new AdminBean();
		OrganizerBean organizer = new OrganizerBean();

		try {
			currentCon = ConnectionManager.getConnection();
			stmt = currentCon.createStatement();
			String q = "select *"
					+ "from (select STATUS, STATUSDATE, ADMNAME, ORGNAME "
						+ "from ADMIN "
						+ "join STATUS "
						+ "using (ADMID)"
						+ "join PROGRAM "
						+ "using (PROGID) "
						+ "join ORGANIZER "
						+ "using (ORGID) "
						+ "where PROGID = '" + progID + "' "
						+ "and ORGID = '" + orgID + "' "
						+ "order by 2 desc) "
					+ "where ROWNUM = 1";

			ResultSet rs = stmt.executeQuery(q);
		  
			  while (rs.next()) {
				  status.setStatus(rs.getString("status"));
				  status.setStatusDate(rs.getDate("statusDate"));
				  admin.setAdmName(rs.getString("admName"));
				  organizer.setOrgName(rs.getString("orgName"));
			  }
		  } catch (SQLException e) {
		      e.printStackTrace();
		  }
		  return new StatusAdminOrganizerBean(status,admin,organizer);
	}
	
	//update program to LULUS
	public void approveProgram(String progID, String admID) {
		try {
			currentCon = ConnectionManager.getConnection();
			ps=currentCon.prepareStatement("insert into STATUS (ADMID, PROGID, STATUS)values(?,?,?)");
			ps.setString(1,admID);
			ps.setString(2,progID);
			ps.setString(3,"LULUS");
			ps.executeUpdate();
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
	}

	//update program to GAGAL
	public void rejectProgram(String progID, String admID) {
		try {
			currentCon = ConnectionManager.getConnection();
			ps=currentCon.prepareStatement("insert into STATUS (ADMID, PROGID, STATUS)values(?,?,?)");
			ps.setString(1,admID);
			ps.setString(2,progID);
			ps.setString(3,"GAGAL");
			ps.executeUpdate();
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
	}

	//get status program by id
	public StatusBean getStatusProgram(String progID) {
		StatusBean status = new StatusBean();
		try {
			currentCon = ConnectionManager.getConnection();
			stmt = currentCon.createStatement();
			String q = "select status from (select status from status where progid ='" + progID + "' order by statusdate desc) where rownum = 1";
			ResultSet rs = stmt.executeQuery(q);
		  
			  while (rs.next()) {
				  status.setStatus(rs.getString("status"));
			  }
		  } catch (SQLException e) {
		      e.printStackTrace();
		  }
		return status;
	}
}
