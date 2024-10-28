package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.http.HttpServletRequest;

import dto.UserDto;

public class UserDao {
	// Connection object of :User
	public Connection getConnection() throws Exception {
		Class.forName("com.mysql.cj.jdbc.Driver");
		return DriverManager.getConnection("jdbc:mysql://localhost:3306/user?createDatabaseIfNotExist=true&user=root&password=root");
	}

	// userdata Table Creation
	public void creatUserTable() {
		try {
			PreparedStatement ps = getConnection().prepareStatement("create table if not exists userdata(email varchar(35) primary key,"
							+ "fname varchar(45),lname varchar(45),address varchar(100),pass varchar(45),phone BIGINT(10),age int,gender VARCHAR(35))");
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
		PreparedStatement ps=getConnection().prepareStatement("insert into userdata values(?,?,?,?,?,?,?,?)");
		ps.setString(1,req.getParameter("email"));
		ps.setString(2,req.getParameter("fname"));
		ps.setString(3,req.getParameter("lname"));
		ps.setString(4,req.getParameter("address"));
		ps.setString(5,req.getParameter("pass"));
		ps.setLong(6,Long.parseLong(req.getParameter("phone")));
		ps.setInt(7,Integer.parseInt(req.getParameter("age")));
		ps.setString(8,req.getParameter("gender"));
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
	
	public int updateUserDetails(String fname, String lname, String email) {
	    int res = 0;
	    try {
	        PreparedStatement ps = getConnection().prepareStatement("UPDATE userdata SET fname=?, lname=? WHERE email=?");
	        ps.setString(1, fname);
	        ps.setString(2, lname);
	        ps.setString(3, email);
	        res = ps.executeUpdate();
	        ps.close();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return res;
	}
	public int update(UserDto userdto) throws Exception
	{
		PreparedStatement ps=getConnection().prepareStatement("update userdata set fname=?,lname=?,address=?,phone=?,age=?,gender=? where email=? and pass=?");
		ps.setString(1, userdto.getFname());
		ps.setString(2, userdto.getLname());
		ps.setString(3, userdto.getAddress());
		ps.setLong(4, userdto.getPhone());
		ps.setInt(5, userdto.getAge());
		ps.setString(6, userdto.getGender());
		ps.setString(7,userdto.getEmail());
		ps.setString(8, userdto.getPass());
		int a=ps.executeUpdate();
		ps.close();
		getConnection().close();
		return a;
	}


	//Fetching user Details from db
	public UserDto profile(UserDto udto) throws Exception
	{
		PreparedStatement ps=getConnection().prepareStatement("select * from user where email=?");
		ps.setString(1, udto.getEmail());
		ResultSet rs=ps.executeQuery();
		if(rs.next())
		{
			UserDto udto1=new UserDto(rs.getString("fname"), rs.getString("lname"), rs.getString("email"),rs.getString("address"),rs.getLong("phone"),null, rs.getInt("age"), rs.getString("gender"));
			return udto1;
		}
		return udto;
	}
	public int deleteUserDetails(HttpServletRequest req) throws Exception
	{
		PreparedStatement ps=getConnection().prepareStatement("delete from userdata where email=? and pass=?");
		ps.setString(1, req.getParameter("email"));
		ps.setString(2, req.getParameter("pass"));
		int res=ps.executeUpdate();
		ps.close();
		getConnection().close();
		return res;
		
	}
	
	public UserDto fetchUserDetails(String email)
	{
		UserDto user=new UserDto();
		try 
		{
			PreparedStatement ps=getConnection().prepareStatement("Select * from userdata where email=?");
			ps.setString(1, email);
			ResultSet rs=ps.executeQuery();
			if(rs.next())
			{
				user.setEmail(rs.getString("email"));
				user.setFname(rs.getString("fname"));
				user.setLname(rs.getString("lname"));
				user.setAddress(rs.getString("address"));
				user.setPass(rs.getString("pass"));
				user.setPhone(rs.getLong("phone"));
				user.setAge(rs.getInt("age"));
				user.setGender(rs.getString("gender"));
			}
			ps.close();
			rs.close();
			getConnection().close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return user;
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
