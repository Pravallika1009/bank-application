<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Signup Form</title>
    <link rel="stylesheet" href="style.css">
    <style type="text/css">
    #cmssg{
    color:red;}
    </style>
</head>
<body>
    <div class="container">
        <div class="signup-box">
            <h2>SIGN UP</h2>
            <form action="" method="POST" id="myform">
                <input type="text" placeholder="FirstName" required name="fname" required>
                <input type="text" placeholder="Lastname" required name="lname" required>
                <input type="email" placeholder="Email" required name="email" required>
                <input type="text" placeholder="Password" required name="pass" id="pass" required>
                <input type="password" placeholder="Confirm Password" required name="cpass" id="cpass" required>
                <span id="cmssg"></span>
                <input type="text" placeholder="Address" required name="address" required>
                <input type="tel" placeholder="PhoneNumber" required name="phone" required minlength=10 maxlength=10>
                <input type="number" placeholder="Age" required name="age" required>
                <%String emssg=(String)request.getAttribute("emssg");
                if(emssg!=null)
                {
                	out.println("<span style='color:red;'>"+emssg+"</span>");
                }%>
                <button type="submit" class="signup-btn" id="sbtn">Sign Up</button>
            </form>
            <div class="signin-link">
                <span>Already have an account?</span>
                <a href="index.jsp" action="">Log in</a>
            </div>
        </div>
    </div>
    <script type="text/javascript">
   	document.getElementById('sbtn').addEventListener('click',(event)=>{
   		var pass=document.getElementById('pass').value;
   		var cpass=document.getElementById('cpass').value;
   		if(pass!=cpass)
   		{
   			event.preventDefault();
   			document.getElementById('cmssg').innerHTML='Enter correct pass';
   			
   		}
   		else if(pass==cpass)
   		{
   			document.getElementById('cmssg').innerHTML='';
   			document.getElementById('myform').action='signup';
   		}
   		
   	});
    </script>
</body>
</html>
