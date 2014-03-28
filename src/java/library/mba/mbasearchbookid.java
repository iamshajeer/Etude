package library.mba;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import library.Mcabookreg;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author Shajeer
 */
public class mbasearchbookid extends HttpServlet {

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
        String bookid = request.getParameter("b_id");
        SessionFactory sf = new Configuration().configure().buildSessionFactory();
        Session s = sf.openSession();

        String isbn = "";
        String callnum = "";
        String title = "";
        String author = "";
        String edition = "";
        String pob = "";
        String nob = "";
        String yob = "";
        String pagenum = "";
        String series = "";
        String type = "";
        String doa = "";
        String source = "";
        BigDecimal cost = null;
        String status = "";
        boolean flag = false;
        Mcabookreg m = null;
        Transaction t = s.beginTransaction();
        String hql = "FROM Mbabookreg where bookid=:bid";
        List list = s.createQuery(hql).setString("bid", bookid).list();
        Iterator iterator = list.iterator();
        while (iterator.hasNext()) {
            m = (Mcabookreg) iterator.next();
            flag = true;
            isbn = m.getIsbn();
            callnum = m.getCallnum();
            title = m.getTitle();
            author = m.getAuthor();
            edition = m.getEdition();
            pob = m.getPob();
            nob = m.getNob();
            yob = m.getYob();
            pagenum = m.getPagenum();
            series = m.getSeries();
            type = m.getType();
            doa = m.getDoa();
            source = m.getSource();
            cost = m.getCost();
            status = m.getStatus();
            break;
        }
        if (flag) {
            request.getSession().setAttribute("bid", bookid);
            request.getSession().setAttribute("isbn", isbn);
            request.getSession().setAttribute("callnum", callnum);
            request.getSession().setAttribute("title", title);
            request.getSession().setAttribute("author", author);
            request.getSession().setAttribute("edition", edition);
            request.getSession().setAttribute("pob", pob);
            request.getSession().setAttribute("nob", nob);
            request.getSession().setAttribute("yob", yob);
            request.getSession().setAttribute("pagenum", pagenum);
            request.getSession().setAttribute("series", series);
            request.getSession().setAttribute("type", type);
            request.getSession().setAttribute("doa", doa);
            request.getSession().setAttribute("source", source);
            request.getSession().setAttribute("cost", cost);
            request.getSession().setAttribute("status", status);
            response.sendRedirect("updatereg/mbabookupd.jsp");
        } else {
            out.println("Book with given id not found , please try again");
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
