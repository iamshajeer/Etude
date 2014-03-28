/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import library.Mcaissue;
import library.Mcareserv;
import library.Settings;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author Shajeer
 */
public class mcaissuereservdbook extends HttpServlet {

    SessionFactory sf = new Configuration().configure().buildSessionFactory();

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
            Session sess=sf.openSession();
         Transaction tra=sess.beginTransaction();
         String hq="from Settings where deptid=:dptid";
         List li=sess.createQuery(hq).setString("dptid","Mca").list();
         Iterator it=li.iterator();
         int duration=0;
         while(it.hasNext()){
             Settings set=(Settings) it.next();
             duration=set.getRendays();
         }
            String uid = (String) request.getSession().getAttribute("uid");
            String bookid = request.getParameter("searchid");
            Session ses = sf.openSession();
            Transaction tr = ses.beginTransaction();
            Session s = sf.openSession();
            Transaction t = s.beginTransaction();
            String hql = "from Mcareserv where uid=:uid";
            List list = s.createQuery(hql).setString("uid", uid).list();
            Iterator iterator = list.iterator();
            boolean flag=false;
            Mcareserv mr = null;
            Random r = new Random();
            while (iterator.hasNext()) {
                mr = (Mcareserv) iterator.next();
                if (mr.getMcabookreg().getBookid().equals(bookid)) {
                    t.begin();
                    int i = r.nextInt(9999);
                    String tid = String.valueOf(mr.getMcabookreg().getTitle().hashCode() + i);
                    //Getting system date
                    Date date = new Date();
                    DateFormat df = new SimpleDateFormat("dd-MM-yyyy");
                    String sysdate = df.format(date);
                    //date retrieval over
                    //calculating date +14 days
                    String rendate;
                    Calendar cal = Calendar.getInstance();
                    cal.setTime(date);
                    cal.add(Calendar.DATE, duration);
                    rendate = String.valueOf(df.format(cal.getTime()));
                    Mcaissue mi = new Mcaissue( mr.getMcabookreg().getTitle(), mr.getMcabookreg().getAuthor(), sysdate, rendate, uid, bookid, null, null, null);
                    s.save(mi);
                    flag=true;
                    t.commit();
                   deleteFromReserv(bookid);
                }
            }
            if(flag){
           out.println("<br/><br/><br/><center><b><h2>Book id " + bookid + " Success fully issued to user " + uid + "</h2></b></center>,<h4><br> press F5/refresh to go back ! </h4>");
        }
        }
         catch (Exception e) {
            out.println(e.getMessage());
        } finally {
            out.close();
        }
        
    }

    public void deleteFromReserv(String bookid) {
        Session ses = sf.openSession();
        Transaction t = ses.beginTransaction();
        t.begin();
        String hql = "from Mcareserv where bookid=:bid";
        List list = ses.createQuery(hql).setString("bid", bookid).list();
        Iterator iterator = list.iterator();
        Mcareserv mr = null;
        while (iterator.hasNext()) {
            mr = (Mcareserv) iterator.next();
            mr.setResid(mr.getResid());
        }
        ses.delete(mr);
        t.commit();
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
