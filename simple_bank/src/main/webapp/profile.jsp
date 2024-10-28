	<%@page import="dao.UserDao"%>
	<%@page import="java.sql.ResultSet"%>
	<%@ page language="java" contentType="text/html; charset=UTF-8"
	    pageEncoding="UTF-8"%>
	<%@page import="dto.UserDto" %>
	<!DOCTYPE html>
	<html>
	<head>
	<meta charset="UTF-8">
	<title>Profile Dashboard</title>
	 
	</head>
	<style>
		/* General Body Style */
	body {
	    font-family: 'Georgia', serif;
	    background-color: black;
	    margin: 0;
	    padding: 20px;
	    display: flex;
	    justify-content: center;
	    align-items: center;
	    height: 100vh;
	    overflow: hidden;
	}
	
	/* Dashboard Container */
	.dashboard-container {
	
	    max-width: 800px;
	    width: 100vh;
	    text-align: center;
	}
	
	/* Title Styling */
	h2 {
	    font-family: 'Times New Roman', serif;
	    color: whitesmoke;
	    font-size: 24px;
	    margin-bottom: 30px;
	    text-transform: uppercase;
	    letter-spacing: 1px;
	}
	
	/* Cards Wrapper */
	.cards-wrapper {
	    display: flex;
	    justify-content: space-evenly;
	    gap: 20px;
	    flex-wrap: wrap;
	}
	
	/* Card Style */
	.card {
	    background-color: #fff;
	    padding: 25px;
	    border-radius: 8px;
	    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.15);
	    border: 1px solid #dedede;
	    width: 48%;
	    max-width: 380px;
	    box-sizing: border-box;
	}
	
	.card h3 {
	    font-size: 20px;
	    color: #3B536F;
	    margin-bottom: 15px;
	    border-bottom: 2px solid #3B536F;
	    padding-bottom: 5px;
	    font-weight: bold;
	}
	
	.card p {
	    font-size: 16px;
	    color: #555;
	    line-height: 1.6;
	}
	
	.card p strong {
	    color: #333;
	}
	
	.card-personal-details{
		width:500px;
		height:500px;
		color:white;
		font-size:30px;
		
	}
	/* Responsive Design */
	@media (max-width: 768px) {
	    .cards-wrapper {
	        flex-direction: column;
	        align-items: center;
	    }
	
	    .card {
	        width: 90%;
	    }
	}
	
	@media (max-width: 480px) {
	    .card {
	        padding: 20px;
	    }
	
	    .card h3 {
	        font-size: 18px;
	    }
	
	    .card p {
	        font-size: 14px;
	    }
	}
		
	</style>
	<body >
	<form>
	 <%UserDto udto=(UserDto)request.getAttribute("values"); %>
		 <div class="dashboard-container">
    <h2>Hello <%out.print(udto.getFname()); %>, </h2>
    <div class="cards-wrapper">
        <!-- Personal Details Card -->
        <div class="card-personal-details" style="background-image: linear-gradient(45deg,#3B1E54,#D4BEE4);">
            <h3 style="color:#3B1E54;">Personal Details</h3>
            <span style="color:#3B1E54;"><strong>Full Name:</strong></span><span><%out.print(udto.getFname()); %> <%out.print(udto.getLname()); %></span><br><br>
            <span style="color:#3B1E54;"><strong>Email:</strong></span><span><%out.print(udto.getEmail()); %></span><br><br>
            <span style="color:#3B1E54;"><strong>Address:</strong></span><span> <%out.print(udto.getAddress()); %></span><br><br>
            <span style="color:#3B1E54;"><strong>Phone Number:</strong></span><span> <%out.print(udto.getPhone()); %></span><br><br>
            <span style="color:#3B1E54;"><strong>Age:</strong></span><span> <%out.print(udto.getAge()); %></span><br><br>
        </div>
    </div>
</div>
</form>
	</body>
	</html>