package pms.model;

public class OrganizerBean {
    
	private String orgID;
    private String orgName;
    private String orgPassword;
    private String orgEmail;
	private String orgIC;
    private String orgPhone1;
    private String orgPhone2;
    private String typeOrganization;
    private String organization;
    private boolean valid;
    
    public String getOrgID() {
		return orgID;
	}
    public String getOrgName() {
		return orgName;
	}
	public String getOrgPassword() {
		return orgPassword;
	}
	public String getOrgEmail() {
		return orgEmail;
	}
	public String getOrgIC() {
		return orgIC;
	}
	public String getOrgPhone1() {
		return orgPhone1;
	}
	public String getOrgPhone2() {
		return orgPhone2;
	}
	public String getTypeOrganization() {
		return typeOrganization;
	}
	public String getOrganization() {
		return organization;
	}
	public boolean isValid() {
		return valid;
	}
	public void setOrgID(String orgID) {
		this.orgID = orgID;
	}
	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}
	public void setOrgPassword(String orgPassword) {
		this.orgPassword = orgPassword;
	}
	public void setOrgEmail(String orgEmail) {
		this.orgEmail = orgEmail;
	}
	public void setOrgIC(String orgIC) {
		this.orgIC = orgIC;
	}
	public void setOrgPhone1(String orgPhone1) {
		this.orgPhone1 = orgPhone1;
	}
	public void setOrgPhone2(String orgPhone2) {
		this.orgPhone2 = orgPhone2;
	}
	public void setTypeOrganization(String typeOrganization) {
		this.typeOrganization = typeOrganization;
	}
	public void setOrganization(String organization) {
		this.organization = organization;
	}
	public void setValid(boolean valid) {
		this.valid = valid;
	}
}
