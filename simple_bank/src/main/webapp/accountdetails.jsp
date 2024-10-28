<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="dto.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Account Details</title>
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
            background-image: linear-gradient(45deg,#3B1E54,#D4BEE4);
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            text-align: center;
            color: #007bff;
            margin-bottom: 20px;
        }
        .account-detail {
            margin-bottom: 15px;
            padding: 10px;
            border: 1px solid #ced4da;
            border-radius: 5px;
            background-color: #f8f9fa;
            display:flex;
            align-items:center;
            flex-direction:row;
        }
        .label {
            font-weight: bold;
        }
        button {
            background-color: #3B1E54;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-top: 10px;
            margin-bottom:10px;
            width: 100%;
        }
        .edit-form {
            display: none; /* Hidden by default */
            margin-top: 20px;
        }
        .form-group {
            margin-bottom: 15px;
            
        }
        input[type="text"], input[type="number"] {
            width: 100%;
            padding: 8px;
            border: 1px solid #ced4da;
            border-radius: 4px;
        }
        #anchor{
        margin-left:40%;
       	text-decoration:none;
       	color:  #0056b3;
        }
        #abbtn{
        	background-color: #007bff;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-left:63%;
            width: 20%;
        }
        #balance{
        padding:0px 10px;
        }
        .balancediv{
        width:100%;
        display:none;
        flex-direction:row;
        align-items:center;
    	justify-content: flex-end;
        overflow:hidden;
        }
        .balancediv input{
        width:40%;
        }
        .balancediv button{
        	width:50%;
        }
    </style>
</head>
<body>
	<%
	
		//For user details
		UserDao user = new UserDao();
        UserDto userdetails = user.fetchUserDetails((String)session.getAttribute("usercurrentemail"));
        // For bank details
        BankDao bank = new BankDao();
        BankAccountDto bankdetails = bank.fetchDetails((String)session.getAttribute("usercurrentemail"));
        
        String value=((String)session.getAttribute("amount"));
       
        if(value!=null)
        {
        	BankDao bank1= new BankDao();
        	double amount=Double.parseDouble(value);
        	bank1.updateBalance(amount,(String)session.getAttribute("usercurrentemail"));
        }
        session.removeAttribute("amount");
        
	%>
    <div class="container">
        <h1 style="color:#3B1E54;">Account Details</h1>
        
        <div class="account-detail" id="accountHolder">  
            <span class="label">Account Holder:</span><%=userdetails.getFname()+" "+userdetails.getLname()%>
        </div>
        <div class="account-detail" id="accountNumber">
            <span class="label">Account Number:</span> <%= bankdetails.getAccountNumber()%>
        </div>
        <div class="account-detail" id="accountType">
            <span class="label">Account Type:</span><%=bankdetails.getAccountType()%>
        </div>
        <div class="account-detail" id="balance">	
            <span class="label">Balance:</span> <%= bankdetails.getBalance() %>
            <button id="abbtn" style="background-color:#3B1E54;">Add Balance</button>
            
            <!-- for adding amount -->
             <div class="balancediv" id="balancediv">
             <form action="updatebalance" method="post">
                <input type="number" id="balanceInput" placeholder="Enter amount" required name="amount" min=1>
                <button id="addBalanceBtn">Add Balance</button>
            </form>
            </div>
            
        </div>
        
        <div class="account-detail" id="ifscCode">
            <span class="label">IFSC Code:</span> <%= bankdetails.getIFSC() %>
        </div>
        <button id="editButton">Edit Account Details</button>
      
        <a href="home.jsp" id="anchor" style="color:#3B1E54;">Back To Home</a>
	
		<form action="editaccountdetails" method="post">
        <div class="edit-form" id="editForm">
            <h2>Edit Details</h2>
            <div class="form-group">
                <label for="editAccountHolder">First Name:</label>
                <input type="text" id="editAccountHolder" name="fname" required>
            </div>
            <div class="form-group">
            
                <label for="editAccountHolder">Last Name:</label>
                <input type="text" id="editAccountHolder" name="lname" required>
            </div>
       
            <button id="saveButton">Save Changes</button>
           </form>
        </div>
        </div>
	</form>
    <script>
        document.getElementById('editButton').addEventListener('click', function() {
            document.getElementById('editForm').style.display = 'block';
            document.getElementById('editAccountHolder').focus();
        });
        
        document.getElementById('abbtn').addEventListener('click', function() {
            document.getElementById('balancediv').style.display = 'flex';
            document.getElementById('balancediv').style.flexDirection = 'row';
            document.getElementById('balanceInput').focus();
            document.getElementById('abbtn').style.display = 'none';
        });
    </script>
</body>
</html>
    