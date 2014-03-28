/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
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
public class mcabkupd extends HttpServlet {

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
            String bookid = request.getParameter("b_id");
            String isbn = request.getParameter("isbn");
            String callnum = request.getParameter("ddc");
            String title = request.getParameter("title");
            String author = request.getParameter("author");
            String edition = request.getParameter("edition");
            String pob = request.getParameter("pob");
            String nob = request.getParameter("nob");
            String yob = request.getParameter("yob");
            String pagenum = request.getParameter("page");
            String series = request.getParameter("series");
            String type = request.getParameter("type");
            String doa = request.getParameter("doa");
            String source = request.getParameter("source");
            BigDecimal cost = new BigDecimal(request.getParameter("cost"));
            String status = request.getParameter("status");
            //    out.println("updated successfully !"+type+"IIII"+doa+"IIII"+source+"IIII"+cost+"IIII"+status);
            SessionFactory sf = new Configuration().configure().buildSessionFactory();
            Session s = sf.openSession();
            Transaction t = s.beginTransaction();
            String hql = "UPDATE Mcabookreg SET isbn=:isbn,callnum=:callnum ,title=:title,"
                    + "author=:author,edition=:edition,pob=:pob,nob=:nob,yob=:yob,pagenum=:pagenum,"
                    + "series=:series,type=:type,doa=:doa,source=:source,cost=:cost,status=:status "
                    + "where bookid=:bookid";
            Query q = s.createQuery(hql);
            q.setString("bookid", bookid);
            q.setString("isbn", isbn);
            q.setString("callnum", callnum);
            q.setString("title", title);
            q.setString("author", author);
            q.setString("edition", edition);
            q.setString("pob", pob);
            q.setString("nob", nob);
            q.setString("yob", yob);
            q.setString("pagenum", pagenum);
            q.setString("series", series);
            q.setString("type", type);
            q.setString("doa", doa);
            q.setString("source", source);
            q.setBigDecimal("cost", cost);
            q.setString("status", status);
            q.executeUpdate();
            t.commit();
            s.close();

            out.println("updated successfully !");
        } catch (Exception e) {
            out.println(e.getMessage());
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
