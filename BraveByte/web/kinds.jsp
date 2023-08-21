<%-- 
    Document   : kinds
    Created on : 18-Aug-2023, 17:14:10
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BraveByte</title>
        <link rel="stylesheet" href="Style/GamesStyle.css">
    </head>
    <body>
        <%
            GameDAO gdao = new GameDAO();
            PaggingDAO pdao = new PaggingDAO();
            ArrayList<Game> kinds = (ArrayList<Game>) request.getAttribute("kinds");
        %>
        <div class="page">
            <%@include file="header.jsp" %>
            <div class="body-page">
                <div class="body-page_banner">
                    <div class="banner-content-cover">
                        <div class="banner-content">
                            <p>New Arrival</p>
                            <h1>Discover Our <br> New Collection</h1>
                            <form action="main" method="post" class="formlogin">
                                <button name="action" value="watch">Watch More</button>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="catagories-field">
                    <h1>With Diversified Categories</h1>
                    <p>Never ending journey</p>
                    <div class="catagories">
                        <div class="catagory ">
                            <div class="cata-img_action"></div>
                            <a href="show-by-kind?kind=Action">Action</a>
                        </div>
                        <div class="catagory ">
                            <div class="cata-img_adventure"></div>
                            <a href="show-by-kind?kind=Adventure">Adventure</a>
                        </div>
                        <div class="catagory">
                            <div class="cata-img_shooter"></div>
                            <a href="show-by-kind?kind=Shooter">Shooter</a>
                        </div>

                    </div>
                </div>
                <div class="game-showing">
                    <h1>List games</h1>
                    <div class="top-game">
                        <%                            for (Game game : kinds) {

                        %>
                        <div class="game RDR2" style="background-image: url('<%= game.getPoster()%>');">
                            <div class="black-bgr"></div>
                            <div class="game-rate">
                                <ion-icon name="bookmark-outline"></ion-icon>
                                <p><%= game.getRating()%></p>
                            </div>
                            <div class="game-descript">
                                <h2 class="game-name"><%= game.getTitle()%></h2>
                                <h3 class="game-price">Price : <%= game.getPrice()%>$</h3>
                            </div>
                            <div class="game-button">
                                <button class="game-info"> <ion-icon name="alert-outline"></ion-icon> </button>
                                <button class="add-to-cart"> <ion-icon name="cart-outline"></ion-icon></button>
                            </div>

                        </div>
                        <%
                            }
                        %>

                    </div>  
                    <form action="main" method="post" class="formlogin">
                        <button name="action" value="watch" class = "see-more-game"> See more </button>
                    </form>
                </div>
            </div>
            <%@include file="footer.jsp" %>
        </div>

        <script src="Script/HomeScript.js"></script>
        <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
    </body>
</html>
