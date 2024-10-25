package controller;

import java.awt.geom.Rectangle2D;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDao;

@WebServlet("/forgotpassword")
public class Forgotpassword extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		UserDao user=new UserDao();
		try {
			int rows=user.updateUser(req);
			if(rows>0)
			{
				res.sendRedirect("index.jsp");
			}
			else
			{
				req.setAttribute("fpmssg", "YOU HAVE ENTERED INVALID EMAIL OR PHONE");
				RequestDispatcher fpdispatch=req.getRequestDispatcher("forgotpassword.jsp");
				fpdispatch.include(req, res);	
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
