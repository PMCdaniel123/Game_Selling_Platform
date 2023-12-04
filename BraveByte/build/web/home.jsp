
<%@page import="model.Pagging"%>
<%@page import="dao.PaggingDAO"%>
<%@page import="model.Game"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.GameDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>BraveByte</title>
      <link rel="stylesheet" href="Style/HomeStyle.css">
      <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Electrolize&display=swap" rel="stylesheet">
    </head>

    <body>
        <%
            GameDAO gdao = new GameDAO();
            ArrayList<Game> list = gdao.getTop3Games();

        %>
        <div class="page">
            
        <div class="head-page">
            <img src="img/white.jpg" alt="">
            <div class="head-page_logo">BRAVE<ion-icon id='logo' name="shield-outline"></ion-icon>BYTE</div>
            <div class="head-page_select">
                <a href="home.jsp" class="selection selected">HOME</a>
                <a href="games.jsp" class="selection">GAMES</a>

      
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
                            <a href="main?txtSearch=&minimum=&maximum=&kind=1&action=search">Action</a>
                        </div>
                        <div class="catagory ">
                            <div class="cata-img_adventure"></div>
                            <a href="main?txtSearch=&minimum=&maximum=&kind=2&action=search">Adventure</a>
                        </div>
                        <div class="catagory">
                            <div class="cata-img_shooter"></div>
                            <a href="main?txtSearch=&minimum=&maximum=&kind=3&action=search">Shooter</a>
                        </div>

                    </div>
                </div>
                <div class="game-showing">
                    <h1>Top game </h1>
                    <div class="top-game">
                        <%                            for (Game game : list) {
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
                                <form method="post" action="addgametocart" class="buy-form">
                                 <input type="hidden" name="idGame" value="<%= game.getId()%>" />
                                <button class="add-to-cart"> <ion-icon name="cart-outline"></ion-icon></button></form>
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
