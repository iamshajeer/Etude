package library.mba;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import library.Mbabookreg;
import library.Mbapatron;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author Shajeer
 */
public class mbapatsearch extends HttpServlet {

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
            String uname = "";
            String dob = "";
            String address = "";
            String author = "";
            String place = "";
            String pincode = "";
            String phone = "";
            String email = "";
            String doj = "";
            String batch = "";
            String rollnumber = "";
            SessionFactory sf = new Configuration().configure().buildSessionFactory();
        Session s = sf.openSession();
        Mbabookreg m = null;
        Transaction t = s.beginTransaction();
        String hql = "FROM Mbapatron where uid=:uid";
        List list = s.createQuery(hql).setString("uid", uid).list();
        Iterator iterator = list.iterator();
        Mbapatron mb=null;
        while (iterator.hasNext()) {
            mb=(Mbapatron) iterator.next();
            uname=mb.getUname();
            dob=mb.getDob();
            out.println(mb.getAddress());
            address=mb.getAddress();
            place=mb.getPlace();
            pincode=String.valueOf(mb.getPincode());
            phone=String.valueOf(mb.getPhone());
            email=mb.getEmail();
            doj=mb.getDoj();
            batch=mb.getBatch();
            rollnumber=String.valueOf(mb.getRollnumber());
            break;
        }
            request.getSession().setAttribute("uid", uid);
            request.getSession().setAttribute("uname", uname);
            request.getSession().setAttribute("dob", dob);
            request.getSession().setAttribute("address", address);
            request.getSession().setAttribute("place", place);
            request.getSession().setAttribute("pincode", pincode);
            request.getSession().setAttribute("phone", phone);
            request.getSession().setAttribute("email", email);
            request.getSession().setAttribute("doj", doj);
            request.getSession().setAttribute("batch", batch);
            request.getSession().setAttribute("rollnumber", rollnumber);
            response.sendRedirect("updatereg/mbapatronupd.jsp");
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
