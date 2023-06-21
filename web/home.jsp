<%-- 
    Document   : home
    Created on : 20 de jun. de 2023, 11:06:33
    Author     : aluno
--%>

<%@page import="model.media.TvShow"%>
<%@page import="model.media.Film"%>
<%@page import="java.util.List"%>
<%@page import="model.media.Media"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <title>ShowTracker</title>
        <link rel="stylesheet" type="text/css" href="./CSS/style.css">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>

    <body>
        <h1>ShowTracker</h1>

        <p id="page-message">Hi, Maria!</p>
        <form id="search-form" action="SearchMedia">
            <input type="text" name="search-entry" placeholder="Search..." required>
            <input type="hidden" name="user-email" id="user-email" value=<%= request.getAttribute("email")%>>
            <button type="submit" value="SearchMedia">Search</button>
        </form>   

        <div class="grid-container">
            <%
                List<Media> medias = (List<Media>) request.getAttribute("result");

                if (medias.isEmpty()) {

            %>
            <h2>Nenhuma mídia encontrada!</h2>
            <%            } else {
                for (Media m : medias) {
            %>
            <div class="grid-item">
                <div class="media-item">
                    <h2><%= m.getTitle()%></h2>
                    <%
                        if (m instanceof Film) {
                            Film n = (Film) m;
                    %>
                    <p>Type: Movie</p>
                    <p>Release Year: <%= n.getYear()%></p>
                    <p>Duration: <%= n.getDuration()%> minutes</p>
                    <%
                    } else {
                        TvShow n = (TvShow) m;
                    %>
                    <p>Type: TV Series</p>
                    <p>Release Year: <%= n.getYear()%></p>
                    <p>End Year: <%= n.getEndYear()%></p>
                    <%
                        }
                    %>
                    <button id="delete-media">Remove</button>
                </div>

            </div>

            <%
                    }
                }
            %>

        </div>
    </body>

</html>