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
  <link rel="stylesheet" href="./CSS/style.css">
</head>
<body>
  <h1>Login</h1>
  
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
