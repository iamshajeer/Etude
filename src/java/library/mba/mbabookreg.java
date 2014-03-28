package library.mba;

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
import library.Mbabookreg;
import library.Mcabookavail;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author Shajeer
 */
public class mbabookreg extends HttpServlet {

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
        String isbn = request.getParameter("isbn");
        String callnum = request.getParameter("ddc");
        String title = request.getParameter("title");
        String author = request.getParameter("author");
        String edition = request.getParameter("edition");
        String pob = request.getParameter("pob");
        String nob = request.getParameter("nop");
        String yob = request.getParameter("yop");
        String pagenum = request.getParameter("page");
        String series = request.getParameter("series");
        String type = request.getParameter("type");
        String doa = request.getParameter("doa");
        String source = request.getParameter("soa");
        BigDecimal cost = new BigDecimal(request.getParameter("cost"));
        String status = request.getParameter("status");
        /*    String bookid = "asd";
         String isbn = "asd";
         String callnum = "asd";
         String title = "os";
         String author = "me";
         String edition = "illa";
         String pob = "pob";
         String nob = "nob";
         String yob = "yob";
         String pagenum = "pn";
         String series = "srs";
         String type = "typ";
         String doa = "doa";
         String source = "src";
         BigDecimal cost = BigDecimal.valueOf(123.65);
         String status = "stst";*/
        SessionFactory sf = new Configuration().configure().buildSessionFactory();
        Session s = sf.openSession();
        Transaction t = s.beginTransaction();
        Mbabookreg m = new Mbabookreg(bookid, isbn, callnum, title, author, edition, pob, nob, yob, pagenum, series, type, doa, source, cost, status, null);
        s.save(m);
        t.commit();
        s.close();
        SessionFactory sf1 = new Configuration().configure().buildSessionFactory();
        Session s1 = sf1.openSession();
        Transaction t1 = s1.beginTransaction();
        Mcabookavail mb = new Mcabookavail(bookid, title, author);
        s1.save(mb);
        t1.commit();
        s1.close();

        out.println("<b>done book registered !</b>");
        /*
         try {
         out.println("<html>");
         out.println("<head>");
         out.println("<title>Servlet mcabookreg</title>");
         out.println("</head>");
         out.println("<body>");
         out.println("<h1>Servlet mcabookreg at " + request.getContextPath() + "</h1>");
         out.println("</body>");
         out.println("</html>");
         } finally {
         out.close();
         }
    
         */
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
