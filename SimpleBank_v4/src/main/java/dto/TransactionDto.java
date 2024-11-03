package dto;

public class TransactionDto 
{
	private String uemail,remail,tstatus;
	private int id;
	private double tamount;
	
	public TransactionDto() {}

	public TransactionDto(String uemail, String remail, String tstatus, int id, double tamount) {
		super();
		this.uemail = uemail;
		this.remail = remail;
		this.tstatus = tstatus;
		this.id = id;
		this.tamount = tamount;
	};
	
	public String getUemail() {
		return uemail;
	}

	public void setUemail(String uemail) {
		this.uemail = uemail;
	}

	public String getRemail() {
		return remail;
	}

	public void setRemail(String remail) {
		this.remail = remail;
	}

	public String getTstatus() {
		return tstatus;
	}

	public void setTstatus(String tstatus) {
		this.tstatus = tstatus;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public double getTamount() {
		return tamount;
	}

	public void setTamount(double tamount) {
		this.tamount = tamount;
	}	
}
