package pms.model;

public class ClosedBean extends ProgramBean {
	private int numParticipant;
	public ClosedBean() {
		super();
	}
	public int getNumParticipant() {
		return numParticipant;
	}
	public void setNumParticipant(int numParticipant) {
		this.numParticipant = numParticipant;
	}
}
