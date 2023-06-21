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
        <style>
            .media-item form {
                padding: 0px;
                margin-bottom: 0px;
                background-color: transparent;
                border: 0;
                display: flex;
                justify-content: center;
                align-items: center;
            }
            .modal {
                display: none; /* Hide the modal by default */
                position: fixed;
                z-index: 1;
                left: 0;
                top: 0;
                width: 100%;
                height: 100%;
                overflow: auto;
                background-color: rgba(0, 0, 0, 0.4); /* Semi-transparent background */
            }

            .modal-content {
                background-color: #fff;
                margin: 15% auto;
                padding: 20px;
                width: 300px;
                border-radius: 5px;
                box-shadow: 0 2px 8px rgba(0, 0, 0, 0.2);
            }

            /* Close button style */
            .close {
                color: #aaa;
                float: right;
                font-size: 28px;
                font-weight: bold;
                cursor: pointer;
            }

            .close:hover,
            .close:focus {
                color: black;
                text-decoration: none;
                cursor: pointer;
            }
        </style>
    </head>

    <body>

        <%
            String error = (String) request.getAttribute("error");
            if (error != null) {

        %>
        <div id="myModal" class="modal">
            <div class="modal-content">
                <span class="close" onclick="closeModal()">&times;</span>
                <h3><%= error%></h3>
            </div>
        </div>
        <%
            }
        %>
        <h1>ShowTracker</h1>
        <%
            if (request.getParameter("first-name") == null) {
        %>
        <p id="page-message">Hi, <%= request.getAttribute("first-name")%></p>
        <%
        } else {
        %>
        <p id="page-message">Hi, <%= request.getParameter("first-name")%></p><%
            }
        %>
        <form id="search-form" action="SearchMedia">
            <input type="text" name="search-entry" placeholder="Search..." required>
            <input type="hidden" name="user-email" id="user-email" value=<%= request.getAttribute("email")%>>
            <%
                if (request.getParameter("first-name") == null) {
            %>
            <input type="hidden" name="first-name" id="first-name" value=<%= request.getAttribute("first-name")%>>
            <%
            } else {
            %>
            <input type="hidden" name="first-name" id="first-name" value=<%= request.getParameter("first-name")%>><%
                }
            %>
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

                    <form action="DeleteMedia">
                        <input type="hidden" name="email" id="email" value=<%= request.getAttribute("email")%>>
                        <input type="hidden" name="media-id" id="media-id" value=<%= m.getId()%>>
                        <%
                            if (request.getParameter("first-name") == null) {
                        %>
                        <input type="hidden" name="first-name" id="first-name" value=<%= request.getAttribute("first-name")%>>
                        <%
                        } else {
                        %>
                        <input type="hidden" name="first-name" id="first-name" value=<%= request.getParameter("first-name")%>><%
                            }
                        %>
                        <button id="delete-media">Remove</button>
                    </form>
                </div>

            </div>

            <%
                    }
                }
            %>

        </div>
        <script>
            window.addEventListener("load", function () {
                var modal = document.getElementById("myModal");
                modal.style.display = "block";
            });

            function closeModal() {
                var modal = document.getElementById("myModal");
                modal.style.display = "none";
            }
        </script>
    </body>

</html>