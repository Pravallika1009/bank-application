<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Signup Form</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="container">
        <div class="signup-box">
            <h2>SIGN UP</h2>
            <form action="signup" method="POST">
                <input type="text" placeholder="FirstName" required name="fname">
                <input type="text" placeholder="Lastname" required name="lname">
                <input type="email" placeholder="Email" required name="email">
                <input type="text" placeholder="Password" required name="pass">
                <input type="text" placeholder="Address" required name="address">
                <input type="tel" placeholder="PhoneNumber" required name="phone">
                <input type="number" placeholder="Age" required name="age">
			    <select id="gender" name="gender" required>
			      <option value="">Select Gender</option>
			      <option value="male" name="gender">Male</option>
			      <option value="female" name="gender">Female</option>
			      </select>
                <%String emssg=(String)request.getAttribute("emssg");
                if(emssg!=null)
                {
                	out.println("<span style='color:red;'>"+emssg+"</span>");
                }%>
                <button type="submit" class="signup-btn">Sign Up</button>
                <%String smsg=(String)request.getAttribute("smssg");
                if(smsg!=null)
                {
                	out.println("<span style='color:green;'>"+smsg+"</span>");
                }%>
            </form>
            <div class="signin-link">
                <span>Already have an account?</span>
                <a href="index.jsp" action="">Log in</a>
            </div>
            <%--<%String smsg=(String)request.getAttribute("smssg");
                if(smsg!=null)
                {
                	out.println("<span style='color:black;'>"+smsg+"</span>");
                }%> --%>
        </div>
    </div>
</body>
</html>