/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import com.oreilly.servlet.MultipartRequest;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import library.Mcainbox;
import library.Mcapatron;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author Shajeer
 */
public class mcapatronreg extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
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
            String path = "C:/Users/Shajeer/Documents/NetBeansProjects/etude22/web/imgupddir/";
            
            //recieving image

            MultipartRequest mr = new MultipartRequest(request, path);
            String name = mr.getOriginalFileName("photo");
            String uid = mr.getParameter("st_id");
            String uname = mr.getParameter("st_name");
            String dob = mr.getParameter("dob");
            String address = mr.getParameter("address");
            String place = mr.getParameter("place");
            Integer pincode = Integer.parseInt(mr.getParameter("pincode"));
            Long phone = Long.parseLong(mr.getParameter("phone"));
            String email = mr.getParameter("email");
            String doj = mr.getParameter("doj");
            String batch = mr.getParameter("batch");
            Integer rollnumber = Integer.parseInt(mr.getParameter("rollnum"));
            
            
            //converting to byte
            
            File f = new File(path + name);
            byte[] b = new byte[(int) f.length()];
            FileInputStream fileInputStream = new FileInputStream(f);
            fileInputStream.read(b);
            fileInputStream.close();
            SessionFactory sf = new Configuration().configure().buildSessionFactory();
            Session s = sf.openSession();
            Transaction t = s.beginTransaction();
            Mcapatron m = new Mcapatron(uid, uname, dob, address, place, pincode, phone, email, doj, batch, rollnumber, b, null);
            s.save(m);
            t.commit();
            f.delete();
            out.print("done ! successfully registered user " + uname);
            Session ses = sf.openSession();
            Transaction tr = ses.beginTransaction();
            String mail = "Welcome to etude Library management system, </br>now you can sign in to your account any time with user id and date of birth</br>";
            String subject = "Welcome ! This is an automatic generated message";

            //getting message sending date
            
            Date date = new Date();
            DateFormat df = new SimpleDateFormat("dd-MM-yyyy");
            String sysdate = df.format(date);
            Mcainbox mi = new Mcainbox(m, mail, 0, sysdate, subject);
            ses.save(mi);
            tr.commit();
            ses.close();
            s.close();
        } catch (Exception e) {
            out.println(e.getClass());
        }
    }

// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
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
     * Handles the HTTP
     * <code>POST</code> method.
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
