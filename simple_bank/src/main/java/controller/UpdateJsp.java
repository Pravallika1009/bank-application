package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDao;
import dto.UserDto;
@WebServlet("/update")
public class UpdateJsp extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("done");
		String fname=req.getParameter("firstName");
		String lname=req.getParameter("lastName");
		long phone=Long.parseLong(req.getParameter("phoneNumber"));
		String gender=req.getParameter("gender");
		int age=Integer.parseInt(req.getParameter("age"));
		String address=req.getParameter("address");
		HttpSession hs=req.getSession();
		String email=(String)hs.getAttribute("usercurrentemail");
		String pwd=(String)hs.getAttribute("usercurrentpass");
		System.out.println(email+pwd);
		System.out.println(fname+lname+phone+gender+age+address);
		UserDto usdto=new UserDto(fname,lname,email,address,phone,pwd,age,gender);
		UserDao usdao=new UserDao();
		
			try {
				int res=usdao.update(usdto);
				if(res>0)
				{
					req.setAttribute("upmsg", "Updated details Sucessfully");
					RequestDispatcher dispatch=req.getRequestDispatcher("update.jsp");
					dispatch.include(req, resp);
				}
				else {
					req.setAttribute("upmsg", "enter correct details");
					RequestDispatcher dispatch=req.getRequestDispatcher("update.jsp");
					dispatch.include(req, resp);
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		
	}
}
 