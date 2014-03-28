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
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import library.Mcabookavail;
import library.Mcaissue;
import library.Settings;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.classic.Session;

/**
 *
 * @author Shajeer
 */
public class mcabookreutrn extends HttpServlet {

    SessionFactory sf = new Configuration().configure().buildSessionFactory();
    String[] bookid = new String[25];
    int temp;

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
        String ind;
        boolean flag=false;
        bookid = (String[]) request.getSession().getAttribute("bookid");
        String bt = request.getParameter("button");
        int count = (Integer) (request.getSession().getAttribute("count"));
        String uid = (String) request.getSession().getAttribute("sid");;
        temp = count + 1;
        if (bt.equals("return")) {
            for (int i = 0; i < count; i++) {
                ind = request.getParameter(String.valueOf(i));
                if (ind != null) {
                    if (ind.equals("checked")) {
                        if (returnBook(count, i)) {
                            //response.sendRedirect("se");
                            flag=true;
                        }
                    }
                }
            }
            if(flag){
              out.println("<br/><br/><br/><center><b><h2>Book Success fully returned </h2></b></center>,<h4><br> press F5/refresh to go back ! </h4>");
            }
        } else if (bt.equals("renew")) {
            for (int i = 0; i < count; i++) {
                ind = request.getParameter(String.valueOf(i));
                if (ind != null) {
                    if (ind.equals("checked")) {
                        if(renewBook(count, i,response)){
                            flag=true;
                        }
                    }
                }
            }
            if(flag){
                out.println("<br/><br/><br/><center><b><h2>Book Success fully renewed </h2></b></center>,<h4><br> press F5/refresh to go back ! </h4>");
            }
        }
        
    }

    public boolean returnBook(int count, int index) throws IOException {
        Session s = sf.openSession();
        Transaction t = s.beginTransaction();
        Session ses = sf.openSession();
        Transaction tr = ses.beginTransaction();
        String book = bookid[count - index - 1];
        String hql = "from Mcaissue where bookid=:book";
        List li = s.createQuery(hql).setString("book", book).list();
        Iterator iterator = li.iterator();
        Mcaissue mi = null;
        Mcabookavail ma = null;
        boolean flag = false;
        while (iterator.hasNext()) {
            mi = (Mcaissue) iterator.next();
        }
        if (mi.getBookid().equals(book)) {
            ma = new Mcabookavail(book, mi.getTitle(), mi.getAuthor());
            ses.save(ma);
            tr.commit();
            ses.close();
            updateReturnDate(book);
            return true;
        }
        
        return false;
    }

    public void updateReturnDate(String book) throws IOException {

        try {
            Session se = sf.openSession();
            Transaction tr = se.beginTransaction();
            tr.begin();
            //Getting system date
            Date date = new Date();
            DateFormat df = new SimpleDateFormat("dd-MM-yyyy");
            String sysdate = df.format(date);
            //date retrieval over
            //calculating date +14 days
            String rendate;
            Calendar cal = Calendar.getInstance();
            cal.setTime(date);
            cal.add(Calendar.DATE, 14);
            rendate = String.valueOf(df.format(cal.getTime()));
            //date recieved
            String hql = "Update Mcaissue set rtrndate=:retdate where bookid=:book and rtrndate=null";
            se.createQuery(hql).setString("retdate", rendate).setString("book", book).executeUpdate();
            tr.commit();
        } catch (Exception e) {
            e.getLocalizedMessage();
        }
    }
     public boolean renewBook(int count, int index,HttpServletResponse response) throws IOException {
         Session ses=sf.openSession();
         Transaction tr=ses.beginTransaction();
         String hq="from Settings where deptid=:dptid";
         List li=ses.createQuery(hq).setString("dptid","Mca").list();
         Iterator it=li.iterator();
         int duration=0;
         while(it.hasNext()){
             Settings set=(Settings) it.next();
             duration=set.getRendays();
         }
        Session s = sf.openSession();
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
        PrintWriter out=response.getWriter();
        Transaction t = s.beginTransaction();
        String book = bookid[count - index - 1];
        String hql="Update Mcaissue set issuedate=:issuedate, renewaldate=:rendate where bookid=:book and rtrndate=null";
        s.createQuery(hql).setString("issuedate", sysdate).setString("rendate",rendate).setString("book", book).executeUpdate();
        out.println(book);
        
       // String hql="UPDATE Mcaissue set issuedate=:issuedate,renewaldate";
        return true;
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
