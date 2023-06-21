<%-- 
    Document   : searchResults
    Created on : 20 de jun. de 2023, 13:29:05
    Author     : aluno
--%>

<%@page import="model.media.Film"%>
<%@page import="model.media.TvShow"%>
<%@page import="model.media.Media"%>
<%@page import="java.util.List"%>
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
        <a id="heading" href="Home?email=<%= request.getAttribute("email")%>&first-name=<%= request.getAttribute("first-name")%>"><h1>ShowTracker</h1></a>

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
        <p id="page-message">Search results for '<%= request.getAttribute("entry")%>'</p>
        <form id="search-form" action="SearchMedia">
            <input type="text" name="search-entry" placeholder="Search..." required>
            <input type="hidden" name="user-email" id="user-email" value=<%= request.getAttribute("email")%>>
            <input type="hidden" name="first-name" id="first-name" value=<%= request.getAttribute("first-name")%>>
            <button type="submit" value="SearchMedia">Search</button>
        </form>  

        <div class="grid-container">
            <%
                List<Media> medias = (List<Media>) request.getAttribute("result");

                if (medias.isEmpty()) {

            %>
            <h2>Nenhuma resultado encontrado!</h2>
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
                        List<Media> userMedias = (List<Media>) request.getAttribute("user-media");
                        boolean exists = false;
                        for (Media media : userMedias) {
                            if (media.getId() == m.getId()) {
                                exists = true;
                                break;
                            }
                        }
                        if (exists) {
                    %>
                    <form action="DeleteMediaAtSearch">
                        <input type="hidden" name="user-email" id="user-email" value=<%= request.getAttribute("email")%>>
                        <input type="hidden" name="media-id" id="media-id" value=<%= m.getId()%>>
                        <input type="hidden" name="search-entry" id="search-entry" value=<%= request.getAttribute("entry")%>>
                        <input type="hidden" name="first-name" id="first-name" value=<%= request.getAttribute("first-name")%>>
                        <button id="delete-media">Remove</button>
                    </form>
                    <%
                    } else {
                    %>
                    <form action="AddMedia">
                        <input type="hidden" name="user-email" id="user-email" value=<%= request.getAttribute("email")%>>
                        <input type="hidden" name="media-id" id="media-id" value=<%= m.getId()%>>
                        <input type="hidden" name="search-entry" id="search-entry" value=<%= request.getAttribute("entry")%>>
                        <input type="hidden" name="first-name" id="first-name" value=<%= request.getAttribute("first-name")%>>
                        <button id="add-media" value="AddMedia">Add</button>
                    </form>
                    <%
                        }
                    %>
                </div>

            </div>

            <%
                    }
                }
            %>

        </div>

        <div class="pagination">
            <button onclick="previousPage()">Previous</button>
            <span class="current-page">1</span>
            <button onclick="nextPage()">Next</button>
        </div>

        <script>
            var itemsPerPage = 12;
            var currentPage = 1;
            var totalItems = document.querySelectorAll('.grid-item').length;
            var totalPages = Math.ceil(totalItems / itemsPerPage);

            function showItemsForPage(page) {
                var items = document.querySelectorAll('.grid-item');
                var startIndex = (page - 1) * itemsPerPage;
                var endIndex = startIndex + itemsPerPage;

                items.forEach(function (item, index) {
                    if (index >= startIndex && index < endIndex) {
                        item.style.display = 'block';
                    } else {
                        item.style.display = 'none';
                    }
                });
            }

            function previousPage() {
                if (currentPage > 1) {
                    currentPage--;
                    updatePagination();
                    showItemsForPage(currentPage);
                }
            }

            function nextPage() {
                if (currentPage < totalPages) {
                    currentPage++;
                    updatePagination();
                    showItemsForPage(currentPage);
                }
            }

            function updatePagination() {
                var currentElement = document.querySelector('.current-page');
                currentElement.textContent = currentPage;
            }

            // Initial setup
            showItemsForPage(currentPage);

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
