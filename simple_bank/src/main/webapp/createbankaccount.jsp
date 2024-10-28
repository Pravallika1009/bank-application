<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Account Creation Form</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: black; /* Light background color */
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .form-container {
            background-image: linear-gradient(45deg,#3B1E54,#D4BEE4);
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            max-width: 700px;
            width: 100%;
            display: flex;
            flex-direction: column;
        }
        h2 {
            text-align: center;
            color: #1877F2; 
            margin-bottom: 20px;
        }
        label {
        
            margin: 10px 5px 10px ;
            font-weight: bold;/* Facebook blue */
            color: black;
        }
        input, select {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            transition: border-color 0.3s;
        }
       #phone,#aadhar,#pin{
            width: 97%;
        }
        input:focus, select:focus {
            border-color: #1877F2; /* Facebook blue */
            outline: none;
        }
        button {
            width: 100%;
            padding: 10px;
            background-color: rgba(59, 30, 84, 0.7); /* Facebook blue */
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s;
        }
        button:hover {
            background-color: rgba(59, 30, 84, 0.7); /* Darker Facebook blue */
        }
        .footer {
            text-align: center;
            margin-top: 20px;
            font-size: 12px;
            color: white;
        }
        #home{
        color:lavender;
        font-size:15px;
        }
    </style>
</head>
<body>
    
    <div class="form-container">
        <h2 style="color:rgba(59, 30, 84, 0.7);">Create Bank Account</h2>
        <form id="" action="accountdetails" method="post">
            <label for="accountType">Account Type</label>
            <select id="accountType" name="accountType" required>
                <option value="">Select Account Type</option>
                <option value="savings">Savings</option>
                <option value="current">Current</option>
                <option value="fixed">Fixed Deposit</option>
            </select>

            <label for="aadhar">Aadhar Number</label>
            <input type="text" id="aadhar" name="aadhar" required placeholder="Enter your Aadhar number" maxlength="12" minlength="12">

            <label for="pin">Security Pin</label>
            <input type="text" id="pin" name="pin" required placeholder="Enter your Security pin" maxlength="4" minlength="4">
            <button type="submit">Submit</button>
        </form>
        
        
     	<div class="footer" style="color :red;">
     	<%String emssg=(String)request.getAttribute("emssg");
           if(emssg!=null)
           {
        	   out.print(emssg);
           }%>
        </div>
        <div class="footer">Your information is safe with us.</div>
        <a class="footer" id="home" href="home.jsp">Back to home Page</a>
    </div>

    <script>
    /*
        document.getElementById('accountForm').addEventListener('submit', function(event) {
            event.preventDefault();
            const accountType = document.getElementById('accountType').value;
            const phone = document.getElementById('phone').value;
            const aadhar = document.getElementById('aadhar').value;

            alert(`Account Type: ${accountType}\nPhone: ${phone}\nAadhar: ${aadhar}`);
        });*/
    </script>

</body>
</html>
    