/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author Shajeer
 */
public class mcapatupd extends HttpServlet {

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
            String uid = request.getParameter("uid");
            String uname = request.getParameter("uname");
            String dob = request.getParameter("dob");
            String address = request.getParameter("address");
            String place = request.getParameter("place");
            String pincode = request.getParameter("pincode");
            String phone = request.getParameter("phone");
            String email = request.getParameter("email");
            String doj = request.getParameter("doj");
            String batch = request.getParameter("batch");
            String rollnumber = request.getParameter("rollnumber");
            out.println(rollnumber);
            SessionFactory sf = new Configuration().configure().buildSessionFactory();
            Session s = sf.openSession();
            s.clear();
            Transaction t = s.beginTransaction();
            t.begin();
            String hql = "UPDATE Mcapatron SET uname=:uname,dob=:dob ,address=:address,"
                    + "place=:place,pincode=:pincode,phone=:phone,email=:email,doj=:doj,batch=:batch,"
                    + "rollnumber=:rollnumber "
                    + "where uid=:uid";
            Query q = s.createQuery(hql);
            q.setString("uid", uid);
            q.setString("uname", uname);
            q.setString("dob", dob);
            q.setString("address", address);
            q.setString("place", place);
            q.setInteger("pincode", Integer.parseInt(pincode));
            q.setLong("phone", Long.parseLong(phone));
            q.setString("email", email);
            q.setString("doj", doj);
            q.setString("batch", batch);
            q.setInteger("rollnumber", Integer.parseInt(rollnumber));
            q.executeUpdate();
            s.close();
            t.commit();
            out.println("updated successfully !");
        } catch (Exception e) {
            out.println(e.getCause());
        } finally {

            out.close();
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
