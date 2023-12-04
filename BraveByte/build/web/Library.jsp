<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Library</title>
    <link rel="stylesheet" href="Style/LibraryStyle.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Dongle&family=Montserrat&family=Raleway:wght@600;700&display=swap" rel="stylesheet">
</head>

<body>
    <div class="page">
    
        <div class="head-page">
            <img src="img/white.jpg" alt="">
            <div class="head-page_logo">BRAVE<ion-icon id='logo' name="shield-outline"></ion-icon>BYTE</div>
            <div class="head-page_select">
                <a href="home.jsp" class="selection">HOME</a>
                <a href="games.jsp" class="selection">GAMES</a>

  
                <a href="bill" class="selection">TRANSACTION</a>

                <a href="library" class="selection selected">LIBRARY</a>
                 
            </div>
            <div class="head-page_user">
                <a href="cart" class="selection"><ion-icon name="cart-outline"></ion-icon></a>
                <a href="Profile.jsp" class="selection"><ion-icon name="person-circle-outline"></ion-icon></a>
                  <a href="LogoutServlet" class="selection"><ion-icon name="log-out-outline"></ion-icon></a>
            </div>
        </div>

        <div class="body-page">
            <h1 > LIBRARY </h1>
            <h2 class="number-games">Total :<%= request.getAttribute("count")%> Game</h2>
            <div class="cart-field">
                <div class="titles">
                    <div class="section blank"></div>
                    <div class="section title-name">Name</div>
                    <div class="section category">Category</div>
                    <div class="section ">Price</div>
                    <div class="section buttons"> </div>
                </div>
                    <c:forEach items="${library}" var="x">
                          
                <div class="game gow" style="background-image: url('${x.background}');">
                    <div class="background"></div>
                    <div class="section blank"></div>
                    <div class="section name">${x.title} </div>
                    <div class="section category"><p>${x.kind}</p> </div>
                    <div class="section price">${x.price}</div>
                    <div class="section buttons"> <button><ion-icon name="play-circle-outline"></ion-icon></button> </div>
                </div>
                      </c:forEach>
            </div>
        </div>
         <%@include file="footer.jsp" %>
    </div>
    <script src="Script/LibraryScript.js"></script>
    <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>

</body>

</html>
