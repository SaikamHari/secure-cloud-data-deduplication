package action;

import Util.GetKeys;
import Util.TrippleDes;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import pack.Dbconnection;
import pack.Ftpcon;
import pack.MailSender;

public class upload extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            File f = null;
            DiskFileItemFactory diskFile = new DiskFileItemFactory();
            diskFile.setRepository(f);
            ServletFileUpload sfu = new ServletFileUpload(diskFile);
            List item = sfu.parseRequest(request);
            Iterator itr = item.iterator();
            FileItem items = (FileItem) itr.next();
            String fileName = items.getName();
            String filename = items.getName().toLowerCase();
            f = new File("D:/" + filename);
            String originalData = getStringFromInputStream(items.getInputStream());
            Connection con = Dbconnection.getConn();
            Statement st3 = con.createStatement();
            ResultSet rt3 = st3.executeQuery("select * from files where filename='" + filename + "'");
            if (rt3.next()) {
                response.sendRedirect("upload.jsp?failed='yes'");
            } else {
// Disabled for security:                 System.out.println("String is  " + originalData);
                String filefirstKey = new GetKeys().encrypt(originalData);
// Disabled for security:                 System.out.println("filefirstKey " + filefirstKey);
                String SecondKey = new GetKeys().encrypt("Thisstringwillworkforgettingsecondkeys");
// Disabled for security:                 System.out.println("SecondKey " + SecondKey);
                String encryptedtext = new TrippleDes(filefirstKey).encrypt(originalData);
// Disabled for security:                 System.out.println("first encr " + encryptedtext);
                String againencryptedtext = new TrippleDes(SecondKey).encrypt(encryptedtext);
// Disabled for security:                 System.out.println("secondencr " + againencryptedtext);

//            FileWriter fw=new FileWriter(f);
//            fw.write(encryptedtext);
//            fw.close();
//            byte[] b=secretKey.getEncoded();//encoding secretkey
//            String skey=Base64.encode(b);
//            System.out.println("converted secretkey to string:"+skey);
                HttpSession user = request.getSession(true);
                String owner = user.getAttribute("username").toString();
                DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
                Date date = new Date();
                System.out.println(dateFormat.format(date));
                String time = dateFormat.format(date);
                Calendar cal = Calendar.getInstance();
                System.out.println(dateFormat.format(cal.getTime()));
                InputStream input = items.getInputStream();
                byte b[] = new byte[input.available()];
                System.out.println("before compression size is " + b.length);
                String len = b.length + "bytes";
//             boolean status=new Ftpcon().upload(f);
//            if(status){
//                 Statement st=con.createStatement();
//                 Statement st1=con.createStatement();
//                 ResultSet rt1=st1.executeQuery("select * from user_reg where username='"+owner+"'");
//                 if(rt1.next()){
//                 String mail=rt1.getString("mail");
//                 String msg="Filename:"+file.getName()+"\n Filekey:"+skey;
//                 new MailSender().sendMail(mail,"File Key", msg);    
//                 }
//                 else{
//                     out.println("error while sending mail");
//                 }
//                int i=st.executeUpdate("insert into files(filename,content,owner_name,upload_time,size,file_key)values('"+file.getName()+"','"+encryptedtext+"','"+owner+"','"+time+"','"+len+"','"+filefirstKey+"')");
//                if(i!=0){
//                    response.sendRedirect("upload.jsp?status='uploded'");
//                    
//                }
//                else{
//                    out.println("error while uploading additional informations");
//                }
//            }
//            else{
//                out.println("error");
//            }
                Statement st = con.createStatement();
                int i = st.executeUpdate("insert into files(filename,content,owner_name,upload_time,size,file_key, second_key)values('" + filename + "','" + againencryptedtext + "','" + owner + "','" + time + "','" + len + "','" + filefirstKey + "','" + SecondKey + "')");
                if (i != 0) {
                    response.sendRedirect("upload.jsp?status='uploded'");
                    try {
                        String mail = null;
                        Statement st1 = con.createStatement();
                        ResultSet rt1 = st1.executeQuery("select * from user_reg where username='" + owner + "'");
                        if (rt1.next()) {
                            mail = rt1.getString("mail");
                        }
                        String msg = "Filename:" + filename + "\n Public Key:" + SecondKey + "\n Private key: " + filefirstKey;
                        new MailSender().sendMail(mail, "File Key", msg);
                    } catch (Exception ex) {
// Disabled for security:                         ex.printStackTrace();
                    }
                } else {
                    out.println("error while uploading additional informations");
                }
            }
        } catch (Exception e) {
            out.println(e);
        } finally {
            out.close();
        }
    }

    private static String getStringFromInputStream(InputStream is) {
        BufferedReader br = null;
        StringBuilder sb = new StringBuilder();
        String line;
        try {
            br = new BufferedReader(new InputStreamReader(is));
            while ((line = br.readLine()) != null) {
                sb.append(line + "\n");
            }
        } catch (IOException e) {
// Disabled for security:             e.printStackTrace();
        } finally {
            if (br != null) {
                try {
                    br.close();
                } catch (IOException e) {
// Disabled for security:                     e.printStackTrace();
                }
            }
        }
        return sb.toString();
    }
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
