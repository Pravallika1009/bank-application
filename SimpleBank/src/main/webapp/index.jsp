<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
	<div class="container">
		<div class="login-box">
			<!-- <img src="logo.png" alt="Logo" class="logo"> -->
			<h1>Login</h1>
			<form action="signin" method="post">
				<input type="text" placeholder="Email" name="email" required>
				<%String msg=(String)request.getAttribute("mssg");
                if(msg!=null)
                {
               		out.println("<span style='color:red'>"+msg+"</span>");
                }%>
				<input type="text" placeholder="Password" name="pass" required>
				<%String pmsg=(String)request.getAttribute("pmssg");
                if(pmsg!=null)
                {
               		out.println("<span style='color:red'>"+pmsg+"</span>");
                }%>
				<button class="login-btn">Sign In</button>
			</form>
			<div class="separator">
				<hr>
				<span>OR</span>
			</div>
			<a href="forgotpassword.jsp" class="forgot-password">Forgot password?</a>
			<div class="signup">
				<span>Don't have an account?</span> <a href="signup.jsp" >Sign up</a>
			</div>
		</div>
	</div>
</body>