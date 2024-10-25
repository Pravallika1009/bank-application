package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.http.HttpServletRequest;

public class UserDao {
	// Connection object of :User
	public Connection getConnection() throws Exception {
		Class.forName("com.mysql.cj.jdbc.Driver");
		return DriverManager.getConnection("jdbc:mysql://localhost:3306/User?createDatabaseIfNotExist=true&user=root&password=root");
	}

	// userdata Table Creation
	public void creatUserTable() {
		try {
			PreparedStatement ps = getConnection().prepareStatement("create table if not exists userdata(email varchar(35) primary key,"
							+ "fname varchar(45),lname varchar(45),address varchar(100),pass varchar(45),phone BIGINT(10),age int)");
			ps.executeUpdate();
			ps.close();
			getConnection().close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
	// Insert Operation data into userdata table 
	public int insertUserDetails(HttpServletRequest req) throws Exception
	{
		creatUserTable();
		PreparedStatement ps=getConnection().prepareStatement("insert into userdata values(?,?,?,?,?,?,?)");
		ps.setString(1,req.getParameter("email"));
		ps.setString(2,req.getParameter("fname"));
		ps.setString(3,req.getParameter("lname"));
		ps.setString(4,req.getParameter("address"));
		ps.setString(5,req.getParameter("pass"));
		ps.setLong(6,Long.parseLong(req.getParameter("phone")));
		ps.setInt(7,Integer.parseInt(req.getParameter("age")));	
		int i=ps.executeUpdate();
		ps.close();
		getConnection().close();
		return i;
	}
	
	// Udpate Operation of userdata table
	public int updateUser(HttpServletRequest req)throws Exception
	{
		PreparedStatement ps=getConnection().prepareStatement("update userdata set pass=? where email=? and phone=?");
		ps.setString(1, req.getParameter("pass"));
		ps.setString(2, req.getParameter("email"));
		ps.setLong(3,Long.parseLong(req.getParameter("phone")));
		int i=ps.executeUpdate();
		ps.close();
		getConnection().close();
		return i;
	}

//	public static void main(String[] args) {
//		try {
//			UserDao obj = new UserDao();
//			obj.creatUserTable();
//			System.out.println("user table created");
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//	}

}
