<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    
    <script src="./home.js"  defer></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link type="text/css" rel="stylesheet" href="home.css">
    <style type="text/css">
    	header h1{
    	 text-transform: capitalize;
    	 font-size:25px;
    	 }
    	 header a{
				text-decoration: none;     	 
    	 }
    	 #marqueemsg
    	 {	margin-top:8px;
    	 	margin-bottom:5px;
    	 	height:40px;
    	 	width:	99.8%;
    	 	background-color: #D4BEE4;
    	 	border-radius:2px;
    	 	font-size:20px;
    	 	display:flex;
    	 	flex-direction:column;
    	 	align-items:center;
    	 	justify-content:center;
    	 	color: #3B1E54;;
    	 }
    	 .info{
    	 	width:100%;
    	 	height:200px;
    	 	font-size:35px;
    	 	background-color:black;
    	 	color:#D4BEE4;
    	 	padding:20px;
    	 }
    	 .info h1{
    	 text-align:center;}
    	 section{
    	 box-sizing:content-box;
    	 padding-top:20px;
    	 padding-left:20px;
    	 padding-right:20px;
    	 padding-bottom:10px;
    	 text-align:justify;
    	 color:white;
    	 }
    	 section h1{
    	 color:#9B7EBD;
    	 }
    	 body{
    	  background-color:black;}
    	 footer{
    	 margin-top:20px;
    	 background-color:black;}
    	 
    	 
    	 #navlist li a {
   		 color: white;
    	text-decoration: none; 
    	 
		}
		#navlist li a:hover{
    	font-size: 22px;
   		color:#D4BEE4; 
		}
		
    	
    </style>
    <title>Document</title>
</head>
		<%-- java code --%>
		<%
			String fname=(String)session.getAttribute("username");
    		String status=(String)session.getAttribute("display");
    		String bmenu="none";
    		if(status.equals("none"))
    		{
    			bmenu="flex";
    		}
    		
   		 %>
   		<%-- java code Ends--%>
<header id="head">
    <h1>Welcome, <%=fname %></h1>
    <ul class="bopt-list" style="display:<%=bmenu %>" >
        <li><a href="accountdetails.jsp">Account Details</a></li>
        <li><a href="transfer.jsp">Transfer Money</a></li>
        <li><a href="#aboutus">About Us</a></li>
        <li><a href="#services">Services</a></li>
    </ul>
    <a href="createbankaccount.jsp"><button id="bbtn" style="display:<%=status %>" >Create Bank Account</button></a>
    <nav class="navbar">
        <div class="menu-toggle" id="mobile-menu">
            <i class="fa-solid fa-user" id="icon"></i>
        </div>
        <ul class="nav-list" id="navlist">
            <li><a href="profile">Profile</a></li>
            <li><a href="update.jsp">Update</a></li>
            <li><a href="delete.jsp">Delete</a></li>
            <li><a href="index.jsp">Logout</a></li>
        </ul>
    </nav>
</header>
<body >
    <main>
    <div id="marqueemsg">
     <marquee  behavior="scroll" direction="" scrollamount="25" loop="infinite">
The site is under development, you may encounter some bugs. We will fix all the bugs in the next version</marquee> </div>
        <!-- simple bankTitle -->
        <div class="info">
      		<h1>Simple Bank</h1>
        </div>
        <section id="aboutus">
         <h1>About us</h1>
        <p>Simple Bank is a user-friendly financial institution designed to provide 
        essential banking services with a focus on accessibility and transparency. 
        It offers a range of products, including savings and checking accounts, as 
        well as personal loans, catering to both individual customers and small businesses.
        Simple Bank emphasizes a seamless digital experience, allowing customers to manage 
        their finances through an intuitive online platform and mobile app. This approach 
        not only enhances convenience but also promotes financial literacy by providing users 
        with tools and resources to make informed decisions. Committed to community engagement,
        Simple Bank often supports local initiatives and aims to foster strong relationships with
         its customers, ensuring a supportive banking environment that prioritizes their needs.</p></section>
        <section id="services">
        <h1>services</h1>
        <p>Bank services are shaped by several key theories, including Service Quality Theory 
        (SERVQUAL), which focuses on aligning customer expectations with actual service delivered. 
        Customer Relationship Management (CRM) emphasizes building long-term relationships to enhance 
        loyalty. Financial Intermediation Theory highlights banks as crucial intermediaries between savers 
        and borrowers,while Risk Management Theory addresses strategies to mitigate financial risks. Lastly,
        Digital Banking Transformation Theory examines the impact of technology on service delivery, emphasizing
        the need for innovation in the banking sector.</p>
        </section>
    </main>
</body>
<footer>
        <p>&copy; 2024 SBI Bank. All rights reserved.</p>
    </footer>
</html>