<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="dto.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    
    <script src="./home.js"  defer></script>
    <link type="text/css" rel="stylesheet" href="home.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SimpleBank</title>
</head>
		<%-- java code --%>
		<%		
    		String status="flex";
    		String bmenu="none";
    		BankDao bankdb=new BankDao();
    		BankAccountDto bank=bankdb.fetchDetails((String)session.getAttribute("usercurrentemail"));
    		if((bank.getEmail()!=null) && bank.getEmail().equals((String)session.getAttribute("usercurrentemail")))
    		{
    			status="none";
    			bmenu="flex";
    		}	
    		
    		UserDao userdb=new UserDao();
    		UserDto user=userdb.fetchUserDetails((String)session.getAttribute("usercurrentemail"));
   		 %>
   		<%-- java code Ends--%>
   		
   		<style>
   		/* From Uiverse.io by akshat-patel28 */ 
/* From Uiverse.io by akshat-patel28 */ 
.card {
  width: 300px;
  height: 52px;
  border-radius: 8px;
  box-sizing: border-box;
  padding: 10px 15px;
  background-color: #ffffff;
  box-shadow: rgba(149, 157, 165, 0.2) 0px 8px 24px;
  overflow: hidden;
  display: none;
  align-items: center;
  justify-content: space-around;
  gap: 15px;
  position: absolute;
  top:10%;
  left:40%;
}
.wave {
  position: absolute;
  transform: rotate(90deg);
  left: -31px;
  top: 32px;
  width: 80px;
  fill: #04e4003a;
}
.icon-container {
  width: 35px;
  height: 35px;
  display: flex;
  justify-content: center;
  align-items: center;
  background-color: #04e40048;
  border-radius: 50%;
  margin-left: 8px;
}
.icon {
  width: 17px;
  height: 17px;
  color: #269b24;
}
.message-text-container {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: flex-start;
  flex-grow: 1;
}
.message-text,
.sub-text {
  margin: 0;
  cursor: default;
}
.message-text {
  color: #269b24;
  font-size: 17px;
  font-weight: 700;
}
.sub-text {
  font-size: 14px;
  color: #555;
}
.cross-icon {
  width: 18px;
  height: 18px;
  color: #555;
  cursor: pointer;
}
  		
</style>
<header id="head">
<div class="card" id="confirmationMessage">
  <svg class="wave" viewBox="0 0 1440 320" xmlns="http://www.w3.org/2000/svg">
    <path
      d="M0,256L11.4,240C22.9,224,46,192,69,192C91.4,192,114,224,137,234.7C160,245,183,235,206,213.3C228.6,192,251,160,274,149.3C297.1,139,320,149,343,181.3C365.7,213,389,267,411,282.7C434.3,299,457,277,480,250.7C502.9,224,526,192,549,181.3C571.4,171,594,181,617,208C640,235,663,277,686,256C708.6,235,731,149,754,122.7C777.1,96,800,128,823,165.3C845.7,203,869,245,891,224C914.3,203,937,117,960,112C982.9,107,1006,181,1029,197.3C1051.4,213,1074,171,1097,144C1120,117,1143,107,1166,133.3C1188.6,160,1211,224,1234,218.7C1257.1,213,1280,139,1303,133.3C1325.7,128,1349,192,1371,192C1394.3,192,1417,128,1429,96L1440,64L1440,320L1428.6,320C1417.1,320,1394,320,1371,320C1348.6,320,1326,320,1303,320C1280,320,1257,320,1234,320C1211.4,320,1189,320,1166,320C1142.9,320,1120,320,1097,320C1074.3,320,1051,320,1029,320C1005.7,320,983,320,960,320C937.1,320,914,320,891,320C868.6,320,846,320,823,320C800,320,777,320,754,320C731.4,320,709,320,686,320C662.9,320,640,320,617,320C594.3,320,571,320,549,320C525.7,320,503,320,480,320C457.1,320,434,320,411,320C388.6,320,366,320,343,320C320,320,297,320,274,320C251.4,320,229,320,206,320C182.9,320,160,320,137,320C114.3,320,91,320,69,320C45.7,320,23,320,11,320L0,320Z"
      fill-opacity="1"
    ></path>
  </svg>

  <div class="icon-container">
    <svg
      xmlns="http://www.w3.org/2000/svg"
      viewBox="0 0 512 512"
      stroke-width="0"
      fill="currentColor"
      stroke="currentColor"
      class="icon"
    >
      <path
        d="M256 48a208 208 0 1 1 0 416 208 208 0 1 1 0-416zm0 464A256 256 0 1 0 256 0a256 256 0 1 0 0 512zM369 209c9.4-9.4 9.4-24.6 0-33.9s-24.6-9.4-33.9 0l-111 111-47-47c-9.4-9.4-24.6-9.4-33.9 0s-9.4 24.6 0 33.9l64 64c9.4 9.4 24.6 9.4 33.9 0L369 209z"
      ></path>
    </svg>
  </div>
  <div class="message-text-container">
    <p class="message-text" id="message-text">Success message</p>
    <p class="sub-text">Everything seems great</p>
  </div>
  </svg>
</div>
	
	<!-- main page-->
    <h1>Welcome, <%=user.getFname() %></h1>
    <ul class="bopt-list" style="display:<%=bmenu %>">
        <li><a href="accountdetails.jsp">Account Details</a></li>
        <li><a href="transfer.jsp">Transfer Money</a></li>
        <li><a href="#aboutus">About Us</a></li>
        <li><a href="#services">Services</a></li>
    </ul>
    <a href="createbankaccount.jsp">
        <button id="bbtn" style="display:<%=status %>;">Create Bank Account</button>
    </a>
    <nav class="navbar">
        <div class="menu-toggle" id="mobile-menu">
            <i class="fa-solid fa-user" id="icon"></i>
        </div>
        <ul class="nav-list" id="navlist">
            <li><a href="profile.jsp">Profile</a></li>
            <li><a href="delete.jsp">Delete</a></li>
            <li><a href="index.jsp">Logout</a></li>
        </ul>
    </nav>
</header>

<body >
    <main>
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
        <div id="marqueemsg">
            <marquee  behavior="scroll" direction="" scrollamount="10" loop="infinite">
       🌟 Welcome to Simple Bank! 🌟 Where your financial journey is made easy and accessible. We're thrilled to have you with us! Experience simplicity and transparency in every transaction. Let’s achieve your financial goals together!</marquee>
        </div>
    </main>
    <script type="text/javascript">
		<%
		String loginmssg=(String)session.getAttribute("loginmssg");
		session.removeAttribute("loginmssg");
		
		String cbamssg=(String)session.getAttribute("cbamssg");
		session.removeAttribute("cbamssg");
		
		String finalmssg=null;
		if(loginmssg!=null)
		{
			finalmssg=loginmssg;
		}
		else if(cbamssg!=null)
		{
			finalmssg=cbamssg;
		}
		%>;
		
		var finalmssg=<%="'"+finalmssg+"'" %>
		console.log(finalmssg);
		if(finalmssg!='null')
		{	
			document.getElementById('confirmationMessage').style.display="flex";
			document.getElementById('message-text').innerText=finalmssg;
			setTimeout(display,1500);
		}
		else
		{
			document.getElementById('confirmationMessage').style.display="none";
		}
		
		function display()
		{
			document.getElementById('confirmationMessage').style.display="none";
		}
		
	</script>
</body>
    <footer>
        <p>&copy; 2024 SIMPLE Bank. All rights reserved. &nbsp;&nbsp;chakravarthi139@gmai.com</p>
    </footer>
</html>