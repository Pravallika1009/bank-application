<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="dao.*" %>
 <%@ page import="dto.*" %>
  <%@ page import="java.sql.ResultSet" %>

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
            height: 100vh;
            gap:20px; /* Full viewport height */
        }
        .container {
        	box-sizing: border-box;
            max-width: 500px;
            width: 100%; /* Make it responsive */
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
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
            background-color: #007bff;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
        }
        button:hover {
            background-color: #0056b3;
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
        #incon
        {
        	background-color:white;
        }
        
        table{
            border-collapse: collapse; 
            color:black;
        }
        table th{	
            background-image: linear-gradient(90deg,#EEEEEE,#9B7EBD);
            width: 150px;
            overflow: scroll;
            position:;
            padding:3px;
            border-radius:3px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            text-transform:capitalize;
        }
        table th::-webkit-scrollbar{
            display: none;
        }
        table td{
            background-color: white;
            width: 150px;
            overflow: scroll;
            text-align: center;
            padding:3px;
            border-radius:3px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }
        table td::-webkit-scrollbar{
            display: none;
        }
        table tr{
          	/*background-color: grey;*/
            display: flex;
            gap:2px;
            padding: 2px;
        }
        #tcon{
            max-width: 800px; 
            min-height: 500px;
            max-height: 500px;
            overflow:scroll;
            flex-direction:column;
            align-items:center;
            justify-content:center;
            gap:10px;
            background-color:black;
        }
        #tcon::-webkit-scrollbar{
            display: none;   
        }
        #tablediv{
        	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        	box-sizing: border-box;
        	overflow:scroll;
        }
        #tablediv::-webkit-scrollbar{
            display: none;   
        }
    </style>
</head>
<body>
    <div class="container">
        <h1 style="color:#3B1E54;">Money Transfer</h1>

        <div class="transfer-form" id="transfercon">
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
                <span id="mssg" style="color:red; margin-left:20%;">
                <%
                String mssg=(String)session.getAttribute("tmssg");
        		session.removeAttribute("tmssg"); 
	        	if(mssg!=null)
	        	{
	        		out.print(mssg);
	        	}
        		%>
        	</span>
                <button type="submit" id="tbtn" style="background-color:#3B1E54;">Transfer Money</button>
                <a href="home.jsp" id="anchor" style="color:black;">Back To Home</a>
            </form>
        </div>
        
        <div class="confirmation" id="confirmationMessage">
            <strong>Success!</strong> Your transfer has been completed.
        </div>
    </div>

	
	<div class="container" id="tcon">
		<div id="tablediv">
		 <table>
            <tr>
                <th>Transaction Id</th>
                <th>UserEmail</th>
                <th>RecipientEmail</th>
                <th>TransferAmount</th>
                <th>Status</th>
            </tr>
            <%
            	BankDao bankdb=new BankDao();
            	ResultSet rs=bankdb.getTransactions((String)session.getAttribute("usercurrentemail"));
            	while(rs.next())
            	{
            		out.print("<tr> <td>"+rs.getInt("id")+"</td> <td>"
            		+rs.getString("uemail")+"</td> <td>"
            		+rs.getString("remail")+"</td> <td>"
            		+rs.getDouble("tamount")+"</td> <td>"
            		+rs.getString("tstatus")+"</td> </tr>");
            	}
           
            %>
         </table>
         </div>
 
	</div>
    <script>
    console.log(<%=(String)session.getAttribute("usercurrentemail")%>);
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
    