package org.apache.jsp.reservation;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import library.Mcareserv;
import java.util.Iterator;
import java.util.List;
import org.hibernate.Transaction;
import org.hibernate.Session;
import org.hibernate.cfg.Configuration;
import org.hibernate.SessionFactory;

public final class mcauserreservadmin_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("        <link href=\"styleforreserv.css\" rel=\"stylesheet\" type=\"text/css\" media=\"screen\" />\n");
      out.write("    </head>\n");
      out.write("    <body onload=\"searching.focus();\">\n");
      out.write("        <form action=\"../mcaissuereservdbook\">\n");
      out.write("            <br/>\n");
      out.write("       &nbsp;&nbsp;<input type=\"text\" value=\"Enter book id here\" onfocus=\"if(this.value == 'Enter book id here') {this.value=''}\" onblur=\"if(this.value == ''){this.value ='Enter book id here'}\" name=\"searchid\" id=\"searching\" style=\"width: 520px; height: 30px;\"/>\n");
      out.write("            <input type=\"submit\" value=\"Issue Book\"  style=\"width:140px ; height:40px\" class=\"submit\"/>\n");
      out.write("        </form>\n");
      out.write("            <table width=\"600px\" border=\"1\" cellpadding=\"15\" cellspacing=\"0\" id=\"reservtab\">\n");
      out.write("                <tr>\n");
      out.write("                    <th>\n");
      out.write("                        Sl No.\n");
      out.write("                    </th>\n");
      out.write("                    <th width=\"100px\">\n");
      out.write("                        Book id\n");
      out.write("                    </th>\n");
      out.write("                    <th id=\"msgth\">\n");
      out.write("                        Title\n");
      out.write("                    </th>\n");
      out.write("                    <th>\n");
      out.write("                        Date\n");
      out.write("                    </th>\n");
      out.write("                </tr>\n");
      out.write("                ");
 String uid = (String) request.getSession().getAttribute("uid");
                    int i = 0;
                    int[] msgid = new int[50];
                    SessionFactory sf = new Configuration().configure().buildSessionFactory();
                    Session s = sf.openSession();
                    Transaction t = s.beginTransaction();
                    String hql = "from Mcareserv where uid=:uid";
                    List li = s.createQuery(hql).setString("uid", uid).list();
                    Iterator iterator = li.iterator();
                    Mcareserv mi = null;
                    while (iterator.hasNext()) {
                        mi = (Mcareserv) iterator.next();
                        if ((i % 2) == 0) {
                
      out.write("\n");
      out.write("                <tr id=\"col1\">\n");
      out.write("                    ");
} else{
      out.write("\n");
      out.write("                <tr id=\"col2\">\n");
      out.write("                    ");
       } i++;
                            for (int j = 0; j < 4; j++) {
      out.write("<td>");

                                if (j == 0) {
                                    out.println(i);
                                }
                                if (j == 1) {
                                    out.println(mi.getMcabookreg().getBookid());
                                }
                                if (j == 2) {
                                    out.println(mi.getMcabookreg().getTitle());
                                }
                                if (j == 3) {
                                    out.println(mi.getResdate());
                                }
                            }
                        }
                    
      out.write("\n");
      out.write("                            </td>\n");
      out.write("                </tr>\n");
      out.write("               \n");
      out.write("    </table>\n");
      out.write("</body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
