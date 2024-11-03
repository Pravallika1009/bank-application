package controller;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BankDao;

@WebServlet("/transfer")
public class Transfer extends HttpServlet
{
	String email=null;
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher dis=req.getRequestDispatcher("transfer.jsp");
		String remail=req.getParameter("remail");
		double amount=Double.parseDouble(req.getParameter("ramount"));
		HttpSession hs=req.getSession();
		String uemail=(String)hs.getAttribute("usercurrentemail");
		email=(String)hs.getAttribute("usercurrentemail");
		
		BankDao bank=new BankDao();
		boolean status=bank.transfer(amount, remail, uemail);
		if(status==false)
		{
			hs.setAttribute("tmssg", "Invalid Recipient Email or Insufficient Funds");
			dis.include(req, resp);
		}
		else if(status==true)
		{
			hs.setAttribute("tmssg", "Transaction Completed, Succesfully!");
			resp.sendRedirect("transfer.jsp");
		}
		
		
		
//		System.out.println("Transfer.java file current user email : "+uemail);
//		System.out.println("Transfer.java file recipient user email : "+remail);
//		System.out.println(status);
	}
}
