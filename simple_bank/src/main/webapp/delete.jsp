<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete</title>
</head>
<style>
 
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

/* Body background with vibrant gradient */
body {
  font-family: 'Arial', sans-serif;
  background: black;
  height: 100vh;
  display: flex;
  justify-content: center;
  align-items: center;
}

/* Container for form */
.container {
  background-image: linear-gradient(45deg,#3B1E54,#D4BEE4);
  padding: 40px;
  border-radius: 15px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
  width: 400px;
  text-align: center;
}

/* Heading style */
h1 {
  color: rgb(0, 115, 255);
  margin-bottom: 20px;
  font-size: 32px;
}

/* Input fields with a colorful focus state */
.input-field {
  margin-bottom: 25px;
  text-align: left;
}

label {
  font-size: 16px;
  color: #333;
  margin-bottom: 8px;
  display: block;
}

input[type="email"],
input[type="password"] {
  width: 100%;
  padding: 15px;
  border-radius: 10px;
  border: 1px solid #ccc;
  font-size: 18px;
  margin-top: 5px;
  transition: border-color 0.3s ease;
}

input[type="email"]:focus,
input[type="password"]:focus {
  border-color: #12c2e9;
  outline: none;
  box-shadow: 0 0 5px #12c2e9;
}

/* Submit button with hover effect */
input[type="submit"] {
  background-color: #04AA6D;
  color: white;
  border: none;
  padding: 15px;
  width: 100%;
  border-radius: 10px;
  font-size: 20px;
  cursor: pointer;
  transition: background-color 0.3s ease;
}

input[type="submit"]:hover {
  background-color: #3e8e41;
}

/* Custom popup styles */
.custom-popup {
  position: fixed;
  top: 0;
  left: 0;
  width: 30%;
  height: 20%;
  background-color: #fff;
  border: 1px solid #ccc;
  padding: 20px;
  border-radius: 15px;
  display: none;
  text-align: center;
  z-index: 1000;
  margin-left: 35%;
}

/* Button styles */
.popup-button {
  background-color: #04AA6D;
  color: white;
  border: none;
  padding: 10px 20px;
  font-size: 16px;
  cursor: pointer;
  border-radius: 10px;
  margin: 10px;
  transition: background-color 0.3s ease;
}

.popup-button:hover {
  background-color: #3e8e41;
}

.popup-button#no-button {
  background-color: #ff0000;
}

.popup-button#no-button:hover {
  background-color: #ff4d4d;
}

.popup-button#yes-button {
  background-color: #00ff00;
}

.popup-button#yes-button:hover {
  background-color: #00ff4d;
}
</style>
</head>
<body>
  <div class="custom-popup" id="custom-popup">
    <h2>Confirmation</h2>
    <p>Are you sure you want to delete your account?</p>
    <button class="popup-button" id="yes-button" onclick="confirmYes()">Yes</button>
    <button class="popup-button" id="no-button" onclick="confirmNo()">Cancel</button>
  </div>
  <div class="container">
    <h1 style="color:#3B1E54;">Delete Account</h1>
    <form action="delete" method="post" onsubmit="return confirmDelete()">
      <div class="input-field">
      <label for="email" style="color:#3B1E54;">Email:</label>
        <input type="email" id="email" name="email" placeholder="Enter your email" required><br><br>
        <label for="password" style="color:#3B1E54;">Password:</label>
        <input type="password" id="password" name="pass" placeholder="Enter your password" required>
      </div>
      <input type="submit" value="Delete Account" style="background-color:#3B1E54;">
      			<%String imssg=(String)request.getAttribute("imssg");
                if(imssg!=null)
                {
               		out.println("<span style='color:red'>"+imssg+"</span>");
                }%>
                <%String inmssg=(String)request.getAttribute("inmssg");
                if(inmssg!=null)
                {
               		out.println("<span style='color:red'>"+inmssg+"</span>");
                }%>
    </form>
  </div>
<script>
  function confirmDelete() {
    document.getElementById('custom-popup').style.display = 'block';
    return false; // Prevent form submission until user confirms
  }

  function confirmYes() {
    document.getElementById('custom-popup').style.display = 'none';
    document.querySelector("form").submit(); // Submit the form to trigger deletion
  }

  function confirmNo() {
    document.getElementById('custom-popup').style.display = 'none';
  }
</script>
</body>

</html>