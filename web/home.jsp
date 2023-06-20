<%-- 
    Document   : home
    Created on : 20 de jun. de 2023, 11:06:33
    Author     : aluno
--%>

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
    <div class="grid-item">
      <div class="media-item">
        <h2>Title 1</h2>
        <p>Type: Movie</p>
        <p>Release Year: 2020</p>
        <p>Duration: 120 minutes</p>
        <button id="delete-media">Remove</button>
      </div>
    </div>
    <div class="grid-item">
      <div class="media-item">
        <h2>Title 2</h2>
        <p>Type: Movie</p>
        <p>Release Year: 2020</p>
        <p>Duration: 120 minutes</p>
        <button id="delete-media">Remove</button>
      </div>
    </div>
    <div class="grid-item">
      <div class="media-item">
        <h2>Title 3</h2>
        <p>Type: TV Series</p>
        <p>Release Year: 2019</p>
        <p>End Year: 2022</p>
        <button id="delete-media">Remove</button>
      </div>
    </div>
    <div class="grid-item">
      <div class="media-item">
        <h2>Title 4</h2>
        <p>Type: TV Series</p>
        <p>Release Year: 2022</p>
        <p>End Year: 2023</p>
        <button id="delete-media">Remove</button>
      </div>
    </div>
    <div class="grid-item">
      <div class="media-item">
        <h2>Title 5</h2>
        <p>Type: Movie</p>
        <p>Release Year: 2018</p>
        <p>Duration: 150 minutes</p>
        <button id="delete-media">Remove</button>
      </div>
    </div>
    <div class="grid-item">
      <div class="media-item">
        <h2>Title 6</h2>
        <p>Type: Movie</p>
        <p>Release Year: 2020</p>
        <p>Duration: 105 minutes</p>
        <button id="delete-media">Remove</button>
      </div>
    </div>
    <div class="grid-item">
      <div class="media-item">
        <h2>Title 7</h2>
        <p>Type: TV Series</p>
        <p>Release Year: 2017</p>
        <p>End Year: 2021</p>
        <button id="delete-media">Remove</button>
      </div>
    </div>
    <div class="grid-item">
      <div class="media-item">
        <h2>Title 8</h2>
        <p>Type: TV Series</p>
        <p>Release Year: 2019</p>
        <p>End Year: 2020</p>
        <button id="delete-media">Remove</button>
      </div>
    </div>
  </div>
</body>

</html>