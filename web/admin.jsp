<!DOCTYPE HTML>
<html>

    <head>
        <title>Secure Auditing</title>
        <meta name="description" content="website description" />
        <meta name="keywords" content="website keywords, website keywords" />
        <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
        <link rel="shortcut icon" type="image/x-icon" href="images/brainstorming_alternative.png"/>
        <link rel="stylesheet" type="text/css" href="css/style.css" />
        <link rel="stylesheet" type="text/css" href="css/auditor-login.css" />
        <!-- modernizr enables HTML5 elements and feature detects -->
        <script type="text/javascript" src="js/modernizr-1.5.min.js"></script>
        <style>
            #id{
                width: 200px;
                height: 25px;
                background-color: #D3F2F7;
            }
            #but{
                width: 60px;
                height: 25px;
            }
        </style>
        <script>
            function validation() {
                var uname = document.ulogin.username.value;
                var pass = document.ulogin.password.value;

                if (uname == 0) {
                    alert("Enter ADMIN ID");
                    document.ulogin.username.focus();
                    return false;
                }
                if (pass == 0) {
                    alert("Enter password");
                    document.ulogin.password.focus();
                    return false;
                }
            }
        </script>
    </head>

    <body>
        <div id="main">
            <header>
                <div id="logo">
                    <div id="logo_text">
                        <!-- class="logo_colour", allows you to change the colour of the text -->
                        <pre> <h1><a href="#"> </a></h1></pre>
                    </div>
                </div>
                <nav>
                    <ul class="sf-menu" id="nav">
                        <li><a href="index.html">Home</a></li>
                        <li  class="selected"><a href="admin.jsp">Auditor</a></li>
                        <li><a href="p_cloud.jsp">Cloud Server</a></li>
                        <li><a href="#">User</a>
                            <ul>
                                <li><a href="user.jsp">Login</a></li>
                                <li><a href="register.jsp">Register</a></li>
                            </ul>
                        </li>
                        <li><a href="">Contact Us</a></li>
                    </ul>
                </nav>
            </header>
            <div id="site_content">
                <div id="sidebar_container">
                    <div class="gallery">
                        <ul class="images">
                            <li class="show"><img width="450" height="450" src="images/model.png" alt="photo_one" /></li>
                            <li><img width="450" height="450" src="images/c2.jpg" alt="photo_two" /></li>
                            <li><img width="450" height="450" src="images/c3.jpg" alt="photo_three" /></li>
                            <li><img width="450" height="450" src="images/c4.jpg" alt="photo_four" /></li>
                            <li><img width="450" height="450" src="images/c5.jpg" alt="photo_five" /></li>
                        </ul>
                    </div>
                </div>
                <div id="content">
                    <div class="auditor-login-card">
                        <h1 class="auditor-login-title">Auditor Login</h1>
                        <p class="auditor-login-subtitle">
                            Sign in to securely review and approve file requests.
                        </p>

                        <form action="admin_login" name="ulogin" method="post" onsubmit="return validation()">
                            <div class="auditor-form-group">
                                <label for="auditor-username">Auditor ID</label>
                                <input type="text" id="auditor-username" name="username"
                                       placeholder="Enter Auditor ID" autocomplete="username" required />
                            </div>

                            <div class="auditor-form-group">
                                <label for="auditor-password">Password</label>
                                <input type="password" id="auditor-password" name="password"
                                       placeholder="Enter password" autocomplete="current-password" required />
                            </div>

                            <div class="auditor-login-actions">
                                <button type="submit" class="auditor-login-button">Sign In</button>
                                <button type="reset" class="auditor-login-button auditor-reset-button">Reset</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <footer>
                <p>Copyright &copy; . All Rights Reserved.</p>
            </footer>
        </div>
        <p>&nbsp;</p>
        <!-- javascript at the bottom for fast page loading -->
        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="js/jquery.easing-sooper.js"></script>
        <script type="text/javascript" src="js/jquery.sooperfish.js"></script>
        <script type="text/javascript" src="js/image_fade.js"></script>
        <script type="text/javascript">
                                $(document).ready(function() {
                                    $('ul.sf-menu').sooperfish();
                                });
        </script>
    </body>
</html>


