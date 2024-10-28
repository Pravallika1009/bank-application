<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <title>Forgot Password</title>
</head>
<body>
    <div class="container">
        <div class="signup-box">
            <h2>Forgot Password</h2>
            <p>Please enter your email address, phone number and New_Password</p>
            <form action="forgotpassword" method="POST">
                <input type="email" id="fin" name="email" required placeholder="Enter Email Address">
                <input type="tel" id="fin" name="phone" required placeholder="Phone Number">
                <input type="text" id="fin" name="pass" required placeholder="Enter New Password">
                <%String fpmssg=(String)request.getAttribute("fpmssg");
                if(fpmssg!=null)
                {
                	out.print("<span style='color :red ;'>"+fpmssg+"</span>");	
                }%>
                <button class="signup-btn">Update Password</button>
            </form>
            <p class="signin-link"><a href="index.jsp">Back to Login</a></p>
        </div>
    </div>
</body>
</html>

    