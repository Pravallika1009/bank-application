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

@WebServlet("/edituserdetails")
public class EditUserDetails extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String uemail = req.getParameter("uemail");
        String uname = req.getParameter("uname");
        String upass=req.getParameter("pass");
        String uaddress = req.getParameter("uaddress");
        String uphone = req.getParameter("uphone");
        String uage = req.getParameter("uage");

        String[] unamearr=uname.split(" ");
        String fname="";
        String lname=unamearr[unamearr.length-1];
        for(int i=0;i<unamearr.length-1;i++)
        {
        	if(!(unamearr[i].equals(" ")))
        	{	
        		fname+=unamearr[i].trim()+" ";
        	}
        }
        double phone=0;
        int age=0;
        HttpSession hs=req.getSession();
        if(uphone!=null && uemail!=null && uname!=null && upass!=null && uaddress!=null && uage!=null)
        {
        	phone=Double.parseDouble(uphone);
        	age=Integer.parseInt(uage);
        }
        else
        {
        	hs.setAttribute("profileupdatemssg","Values cannot be null");
        }
        UserDao user=new UserDao();
        int res= user.updateUserDetails(fname, lname, uemail, uaddress, upass, phone, age);
        if(res>0)
        {
        	hs.setAttribute("profileupdatemssg","Updated successfully!");
        }
        else
        {hs.setAttribute("profileupdatemssg","Invalid Details");}
        // printing the details fetched from request
//        System.out.println("Email: " + uemail);
//        System.out.println("Username: " + uname);
//        System.out.println("lname :"+lname);
//        System.out.println("fname :"+fname);
//        System.out.println("Address: " + uaddress);
//        System.out.println("Phone: " + uphone);
//        System.out.println("Age: " + uage);
//        System.out.println("Password :"+upass);

        
        
        // Redirect back to the profile or a success page
        RequestDispatcher dis=req.getRequestDispatcher("profile.jsp");
        dis.include(req, resp);
    }
}
