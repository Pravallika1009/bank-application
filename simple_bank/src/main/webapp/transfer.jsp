<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="dao.*" %>
 <%@ page import="dto.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Money Transfer</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #e9ecef;
            color: #212529;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh; /* Full viewport height */
            background-color:black;
        }
        .container {
            max-width: 600px;
            width: 100%; /* Make it responsive */
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            background-image: linear-gradient(45deg,#3B1E54,#D4BEE4);
            
        }
        h1 {
            text-align: center;
            color: #007bff;
            margin-bottom: 20px;
        }
        .transfer-form {
            margin-bottom: 20px;
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            display: block;
            margin-bottom: 5px;
        }
        input[type="text"],
        input[type="number"],
        input[type="email"] {
            width: 97%;
            padding: 8px;
            border: 1px solid #ced4da;
            border-radius: 4px;
        }
        button {
            background-color: #3B1E54;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
        }
        .confirmation {
            margin-top: 20px;
            padding: 10px;
            border: 1px solid #ced4da;
            border-radius: 5px;
            background-color: #d4edda;
            color: #155724;
            display: none; /* Hidden by default */
        }
        textarea{
            width: 99%;
            margin-bottom: 10px;
            min-width: 99%;
        }
        #tbtn{
        	margin-top:10px;
        	margin-bottom:5px;
        }
        #anchor{
        margin-left:40%;
       	text-decoration:none;
       	color:  #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1 style="color:#3B1E54;">Money Transfer</h1>

        <div class="transfer-form">
            <form action="transfer" method="post">
                <div class="form-group">
                    <label for="recipientName">Recipient Name:</label>
                    <input type="text" id="recipientName" placeholder="Enter recipient name" name="rname">
                </div>
                <div class="form-group">
                    <label for="recipientEmail">Recipient Email:</label>
                    <input type="email" id="recipientEmail" required placeholder="Enter recipient email" name="remail">
                </div>
                <div class="form-group">
                    <label for="amount">Amount:</label>
                    <input type="number" id="amount" required placeholder="Enter amount" name="ramount">
                </div>
                <label for="description">Description</label>
                <textarea name="description" id="" name="rdescription"></textarea>
                <span id="mssg" style="color:red; margin-left:30%;">
                <%	String mssg=(String)session.getAttribute("tmssg");
        	session.removeAttribute("tmssg"); 
        	if(mssg!=null)
        	{
        		out.print(mssg);
        	}%>
        	</span>
                <button type="submit" id="tbtn">Transfer Money</button>
                <a href="home.jsp" id="anchor" style="color:#3B1E54;">Back To Home</a>
            </form>
        </div>
        
        <div class="confirmation" id="confirmationMessage">
            <strong>Success!</strong> Your transfer has been completed.
        </div>
    </div>

    <script>
        document.getElementById('transferForm').addEventListener('submit', function(event) {
            const recipientName = document.getElementById('recipientName').value;
            const recipientEmail = document.getElementById('recipientEmail').value;
            const amount = document.getElementById('amount').value;

            // Here, you could add code to handle the transfer, e.g., send it to a server

            // Display the confirmation message
            const confirmationMessage = document.getElementById('confirmationMessage');
            confirmationMessage.style.display = 'block';

            // Reset the form
            document.getElementById('transferForm').reset();
        });
    </script>
</body>
</html>
    