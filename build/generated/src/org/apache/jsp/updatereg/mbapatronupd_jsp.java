package org.apache.jsp.updatereg;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class mbapatronupd_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\n");
      out.write("<html xmlns=\"http://www.w3.org/1999/xhtml\">\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\n");
      out.write("        <link rel=\"stylesheet\" href=\"newstyleforfr.css\" type=\"text/css\"/>\n");
      out.write("        <link href=\"default.css\" rel=\"stylesheet\" type=\"text/css\" />\n");
      out.write("        <script src=\"../script/validator.js\" type=\"text/javascript\"></script>\n");
      out.write("    </head>\n");
      out.write("\n");
      out.write("    <body onload=\"st_id.focus()\">\n");
      out.write("        ");

            String uid = (String) request.getSession().getAttribute("uid");
            String uname = (String) request.getSession().getAttribute("uname");
            String dob = (String) request.getSession().getAttribute("dob");
            String address = (String) request.getSession().getAttribute("address");
            String place = (String) request.getSession().getAttribute("place");
            String pincode = (String) request.getSession().getAttribute("pincode");
            String phone = (String) request.getSession().getAttribute("phone");
            String email = (String) request.getSession().getAttribute("email");
            String doj = (String) request.getSession().getAttribute("doj");
            String batch = (String) request.getSession().getAttribute("batch");
            String rollnumber = (String) request.getSession().getAttribute("rollnumber");
        
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("        <table width=\"600\" border=\"0\" align=\"center\" cellpadding=\"10\" cellspacing=\"3\" class=\"outertable\">\n");
      out.write("            <tr>\n");
      out.write("                <td id=\"tabhead\"><div align=\"center\">PATRON UPDATION</div></td>\n");
      out.write("            </tr>\n");
      out.write("            <tr>\n");
      out.write("                <td><div align=\"right\">\n");
      out.write("                        <table width=\"100%\" border=\"0\" cellpadding=\"15\" cellspacing=\"5\" class=\"innertable\">\n");
      out.write("                            <form action=\"../mbapatsearch\"/>\n");
      out.write("                            <tr>\n");
      out.write("                                <td>User Id <span id=\"mandatory\"><a href=\"#\" title=\"Must entert staff id\">*</a></span>:</td>\n");
      out.write("                                <td><label for=\"st_id\"></label>\n");
      out.write("                                    <input name=\"uid\" type=\"text\" class=\"textbox\" id=\"st_id\"  value=\"");
if (uid != null) {
                                            out.print(uid.toString());
                                        } else {
                                            out.println("");
                                        }
      out.write("\" />\n");
      out.write("                                        <input type=\"submit\" id=\"serchbutton\" value=\"&nbsp;\" title=\"search\"/> \n");
      out.write("                                </td>\n");
      out.write("                            </tr>\n");
      out.write("                            </form>\n");
      out.write("                            <form id=\"myform\" action=\"../mbapatupd\">\n");
      out.write("\n");
      out.write("                                <tr>\n");
      out.write("                                    <td>\n");
      out.write("                                        <input type=\"hidden\" value=\"");
      out.print(uid);
      out.write("\" name=\"uid\"/>\n");
      out.write("                                        User Name <span id=\"mandatory\"><a href=\"#\" title=\"Must entert staff name\" >*</a></span>:\n");
      out.write("                                    </td>\n");
      out.write("                                    <td>\n");
      out.write("                                        <input name=\"uname\" type=\"text\" class=\"textbox\" id=\"st_name\"  value=\"");
if (uname != null) {
                                                out.print(uname.toString());
                                            } else {
                                                out.println("");
                                            }
      out.write("\"/>\n");
      out.write("                                    </td>\n");
      out.write("                                </tr>\n");
      out.write("                                <tr>\n");
      out.write("                                    <td>\n");
      out.write("                                        Adress <span id=\"mandatory\"><a href=\"#\" title=\"Must entert address\"  value=\"\">*</a></span>:\n");
      out.write("                                    </td>\n");
      out.write("                                    <td> \n");
      out.write("                                        <textarea name=\"address\" cols=\"28\"rows=\"5\" id=\"address\">\n");
      out.write("                                            ");
if (address != null) {
                                                    out.print(address.toString());
                                                } else {
                                                    out.println("");
                                                }
      out.write("</textarea>\n");
      out.write("                                    </td>\n");
      out.write("                                </tr>\n");
      out.write("                                <tr>\n");
      out.write("                                    <td>\n");
      out.write("                                        Place :\n");
      out.write("                                    </td>\n");
      out.write("                                    <td>\n");
      out.write("                                        <input name=\"place\" type=\"text\" class=\"textbox\" id=\"st_id4\" value=\"");
if (place != null) {
                                                out.print(place.toString());
                                            } else {
                                                out.println("");
                                            }
      out.write("\"/>\n");
      out.write("                                    </td>\n");
      out.write("                                </tr>\n");
      out.write("                                <tr>\n");
      out.write("                                    <td>Pincode <span id=\"mandatory\"><a href=\"#\" title=\"Must entert pincode\">*</a></span>:</td>\n");
      out.write("                                    <td><input name=\"pincode\" type=\"text\" class=\"textbox\" id=\"pincode\" value=\"");
