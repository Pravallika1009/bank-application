package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import dto.BankAccountDto;

public class BankDao {
	static UserDao obj=new UserDao();
	
	// bankdata Table Creation
	public void creatBankTable() {
		try 
		{
			PreparedStatement ps = obj.getConnection().prepareStatement("create table if not exists bankdata(accounttype varchar(45) ,phone BIGINT(10) primary key,"
					+ "accountNumber BIGINT(12) ,aadhar BIGINT(12),balance Double,ifsccode varchar(45),pin int,useremail varchar(45) unique);");
			ps.executeUpdate();
			ps.close();
			obj.getConnection().close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	// inserting BankDetails
	public int insertBankDetails(BankAccountDto b)
	{
		int res=0;
		try{
			PreparedStatement ps=obj.getConnection().prepareStatement("insert into bankdata values(?,?,?,?,?,?,?,?)");
			ps.setString(1,b.getAccountType());
			ps.setLong(2,b.getPhone());
			ps.setLong(3,b.getAccountNumber());
			ps.setLong(4,b.getAadhar());
			ps.setDouble(5,b.getBalance());
			ps.setString(6,b.getIFSC());
			ps.setInt(7,b.getPin());
			ps.setString(8,b.getEmail());
			res=ps.executeUpdate();
			ps.close();
			obj.getConnection().close();

		}catch(Exception e)
		{ 
			e.printStackTrace();
		}	
		return res;
	}

	
	// Fetching deatils from bankdata
	public BankAccountDto fetchDetails(String email)
	{
		BankAccountDto user=new BankAccountDto();
		try {
		PreparedStatement ps=obj.getConnection().prepareStatement("select * from bankdata where useremail=?");
		ps.setString(1,email);
		ResultSet rs=ps.executeQuery();
		if(rs.next()) 
		{
			user.setAadhar(rs.getLong("aadhar"));
			user.setAccountNumber(rs.getLong("accountnumber"));
			user.setAccountType(rs.getString("accounttype"));
			user.setBalance(rs.getLong("balance"));
			user.setPhone(rs.getLong("phone"));
			user.setPin(rs.getInt("pin"));
			user.setEmail(rs.getString("useremail"));
		}
		ps.close();
		obj.getConnection().close();
		rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return user;
	}
	
	//updating balance based on email
	public  void updateBalance(double amount,String email)
	{
		try {
			PreparedStatement ps1=obj.getConnection().prepareStatement("select balance from bankdata where useremail=?");
			ps1.setString(1,email);
			ResultSet rs=ps1.executeQuery();
			double currentbalance=0;
			if(rs.next())
			{
				currentbalance=rs.getDouble("balance");
			}
			
			PreparedStatement ps=obj.getConnection().prepareStatement("update bankdata set balance=? where useremail=?");
			ps.setDouble(1,(currentbalance+amount));
			ps.setString(2, email);
			ps.executeUpdate();
			ps.close();
			ps1.close();
			obj.getConnection().close();
			rs.close();
			obj.getConnection().close(); }
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	// Transaction 
	public boolean transaction(double amount, String remail, String uemail) {
		int res1 = 0;
		int res2 = 0;
		double famount = 0;
		boolean status = false;
		try {
			// user current balance
			double userCurrentBalance = 0;
			PreparedStatement ps1 = obj.getConnection().prepareStatement("select * from bankdata where useremail=?");
			ps1.setString(1, uemail);
			ResultSet rs1 = ps1.executeQuery();
			if(rs1.next()) {
				userCurrentBalance = rs1.getDouble("balance");
			}
			
			// recipient current balance
			double recipientCurrentBalance = 0;
			PreparedStatement ps2 = obj.getConnection().prepareStatement("select balance,useremail from bankdata where useremail=?");
			ps2.setString(1, remail);
			ResultSet rs2 = ps2.executeQuery();
			if (rs2.next()) {
				recipientCurrentBalance = rs2.getDouble("balance");
			}
			
			
			if (recipientCurrentBalance >0 && userCurrentBalance > 0 && remail.equals(rs2.getString("useremail")) 
					&& !(rs1.getString("useremail").equals(rs2.getString("useremail")))) {

				PreparedStatement ps = obj.getConnection().prepareStatement("update bankdata set balance=? where useremail=?");
				ps.setDouble(1, (userCurrentBalance - amount));
				ps.setString(2, uemail);
				res1 = ps.executeUpdate();
				
				// changes values in recipient balance
				PreparedStatement ps3 = obj.getConnection().prepareStatement("update bankdata set balance=? where useremail=?");
				ps3.setDouble(1, (recipientCurrentBalance + amount));
				ps3.setString(2, remail);
				res2 = ps3.executeUpdate();
				

				ps.close();
				ps3.close();
				
				if (res1 > 0 && res2 > 0) {
					status = true;
				} else {
					status = false;
				}
			} else {
				ps1.close();
				ps2.close();
				rs1.close();
				rs2.close();
				obj.getConnection().close();
				status = false;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}
	
	public static void main(String[] args)
	{
		BankDao obj=new BankDao();
	}
	
}
