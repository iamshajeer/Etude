

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
import javax.servlet.http.HttpSession;
import library.Mbapatron;
import library.Mcapatron;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.classic.Session;

/**
 *
 * @author Shajeer
 */
public class chkusrlog extends HttpServlet {

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
        String userid = request.getParameter("uid");
        String dob = request.getParameter("dob");
        String department = request.getParameter("dpt");
        out.println(department);
        SessionFactory sf = new Configuration().configure().buildSessionFactory();
        Session s = sf.openSession();
        Transaction t = s.beginTransaction();
        String hql = "from " + department;
        boolean flagmca = false, flagmba = false;
        List list = s.createQuery(hql).list();
        Iterator iterator = list.iterator();
        if (department.equals("Mcapatron")) {
            while (iterator.hasNext()) {
                Mcapatron m = (Mcapatron) iterator.next();
                if (m.getUid().equals(userid)) {
                    if (m.getDob().equals(dob)) {
                        flagmca = true;
                    }
                }

            }
        }
        //checks table mbaptron if the user belongs to mba department

        if (department.equals("Mbapatron")) {
            while (iterator.hasNext()) {
                Mbapatron m = (Mbapatron) iterator.next();
                if (m.getUid().equals(userid)) {
                    if (m.getDob().equals(dob)) {
                        flagmba = true;
                    }
                }

            }
        }

        if (department.equals(
                "biotech")) {
        }
        if (department.equals(
                "btech")) {
        }


        if (flagmca) {
            request.getSession().setAttribute("uid", userid);
            String sessionid;
            HttpSession ses = request.getSession();
            sessionid = ses.getId();
            request.getSession().setAttribute("sesid", sessionid);
            out.println(sessionid);
            request.getSession().setAttribute("sid", userid);
            request.getRequestDispatcher("user.jsp").forward(request, response);
        } else if (flagmba) {
            request.getSession().setAttribute("uid", userid);
            String sessionid;
            HttpSession ses = request.getSession();
            sessionid = ses.getId();
            request.getSession().setAttribute("sesid", sessionid);
            out.println(sessionid);
            request.getSession().setAttribute("sid", userid);
            request.getRequestDispatcher("mbauser.jsp").forward(request, response);

        } else {
            request.getSession().setAttribute("flg", "invalid");
            response.sendRedirect("loginform/userlogin.jsp");

        }

        t.commit();
        s.close();

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
