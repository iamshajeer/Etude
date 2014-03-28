<%-- 
    Document   : stockreport
    Created on : Apr 9, 2013, 9:20:57 PM
    Author     : Shajeer
--%>

<%@page import="com.lowagie.text.HeaderFooter"%>
<%@page import="com.lowagie.text.pdf.PdfPTable"%>
<%@page import="com.lowagie.text.pdf.PdfWriter"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="com.lowagie.text.Document"%>
<%@page import="com.lowagie.text.Document"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="library.Mcabookreg"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Stock report</title>
        <link rel="stylesheet" href="styleforuser.css" type="text/css" />
    </head>
    <body id="reportbody">
        <%
            String name = "Stock_Report.pdf";
            String pdfname = "C:/Users/Shajeer/Documents/NetBeansProjects/etude22/web/report/generated_reports/" + name;
            Document doc = new Document();
            PdfWriter.getInstance(doc, new FileOutputStream(pdfname));
            doc.open();
            PdfPTable pt = new PdfPTable(16);
            doc.addAuthor("etude");
            doc.newPage();
            pt.setWidthPercentage(95);
            pt.addCell("Sl Num");
            pt.addCell("BOOK ID");
            pt.addCell("TITLE");
            pt.addCell("AUTHOR");
            pt.addCell("ISBN");
            pt.addCell("CALL NUM");
            pt.addCell("EDITION");
            pt.addCell("P.O.B");
            pt.addCell("N.O.B");
            pt.addCell("Y.O.B");
            pt.addCell("PAGE NUM");
            pt.addCell("SERIES");
            pt.addCell("TYPE");
            pt.addCell("D.O.A");
            pt.addCell("SOURCE");
            pt.addCell("COST");
        %>
        <div id="repheader" align="center">
            REGISTERED BOOKS REPORT           
        </div>
        <table id="stocktab" align="center" width="70%" height="100%" cellpadding="12" cellspacing="0" id="outer" border="1px">
            <tr>
                <th>
                    Sl num
                </th>
                <th>
                    Book Id
                </th>
                <th>
                    Title
                </th>
                <th>
                    Author
                </th>
                <th>
                    ISBN
                </th>
                <th>
                    Call Num
                </th>
                <th>
                    Edition
                </th>
                <th title="Place Of Publication">
                    P.O.B
                </th>
                <th title="Name Of Publication">
                    N.O.B
                </th>
                <th title="Year Of Publication">
                    Y.O.B
                </th>
                <th title="Page Number">
                    Page Num
                </th>
                <th>
                    Series
                </th>
                <th title="Type Of Book">
                    Type
                </th>
                <th title="Book Acquired date">
                    D.O.A
                </th>   
                <th>
                    Source
                </th>
                <th>
                    Cost
                </th>
            </tr>
            <%


                int i = 0;
                SessionFactory sf = new Configuration().configure().buildSessionFactory();
                Session s = sf.openSession();
                Transaction t = s.beginTransaction();
                String hql = "from Mcabookreg order by title asc";
                List list = s.createQuery(hql).list();
                Iterator iterator = list.iterator();
                while (iterator.hasNext()) {
                    Mcabookreg m = (Mcabookreg) iterator.next();



                    if ((i % 2) == 0) {

            %>
            <tr id="col1">
                <%                    } else {
                %>
            <tr id="col2">



                <%                        }
                    for (int j = 0; j < 16; j++) {


                %>
                <td>
                    <%
                        if (j == 0) {
                            out.println(i + 1);
                            pt.addCell(String.valueOf(i+1));
                        }
                        if (j == 1) {
                            out.println(m.getBookid());
                            pt.addCell(m.getBookid());
                        }
                        if (j == 2) {
                            out.println(m.getTitle());
                            pt.addCell(m.getTitle());
                        }
                        if (j == 3) {
                            out.println(m.getAuthor());
                            pt.addCell(m.getAuthor());
                        }
                        if (j == 4) {
                            out.println(m.getIsbn());
                            pt.addCell(m.getIsbn());
                        }
                        if (j == 5) {
                            out.println(m.getCallnum());
                            pt.addCell(m.getCallnum());
                        }
                        if (j == 6) {
                            out.println(m.getEdition());
                            pt.addCell(m.getEdition());
                        }
                        if (j == 7) {
                            out.println(m.getPob());
                            pt.addCell(m.getPob());
                        }
                        if (j == 8) {
                            out.println(m.getNob());
                            pt.addCell(m.getNob());
                        }
                        if (j == 9) {
                            out.println(m.getYob());
                            pt.addCell(m.getYob());
                        }
                        if (j == 10) {
                            out.println(m.getPagenum());
                            pt.addCell(m.getPagenum());
                        }
                        if (j == 11) {
                            out.println(m.getSeries());
                            pt.addCell(m.getSeries());
                        }
                        if (j == 12) {
                            out.println(m.getType());
                            pt.addCell(m.getType());
                        }
                        if (j == 13) {
                            out.println(m.getDoa());
                            pt.addCell(m.getDoa());
                        }
                        if (j == 14) {
                            out.println(m.getSource());
                            pt.addCell(m.getSource());
                        }
                        if (j == 15) {
                            out.println(m.getCost());
                            pt.addCell(String.valueOf(m.getCost()));
                        }
                       
                    %>


                </td><%

                        }
                        i++;
                    }
                 doc.add(pt);
                    doc.close();
                %>
        </table>
    <br/><center>
        <input type="submit" value="Generate pdf" class="submit" onclick="download('<%=name%>')" />
    </center>

    <br/><br/>

    <!--footer begins -->
    <div id="footer">
        <p>Copyright  2013</p>
        <p>Design by Rashi nellimunda & Shajeer ahmed</a>
        </p>
    </div>
    <!-- footer ends-->
</body>
<script>
      function download(name){
        window.open("generated_reports/"+name);
        var fso=new ActiveXObject("Scripting.FileSystemObject");
        file =fso.GetFile("generated_reports/"+name);
        file.Delete();
    } 
</script>
</html>
