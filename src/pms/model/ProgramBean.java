package pms.model;

import java.sql.Time;
import java.sql.Date;

public class ProgramBean {
	private String progID;
    private String progName;
    private Date progStartDate;
	private Date progEndDate;
    private Time progStartTime;
    private Time progEndTime;
    private String progType;
    private String orgID;
    private String venueID;
    
	public String getProgID() {
		return progID;
	}
	public String getProgName() {
		return progName;
	}
	public Date getProgStartDate() {
		return progStartDate;
	}
	public Date getProgEndDate() {
		return progEndDate;
	}
	public Time getProgStartTime() {
		return progStartTime;
	}
	public Time getProgEndTime() {
		return progEndTime;
	}
	public String getProgType() {
		return progType;
	}
	public String getOrgID() {
		return orgID;
	}
	public String getVenueID() {
		return venueID;
	}
	public void setProgID(String progID) {
		this.progID = progID;
	}
	public void setProgName(String progName) {
		this.progName = progName;
	}
	public void setProgStartDate(Date progStartDate) {
		this.progStartDate = progStartDate;
	}
	public void setProgEndDate(Date progEndDate) {
		this.progEndDate = progEndDate;
	}
	public void setProgStartTime(Time progStartTime) {
		this.progStartTime = progStartTime;
	}
	public void setProgEndTime(Time progEndTime) {
		this.progEndTime = progEndTime;
	}
	public void setProgType(String progType) {
		this.progType = progType;
	}
	public void setOrgID(String orgID) {
		this.orgID = orgID;
	}
	public void setVenueID(String venueID) {
		this.venueID = venueID;
	}
}
