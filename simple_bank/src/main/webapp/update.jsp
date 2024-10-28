<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>update</title>
</head>
<style>
  body {
    font-family: Arial, sans-serif;
    background-color:black;
  }
  .container {
    width: 30%;
    height: 20%;
    margin: auto;
    padding: 20px;
    border: 1px solid #ccc;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    margin-top: 50px;
  }
  label {
    display: inline-block;
    margin-bottom: 10px;
    width: 120px;
    text-align: left;
  }
  input[type="text"], input[type="number"], select {
    width: 70%;
    height: 40px;
    margin-bottom: 20px;
    padding: 10px;
    box-sizing: border-box;
    border: 1px solid #ccc;
  }
  .form-group {
    margin-bottom: 20px;
  }
  .form-group input[type="text"] {
    width: 75%;
    
  }
  .form-group label {
    width: 120px;
    display: inline-block;
  }
  .name-group {
    margin-bottom: 20px;
  }
  .name-group input[type="text"] {
    width: 45%;
    display: inline-block;
    margin-right: 10px;
  }
  .name-group label {
    width: 120px;
    display: inline-block;
  }
  button[type="submit"] {
    width: 450px;
    height: 30px;
    background-color: #007bff;
    color: white;
    padding: 10px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    margin-right:10px;
  }
  button[type="submit"]:hover {
    background-color: #0056b3;
  }
  label{
  color:#3B1E54;
  }
  div{
  background-image: linear-gradient(45deg,#3B1E54,#D4BEE4);
  }
</style>

<div class="container">
  <h2>Update User Information</h2>
  <form action="update" method="post">
    <div class="name-group">
     <label for="firstName" >FirstName:</label>
     <input type="text" id="firstName" name="firstName" placeholder="Enter your First Name" style="width:315px;"required >
      <label for="lastName">Last Name:</label>
     <input type="text" id="lastName" name="lastName"  placeholder="Enter your Last Name"style="width:315px;" required>
    <label for="phoneNumber">Phone Number:</label>
    <input type="text" id="phoneNumber" name="phoneNumber"  placeholder="Enter your Phone Number" style="width:315px;" required>
    <label for="gender">Gender:</label>
    <select id="gender" name="gender" required>
      <option value="">Select Gender</option>
      <option value="male">Male</option>
      <option value="female">Female</option>
      
    </select>
    <label for="age">Age:</label>
    <input type="number" id="age" name="age"  placeholder="Enter your Age" required>
    <label for="address">Address:</label>
    <input type="text" id="address" name="address" style="width:315px;"  placeholder="Enter your Address" required><br>
    <button type="submit" style="background-color:#3B1E54;">Update</button>
    <%String upmsg=(String)request.getAttribute("upmsg");
          if(upmsg!=null)
           {
             out.println("<span style='color:green' margin-left:50px>"+upmsg+"</span><br>");
           }%>
  </form>
  <div class="signup">
				<span>Back To</span> 
				<a href="home.jsp"style="color:white;">Home</a>
			</div>
</div>

</body>
</html>