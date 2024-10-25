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
                <%String emssg=(String)request.getAttribute("emssg");
                if(emssg!=null)
                {
                	out.println("<span style='color:red;'>"+emssg+"</span>");
                }%>
                <button type="submit" class="signup-btn">Sign Up</button>
            </form>
            <div class="signin-link">
                <span>Already have an account?</span>
                <a href="index.jsp" action="">Log in</a>
            </div>
        </div>
    </div>
</body>
</html>
