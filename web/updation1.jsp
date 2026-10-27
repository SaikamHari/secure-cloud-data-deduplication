<%@page import="Util.TrippleDes"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.sun.org.apache.bcel.internal.generic.AALOAD"%>
<%@page import="java.util.ArrayList"%>
<%@page import="pack.decryption"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="pack.Dbconnection"%>
<!DOCTYPE HTML>
<html>

<head>
<title>Secure Auditing</title>
  <meta name="description" content="website description" />
  <meta name="keywords" content="website keywords, website keywords" />
  <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
   <link rel="shortcut icon" type="image/x-icon" href="images/brainstorming_alternative.png"/>
  <link rel="stylesheet" type="text/css" href="css/style.css" />
  <!-- modernizr enables HTML5 elements and feature detects -->
  <script type="text/javascript" src="js/modernizr-1.5.min.js"></script>
  <style>
      h1{
          position: relative;
          left: 350px;
          
      }
    #id{
        width: 200px;
        height: 25px;
        background-color: #D5D5D5;
    }
    #but{
        width: 60px;
        height: 25px;
        background-color: burlywood;
    }
</style>
 <style>
    table,td,tr{
        border-collapse: collapse;
        border-style: solid;
    }
    table{
        position: relative;
        left: 100px;
        width: 680px;
    }
    td{
        text-align: center;
    }
    tr{ 
        background-color: #D9D5CF;
        height: 25px;
    }
</style>
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
            <li ><a href="update.jsp">Update</a></li>
            <li><a href="upload.jsp">Upload</a></li>
            <li><a href="download.jsp">Download</a></li>
        
          <li><a href="#"><img width="40" height="40" src="images/user.png" alt="photo_two" /></a>
            <ul>
                <li><a href="index.html">Logout</a></li>
<!--                <li><a href="register.jsp">Register</a></li>-->
            </ul>
          </li>
         
        </ul>
      </nav>
    </header>
    <div id="site_content">

      <div id="content">
          <%
    
        String encrKey =request.getParameter("savedinK");
        String contents = new TrippleDes(encrKey).decrypt(request.getParameter("scontent"));
        System.out.println("sec dec key "+encrKey);
        System.out.println("sfter first dec "+contents);
    
        String id=request.getParameter("fid");
        String firstKey = null;
        String secondKey =null;
        String fname = null;
        String oname = null;
        Connection con=Dbconnection.getConn();
        Statement st=con.createStatement();
        System.out.println(encrKey);
        System.out.println(contents);
        System.out.println(id);
         ResultSet rt=st.executeQuery("select * from files where idfiles='"+id+"'");
    if(rt.next()){
        firstKey=rt.getString("file_key");
        secondKey=rt.getString("second_key");
        fname = rt.getString("filename");
        oname = rt.getString("owner_name");
    %>
    <form action="updating.jsp" method="post">
    <input type="hidden" name="first" value="<%=firstKey%>"/><br/>
    <input type="hidden" name="fname" value="<%=fname%>"/><br/>
    <input type="hidden" name="oname" value="<%=oname%>"/><br/>
    <input type="hidden" name="second" value="<%=secondKey%>"/><br/>
    <input type="hidden" name="fid" value="<%=id%>"/><br/>
    <h1>File Name: <font style="color: tomato"> <%=fname%></font></h1>
    <textarea name="content" style="width: 400px;height: 400px;position: relative;left: 250px;"><%=contents%></textarea><br><br><br>
    
<%
}
%>
    <pre>
                                                                      <input type="submit" id="but"value="Update"/>
    </pre>
</form>

       
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
