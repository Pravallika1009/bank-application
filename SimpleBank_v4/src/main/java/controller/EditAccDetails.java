package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDao;
import dto.UserDto;

@WebServlet("/editaccountdetails")
public class EditAccDetails extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		HttpSession hs=req.getSession();
		String email=(String)hs.getAttribute("usercurrentemail");
		String fname=req.getParameter("fname");
		String lname=req.getParameter("lname");
		hs.setAttribute("amount",req.getParameter("amount"));
		UserDao userdb=new UserDao();
		int res=userdb.updateUserDetails(fname,lname,email);
		RequestDispatcher dis=req.getRequestDispatcher("accountdetails.jsp");
		if(res>0)
		{
			dis.include(req, resp);
			req.setAttribute("updatemssg","udpate succuesfully!");
		}
		else {
			dis.include(req, resp);
			req.setAttribute("updatemssg","Failed to update details");
		}	
	}
}
