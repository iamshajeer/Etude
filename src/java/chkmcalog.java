

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
import library.Department;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.classic.Session;

/**
 *
 * @author Shajeer
 */
public class chkmcalog extends HttpServlet {

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
    String uid=request.getParameter("uid");
    String password=request.getParameter("password");
    SessionFactory sf=new Configuration().configure().buildSessionFactory();
    Session s=sf.openSession();
    Transaction t=s.beginTransaction();
    String hql="from Department";
    boolean flag=false;
    List list = s.createQuery(hql).list();
    Iterator iterator = list.iterator();
    while(iterator.hasNext()){
    Department de  = (Department) iterator.next();
        if(de.getLid().equals(uid) )
        {
          
          if(de.getLpassword().equals(password)) 
          {
                 flag=true;
          }
        }
    }
    if(flag){
  // out.print("<script type='text/javascript'>window.open('mca.html')</script>");
   //response.sendRedirect("mca.html");
        request.getSession().setAttribute("session","true");
        request.getRequestDispatcher("mca.jsp").forward(request, response);
    }
    else{
        request.getSession().setAttribute("flg","invalid");
        response.sendRedirect("loginform/mcalogin.jsp");
    out.println("Login failed");
    }
    /*try {
           
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet chkmcalog</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet chkmcalog at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        } finally {            
            out.close();
    
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
