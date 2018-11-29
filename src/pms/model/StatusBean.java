package pms.model;

import java.sql.Date;

public class StatusBean {

	private String progID;
	private String admID;
	private String status;
	private Date statusDate;
	
	public String getProgID() {
		return progID;
	}
	public String getAdmID() {
		return admID;
	}
	public String getStatus() {
		return status;
	}
	public Date getStatusDate() {
		return statusDate;
	}
	public void setProgID(String progID) {
		this.progID = progID;
	}
	public void setAdmID(String admID) {
		this.admID = admID;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public void setStatusDate(Date statusDate) {
		this.statusDate = statusDate;
	}
}
