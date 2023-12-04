<%-- 
    Document   : games
    Created on : 18-Aug-2023, 20:40:15
    Author     : user
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="model.Game"%>
<%@page import="model.Pagging"%>
<%@page import="dao.PaggingDAO"%>
<%@page import="dao.GameDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>BraveByte</title>

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link
            href="https://fonts.googleapis.com/css2?family=Dongle&family=Montserrat&family=Raleway:wght@600;700&display=swap"
            rel="stylesheet">
        <link rel="stylesheet" href="Style/bootstrap.css" type="text/css"/>
        <link rel="stylesheet" href="Style/bootstrap.min.css" type="text/css"/>
        <link rel="stylesheet" href="Style/GamesStyle.css">
    </head>
    <body>
        <%
            GameDAO gdao = new GameDAO();
            String keyword = (String) request.getAttribute("keyword");
            String maximum = (String) request.getAttribute("maximum");
            String minimum = (String) request.getAttribute("minimum");
            String sort = (String) request.getAttribute("sort");
            String kind = (String) request.getAttribute("kind");
//            ArrayList<Game> searchs = (ArrayList<Game>) request.getAttribute("searchs");
//
//            if (searchs == null) {
//                searchs = gdao.getGameList();
//            }
            PaggingDAO pdao = new PaggingDAO();
            Pagging pagging = pdao.getListSearch(keyword, minimum, maximum, kind, sort, 1, 4);
            int count = gdao.searchGames(keyword, minimum, maximum, kind, sort).size();

            int numberPage = (int) Math.ceil((count * 1.0) / pagging.getPerPage());
            int currentPage = 1;
            ArrayList<Game> list = pagging.getItems();
            if (request.getAttribute("pagging") != null) {
                pagging = (Pagging) request.getAttribute("pagging");
                list = pagging.getItems();
                currentPage = pagging.getPage();
            }
        %>
        <div class="page">
            
        <div class="head-page">
            <img src="img/white.jpg" alt="">
            <div class="head-page_logo">BRAVE<ion-icon id='logo' name="shield-outline"></ion-icon>BYTE</div>
            <div class="head-page_select">
                <a href="home.jsp" class="selection">HOME</a>
                <a href="games.jsp" class="selection selected">GAMES</a>

                <a href="cart" class="selection">CART</a>
                <a href="bill" class="selection">TRANSACTION</a>

                <a href="library" class="selection">LIBRARY</a>
                 
            </div>
            <div class="head-page_user">
                <a href="cart" class="selection"><ion-icon name="cart-outline"></ion-icon></a>
                <a href="Profile.jsp" class="selection"><ion-icon name="person-circle-outline"></ion-icon></a>
                  <a href="LogoutServlet" class="selection"><ion-icon name="log-out-outline"></ion-icon></a>
            </div>
        </div>


            <div class="body-page">
                <div class="">
                                   <div class="">
                    <form action="main" method="get" class="body-up">
                        <div class="search-input">
                            <input type="text" class="search" placeholder="Enter game name or publicer" name="txtSearch">
                            <div class="search-price">
                                <p>Minimum : </p><input type="text" name="minimum">
                                <p>Maximum : </p> <input type="text" name="maximum">
                            </div>
                        </div>
                        <div class="search-choose">
                            <div class="sort-fields">
                                <div class="sort-buttons">
                                <label class="category action">
                                    <input type="radio" name="kind" id="adventure" value="1">
                                    <p class=check-mark>Action</p>
                                </label>
                                <label class="category adventure">
                                    <input type="radio" name="kind" id="adventure" value="2">
                                    <p class=check-mark>Adventure</p>
                                </label>
                                <label class="category shooter">
                                    <input type="radio" name="kind" id="adventure" value="3">
                                    <p class=check-mark>Shooter</p>
                                </label>
                            </div>
                            <div class="sort-buttons">
                                <label class="sort up-alphabet">
                                    <input type="radio" name="sort" id="up-alphabet" value="1">
                                    <p class=check-mark>A - Z</p>
                                </label>
                                <label class="sort down-alphabet">
                                    <input type="radio" name="sort" id="down-alphabet" value="2">
                                    <p class=check-mark>Z -A</p>
                                </label>

                                <label class="sort up-price">
                                    <input type="radio" name="sort" id="up-price" value="3">
                                    <p class=check-mark><ion-icon name="arrow-up-outline"></ion-icon>$</p>
                                </label>
                                <label class="sort down-price">
                                    <input type="radio" name="sort" id="down-price" value="4">
                                    <p class=check-mark><ion-icon name="arrow-down-outline"></ion-icon>$</p>
                                </label>
                            </div>

                            </div>
                            <button class = search-button name="action" value="search"> <ion-icon name="search-outline"></ion-icon> </button>
                        </div>
                    </form>
                </div>
                </div>
                <div class="body-left">
                    <h1 style="color: red;">Games</h1>
                    <div class="games">
                        <%

                            for (Game game : list) {
                        %>
                        <div class="game RDR2" style="background-image: url('<%= game.getPoster()%>');">
                            <div class="black-bgr"></div>
                            <div class="game-rate">
                                <ion-icon name="bookmark-sharp"></ion-icon>
                                <p><%= game.getRating()%></p>
                            </div>
                            <div class="game-descript">
                                <h2 class="game-name"><%= game.getTitle()%></h2>
                                <h3 class="game-price">Price : <%= game.getPrice()%>$</h3>
                            </div>
                            <div class="game-button">
                                <form method="post" action="addgametocart">
                                    <input type="hidden" name="idGame" value="<%= game.getId()%>" />
                                    <button class="add-to-cart"> <ion-icon name="cart-outline"></ion-icon></button></form>
                            </div>

                        </div>
                        <%
                            }
                        %>
                    </div>
                </div>
                <%
                    //main?txtSearch=&minimum=&maximum=&kind=2&action=search
                    String url = "main?";
                    if (keyword == null) {
                        url += "txtSearch=";
                    } else {
                        url += ("txtSearch=" + keyword);
                    }
                    if (minimum == null) {
                        url += "&minimum=";
                    } else {
                        url += ("&minimum=" + minimum);
                    }
                    if (maximum == null) {
                        url += "&maximum=";
                    } else {
                        url += ("&maximum=" + maximum);
                    }
                    if (kind != null) {
                        url += ("&kind=" + kind);
                    }
                    if (sort != null) {
                        url += ("&sort=" + sort);
                    }
                    url += "&action=search";
                %>
                <nav aria-label="Page navigation example">
                    <ul class="pagination justify-content-end">
                        <li class="page-item ">
                            <a class="page-link <%= currentPage == 1 ? "disabled" : null%>" href="<%= url%>&currentPage=<%= currentPage - 1%>">Previous</a>
                        </li>

                        <%
                            for (int i = 1; i <= numberPage; i++) {%>
                        <li class="page-item">
                            <a class="page-link <%= currentPage == i ? "active" : null%> " href="<%= url%>&currentPage=<%= i%>"><%= i%></a>
                        </li>
                        <% }%>

                        <li class="page-item">
                            <a class="page-link <%= currentPage == numberPage ? "disabled" : null%>"  href="<%= url%>&currentPage=<%= currentPage + 1%>">Next</a>
                        </li>
                    </ul>
                </nav>     
            </div>
            <%@include file="footer.jsp" %>
        </div>
        <script src="Script/HomeScript.js"></script>
        <script src="Script/bootstrap.js"></script>
        <script src="Script/bootstrap.bundle.js"></script>
        <script src="Script/bootstrap.min.js"></script>
        <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>

    </body>
</html>
