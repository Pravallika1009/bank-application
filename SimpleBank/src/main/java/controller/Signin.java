package controller;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDao;

@WebServlet("/signin")
public class Signin extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String email=req.getParameter("email");
		String pass=req.getParameter("pass");
		
		try 
		{
			UserDao obj=new UserDao();
			PreparedStatement ps=obj.getConnection().prepareStatement("select * from userdata where email=?");
			ps.setString(1,email);
			ResultSet rs=ps.executeQuery();
			// request Dipatchers
			RequestDispatcher sigindispatch=req.getRequestDispatcher("index.jsp");
			if(rs.next())
			{
				if(rs.getString("pass").equals(pass))
				{
					res.sendRedirect("home.jsp");
				}
				else 
				{
					req.setAttribute("pmssg","password is invalid");
					sigindispatch.include(req, res); 
				}
			}
			else
			{
				req.setAttribute("mssg","Email is invalid");
				sigindispatch.include(req, res);
			}
			ps.close();
			rs.close();
			obj.getConnection().close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
}
