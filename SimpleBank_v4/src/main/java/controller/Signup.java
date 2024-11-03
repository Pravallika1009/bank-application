package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDao;

@WebServlet("/signup")
public class Signup extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		UserDao obj=new UserDao();
//		String fname=req.getParameter("fname");
//		String lname=req.getParameter("lname");
//		String email=req.getParameter("email");
//		String pass=req.getParameter("pass");
//		String address=req.getParameter("address");
//		long phone=Long.parseLong(req.getParameter("phone"));
//		int age=Integer.parseInt(req.getParameter("age"));
		try 
		{
			int rows=obj.insertUserDetails(req);
			if(rows>0)
			{
//				RequestDispatcher signindispatch=req.getRequestDispatcher("index.jsp");
//				signindispatch.forward(req, res);
				res.sendRedirect("index.jsp");
				HttpSession hs=req.getSession();
				hs.setAttribute("signupmssg","Signed Up Successfully");
			}
		}
		catch(Exception e)
		{
			req.setAttribute("emssg", "Enter valid Details");
			RequestDispatcher signindispatch=req.getRequestDispatcher("signup.jsp");
			signindispatch.include(req,res);
			e.printStackTrace();
		}
	}
}
