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
    table,td,tr{
        border-collapse: collapse;
        border-style: solid;
    }
    table{
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
         <%
    if(request.getParameter("rights")!=null){
        out.println("<script>alert('Updated...')</script>");
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
            <li><a href="pcloud_page.jsp">Home Cloud</a></li>
            <li><a href="users_1.jsp">Users</a></li>
            <li><a href="files.jsp">Files</a></li>
         <li><a href="index.html">Logout</a></li>
          </li>
        </ul>
      </nav>
    </header>
    <div id="site_content">

<%
 Connection con=Dbconnection.getConn();
 Statement st=con.createStatement();
 ResultSet rt=st.executeQuery("select * from files where status='Yes'");
%>
      <div id="content">
      
       <center>
                        <form action="" method="get">
                        <table style="border-style: solid;margin-left: 80px">
                            <caption> <h2 style="color: darkslateblue;font-family: monospace;font-weight: bold;font-size: 30px">FILES AVAILABLE ON CLOUD</h2></caption>
                            <tr style="background-color: #999999;font-size: 18px;font-family: monospace;font-weight: bold;">                                
                                <td style="text-align: center">FILE ID</td><td style="text-align: center">FILE NAME</td> <td style="text-align: center">UPLOADED BY</td><td style="text-align: center">UPLOADED ON</td><td style="text-align: center">SIZE</td>
                            </tr>
                            <%
                            while(rt.next()){
                                String name=rt.getString("idfiles");
                                String uname=rt.getString("filename");
                                String pass=rt.getString("owner_name");
                                String mail=rt.getString("upload_time");
                                String status=rt.getString("size");
//                                String avail=rt.getString("status");
                            %>
                            <TR>
                                <td style="text-align: center"><%=name%></td> <td style="text-align: center"><%=uname%></td> <td style="text-align: center"><%=pass%></td> <td style="text-align: center"><%=mail%></td><td style="text-align: center"><%=status%></td>
                            </TR>    
                            <%
                            }
                            %>
                        </table>
                        </form>
            </center> 
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
