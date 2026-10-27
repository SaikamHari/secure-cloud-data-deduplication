/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package action;

import Util.GetKeys;
import Util.TrippleDes;
import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import pack.Dbconnection;


public class Upload_1 extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection conn=null;
        PreparedStatement pstmt = null;  
        HttpSession session = request.getSession();
        try{
            File f = null;
            DiskFileItemFactory diskFile = new DiskFileItemFactory();
            diskFile.setRepository(f);
            String uploadedby = (String)session.getAttribute("ownerName");
            String emailId = (String)session.getAttribute("ownerEmaid");
// Disabled for security:             System.out.println("uploadedby   ...."+uploadedby);
            ServletFileUpload sfu = new ServletFileUpload(diskFile);
            List item = sfu.parseRequest(request);
            Iterator itr = item.iterator();
            FileItem items = (FileItem) itr.next();
            String fileName = items.getName();
            String type=fileName.substring(fileName.lastIndexOf(".")+1,fileName.length());
            String originalData = getStringFromInputStream(items.getInputStream());
// Disabled for security:             System.out.println("file data is "+originalData);
            String filefirstKey = new GetKeys().encrypt(emailId);
            String SecondKey =  new GetKeys().encrypt(emailId);
// Disabled for security:             System.out.println("file filefirstKey is "+filefirstKey);
            String encryptedData = new TrippleDes(filefirstKey).encrypt(originalData);
// Disabled for security:             System.out.println("file encryptedData is "+encryptedData);
            
            conn = Dbconnection.getConn();
            pstmt = conn.prepareStatement("insert into filedetails (owner, file_name, uploaded_by, file_type, tocloud, fileitems, first_key) values(?,?,?,?,?,?,?)");
            pstmt.setString(1, uploadedby);
            pstmt.setString(2, fileName);
            pstmt.setString(3, emailId);
            pstmt.setString(4, type);
            pstmt.setString(5, "No");
            pstmt.setString(6, encryptedData);
            pstmt.setString(7, filefirstKey);
            int i =  pstmt.executeUpdate();
             if(i!=0){
                 response.sendRedirect("dataownerhome.jsp?success");
             }else{
                 response.sendRedirect("dataownerhome.jsp?failed");
             }
        }catch(Exception ex){
// Disabled for security:             ex.printStackTrace();
            response.sendRedirect("dataownerhome.jsp?file already exist.");
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
}
