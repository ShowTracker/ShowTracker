
<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ShowTracker - Profile</title>
       <link rel="stylesheet" type="text/css" href="style.css">
       <style>
           
            .media-item {
                padding: 0px;
                margin-bottom: 0px;
                background-color: transparent;
                border: 0;
                float: left;
                clear: left;
            }
       </style>
    </head> 
   <body>
        <%
            User user = (User) request.getAttribute("user");
        %>
       <div class="top-rectangle"></div>
       <div class="menu-nav">
            <img class="logo-img" src="./IMAGES/logo.svg" alt="ShowTracker">
            <ul class="menu-opts">
                <li><a href="Home?email=<%= request.getAttribute("email")%>&first-name=<%= user.getFisrtName()%>">Home</a></li>
                <li><a href="ProfilePage?email=<%= request.getAttribute("email")%>">Perfil</a></li>
                <li><a href="login.jsp">Logout</a></li>
            </ul>
        </div>
        <p id="page-message">Hi, <%= user.getFisrtName() %></p>
        <p id="page-submessage">Your informations:</p>
        <p class="info">
            First Name: <%= user.getFisrtName() %> 
            <button id="edit-account">Edit First Name</button>
        </p>
        <p class="info">
            Last Name: <%= user.getLastName()%>
            <button id="edit-account">Edit Last Name</button></p>
        <p class="info">
            Birthday: <%= user.getBirthDate()%>
            <button id="edit-account">Edit Birthday</button>
        </p>
        
        <form class="media-item" action="DeleteAccount">
            <input type="hidden" name="email" id="email" value=<%= request.getAttribute("email")%>>
            <button id="delete-acount">Delete account</button>
        </form>
    </body>
</html>
