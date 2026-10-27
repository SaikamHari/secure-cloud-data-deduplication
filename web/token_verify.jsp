<%@page import="pack.MailSender"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="pack.Dbconnection"%>
<%
    String token=request.getParameter("token");
    HttpSession user=request.getSession();
    String uname=user.getAttribute("username").toString();
    System.out.println("token "+token);
    System.out.println("uname "+uname);
    try{
        int count =0;
        Connection con=Dbconnection.getConn();
        Statement st=con.createStatement();
        Statement st1=con.createStatement();
        String mail = null;
        ResultSet rt=st.executeQuery("select *from user_reg  where token_='"+token+"' and username='"+uname+"'");
        if(rt.next()){
            //count=rt.getInt("count_");
            mail = rt.getString("mail");
            int i = st1.executeUpdate("update user_reg set count_='0' where username='"+uname+"'");
            if(i!=0){
                response.sendRedirect("user_page1.jsp");
            }
        }else{
          count++;
          st1.executeUpdate("update user_reg set count_='"+count+"' where username='"+uname+"'");
           if(count>2){
               new MailSender().sendMail(mail, "Account","Your Account blocked due to given token is invalid " );
               st1.executeUpdate("update user_reg set activate='no' where username='"+uname+"'");
               out.println("Your Account blocked due to given token is invalid ");
           }else{
               out.println("invalid token id..."); 
           }
        }
    }catch(Exception ex){
        ex.printStackTrace();
    }
%>