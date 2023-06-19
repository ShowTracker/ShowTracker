<%-- 
    Document   : listMedias
    Created on : 19 de jun. de 2023, 13:07:31
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
        <form id="search-form" action="search_results.html">
            <input type="text" name="search-query" placeholder="Search...">
            <button type="submit">Search</button>
        </form>

        <div class="grid-container">
            <%
                List<Media> medias = (List<Media>) request.getAttribute("result");

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
                    <p>Duration:  <%= n.getDuration()%> minutes</p>
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
                </div>
            </div>
            <%
                }
            %>
        </div>
    </body>
</html>
