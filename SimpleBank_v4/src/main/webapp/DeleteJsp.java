package controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDao;

@WebServlet("/delete")
public class DeleteJsp extends HttpServlet
{
	UserDao obj=new UserDao();
		@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			try
			{
				HttpSession hs=req.getSession();
				String email=(String)hs.getAttribute("usercurrentemail");
				String pwd=(String)hs.getAttribute("usercurrentpass");
				
				int res=obj.deleteUserDetails(req);
				if(res==1)
				{
					req.getSession().setAttribute("dmssg", "Account Deleted");
				    resp.sendRedirect("index.jsp"); // Redirect to index.jsp
				}
				else
				{
					req.setAttribute("imssg", "Invalid Details");
					RequestDispatcher dispatcher=req.getRequestDispatcher("delete.jsp");
					dispatcher.include(req, resp);
				}
			}
			catch(Exception e)
			{
				req.setAttribute("inmssg", "Invalid Details");
				RequestDispatcher dispatcher=req.getRequestDispatcher("delete.jsp");
				dispatcher.include(req, resp);
			}
				
		}
}
