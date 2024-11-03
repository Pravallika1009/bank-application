package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import dto.BankAccountDto;
import dto.TransactionDto;

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
	
	//creates transactionsdata table
	public void createTransactionTable() {
		try 
		{
			PreparedStatement ps = obj.getConnection().prepareStatement("create table if not exists transactiondata(id int auto_increment primary key,uemail varchar(45),remail varchar(45),tamount double,tstatus varchar(45));");
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
		creatBankTable();
		
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
	
	// transfer money Based on email
	public boolean transfer(double amount, String remail, String uemail)
	{
		createTransactionTable();
		BankDao bankdb=new BankDao();
		BankAccountDto rbank=bankdb.fetchDetails(remail);
		BankAccountDto ubank=bankdb.fetchDetails(uemail);
		boolean status=false;
		int res1=0,res2=0;
		if(!(rbank.getEmail()==null || ubank.getEmail()==null)&&rbank.getBalance()>=0 && ubank.getBalance()>0 && rbank.getEmail().equals(remail) && (ubank.getEmail().equals(uemail)) &&!(uemail.equals(remail)))
		{
			try 
			{
				// changes values in user bank
				PreparedStatement ps = obj.getConnection().prepareStatement("update bankdata set balance=? where useremail=?");
				ps.setDouble(1, (ubank.getBalance() - amount));
				ps.setString(2, uemail);
				res1 = ps.executeUpdate();
				
				// changes values in recipient balance
				PreparedStatement ps3 = obj.getConnection().prepareStatement("update bankdata set balance=? where useremail=?");
				ps3.setDouble(1, (rbank.getBalance()+ amount));
				ps3.setString(2, remail);
				res2 = ps3.executeUpdate();
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
			// for mssg prupose
			if(res1>0 && res2>0)
			{
				status=true;
				System.out.println(status);
				try {
					PreparedStatement ps4= obj.getConnection().prepareStatement("insert into transactiondata (uemail,remail,tamount,tstatus) values(?,?,?,?)");
					ps4.setString(1, uemail);
					ps4.setString(2, remail);
					ps4.setDouble(3, amount);
					ps4.setString(4, "success");
					ps4.executeUpdate();
					ps4.close();
					obj.getConnection().close();
				}
				catch(Exception e)
				{
					e.printStackTrace();
				}
			}
		}
		else
		{
//			System.out.println("user deatils mismatch");
//			System.out.println("bankdao user email	:"+ubank.getEmail()+"\nuser balance		:"+ubank.getBalance());
//			System.out.println("bankdao recipient email	:"+rbank.getEmail()+"\nrecipient balance	:"+rbank.getBalance());
			status=false;
			System.out.println(status);
			try {
				PreparedStatement ps4= obj.getConnection().prepareStatement("insert into transactiondata (uemail,remail,tamount,tstatus) values(?,?,?,?)");
				ps4.setString(1, uemail);
				ps4.setString(2, remail);
				ps4.setDouble(3, amount);
				ps4.setString(4, "Failed");
				ps4.executeUpdate();
				ps4.close();
				obj.getConnection().close();
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
		}
		return status;
	}
	
	// for transactions
	public ResultSet getTransactions(String uemail)throws Exception
	{
		createTransactionTable() ;
		PreparedStatement ps=obj.getConnection().prepareStatement("select * from transactiondata where uemail=?");
		ps.setString(1, uemail);
		return ps.executeQuery();
	}
	
	
}
