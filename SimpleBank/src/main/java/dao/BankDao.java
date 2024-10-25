package dao;

import java.sql.PreparedStatement;

import dto.BankAccountDto;

public class BankDao {
	UserDao obj = new UserDao();
	
	// bankdata Table Creation
	public void creatBankTable() {
		try 
		{
			PreparedStatement ps = obj.getConnection().prepareStatement("create table if not exists bankdata(accounttype varchar(45),address varchar(45),phone BIGINT(10) primary key,accountNumber BIGINT(10),aadhar BIGINT(12),balance Double)");
			ps.executeUpdate();
			ps.close();
			obj.getConnection().close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	// BankDetails
	public void insertBankDetails()
	{
		try{
			PreparedStatement ps=obj.getConnection().prepareStatement("insert into bankdata values(?,?,?,?,?,?)");
			ps.close();
			obj.getConnection().close();
			
		}catch(Exception e)
		{ 
			e.printStackTrace();
		}
		
	}

}
