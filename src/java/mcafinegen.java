/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import library.Mcafine;
import library.Mcaissue;
import library.Settings;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author Shajeer
 */
public class mcafinegen extends HttpServlet {

    SessionFactory sf = new Configuration().configure().buildSessionFactory();
    Long fid = null;
    PrintWriter out;

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
        out = response.getWriter();
        Session session2 = sf.openSession();
        Transaction t2 = session2.beginTransaction();
        try {
            t2.begin();
            String hql1 = "from Mcaissue where userid=:uid";
            String uid = (String) request.getSession().getAttribute("uid");
            List list1 = session2.createQuery(hql1).setString("uid", uid).list();
            Iterator iterator1 = list1.iterator();
            Mcaissue mi = null;
            int days = 0;
            BigDecimal amnt = getAmount();
            while (iterator1.hasNext()) {
                mi = (Mcaissue) iterator1.next();
                String renewaldate = mi.getRenewaldate();
                Long transid = mi.getTransid();
                getFineDetails(uid, transid);
                 if (mi.getRtrndate() == null) {
                 days = getDays(renewaldate);
                 } else {
                 days = getDaysIfReturned(mi.getRtrndate());
                 }
                 if (days > 0) {
                 BigDecimal fineamntperbook = calculateFineAmountPerBook(days, amnt);
                 out.println(getFineDetails(uid, transid));
                 if (getFineDetails(uid, transid)) {
                 updateFine(fineamntperbook, days, response);
                 } else {
                 addFine(mi, uid, fineamntperbook, days);
                 }
                 }
            }
        } catch (Exception e) {
            out.println(e.getCause());
        }
        response.sendRedirect("fine/mcauserfineviewer.jsp");
    }
    //getting fine amount from settings table in db

    public BigDecimal getAmount() {
        BigDecimal amount = null;
        Session session1 = sf.openSession();
        Transaction t1 = session1.beginTransaction();
        String hql = "from Settings where deptid=:dept";
        Query q = session1.createQuery(hql).setString("dept", "Mca");
        List list = q.list();
        Iterator iterator = list.iterator();
        Settings set = null;
        while (iterator.hasNext()) {
            set = (Settings) iterator.next();
            amount = set.getFineamount();
        }
        return amount;
    }
    //amount recieved

//calculating date difference 
    public int getDays(String d) throws ParseException {
        SimpleDateFormat sdf = new SimpleDateFormat("d-MM-yyyy");
        Date ogdate = sdf.parse(d);
        Date current = new Date();
        String curdate = sdf.format(current);
        int diffInDays = (int) ((current.getTime() - ogdate.getTime()) / (1000 * 60 * 60 * 24));
        return diffInDays;
    }

    public int getDaysIfReturned(String returndate) throws ParseException {
        SimpleDateFormat sdf = new SimpleDateFormat("d-MM-yyyy");
        Date ogdate = sdf.parse(returndate);
        Date current = new Date();
        String curdate = sdf.format(current);
        int diffInDays = (int) ((current.getTime() - ogdate.getTime()) / (1000 * 60 * 60 * 24));
        return diffInDays;

    }

    public boolean getFineDetails(String uid, Long trid) {
         out.println(uid);
        Mcafine f = null;
        Session session = sf.openSession();
        Transaction t = session.beginTransaction();
        String hql = "from Mcafine where uid=:uid";
        List li = session.createQuery(hql).setString("uid", uid).list();
        Iterator it = li.iterator();
        while (it.hasNext()) {
            f = (Mcafine) it.next();
            if (f.getMcaissue().getTransid().equals(trid)) {
                fid = f.getFid();
                return true;
            }
        }
        return false;
    }

    //setting fine to table fine
    public BigDecimal calculateFineAmountPerBook(int days, BigDecimal amnt) {
        return amnt.multiply(new BigDecimal(days));
    }

    public void updateFine(BigDecimal fineamnt, int days, HttpServletResponse re) throws IOException {
        Session sessions = sf.openSession();
        Transaction tr = sessions.beginTransaction();
        tr.begin();
        PrintWriter out = re.getWriter();
        String hquery = "update Mcafine set fineamt=:fineamount, days=:days where fid=:fid";
        Query q = sessions.createQuery(hquery);
        q.setLong("fid", fid);
        q.setBigDecimal("fineamount", fineamnt);
        q.setInteger("days", days);
        q.executeUpdate();
        tr.commit();
        sessions.clear();
//        out.println("<br/>"+q.executeUpdate());
    }

    public void addFine(Mcaissue mi, String uid, BigDecimal amnt, int days) {
        Session session = sf.openSession();
        Transaction t = session.beginTransaction();
        Mcafine f = new Mcafine(mi, uid, amnt, days);
        session.save(f);
        t.commit();
    }

    //over
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
