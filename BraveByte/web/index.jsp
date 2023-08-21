
<%
    session.invalidate();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>BRAVEBYTE</title>
        <link rel="stylesheet" href="Style/style.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link
            href="https://fonts.googleapis.com/css2?family=Dongle&family=Montserrat&family=Raleway:wght@600;700&display=swap"
            rel="stylesheet">
    </head>

    <body>

        <div class="page">
            <div class="head-page">
                <div class="head_left">
                    <h1>FPT</h1>
                </div>
                <div class="head_right">
                    <h5>ABOUT US</h5>
                    <h5>...</h5>
                </div>
            </div>
            <div class="body-page">
                <div class="body-page_left">

                    <div class="login">
                        <h1>Wellcome to BRAVEBYTE</h1>
                        <h2>SIGN IN</h2>
                        <form action="LoginServlet" method="POST" class="input-fields">
                            <input type="text" name="ussignin" id="" placeholder="Username">
                            <input type="password" name="pwsignin" id="" placeholder="Password" required>
                            <button class = form-button >SIGN IN</button>
                        </form>

                        <button class=" forgot-password-button forgot-pass-login">Forgot your password ?</button>
                    </div>

                    <div class="sign-up">
                        <h1>Wellcome to BRAVEBYTE</h1>
                        <h2>SIGN UP</h2>
                        <form action="RegisterServlet" method="POST" class="input-fields-2">
                            <div class ="sub-field"><input type="text" name="usnregister" id="" placeholder="Username">
                                <input type="text" name="emailregister" id="" placeholder="Email"></div>
                            <div class="sub-field"><input type="password" name="pwregister" id="" placeholder="Password" required>
                                <input type="password" name="rpwregister" id="" placeholder="ReType Password" required></div>
                            <div class ="sub-field"><input type="text" name="fullnameregister" id="" placeholder="FullName">
                                <input type="text" name="phoneregister" id="" placeholder="Phone"></div>


                            <button class = form-button>SIGN UP</button>
                        </form>

                    </div>

                    <div class="forgot-password">
                        <h1>Wellcome to BRAVEBYTE</h1>
                        <h2>FORGOT PASSWORD</h2>
                        <form action="ForgotPasswordServlet" method="POST" class="input-fields">
                            <input type="text" name="femail" id="" placeholder="Enter your email">
                            <input type="text" name="fphone" id="" placeholder="Enter your phone number">
                            <input type="password" name="fnewpw" id="" placeholder="New Password" required>
                            <input type="password" name="fretypepw" id="" placeholder="ReType New Password" required>
                            <button class = form-button>CONFIRM</button>
                        </form>

                    </div>

                </div>
                <div class="body-page_right">
                    <div class="body-page_right_select">
                        <div class="body-contain_choose">
                            <p>Conduct by FPT Team</p>
                            <h1>BRAVEBYTE</h1>
                            <p> Dive into the ever-changing realm of gaming, where you'll encounter a roller coaster of emotions, challenges, and triumphs that will keep you on the edge of your seat.</p>
                        </div>
                        <div class="body-button">
                            <button class="login-button">LOGIN</button>
                            <button class="sign-up-button">SIGN UP</button>
                            <%
                                if (request.getParameter("status") != null) {
                            %>
                            <script>
                                function showAlert() {
                                    alert("Username or password were incorrect !");
                                }
                                showAlert();
                            </script>
                            <%
                                }
                            %>
                        </div>
                        <button class="forgot-password-button forgot-pass">Forgot your password ?</button>
                    </div>
                    <button class="body-page_back-button">
                        <ion-icon name="chevron-back-circle-outline"></ion-icon>
                    </button>
                </div>
            </div>
            <div class="foot-page">
                <div class="foot_contact_left">
                    <a href=""><ion-icon name="logo-facebook"></ion-icon></a>
                    <a href=""><ion-icon name="logo-instagram"></ion-icon></a>
                    <a href=""><ion-icon name="logo-discord"></ion-icon></a>
                </div>
                <div class="foot_contact_right">
                    <p>Special requests or error reporting - contact at:</p> <a
                        href="https://www.facebook.com/profile.php?id=100009472942133">here</a>
                </div>
            </div>


        </div>

        <script src="Script/script.js"></script>
        <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
    </body>

</html>
