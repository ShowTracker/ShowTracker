<%-- 
    Document   : login
    Created on : 20 de jun. de 2023, 10:16:40
    Author     : aluno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>ShowTracker</title>
  <link rel="shortcut icon" type="x-icon" href="./IMAGES/simbolo.svg">
  <link rel="stylesheet" type="text/css" href="style.css"/>
</head>
<body>
  <div class="top-rectangle"></div>
  
  <div class="menu-nav">
    <img class="logo-img" src="./IMAGES/logo.svg" alt="ShowTracker">
  </div>
  <h2>Login</h2>
  
  <form action="Login" method="post">
    <label for="email">Email:</label>
    <input type="email" id="email" name="email" required><br><br>
    
    <label for="password">Password:</label>
    <input type="password" id="password" name="password" required><br><br>
    
    <input type="submit" value="Login">
  </form>
  
  <p>Don't have an account? <a href="registerUser.jsp">Register</a></p>
</body>
</html>
