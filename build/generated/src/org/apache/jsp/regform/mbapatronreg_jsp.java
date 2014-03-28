package org.apache.jsp.regform;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class mbapatronreg_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\n");
      out.write("<html xmlns=\"http://www.w3.org/1999/xhtml\">\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\n");
      out.write("        <link rel=\"stylesheet\" href=\"newstyleforfr.css\" type=\"text/css\"/>\n");
      out.write("        <link href=\"default.css\" rel=\"stylesheet\" type=\"text/css\" />\n");
      out.write("    </head>\n");
      out.write("    <body onload=\"st_id.focus()\">\n");
      out.write("        <form id=\"form1\" action=\"../mbapatronreg\" method=\"post\" enctype=\"multipart/form-data\">\n");
      out.write("            <!input type=\"image\"  name=\"head\" id=\"head\" src=\"../images/head.jpg\" />\n");
      out.write("            <table width=\"600\" border=\"0\" align=\"center\" cellpadding=\"10\" cellspacing=\"3\" class=\"outertable\">\n");
      out.write("                <tr>\n");
      out.write("                    <td id=\"tabhead\"><div align=\"center\">PATRON REGISTRATION</div></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td><div align=\"right\">\n");
      out.write("                            <table width=\"100%\" border=\"0\" cellpadding=\"15\" cellspacing=\"5\" class=\"innertable\">\n");
      out.write("                                <tr>\n");
      out.write("                                    <td>User Id <span id=\"mandatory\"><a href=\"#\" title=\"Must entert staff id\">*</a></span>:</td>\n");
      out.write("                                    <td><label for=\"st_id\"></label>\n");
      out.write("                                        <input name=\"st_id\" tabindex=\"1\" type=\"text\" class=\"textbox\" id=\"st_id\" /></td>\n");
      out.write("                                </tr>\n");
      out.write("                                <tr>\n");
      out.write("                                    <td>User Name <span id=\"mandatory\"><a href=\"#\" title=\"Must entert user name\">*</a></span>:</td>\n");
      out.write("                                    <td><input name=\"st_name\"  tabindex=\"2\" type=\"text\" class=\"textbox\" id=\"st_name\" /></td>\n");
      out.write("                                </tr>\n");
      out.write("                                <tr>\n");
      out.write("                                    <td>Adress <span id=\"mandatory\"><a href=\"#\" title=\"Must entert address\">*</a></span>:</td>\n");
      out.write("                                    <td>  <textarea name=\"address\"  tabindex=\"3\" cols=\"28\" rows=\"5\" id=\"st_address\"></textarea></td>\n");
      out.write("                                </tr>\n");
      out.write("                                <tr>\n");
      out.write("                                    <td>Roll Number :</td>\n");
      out.write("                                    <td><input name=\"rollnum\"  tabindex=\"4\" type=\"text\" class=\"textbox\" id=\"st_id4\" /></td>\n");
      out.write("                                </tr>\n");
      out.write("                                <tr>\n");
      out.write("                                    <td>Place :</td>\n");
      out.write("                                    <td><input name=\"place\" type=\"text\"   tabindex=\"5\" class=\"textbox\" id=\"st_id4\" /></td>\n");
      out.write("                                </tr>\n");
      out.write("                                <tr>\n");
      out.write("                                    <td>Pincode <span id=\"mandatory\"><a href=\"#\"  title=\"Must entert pincode\">*</a></span>:</td>\n");
      out.write("                                    <td><input name=\"pincode\" type=\"text\"  tabindex=\"6\" class=\"textbox\" id=\"st_id5\" /></td>\n");
      out.write("                                </tr>\n");
      out.write("                                <tr>\n");
      out.write("                                    <td>D.O.B :</td>\n");
      out.write("                                    <td><input name=\"dob\" type=\"date\"  tabindex=\"7\" class=\"textbox\" id=\"st_id6\" /></td>\n");
      out.write("                                </tr>\n");
      out.write("                                <tr>\n");
      out.write("                                    <td>Phone Number <span id=\"mandatory\"><a href=\"#\" title=\"Must entert phone number\">*</a></span>:</td>\n");
      out.write("                                    <td><input name=\"phone\" type=\"text\"  tabindex=\"8\" class=\"textbox\" id=\"st_id7\" /></td>\n");
      out.write("                                </tr>\n");
      out.write("                                <tr>\n");
      out.write("                                    <td>e-mail :</td>\n");
      out.write("                                    <td><input name=\"email\"  tabindex=\"9\" type=\"text\" class=\"textbox\" id=\"st_id8\" /></td>\n");
      out.write("                                </tr>\n");
      out.write("                                <tr>\n");
      out.write("                                    <td>Date Of Joining <span id=\"mandatory\"><a href=\"#\" title=\"Must entert date of joining\">*</a></span>:</td>\n");
      out.write("                                    <td><input name=\"doj\" type=\"text\"  tabindex=\"10\" class=\"textbox\" id=\"st_id9\" /></td>\n");
      out.write("                                </tr>\n");
      out.write("                                <tr>\n");
      out.write("                                    <td>Choose Image :</td>\n");
      out.write("                                    <td><label for=\"photo\"></label>\n");
      out.write("                                        <input type=\"file\" name=\"photo\"  tabindex=\"11\" id=\"st_photo\" /></td>\n");
      out.write("                                </tr>\n");
      out.write("                                <tr>\n");
      out.write("                                    <td>Batch:<span id=\"mandatory\"><a href=\"#\" title=\"Must entert type of user, user can be a staff, student\">*</a></span> :</td>\n");
      out.write("                                    <td>\n");
      out.write("                                        <input type=\"text\" name=\"batch\"  tabindex=\"12\" class=\"textbox\" id=\"staff_type\"/>\n");
      out.write("                                    </td>\n");
      out.write("                                </tr>\n");
      out.write("                                <tr>\n");
      out.write("                                    <td>type of user<span id=\"mandatory\"><a href=\"#\" title=\"Must entert type of user, user can be a staff, student\">*</a></span> :</td>\n");
      out.write("                                    <td><label for=\"staff_type\"></label>\n");
      out.write("                                        <select name=\"staff_type\"  tabindex=\"12\" class=\"textbox\" id=\"staff_type\">\n");
      out.write("                                        </select></td>\n");
      out.write("                                </tr>\n");
      out.write("                                <tr>\n");
      out.write("                                    <td>&nbsp;</td>\n");
      out.write("                                    <td><div align=\"left\">\n");
      out.write("                                            <input name=\"submit\" type=\"submit\"  tabindex=\"13\" class=\"submit\" id=\"submit\"  />\n");
      out.write("                                        </div></td>\n");
      out.write("                                </tr>\n");
      out.write("                            </table>\n");
      out.write("                        </div></td>\n");
      out.write("                </tr>\n");
      out.write("            </table>\n");
      out.write("        </form>\n");
      out.write("    </body>\n");
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
