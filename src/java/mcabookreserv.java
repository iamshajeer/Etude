/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import library.Mcabookavail;
import library.Mcabookreg;
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
public class mcabookreserv extends HttpServlet {

    SessionFactory sf = new Configuration().configure().buildSessionFactory();
    String userid, bookid;

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
            PrintWriter sout = response.getWriter();
            userid = (String) request.getSession().getAttribute("uid");
            bookid = request.getParameter("bookid");
            // out.println(userid+bookid);
            if (getReservedCount() < getReservCount()) {
                // sout.println(deleteAvailable(response));
                //out.println(deleteAvailable());

                addToReserv(response);
                //if (deleteAvailable(response)) {
                out.println("<h4><center>Success fully reserved book " + bookid + "<br/>reservation of this will cancel automatically</center></h4>");
                //  }

            } else {
                out.println("Maximum number of books already booked");
            }
        } finally {
            out.close();
        }
    }
///////////////////////////////////////////////

    public int getReservCount() {
        int reservcount = 0;
        Session ses1 = sf.openSession();
        Transaction tr1 = ses1.beginTransaction();
        String hql = "From Settings where deptid=:dpt";
        List li1 = ses1.createQuery(hql).setString("dpt", "Mca").list();
        Iterator it1 = li1.iterator();
        while (it1.hasNext()) {
            Settings set = (Settings) it1.next();
            reservcount = set.getReservcount();
        }
        return reservcount;
    }
///////////////////////////////////////////////

    public int getReservedCount() {
        int reservedcount = 0;
        Session ses1 = sf.openSession();
        Transaction tr1 = ses1.beginTransaction();
        String hql = "From Mcareserv where uid=:userid";
        List li1 = ses1.createQuery(hql).setString("userid", userid).list();
        Iterator it1 = li1.iterator();
        while (it1.hasNext()) {
            Mcareserv mr = (Mcareserv) it1.next();
            if (mr.getUid().equals(userid)) {
                reservedcount = reservedcount + 1;
            }
        }
        return reservedcount;
    }

///////////////////////////////////////////////
    public boolean deleteAvailable(HttpServletResponse respones) throws IOException {
        PrintWriter out = respones.getWriter();
        try {
            Session ses = sf.openSession();
            //ses.clear();
            Transaction tr1 = ses.beginTransaction();
            tr1.begin();
            /*String hql="delete from Mcabookavail where bookid=:bid";
             Query d=ses.createQuery(hql).setString("bid", bookid);
             d.executeUpdate();*/
            String hql = "from Mcabookavail where bookid=:bkid";
            //out.println(bookid);
            //Query q= ses.createQuery(hql).setParameter("bkid",bookid);
            //out.println(q.executeUpdate());
            List li1 = ses.createQuery(hql).setString("bkid", bookid).list();
            Iterator it1 = li1.iterator();
            Mcabookavail m = null;
            while (it1.hasNext()) {
                m = (Mcabookavail) it1.next();
                m.setBookid(bookid);
            }
            ses.delete(m);
            //ses.close();
            ses.clear();
            // ses.save(m);
            tr1.commit();
            //return true;
        } catch (Exception e) {
            out.println(e.getLocalizedMessage());
        }
        return false;
    }

///////////////////////////////////////////////
    public void addToReserv(HttpServletResponse respones) throws IOException {


        try {
            String book=bookid;
            PrintWriter out = respones.getWriter();
            Session sesion = sf.openSession();
            Transaction transaction = sesion.beginTransaction();
            transaction.begin();
            Date date = new Date();
            DateFormat df = new SimpleDateFormat("dd-MM-yyyy");
            String sysdate = df.format(date);
            //Mcareserv mc=new Mcareserv
//            Mcareserv mcareserv=new Mcareserv(getPatronReg(), getBookreg(), sysdate);Mca
            // out.println(getBookreg().getAuthor());
           // out.println(getBookreg(respones).getAuthor());
            Mcareserv mcareserv = new Mcareserv(getBookreg(respones,book), sysdate, userid);
            sesion.save(mcareserv);
            transaction.commit();
            sesion.close();
        } catch (Exception e) {
        }
    }

///////////////////////////////////////////////
  /*  public Mcapatron getPatronReg() {
     boolean flag = false;
     Session sess = sf.openSession();
     Transaction tr = sess.beginTransaction();
     String hql = "from Mcapatron";
     List li1 = sess.createQuery(hql).list();
     Iterator it1 = li1.iterator();
     Mcapatron mp = null;
     while (it1.hasNext()) {
     mp = (Mcapatron) it1.next();
     if (mp.getUid().equals(userid)) {
     flag = true;
     }
     }
     if (flag) {
     return mp;
     }
     return mp;
     }
     */
///////////////////////////////////////////////
    public Mcabookreg getBookreg(HttpServletResponse respones,String book) throws IOException {
        Session ses = sf.openSession();
        PrintWriter out = respones.getWriter();
        String hql1 = "from Mcabookreg";
        List list = ses.createQuery(hql1).list();
        Iterator it = list.iterator();
        Mcabookreg mb = null;
        out.println(bookid);
        while (it.hasNext()) {
            mb = (Mcabookreg) it.next();
            //out.println(mb.getBookid() + "<br/>");
            out.println(mb.getBookid());
            if (mb.getBookid().equals(bookid.trim())) {
                out.println(mb.getBookid()+mb.getTitle());
                return mb;
            }
        }
        return null;
    }

///////////////////////////////////////////////    
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
