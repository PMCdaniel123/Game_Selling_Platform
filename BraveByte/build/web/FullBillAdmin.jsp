<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" href="Style/BillStyle.css">
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
               <a href="Admin.jsp" class="selection">Home</a>

                <a href="BillAdmin.jsp" class="selection selected">Bills</a>
                 
            </div>
            <div class="head-page_user">
                <a href="cart" class="selection"><ion-icon name="cart-outline"></ion-icon></a>
                <a href="Profile.jsp" class="selection"><ion-icon name="person-circle-outline"></ion-icon></a>
                  <a href="LogoutServlet" class="selection"><ion-icon name="log-out-outline"></ion-icon></a>
            </div>
        </div>



            <div class="body-page">
                <h1 > Bills </h1>
                <div class="bills">
                    <div class="bill">

                        <div class="bill-upper">
                            <c:forEach items="${bills}" var="x">
                                <p>Bill ID : ${x.billID}</p> <p>Full Name : ${x.fullName}</p>  <p>Date : ${x.billDate}</p> <p>Total : ${x.total} </p>
                            </c:forEach>
                        </div>
                        <c:forEach items="${games}" var="x">
                            <div class="bill-down">

                                <div class="game">
                                    <h3>Game</h3>
                                    <p>${x.title}</p>
                                </div>
                                <div class="category">
                                    <h3>Category</h3>
                                    <p>${x.kind}</p>
                                </div>
                                <div class="price">
                                    <h3>Price</h3>
                                    <p>${x.price}</p>
                                </div>

                            </div>
                        </c:forEach>
                    </div>
                </div>


            </div>
            <%@include file="footer.jsp" %>
        </div>
        <script src="Script/LibraryScript.js"></script>
        <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>

    </body>

</html>
