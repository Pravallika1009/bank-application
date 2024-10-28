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
import javax.servlet.http.HttpSession;

import dao.BankDao;
import dao.UserDao;
import dto.BankAccountDto;
import dto.UserDto;

@WebServlet("/signin")
public class LoginJsp extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String email=req.getParameter("email");
		String pass=req.getParameter("pass");
		
		// httpsession
		HttpSession hs=req.getSession();
		hs.setAttribute("usercurrentemail", email);
		hs.setAttribute("usercurrentpass",pass);
		
		
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
		
		//for Name on nav bar
		UserDao u=new UserDao();
		UserDto user=u.fetchUserDetails(email);
		hs.setAttribute("username", user.getFname());
		hs.setAttribute("userlname", user.getLname());
		hs.setAttribute("useraddress", user.getAddress());
		hs.setAttribute("userpass", user.getPass());
		hs.setAttribute("userphone",user.getPhone());
		hs.setAttribute("userage", user.getAge());
		hs.setAttribute("usergender", user.getGender());
		
		// for menu Bank menu
		BankDao b=new BankDao();
		BankAccountDto userbank=b.fetchDetails(email);
		if(userbank.getEmail()!=null &&userbank.getEmail().equals(email))
		{
			hs.setAttribute("display", "none");
		}
		else
		{
			hs.setAttribute("display", "block");
		}
		
	
	}
}
