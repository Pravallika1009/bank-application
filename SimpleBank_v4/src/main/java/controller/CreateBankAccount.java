package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BankDao;
import dto.BankAccountDto;

@WebServlet("/accountdetails")
public class CreateBankAccount extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		String acctype=req.getParameter("accountType");
//		long phone=Long.parseLong(req.getParameter("phone"));
		long aadhar=Long.parseLong(req.getParameter("aadhar"));
		int pin=Integer.parseInt(req.getParameter("pin"));
//		System.out.println(acctype+"\n"+phone+"\n"+aadhar+"\n"+pin);
		
		HttpSession hs=req.getSession();
		String email=(String)hs.getAttribute("usercurrentemail");
		long phone=(long)hs.getAttribute("userphone");
		// Generates account number
		BankAccountDto obj=new BankAccountDto();
		long accountnumber=obj.generateAccountNumber();
		//wrapping the details 
		BankAccountDto bankaccount=new BankAccountDto(acctype,email,phone,accountnumber,aadhar,pin,0);
		
		BankDao bankdb=new BankDao();
		int res=bankdb.insertBankDetails(bankaccount);
		RequestDispatcher dispatch=req.getRequestDispatcher("createbankaccount.jsp");
		RequestDispatcher homedispatch=req.getRequestDispatcher("home.jsp");
		if(res>0)
		{
			resp.sendRedirect("home.jsp");
			hs.setAttribute("display","none");
			hs.setAttribute("cbamssg", "Account Created");
		}
		else
		{
			req.setAttribute("emssg", "Enter valid Details");
			dispatch.include(req, resp);
		}
		
	}
}
