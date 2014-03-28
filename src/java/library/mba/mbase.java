/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package library.mba;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import library.Mbaissue;
import library.Mbapatron;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.classic.Session;

/**
 *
 * @author Shajeer
 */
public class mbase extends HttpServlet {
    String[] title = new String[25];
    String[] author = new String[25];
    String[] issuedate = new String[25];
    String[] bookid = new String[25];
    String[] renewdate = new String[25];
    String bidfrombkissue ;
    String uidfrombkissue ;
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
        request.getSession().invalidate();
        String sid = request.getParameter("search");
        SessionFactory sf = new Configuration().configure().buildSessionFactory();
        Session s = sf.openSession();
        Transaction t = s.beginTransaction();
        boolean flag = false;
        int i = 0;
        String hql = "from Mbaissue where rtrndate=null";
        List li = s.createQuery(hql).list();
        Iterator iterator = li.iterator();
        String hql1 = "from Mbapatron";
        List list = s.createQuery(hql1).list();
        Iterator it = list.iterator();
        Mbaissue mi;
        while (it.hasNext()) {
            Mbapatron m = (Mbapatron) it.next();
            if (m.getUid().equals(sid)) {
                flag = true;
                while (iterator.hasNext()) {
                    mi = (Mbaissue) iterator.next();
                    if (mi.getUserid().equals(sid))//||bidfrombkissue.equals(mi.getBookid())) {
                    {
                        title[i] = mi.getTitle();
                        author[i] = mi.getAuthor();
                        issuedate[i] = mi.getIssuedate();
                        renewdate[i] = mi.getRenewaldate();
                        bookid[i] = mi.getBookid();
                        i++;
                    }
                }
            }
        }

  if (flag) {
        /*          while (i != 0) {
                i--;
                out.println(title[i]);
            }
*/
            request.getSession().setAttribute("title", title);
            request.getSession().setAttribute("bookid", bookid);
            request.getSession().setAttribute("count", i);
            request.getSession().setAttribute("author", author);
            request.getSession().setAttribute("renewdate", renewdate);
            request.getSession().setAttribute("issuedate", issuedate);
            request.getSession().setAttribute("sid", sid);
            request.getRequestDispatcher("userforadminmba.jsp").forward(request, response); 
        } else {
      request.getSession().setAttribute("flg", "invalid");
      request.getRequestDispatcher("mba.jsp").forward(request, response);
            out.println("no user found !");
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
