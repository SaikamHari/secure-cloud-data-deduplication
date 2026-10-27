<%@page import="java.sql.Statement"%>
<%@page import="pack.Dbconnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.io.OutputStream"%>
<%

    String filenm = request.getParameter("fnamee");
    try {
        String data = request.getParameter("content");
        byte a[] = data.getBytes();
        response.setContentType("text/plain");
        response.setHeader("Content-Disposition", "attachment; filename=\"" + filenm + "\"");
        OutputStream os = response.getOutputStream();
        os.write(a);
        os.close();
        a = null;
        if (a == null) {
        }
    } catch (Exception ex) {
        ex.printStackTrace();
    }
%>