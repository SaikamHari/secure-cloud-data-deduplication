<%@page import="pack.Dbconnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Util.TrippleDes"%>
<%
     int id = Integer.parseInt(request.getParameter("fid"));
    String content = request.getParameter("content");
    String fname = request.getParameter("fname");
    String firstKey = request.getParameter("first");
    String secondKey = request.getParameter("second");
    String oname = request.getParameter("oname");
    String encrtptFirst = new TrippleDes(firstKey).encrypt(content);
    String encrtptsecond = new TrippleDes(secondKey).encrypt(encrtptFirst);
    try{
         Connection conn = Dbconnection.getConn();
         Statement smt = conn.createStatement();
         int  i = smt.executeUpdate("update files set content ='"+encrtptsecond+"'where idfiles ='"+id+"'");
         smt.execute("insert into updates (filename, username, time)values('"+fname+"','"+oname+"',now()) ");
         if(i!=0){
             response.sendRedirect("update.jsp?success");
         }else{
             response.sendRedirect("update.jsp?failed");
         }
    }catch(Exception ex){
        ex.printStackTrace();
    }
%>