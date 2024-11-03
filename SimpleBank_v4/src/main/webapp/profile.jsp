<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="dto.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: black;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            padding: 20px;
        }
        .container {
            max-width: 700px;
            width: 100%;
            background-image: linear-gradient(45deg,#3B1E54,#D4BEE4);
            border-radius: 8px;
            box-shadow: 0 2px 15px rgba(0, 0, 0, 0.2);
            padding: 20px;
        }
        h1 {
            text-align: center;
            color: #3B1E54;
            font-size: 28px;
            margin-bottom: 20px;
        }
        .profile-item {
            margin: 15px 0;
            border-bottom: 1px solid #e0e0e0;
            padding-bottom: 10px;
        }
        .profile-item:last-child {
            border-bottom: none;
        }
        .profile-item strong {
            color: #D4BEE4;
        }
        .profile-item input {
            width: calc(100% - 20px);
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        button {
            padding: 10px 20px;
            border: none;
            background-color: #3B1E56;
            color: white;
            border-radius: 4px;
            cursor: pointer;
        }
        #editbtn {
            margin-left: 78%;
        }
        #home{
        color:white;
        font-size:15px;
        margin-left:41%;
        }
        #submit{
        margin-bottom:10px;
        display:none;}
        label{
        color:#3B1E54;
        }
    </style>
</head>
<body>

<div class="container">
    <%
        UserDao userdb = new UserDao();
        UserDto user = userdb.fetchUserDetails((String) session.getAttribute("usercurrentemail"));
    %>
    <h1>Profile Details</h1>
     
    <form id="alldetails" action="edituserdetails" method="post">
        <div class="profile-item">
            <label for="uname"><strong>Username:</strong></label>
            <button type="button" id="editbtn">Edit</button>
            <input type="text" id="uname" name="uname" required value="<%= user.getFname() + " " + user.getLname() %>" readonly>
        </div>
        <div class="profile-item">
            <label for="uemail"><strong>Email:</strong></label>
            <input type="email" id="uemail" name="uemail" required value="<%= user.getEmail() %>" readonly>
        </div>
        <div class="profile-item">
            <label for="uaddress"><strong>Address:</strong></label>
            <input type="text" id="uaddress" name="uaddress" required value="<%= user.getAddress() %>" readonly>
        </div>
        <div class="profile-item">
            <label for="pass"><strong>password:</strong></label>
            <input type="password" id="pass" name="pass" required value="<%=user.getPass()%>" readonly>
        </div>
        <div class="profile-item">
            <label for="uphone"><strong>Phone:</strong></label>
            <input type="tel" id="uphone" name="uphone" required value="<%= user.getPhone() %>" minlength=10 maxlength=10 readonly>
        </div>
        <div class="profile-item">
            <label for="uage"><strong>Age:</strong></label>
            <input type="number" id="uage" name="uage" required value="<%= user.getAge() %>" min="1" max="120" readonly>
        </div>
        <span id="mssg"><%String mssg=(String)session.getAttribute("profileupdatemssg");
        if(mssg!=null)
        {
        	out.print("<span style='color:red;margin-left:39%;'>"+mssg+"</span>");	
        }
        session.removeAttribute("profileupdatemssg");
        %></span>
        <div style="text-align: center; margin-top: 20px;">
            <button type="submit" id="submit" disabled>Save Changes</button>
        </div>
        <a class="footer" id="home" href="home.jsp">Back to home Page</a>
    </form>
</div>

<script>
document.getElementById('editbtn').addEventListener('click', function() {
    event.preventDefault(); // Prevent form submission
    // Enable input fields for editing
    document.getElementById('uname').focus();
    document.getElementById('uemail').readOnly = false;
    document.getElementById('uname').readOnly = false;
    document.getElementById('pass').readOnly = false;
    document.getElementById('pass').type="text";
    document.getElementById('uaddress').readOnly = false;
    document.getElementById('uphone').readOnly = false;
    document.getElementById('uage').readOnly = false;
    document.getElementById('submit').style.display='inline-block';
    document.getElementById('submit').disabled= false;
});
</script>

</body>
</html>
