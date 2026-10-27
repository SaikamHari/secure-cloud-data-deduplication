<!DOCTYPE HTML>
<html>
<head>
 <title>Secure Auditing</title>
  <meta name="description" content="website description" />
  <meta name="keywords" content="website keywords, website keywords" />
  <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
   <link rel="shortcut icon" type="image/x-icon" href="images/brainstorming_alternative.png"/>
  <link rel="stylesheet" type="text/css" href="css/style.css" />
  <link rel="stylesheet" type="text/css" href="css/upload.css" />
  <!-- modernizr enables HTML5 elements and feature detects -->
  <script type="text/javascript" src="js/modernizr-1.5.min.js"></script>
  <script>
      function validation(){
          if(document.name.token.value==0){
              alert('Enter your token');
              document.name.token.focus();
              return false;
          }
      }
  </script>
  <style>
</style>
</head>
<body>
        <%
    if(request.getParameter("status")!=null){
        out.println("<script>alert('File Upload request sent to Auditor...')</script>");
    }
     if(request.getParameter("failed")!=null){
        out.println("<script>alert('file already exist...')</script>");
    }
    %>
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
            <li ><a href="user_page1.jsp">User Home</a></li>
            <li class="selected"><a href="upload.jsp">Upload</a></li>
            <li><a href="download.jsp">Download</a></li>
            <li ><a href="update.jsp">Update</a></li>
            <li><a href="#"><img width="40" height="40" src="images/user.png" alt="photo_two" /></a>
            <ul>
                <li><a href="index.html">Logout</a></li>
<!--                <li><a href="register.jsp">Register</a></li>-->
            </ul>
          </li>
        </ul>
      </nav>
    </header>
    <div id="site_content" style="background-image: url('images/cloud.png')">
        <div id="content" >
          <%
              HttpSession user = request.getSession();
              String uname = user.getAttribute("username").toString();
              String name = user.getAttribute("name").toString();
          %>
<h1>Welocme ! <font style="color: tomato"> <%=name%></font></h1>
<div class="upload-container">
    <h2 class="upload-heading">Upload Your File</h2>
    <p class="upload-description">
        Select the file you want to submit to the auditor for approval.
    </p>

    <form action="upload" method="post" enctype="multipart/form-data">
        <div class="upload-file-area">
            <label for="upload-file"><strong>Choose a file to upload</strong></label>
            <input type="file" id="upload-file" name="file" required>
        </div>

        <div class="upload-actions">
            <button type="submit" class="upload-button">Upload File</button>
            <button type="reset" class="upload-button upload-reset">Reset</button>
        </div>
    </form>
</div>
      </div>
    </div>
    <footer>
      <p>Copyright &copy; 2014. All Rights Reserved.</p>
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



