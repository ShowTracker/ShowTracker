<%-- 
    Document   : update
    Created on : 27 de jun. de 2023, 13:07:49
    Author     : aluno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ShowTracker - Profile</title>
        <link rel="stylesheet" type="text/css" href="style.css">
    </head>
    <body>
        <div class="top-rectangle"></div>
        
        <div class="menu-nav">
          <img class="logo-img" src="./IMAGES/logo.svg" alt="ShowTracker">
        </div>
        
        <h2>Update</h2>
        <%
            if ("firstName".equals(request.getAttribute("type"))) {
        %>
        <form action="UpdateFirstName" method="post">
            <label for="firstName">First Name:</label>
            <input type="text" id="firstName" name="firstName" required><br><br>
            <input type="hidden" name="email" id="email" value=<%= request.getAttribute("email")%>>
            <input type="submit" value="Update First Name">
        </form> 
        <%
            } else if ("lastName".equals(request.getAttribute("type"))) {
        %>
        <form action="UpdateLastName" method="post">  
            <label for="lastName">Last Name:</label>
            <input type="text" id="lastName" name="lastName" required><br><br>
            <input type="hidden" name="email" id="email" value=<%= request.getAttribute("email")%>>
            <input type="submit" value="Update Last Name">
        </form>  
        <%
            } else {
        %>
        <form action="UpdateBirthday" method="post">
            <label for="birthDate">Birth Date:</label>
            <input type="date" id="birthDate" name="birthDate" required><br><br>
            <input type="hidden" name="email" id="email" value=<%= request.getAttribute("email")%>>
            <input type="submit" value="Update Birthday">
        </form> 
        <%
            }
        %> 
    </body>
</html>
