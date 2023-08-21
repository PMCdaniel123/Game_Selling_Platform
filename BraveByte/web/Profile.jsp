
<%@page import="dao.AccountDAO"%>
<%@page import="model.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("acc") == null) {
        response.sendRedirect("index.jsp"); //Chuy?n h??ng ??n trang JSP khác
    }
    AccountDAO accountDAO = new AccountDAO();
    Account acc = (Account) session.getAttribute("acc");
%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Profile</title>
        
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link
            href="https://fonts.googleapis.com/css2?family=Dongle&family=Montserrat&family=Raleway:wght@600;700&display=swap"
            rel="stylesheet">
        <link rel="stylesheet" href="Style/ProfileStyles.css">
    </head>

    <body>
        <div class="page">
       
        <div class="head-page">
            <img src="img/white.jpg" alt="">
            <div class="head-page_logo">BRAVE<ion-icon id='logo' name="shield-outline"></ion-icon>BYTE</div>
            <div class="head-page_select">
                <a href="home.jsp" class="selection">HOME</a>
                <a href="games.jsp" class="selection">GAMES</a>
                <a href="cart" class="selection">CART</a>
                <a href="" class="selection">TRANSACTION</a>
                <a href="library" class="selection">LIBRARY</a>
                 <a href="Profile.jsp" class="selection">PROFILE</a>
                  <a href="LogoutServlet" class="selection">Logout</a>
            </div>
            <div class="head-page_user"></div>
        </div>


            <div class="body-page">
                <div class="main-info">
                    <div class="avatar-cover">
                        <div class="avatar"></div>
                    </div>
                    <h1><%=acc.getUsername()%> <ion-icon name="checkmark-circle"></ion-icon> </h1>
                </div>
                <div class="sub-info">
                    <div class="basic-info1">
                        <form action="UpdateProfileServlet" method="POST">
                            <div class="info info-name"><p>Fullname: </p>  <input type="text" name ="fullname" value="<%=acc.getFullname()%>" readonly></div>
                            <div class="info info-id"><p>ID :</p> <input type="text" name ="id" value=<%=acc.getId()%> readonly></div>
                            <div class="info info-email"><p>Email :</p> <input type="text" name ="email" value=<%=acc.getEmail()%> readonly></div>
                            <div class="info info-number"><p>Phone Number :</p> <input type="text" name="phone" value=<%=acc.getPhone()%> readonly></div>
                            <div>
                                <input type="submit" value="Save Change" class="info-submit" id="info-submit">
                            </div>

                        </form>


                    </div>
                    <div class="basic-info2">
                        <div class="basic-info2_element game-bought"><ion-icon name="game-controller-outline"></ion-icon> 15 </div>
                        <div class="basic-info2_element payment-method"> <ion-icon name="card-outline"></ion-icon> <ion-icon name="logo-paypal"></ion-icon> <ion-icon name="qr-code-outline"></ion-icon> <ion-icon name="cash-outline" class = unavailable></ion-icon></div>
                        <div class="basic-info2_element linked"> <ion-icon name="mail-outline" class = unavailable></ion-icon><ion-icon name="logo-facebook" class = unavailable></ion-icon><ion-icon name="logo-discord" class = unavailable></ion-icon><ion-icon name="logo-instagram" class = unavailable></ion-icon></div>
                        <button class = edit-info>Edit information <ion-icon name="create-outline"></ion-icon></button>
                    </div>

                </div>
                <div class="high-edit">
                    <button class = edit-pass> User Secutity </button>
                    <%
                        if (request.getParameter("status") !=null) {
                            out.print(request.getParameter("status"));
                        }
                    %>
                    <div class="change-password_backgr">
                        <div class="change-password">
                            <ion-icon class = close name="close-circle-outline"></ion-icon>
                            <h1>Change Password</h1>
                            <form action="UpdatePasswordServlet" method="POST">
                                <input type="password" name="old-password" placeholder="Old password" >
                                <input type="password" name="new-password" placeholder="New password" >
                                <input type="password" name="retype-password" placeholder="Type new password again" >
                                <button class="confirm-change">Confirm change</button>
                            </form>



                        </div>
                    </div>
                </div>
            </div>
            <div class="foot-page"></div>
        </div>
        <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
        <script src="Script/Profile-script.js"></script>
    </body>

</html>