if (pincode != null) {
                                            out.print(pincode.toString());
                                        } else {
                                            out.println("");
                                        }
      out.write("\"/></td>\n");
      out.write("                                </tr>\n");
      out.write("                                <tr>\n");
      out.write("                                    <td>D.O.B :</td>\n");
      out.write("                                    <td><input name=\"dob\" type=\"text\" class=\"textbox\" id=\"st_id6\" value=\"");
if (dob != null) {
                                            out.print(dob.toString());
                                        } else {
                                            out.println("");
                                        }
      out.write("\"/></td>\n");
      out.write("                                </tr>\n");
      out.write("                                <tr>\n");
      out.write("                                    <td>Phone Number <span id=\"mandatory\"><a href=\"#\" title=\"Must entert phone number\">*</a></span>:</td>\n");
      out.write("                                    <td><input name=\"phone\" type=\"text\" class=\"textbox\" id=\"phone\" value=\"");
if (phone != null) {
                                            out.print(phone.toString());
                                        } else {
                                            out.println("");
                                        }
      out.write("\" /></td>\n");
      out.write("                                </tr>\n");
      out.write("                                <tr>\n");
      out.write("                                    <td>e-mail :</td>\n");
      out.write("                                    <td><input name=\"email\" type=\"text\" class=\"textbox\" id=\"email\"  value=\"");
if (email != null) {
                                            out.print(email.toString());
                                        } else {
                                            out.println("");
                                        }
      out.write("\"/></td>\n");
      out.write("                                </tr>\n");
      out.write("                                <tr>\n");
      out.write("                                    <td>Date Of Joining <span id=\"mandatory\"><a href=\"#\" title=\"Must entert date of joining\">*</a></span>:</td>\n");
      out.write("                                    <td><input name=\"doj\" type=\"text\" class=\"textbox\" id=\"st_id9\"  value=\"");
if (doj != null) {
                                            out.print(doj.toString());
                                        } else {
                                            out.println("");
                                        }
      out.write("\"/></td>\n");
      out.write("                                </tr>\n");
      out.write("                                <tr>\n");
      out.write("                                    <td>Batch <span id=\"mandatory\"><a href=\"#\" title=\"Must entert date of joining\">*</a></span>:</td>\n");
      out.write("                                    <td><input name=\"batch\" type=\"text\" class=\"textbox\" id=\"st_id9\"  value=\"");
if (batch != null) {
                                            out.print(batch.toString());
                                        } else {
                                            out.println("");
                                        }
      out.write("\"/></td>\n");
      out.write("                                </tr>\n");
      out.write("\n");
      out.write("                                <tr>\n");
      out.write("                                    <td>Roll number <span id=\"mandatory\"><a href=\"#\" title=\"Must entert date of joining\">*</a></span>:</td>\n");
      out.write("                                    <td><input name=\"rollnumber\" type=\"text\" class=\"textbox\" id=\"st_id9\"  value=\"");
if (rollnumber != null) {
                                            out.print(rollnumber.toString());
                                        } else {
                                            out.println("");
                                        }
      out.write("\"/></td>\n");
      out.write("                                </tr>\n");
      out.write("\n");
      out.write("                                <td>&nbsp;</td>\n");
      out.write("                                <td><div align=\"left\">\n");
      out.write("                                        <input name=\"submit\" type=\"submit\" class=\"submit\" id=\"submit\" value=\"Update\" />\n");
      out.write("                                    </div></td>\n");
      out.write("                                </tr>\n");
      out.write("                        </table>\n");
      out.write("\n");
      out.write("                    </div></td>\n");
      out.write("            </tr>\n");
      out.write("        </table>\n");
      out.write("        </div>\n");
      out.write("        </form>\n");
      out.write("        <script  type=\"text/javascript\">\n");
      out.write("            var frmvalidator = new Validator(\"myform\");\n");
      out.write("            frmvalidator.addValidation(\"st_name\",\"req\",\"Username must be entered !\");\n");
      out.write("            frmvalidator.addValidation(\"st_name\",\"alnum\",\"Name must be alpha numeric !\");\n");
      out.write("            frmvalidator.addValidation(\"address\",\"req\",\"Address must be Entered !\");\n");
      out.write("            frmvalidator.addValidation(\"pincode\",\"num\",\"Pincode must be a number !\");\n");
      out.write("            frmvalidator.addValidation(\"pincode\",\"maxlen=6\",\"Pincode not exceed six digits !\");\n");
      out.write("            frmvalidator.addValidation(\"pincode\",\"minlen=4\",\"Pincode not less than four digits !\");\n");
      out.write("            frmvalidator.addValidation(\"email\",\"email\",\"invalid email address !\");\n");
      out.write("        </script>\n");
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
