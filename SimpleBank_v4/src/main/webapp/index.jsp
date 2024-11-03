<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en"></html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login</title>
<link rel="stylesheet" href="style.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" />
<style type="text/css">
*{
font-family: "Poppins", serif;
}
.confirmation
 {
	margin-top: 20px;
	padding: 10px;
	border: 1px solid #ced4da;
	border-radius: 5px;
	background-color: #d4edda;
	color: #155724;
	display: none; /* Hidden by default */
}
</style>
</head>

<body>
	<div class="container">
		<div class="login-box">
			<!-- <img src="logo.png" alt="Logo" class="logo"> -->
			 <div class="confirmation" id="confirmationMessage">
            <strong id="">Success!</strong> Your transfer has been completed.
        	</div>
			<h1>Login</h1>
			<form action="signin" method="post">
				<input type="text" placeholder="Email" name="email" required autofocus>
				<%String msg=(String)request.getAttribute("mssg");
                if(msg!=null)
                {
               		out.println(msg);
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
	
	<script type="text/javascript">
		<%
		String signupmssg=(String)session.getAttribute("signupmssg");
		session.removeAttribute("signupmssg");
		
		String fpmssg=(String)session.getAttribute("fpmssg");
		session.removeAttribute("fpmssg");
		
		String finalmssg=null;
		if(signupmssg!=null)
		{
			finalmssg=signupmssg;
		}
		else if(fpmssg!=null)
		{
			finalmssg=fpmssg;
		}
		%>;
		
		var finalmssg=<%="'"+finalmssg+"'" %>
		console.log(finalmssg)
		if(finalmssg!='null')
		{	
			document.getElementById('confirmationMessage').style.display="block";
			document.getElementById('confirmationMessage').innerHTML="<strong>"+finalmssg+"</strong>";
			setTimeout(display,1500);
		}
		else
		{
			document.getElementById('confirmationMessage').style.display="none";
		}
		console.log(signupmssg);
		
		function display()
		{
			document.getElementById('confirmationMessage').style.display="none";
		}
		
	</script>
</body>