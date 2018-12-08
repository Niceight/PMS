package pms.model;

import java.sql.Date;

public class StatusAdminOrganizerBean {
	StatusBean status;
	AdminBean admin;
	OrganizerBean organizer;
	private String validateStatus;
	private Date validateStatusDate;
	private String validateAdmName;
	private String validateOrgName;
	
	public StatusAdminOrganizerBean(StatusBean status, AdminBean admin, OrganizerBean organizer) {
		validateStatus = status.getStatus();
		validateStatusDate = status.getStatusDate();
		validateAdmName = admin.getAdmName();
		validateOrgName = organizer.getOrgName();
	}
	
	public StatusAdminOrganizerBean(StatusBean status, AdminBean admin, AdminBean organizer) {
		validateStatus = status.getStatus();
		validateStatusDate = status.getStatusDate();
		validateAdmName = admin.getAdmName();
		validateOrgName = organizer.getAdmName();
	}

	public String getValidateStatus() {
		return validateStatus;
	}

	public Date getValidateStatusDate() {
		return validateStatusDate;
	}

	public String getValidateAdmName() {
		return validateAdmName;
	}

	public String getValidateOrgName() {
		return validateOrgName;
	}

	public void setValidateStatus(String validateStatus) {
		this.validateStatus = validateStatus;
	}

	public void setValidateStatusDate(Date validateStatusDate) {
		this.validateStatusDate = validateStatusDate;
	}

	public void setValidateAdmName(String validateAdmName) {
		this.validateAdmName = validateAdmName;
	}

	public void setValidateOrgName(String validateOrgName) {
		this.validateOrgName = validateOrgName;
	}

}
