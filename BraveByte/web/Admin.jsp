<%-- 
    Document   : Admin
    Created on : 19 thg 8, 2023, 23:19:11
    Author     : acer
--%>

<%@page import="dao.AdminDao"%>
<%@page import="model.Account"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.AccountDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin</title>
        <link rel="stylesheet" href="Style/AdminStyles.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Dongle&family=Montserrat&family=Raleway:wght@600;700&display=swap" rel="stylesheet">
    </head>
                <%
                    Integer id = (Integer)session.getAttribute("adminID");
                    if (id !=null) {
                %>
    <body>
        <div class="page">
            <div class="head-page">
                <img src="img\white-red.jpg" alt="">
                <div class="head-page_logo">BRAVE<ion-icon id='logo' name="shield-outline"></ion-icon>BYTE</div>
                <div class="head-page_select">
                    <a href="" class="selection">ADMINISTRATOR</a>
                </div>
                <div class="head-page_user">
                    <a href="LogoutServlet" class="selection"><ion-icon name="log-out-outline"></ion-icon></a>
                </div>
            </div>
            <div class="body-page">
                <%
                    AdminDao admin = new AdminDao();
                    
                %>
                <h1>PARAMETER</h1>
                <div class="parameters">


                    <div class="parameter num-game">
                        <div class="deco1"></div>
                        <div class="deco2"></div>

                        <h6>Super Team</h6>
                        

                    </div>

                    <div class="parameter num-user">
                        <div class="deco1"></div>
                        <div class="deco2"></div>

                        <ion-icon name="people-outline"></ion-icon></ion-icon> <%= admin.getCountAccounts()%>

                    </div>

                    <div class="parameter num-a">
                        <div class="deco1"></div>
                        <div class="deco2"></div>

                        <ion-icon name="game-controller-outline"></ion-icon> <%= admin.getCountGames()%>

                    </div>

                    <div class="parameter num-b">
                        <div class="deco1"></div>
                        <div class="deco2"></div>

                        <a href="showallbill"><ion-icon name="document-text-outline"></ion-icon><%= admin.getCountBills()%></a>

                    </div>

                </div>
                <h1>DETAIL</h1>
                <div class="details">
                    <div class="detail add-games"> <P>+ ADD GAME </P></div>
                    <div class="detail list-user"><p>SHOW ALL USER</p></div>

                </div>
                <div class="add-game">

                    <form id="myForm" method="post" action="Admin.jsp" class="input-fields">
                        <div class="input-field title">
                            <h3 > Game's Title</h3>
                            <input type="text" id="title">
                        </div>

                        <div class="input-field description">
                            <h3 >  Description</h3>
                            <input type="text"id="des">
                        </div>

                        <div class="input-field author">
                            <h3 > Author</h3>
                            <input type="text" id="author">
                        </div>

                        <div class="input-field category">
                            <h3 > Game's Category</h3>
                            <input type="text" id="category">
                        </div>

                        <div class="input-field poster">
                            <h3 > Game's poster</h3>
                            <input type="file" id="poster">
                        </div>

                        <div class="input-field background">
                            <h3 > Game's background</h3>
                            <input type="file" id="backgr">
                        </div>

                        <div class="input-field price">
                            <h3 > Price</h3>
                            <input type="text" id="price" >
                        </div>

                        <div class="input-field rating">
                            <h3 > Rating </h3>
                            <input type="text" id="rating">
                        </div>
                    </form>

                    <button class="add-game-button">Add game</button>
                    <script>
                        document.querySelector(".add-game-button").addEventListener("click", function () {
                            var xhr = new XMLHttpRequest();
                            xhr.open("POST", "AddGameServlet", true);
                            xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

                            var title = encodeURIComponent(document.getElementById("title").value);
                            var description = encodeURIComponent(document.getElementById("des").value);
                            var author = encodeURIComponent(document.getElementById("author").value);
                            var category = encodeURIComponent(document.getElementById("category").value);
                            var poster = encodeURIComponent(document.getElementById("poster").value);
                            var backgr = encodeURIComponent(document.getElementById("backgr").value);
                            var price = encodeURIComponent(document.getElementById("price").value);
                            var rating = encodeURIComponent(document.getElementById("rating").value);
                            
                            console.log(poster);
                            var data = "title=" + title + "&des=" + author + "&author=" + author + "&category=" + category + "&poster=" + poster + "&background=" + backgr + "&price=" + price + "&rating=" + rating; // Thêm các trường input khác

                            xhr.send(data);
                        });

                    </script>

                </div>
                <div class="show-list-user">
                    <h1>List of user :</h1>
                    <%
                        AccountDAO accountDAO = new AccountDAO();
                        ArrayList<Account> accounts = new ArrayList<>();
                        accounts = accountDAO.getAccountList();
                    %>
                    <div class="list-users">
                        <%
                            for (Account account : accounts) {
                                String userClass = account.isRole() ? "admin" : "";
                        %>
                        <div class="user <%= userClass%>" user-id="<%= account.getId()%>">


                            <div class="user_left">
                                <div class="user-system">
                                    <h3>ID : <%= account.getId()%></h3>
                                    <h3>User Name : <%= account.getUsername()%></h3>
                                </div>
                                <div class="user-info">
                                    <h4><ion-icon name="person-circle-outline"></ion-icon>  <%= account.getFullname()%> </h4>
                                    <h4><ion-icon name="mail-open-outline"></ion-icon>  <%= account.getEmail()%></h4>
                                    <h4><ion-icon name="call-outline"></ion-icon> <%= account.getPhone()%></h4>
                                </div>
                            </div>
                            <div class="user_right"><button  class="delete-user"><ion-icon name="close-circle-outline"></ion-icon></button></div>
                            
                        </div>
                        <%
                            }
                        %>
                    <script>
                                var deleteButtons = document.querySelectorAll(".delete-user");
                                deleteButtons.forEach(function (button) {
                                    button.addEventListener("click", function (event) {
                                        var id = event.target.closest(".user").getAttribute("user-id");

                                        var xhr = new XMLHttpRequest();
                                        xhr.open("POST", "DeleteAccountServlet", true);
                                        xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

                                        var data = "id=" + id ; 

                                        xhr.send(data);
                                        event.target.closest(".user").remove();
                                    });
                                });


                            </script>
                    </div>
                </div>
            </div>
            <%@include file="footer.jsp" %>
        </div>

        <script src="Script/AdminScript.js"></script>
        <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>

    </body>
    <%
        }else{

    %>
    <body>
        <h1 class='alert-admin'>Don't do that babe</h1>
    </body>
    <%
        }
    %>

</html>
