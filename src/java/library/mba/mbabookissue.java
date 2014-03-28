/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package library.mba;

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
import library.Mbaissue;
import library.Mbatrans;
import library.Mcabookavail;
import library.Settings;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.classic.Session;

/**
 *
 * @author Shajeer
 */
public class mbabookissue extends HttpServlet {

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
   static int i = 111;
    SessionFactory sf = new Configuration().configure().buildSessionFactory();
    boolean setflag = false;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            Session sess=sf.openSession();
         Transaction tra=sess.beginTransaction();
         String hq="from Settings where deptid=:dptid";
         List li=sess.createQuery(hq).setString("dptid","Mba").list();
         Iterator it=li.iterator();
         int duration=0;
         while(it.hasNext()){
             Settings set=(Settings) it.next();
             duration=set.getRendays();
         }
            String searchid = request.getParameter("searchid");//bookid
            String title = null, author = null;
            String sid = (String) request.getSession().getAttribute("sid");//userid
            // String doi=new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance());
            //Calendar.getInstance().toString();
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
            //date add over
            Session s = sf.openSession();
            Session ses = sf.openSession();
            Transaction t = s.beginTransaction();
            Transaction tr = ses.beginTransaction();
            String hql = "from Mbabookavail";
            // String hq2 = "delete from Mcabookavail where bookid=" + sid;
            List list = s.createQuery(hql).list();
            Iterator iterator = list.iterator();
            Boolean flag = false;
            Mbaissue mi = null;
            Mbatrans mt;
            Random r=new Random();
            while (iterator.hasNext()) {
                Mcabookavail m = (Mcabookavail) iterator.next();
                if (m.getBookid().equals(searchid)) {
                    title = m.getTitle();
                    i=r.nextInt(99999);
                    author = m.getAuthor();
                    String tid = String.valueOf(title.hashCode());
                    mi=new Mbaissue(title, author, sysdate, rendate, sid, tid, rendate, null);
                    s.save(m);
                    mt = new Mbatrans(mi, true);
                    s.save(mt);
                    m.setBookid(searchid);
                    s.delete(m);
                    flag = true;
                    //response.setIntHeader("Refresh", 2);
                  
                    out.println("<br/><br/><br/><center><b><h2>Book id " + searchid + " Success fully issued to user " + sid + "</h2></b></center>,<h4><br> press F5/refresh to go back ! </h4>");
                }
            }
          /*  if (!flag) {
                Session ses1 = sf.openSession();
                Transaction trans = ses1.beginTransaction();
                String hqls = "From Mcareserv where bookid=:bid";
                List li1 = ses1.createQuery(hql).setString("bid", searchid).list();
                Iterator it1 = li1.iterator();
                Mcareserv mcareserv = null;
                while (it1.hasNext()) {
                    mcareserv = (Mcareserv) it1.next();
                    setflag = true;
                }
                if (setflag) {
                    Mcaissue mcaissue = new Mcaissue(String.valueOf(title.hashCode()), title, author, sysdate, rendate, sid, sid, rendate, null, null);
                    ses1.save(mcaissue);
                    deleteReserv(searchid);
                    out.println("<br/><br/><br/><center><b><h2>Book id " + searchid + " Success fully issued to user " + sid + "</h2></b></center>,<h4><br> press F5/refresh to go back ! </h4>");
                }

            }*/
            if (!flag ) {
                out.println("Book not available ! ");
            }
            s.save(mi);
            t.commit();
            s.close();

        } catch (Exception e) {
            out.println(e.getLocalizedMessage());
        }
    }

   /* public boolean checkInReserv() {

        return true;
    }

    public void deleteReserv(String bookid) {
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

    public int getNumOfBooks() {
        int number = 0;
        Session ses1 = sf.openSession();
        Transaction tr1 = ses1.beginTransaction();
        String hql = "from  where deptid=:deptid";
        List list = ses1.createQuery(hql).setString("deptid", "Mca").list();
        Iterator iterator = list.iterator();
        Mcaissue mi = null;
        while (iterator.hasNext()) {
            mi = (Mcaissue) iterator.next();
            number += 1;
        }

        return number;
    }
    public int totalIssuedBooks(String userid) {
        int num = 0;
        Session ses1 = sf.openSession();
        Transaction tr1 = ses1.beginTransaction();
        String hql = "from Mcaissue where userid=:uid";
        List list = ses1.createQuery(hql).setString("userid", userid).list();
        Iterator iterator = list.iterator();
        Settings set = null;
        while (iterator.hasNext()) {
            set = (Settings) iterator.next();
            num = set.getNobooks();
        }
        return num;
    }*/

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
