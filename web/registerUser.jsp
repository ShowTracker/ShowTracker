<%-- 
    Document   : registerUser
    Created on : 20 de jun. de 2023, 10:04:32
    Author     : aluno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>ShowTracker</title>
      <link rel="shortcut icon" type="x-icon" href="./IMAGES/simbolo.svg">
  <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
  
  <div class="top-rectangle"></div>
  <div class="menu-nav">
    <img class="logo-img" src="./IMAGES/logo.svg" alt="ShowTracker">
  </div>
  
  <h2>Register</h2>
  <form action="Register" method="post">
    <label for="firstName">First Name:</label>
    <input type="text" id="firstName" name="firstName" required><br><br>
    
    <label for="lastName">Last Name:</label>
    <input type="text" id="lastName" name="lastName" required><br><br>
    
    <label for="email">Email:</label>
    <input type="email" id="email" name="email" required><br><br>
    
    <label for="birthDate">Birth Date:</label>
    <input type="date" id="birthDate" name="birthDate" required><br><br>
    
    <label for="password">Password:</label>
    <input type="password" id="password" name="password" required><br><br>
    
    <input type="submit" value="Register">
  </form>
</body>
</html>
