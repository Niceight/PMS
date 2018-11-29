package pms.model;

public class AdminBean {
	private String admID;
    private String admName;
    private String admPassword;
    private String admEmail;
    private String admPhone;
    private String svID;
    private boolean valid;
    
	public String getAdmID() {
		return admID;
	}
	public String getAdmName() {
		return admName;
	}
	public String getAdmPassword() {
		return admPassword;
	}
	public String getAdmEmail() {
		return admEmail;
	}
	public String getAdmPhone() {
		return admPhone;
	}
	public String getSvID() {
		return svID;
	}
	public boolean isValid() {
		return valid;
	}
	public void setAdmID(String admID) {
		this.admID = admID;
	}
	public void setAdmName(String admName) {
		this.admName = admName;
	}
	public void setAdmPassword(String admPassword) {
		this.admPassword = admPassword;
	}
	public void setAdmEmail(String admEmail) {
		this.admEmail = admEmail;
	}
	public void setAdmPhone(String admPhone) {
		this.admPhone = admPhone;
	}
	public void setSvID(String svID) {
		this.svID = svID;
	}
	public void setValid(boolean valid) {
		this.valid = valid;
	}
}
