package pms.dao;

import java.sql.Connection;
import pms.connection.ConnectionManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import pms.model.VenueBean;

public class VenueDAO {
	static Connection currentCon = null;
	static ResultSet rs = null; 
	static PreparedStatement ps=null;
	static Statement stmt=null;

	public List<VenueBean> getAllVenue() {
		List<VenueBean> venues = new ArrayList<VenueBean>();
		try {
			currentCon = ConnectionManager.getConnection();
			stmt = currentCon.createStatement();
			String q = "select * from venue";
			ResultSet rs = stmt.executeQuery(q);
		  
			  while (rs.next()) {
				  VenueBean venue = new VenueBean();
				  venue.setVenueID(rs.getString("venueID"));
				  venue.setVenueName(rs.getString("venueName"));
				  
				  venues.add(venue);
			  }
		  } catch (SQLException e) {
		      e.printStackTrace();
		  }
		return venues;
	}

	public VenueBean getVenueProgramByID(String venueID) {
		VenueBean venue = new VenueBean();
	    try {
	    	currentCon = ConnectionManager.getConnection();
	        ps=currentCon.prepareStatement("select venueName from venue where venueID=?");
	
	        ps.setString(1, venueID);
	        ResultSet rs = ps.executeQuery();
	
	        if (rs.next()) {
	        	venue.setVenueName(rs.getString("venueName"));
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
		return venue;
	}

}
