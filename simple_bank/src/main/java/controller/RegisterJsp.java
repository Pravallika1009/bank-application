package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDao;

@WebServlet("/signup")
public class RegisterJsp extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		UserDao obj=new UserDao();
		try 
		{
			int rows=obj.insertUserDetails(req);
			if(rows>0)
			{
				req.setAttribute("smssg", "Registration Succesful");
				RequestDispatcher signindispatch=req.getRequestDispatcher("register.jsp");
				signindispatch.forward(req, res);
//				res.sendRedirect("register.jsp");
			}
		}
		catch(Exception e)
		{
			req.setAttribute("emssg", "Enter valid Details");
			RequestDispatcher signindispatch=req.getRequestDispatcher("register.jsp");
			signindispatch.include(req,res);
		}
	}
}