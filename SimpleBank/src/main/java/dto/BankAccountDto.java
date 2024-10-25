package dto;

public class BankAccountDto 
{
	private String accountType,address;
	private long phone,accountNumber,aadhar;
	private double balance;
	
	//default constructor -co
	public BankAccountDto() {}

	
	// parameterised constructor
	public BankAccountDto(String accountType, String address, long phone, long accountNumber, long aadhar,
			double balance) {
		this.accountType = accountType;
		this.address = address;
		this.phone = phone;
		this.accountNumber = accountNumber;
		this.aadhar = aadhar;
		this.balance = balance;
	}

	// Getters and setters
	public String getAccountType() {
		return accountType;
	}

	public void setAccountType(String accountType) {
		this.accountType = accountType;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public long getPhone() {
		return phone;
	}

	public void setPhone(long phone) {
		this.phone = phone;
	}

	public long getAccountNumber() {
		return accountNumber;
	}

	public void setAccountNumber(long accountNumber) {
		this.accountNumber = accountNumber;
	}

	public long getAadhar() {
		return aadhar;
	}

	public void setAadhar(long aadhar) {
		this.aadhar = aadhar;
	}

	public double getBalance() {
		return balance;
	}

	public void setBalance(double balance) {
		this.balance = balance;
	}
	
	

	
	
	
	
}
