package dto;

import java.util.Random;

public class BankAccountDto 
{
	private final String IFSCCode="SIMPLEBank";
	private String accountType,email;
	private int pin;
	private long phone,accountNumber,aadhar;
	private double balance;
	
	//default constructor -co
	public BankAccountDto() {}

	
	// parameterised constructor
	public BankAccountDto(String accountType,String email, long phone, long accountNumber, long aadhar,
			int pin,double balance) {
		this.accountType = accountType;
		this.email=email;
		this.phone = phone;
		this.accountNumber = accountNumber;
		this.aadhar = aadhar;
		this.pin=pin;
		this.balance = balance;
	}

	
	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	// Getters and setters
	public String getIFSC()
	{
		return IFSCCode;
	}
	public String getAccountType() {
		return accountType;
	}

	public void setAccountType(String accountType) {
		this.accountType = accountType;
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
	// pin getters and setters
	public int getPin() {
		return pin;
	}
	public void setPin(int pin) {
		this.pin = pin;
	}

	public double getBalance() {
		return balance;
	}

	public void setBalance(double balance) {
		this.balance = balance;
	}
	
	//random 12 digit number 
	public static long generateAccountNumber()
	{
		Random n1=new Random();
		Random n2=new Random();
		Random n3=new Random();
		long n=0;
		n=(n*10000)+n1.nextInt(0000,9999);
		n=(n*10000)+n2.nextInt(0000,9999);
		n=(n*10000)+n3.nextInt(0000,9999);
		return n;
	}
	
//	public static void main(String[] args)
//	{
//		System.out.println(generateAadhar());	
//	}
	
}
