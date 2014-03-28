package org.apache.jsp.regform;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class mbabookreg_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<head>\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\n");
      out.write("<link rel=\"stylesheet\" href=\"newstyleforfr.css\" type=\"text/css\"/>\n");
      out.write("<link rel=\"stylesheet\" href=\"default.css\" type=\"text/css\" />\n");
      out.write("</head>\n");
      out.write("\n");
      out.write("<body onload=\"b_id.focus()\">\n");
      out.write("<form id=\"bk_reg_form\" action=\"../mbabookreg\" method=\"post\">\n");
      out.write("\n");
      out.write("  <div id=\"front\">\n");
      out.write("    <table width=\"600\" border=\"0\" align=\"center\" cellpadding=\"10\" cellspacing=\"3\" class=\"outertable\">\n");
      out.write("      <tr>\n");
      out.write("        <td id=\"tabhead\"><center>\n");
      out.write("           BOOK REGISTRATION \n");
      out.write("        </center></td>\n");
      out.write("      </tr>\n");
      out.write("      \n");
      out.write("      <tr>\n");
      out.write("        <td><table width=\"100%\" border=\"0\" cellpadding=\"15\" cellspacing=\"5\" class=\"innertable\">\n");
      out.write("                  \n");
      out.write("          <tr>\n");
      out.write("            <td> Book Id : </td>\n");
      out.write("            <td> \n");
      out.write("              <input name=\"b_id\" type=\"text\" class=\"textbox\" id=\"b_id\" />\n");
      out.write("             </td>\n");
      out.write("            </tr>\n");
      out.write("          <tr>\n");
      out.write("            <td> Isbn : </td>\n");
      out.write("            <td> \n");
      out.write("              <input name=\"isbn\" type=\"text\" class=\"textbox\" id=\"isbn\" />\n");
      out.write("             </td>\n");
      out.write("            </tr>\n");
      out.write("          <tr>\n");
      out.write("            <td> Full Call Number<a href=\"#\" class=\"nil\" title=\"Dewy Decimal Code number.\"> [?]</a> : </td>\n");
      out.write("            <td> \n");
      out.write("              <input name=\"ddc\" type=\"text\" class=\"textbox\" id=\"ddc\" />\n");
      out.write("             </td>\n");
      out.write("            </tr>\n");
      out.write("          <tr>\n");
      out.write("            <td> Title : </td>\n");
      out.write("            <td> \n");
      out.write("              <input name=\"title\" type=\"text\" class=\"textbox\" id=\"title\" />\n");
      out.write("             </td>\n");
      out.write("            </tr>\n");
      out.write("          <tr>\n");
      out.write("            <td> Author : </td>\n");
      out.write("            <td> \n");
      out.write("              <input name=\"author\" type=\"text\" class=\"textbox\" id=\"author\" />\n");
      out.write("             </td>\n");
      out.write("            </tr>\n");
      out.write("          <tr>\n");
      out.write("            <td> Edition : </td>\n");
      out.write("            <td> \n");
      out.write("              <input name=\"edition\" type=\"text\" class=\"textbox\" id=\"author\" />\n");
      out.write("             </td>\n");
      out.write("            </tr>\n");
      out.write("          <tr>\n");
      out.write("            <td> Place Of Publication : </td>\n");
      out.write("            <td> \n");
      out.write("              <input name=\"pob\" type=\"text\" class=\"textbox\" id=\"pob\" />\n");
      out.write("             </td>\n");
      out.write("            </tr>\n");
      out.write("          <tr>\n");
      out.write("            <td> Name Of Publication : </td>\n");
      out.write("            <td> \n");
      out.write("              <input name=\"nop\" type=\"text\" class=\"textbox\" id=\"nop\" />\n");
      out.write("             </td>\n");
      out.write("            </tr>\n");
      out.write("          <tr>\n");
      out.write("            <td> Year Of Publication : </td>\n");
      out.write("            <td> \n");
      out.write("              <input name=\"yop\" type=\"text\" class=\"textbox\" id=\"yop\" />\n");
      out.write("             </td>\n");
      out.write("            </tr>\n");
      out.write("          <tr>\n");
      out.write("            <td> Page Number : </td>\n");
      out.write("            <td> \n");
      out.write("              <input name=\"page\" type=\"text\" class=\"textbox\" id=\"pages\" />\n");
      out.write("             </td>\n");
      out.write("            </tr>\n");
      out.write("          <tr>\n");
      out.write("            <td> Series : </td>\n");
      out.write("            <td> \n");
      out.write("              <input name=\"series\" type=\"text\" class=\"textbox\" id=\"series\" />\n");
      out.write("             </td>\n");
      out.write("            </tr>\n");
      out.write("          <tr>\n");
      out.write("            <td> Type : </td>\n");
      out.write("            <td> \n");
      out.write("              <input name=\"type\" type=\"text\" class=\"textbox\" id=\"b_id2\" />\n");
      out.write("             </td>\n");
      out.write("            </tr>\n");
      out.write("          <tr>\n");
      out.write("            <td> Date Of Book Acquired : </td>\n");
      out.write("            <td> \n");
      out.write("              <input name=\"doa\" type=\"text\" class=\"textbox\" id=\"doa\" />\n");
      out.write("             </td>\n");
      out.write("            </tr>\n");
      out.write("          <tr>\n");
      out.write("            <td> Source : </td>\n");
      out.write("            <td> \n");
      out.write("              <input name=\"soa\" type=\"text\" class=\"textbox\" id=\"soa\" />\n");
      out.write("             </td>\n");
      out.write("            </tr>\n");
      out.write("          <tr>\n");
      out.write("            <td> Cost : </td>\n");
      out.write("            <td> \n");
      out.write("              <input name=\"cost\" type=\"text\" class=\"textbox\" id=\"b_id3\" />\n");
      out.write("             </td>\n");
      out.write("            </tr>\n");
      out.write("          <tr>\n");
      out.write("            <td> Status : </td>\n");
      out.write("            <td> \n");
      out.write("              <input name=\"status\" type=\"text\" class=\"textbox\" id=\"status\" />\n");
      out.write("             </td>\n");
      out.write("            </tr>\n");
      out.write("          <tr>\n");
      out.write("            <td>&nbsp;</td>\n");
      out.write("            <td> \n");
      out.write("              <input name=\"submit\" type=\"submit\" class=\"submit\" id=\"submit\" value=\"Submit\" />\n");
      out.write("             </td>\n");
      out.write("            </tr>\n");
      out.write("        </table></td>\n");
      out.write("      </tr>\n");
      out.write("    </table>\n");
      out.write("  </div>\n");
      out.write("</form>\n");
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
