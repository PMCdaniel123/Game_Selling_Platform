
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>

            body {
                font-family: Arial, sans-serif;
            }
            table {
                width: 100%;
                border-collapse: collapse;
            }
            th, td {
                border: 1px solid #ccc;
                padding: 8px;
            }
            th {
                background-color: #f2f2f2;
            }
            tr:nth-child(even) {
                background-color: #f2f2f2;
            }
            tr:hover {
                background-color: #ddd;
            }
            .content {
                margin: 20px;
            }
        </style>
        <title>Bill</title>
        <link rel="stylesheet" href="Style/BillStyle.css">
    </head>
    <body>

        <div class="page">
            
        <div class="head-page">
            <img src="img/white.jpg" alt="">
            <div class="head-page_logo">BRAVE<ion-icon id='logo' name="shield-outline"></ion-icon>BYTE</div>
            <div class="head-page_select">
                
                <a href="Admin.jsp" class="selection">Home</a>

                <a href="" class="selection selected">Bills</a>

                 
            </div>
            <div class="head-page_user">
                <a href="cart" class="selection"><ion-icon name="cart-outline"></ion-icon></a>
                <a href="Profile.jsp" class="selection"><ion-icon name="person-circle-outline"></ion-icon></a>
                  <a href="LogoutServlet" class="selection"><ion-icon name="log-out-outline"></ion-icon></a>
            </div>
        </div>

            <div class="body-page">
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>IdUser</th>
                            <th>FullName</th>
                            <th>Date</th>
                            <th>Total</th>


                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${bill}" var="x">
                            <tr>
                                <td><a href="showbilladmin?billID=${x.billID}">${x.billID}</a></td>
                                <td>${x.accID}</td>
                                <td>${x.fullName}</td> 
                                <td>${x.billDate}</td>
                                <td>${x.total}</td>


                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            <%@include file="footer.jsp" %>
        </div>

        <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>

    </body>
</html>
