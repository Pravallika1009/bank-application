package controller;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDao;

import dto.UserDto;

@WebServlet("/profile")
public class ProfileJsp extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		UserDao usdao=new UserDao();
		HttpSession hs=req.getSession();
		String email=(String)hs.getAttribute("usercurrentemail");
		String pwd=(String)hs.getAttribute("usercurrentpass");
		System.out.println(email);
		
			try {
				UserDao obj=new UserDao();
				PreparedStatement ps=obj.getConnection().prepareStatement("select * from userdata where email=? and pass=?");
				ps.setString(1,email);
				ps.setString(2, pwd);
				ResultSet res = ps.executeQuery();
				if (res.next()) { 
					System.out.println("yes");
				    String fname=res.getString("fname");
				    String lname=res.getString("lname");
				    String address=res.getString("address");
				    Long phone=res.getLong("phone");
				    int age=res.getInt("age");
				    String gender=res.getString("gender");
				    UserDto userdto=new UserDto(fname,lname,email,address,phone,pwd,age,gender);
				    req.setAttribute("values", userdto);
				} else {
				    System.out.println("No user found with the provided credentials");
				}
				RequestDispatcher dispatch = req.getRequestDispatcher("profile.jsp");
				dispatch.include(req, resp);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
}
