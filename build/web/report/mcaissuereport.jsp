<%-- 
    Document   : stockreport
    Created on : Apr 9, 2013, 9:20:57 PM
    Author     : Shajeer
--%>

<%@page import="com.lowagie.text.pdf.PdfPTable"%>
<%@page import="com.lowagie.text.pdf.PdfWriter"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="com.lowagie.text.Document"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="library.Mcaissue"%>
<%@page import="library.Mcatrans"%>
<%@page import="library.Mcabookavail"%>
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
           
            String name = "Transaction_Report.pdf";
            String pdfname = "C:/Users/Shajeer/Documents/NetBeansProjects/etude22/web/report/generated_reports/" + name;
            Document doc = new Document();
            PdfWriter.getInstance(doc, new FileOutputStream(pdfname));
            doc.open();
            PdfPTable pt = new PdfPTable(7);
             doc.addAuthor("etude");
            doc.newPage();
            pt.setWidthPercentage(95);
            pt.addCell("Sl Num");
            pt.addCell("TRANSACTION ID");
            pt.addCell("BOOK ID");
            pt.addCell("TITLE");
            pt.addCell("AUTHOR");
            pt.addCell("DATE OF ISSUE");
            pt.addCell("DATE OF RETURN");
        %>
        <div id="repheader" align="center">
            BOOKS ISSUED           
        </div>
        <table id="bookavilreport" align="center" width="90%" height="100%" cellpadding="12" cellspacing="0" id="outer" border="1px">
            <tr>
                <th>
                    Sl num
                </th>
                <th width="70px">
                    Transaction Id
                </th>
                <th width="70px">
                    Book ID
                </th>
                <th width="200px">
                    Title
                </th>
                <th width="200px">
                    Author
                </th>
                <th>

                    Date Of Issue
                </th>
                <th>
                    Date Of Return
                </th>
            </tr>
            <%
                long diff = 0;
                int i = 0;
                SessionFactory sf = new Configuration().configure().buildSessionFactory();
                Session s = sf.openSession();
                Transaction t = s.beginTransaction();
                String hql = "from Mcaissue order by issuedate asc";
                List list = s.createQuery(hql).list();
                Iterator iterator = list.iterator();
                while (iterator.hasNext()) {
                    Mcaissue m = (Mcaissue) iterator.next();



                    if ((i % 2) == 0) {

            %>
            <tr id="col1">
                <%                    } else {
                %>
            <tr id="col2">



                <%                        }
                    for (int j = 0; j < 7; j++) {


                %>
                <td>
                    <%
                        if (j == 0) {
                            out.println(i + 1);
                            pt.addCell(String.valueOf(i + 1));
                        }
                        if (j == 1) {
                            out.println(m.getTransid());
                            pt.addCell(String.valueOf(m.getTransid()));
                        }
                        if (j == 2) {

                            out.println(m.getBookid());
                            pt.addCell(m.getBookid());
                        }
                        if (j == 3) {
                            out.println(m.getTitle());
                            pt.addCell(m.getTitle());
                        }
                        if (j == 4) {
                            out.println(m.getAuthor());
                            pt.addCell(m.getAuthor());
                        }
                        if (j == 5) {

                            out.println(m.getIssuedate());
                            pt.addCell(m.getIssuedate());
                        }
                        if (j == 6) {
                            out.println(m.getRenewaldate());
                            pt.addCell(m.getRenewaldate());
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
        <input type="submit" value="Generate pdf" class="submit" onclick="download('<%=name%>')"/>
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
    } 
</script>

</html>
