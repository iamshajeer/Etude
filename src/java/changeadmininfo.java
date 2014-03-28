/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import library.Admin;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.classic.Session;

/**
 *
 * @author Shajeer
 */
public class changeadmininfo extends HttpServlet {

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
            throws ServletException, IOException, NoSuchAlgorithmException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String uid = request.getParameter("uid");
        String newuid = request.getParameter("newuid");
        String password = request.getParameter("password");
        String newpassword = request.getParameter("newpassword");
        String newconfpassword = request.getParameter("newconfpassword");
        if (!newpassword.equals(newconfpassword)) {
            out.println("password mismatch");
        } else {
            //else parts starts here
            SessionFactory sf = new Configuration().configure().buildSessionFactory();
            Session s = sf.openSession();
       //     PassEncrypt p = new PassEncrypt();
            Session ses = sf.openSession();
            Transaction tr = ses.beginTransaction();
            Transaction t = s.beginTransaction();
            String hql = "from Admin";
            boolean flag = false;
            List list = s.createQuery(hql).list();
            Iterator iterator = list.iterator();
            Admin de = null;
            while (iterator.hasNext()) {
                de = (Admin) iterator.next();
                if (de.getAdminid().equals(uid)) {
                    //String encpas = p.encryptPassword(de.getAdminpass());
                    if (password.equals(de.getAdminpass())){
                        String hql1 = "update Admin set adminpass=:newpass,adminid=:adminid where id=1";
                        Query q = s.createQuery(hql1);
//                        String encpass = p.encryptPassword(newpassword);
                        q.setString("newpass", newpassword);
                        q.setString("adminid", newuid);
                        q.executeUpdate();
                        s.save(de);
                        t.commit();
                        flag = true;
                    }
                }
            }
            
            if (flag) {

                out.println("successfully changed !");

            } else {
                out.println("<h3>Login failed</h3>");
            }
            s.close();
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
        try {
            processRequest(request, response);


        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(changeadmininfo.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);


        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(changeadmininfo.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
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
