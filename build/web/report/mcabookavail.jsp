<%-- 
    Document   : stockreport
    Created on : Apr 9, 2013, 9:20:57 PM
    Author     : Shajeer
--%>

<%@page import="java.io.File"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="library.Mcabookavail"%>
<%@page import="library.Mcabookreg"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="com.lowagie.text.*" %>
<%@page import="com.lowagie.text.pdf.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Stock report</title>
        <link rel="stylesheet" href="styleforuser.css" type="text/css" />
    </head>
    <body id="reportbody">
        
        <!--pdf table opening creates new file--> 
        <%
            String name = "Avail_Report.pdf" ;
            String pdfname = "C:/Users/Shajeer/Documents/NetBeansProjects/etude22/web/report/generated_reports/" + name;
            Document doc = new Document();
            PdfWriter.getInstance(doc, new FileOutputStream(pdfname));
            doc.open();
            PdfPTable pt = new PdfPTable(4);
            doc.addAuthor("etude");
            doc.newPage();
            pt.setWidthPercentage(95);
            pt.addCell("Sl Num");
            pt.addCell("BOOK ID");
            pt.addCell("TITLE");
            pt.addCell("AUTHOR");

        %>
        <!--pdf table opening closes with header--> 

        <div id="repheader" align="center">
            AVAILABLE BOOKS           
        </div>
        <table id="bookavilreport" align="center" width="60%" height="100%" cellpadding="12" cellspacing="0" id="outer" border="1px">
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

            </tr>
            <%


                int i = 0;
                SessionFactory sf = new Configuration().configure().buildSessionFactory();
                Session s = sf.openSession();
                Transaction t = s.beginTransaction();
                String hql = "from Mcabookavail order by title asc";
                List list = s.createQuery(hql).list();
                Iterator iterator = list.iterator();
                while (iterator.hasNext()) {
                    Mcabookavail m = (Mcabookavail) iterator.next();
                    if ((i % 2) == 0) {
            %>
            <tr id="col1">
                <%                    } else {
                %>
            <tr id="col2">



                <%                        }
                    for (int j = 0; j < 4; j++) {

                %>
                <td>
                    <%
                        if (j == 0) {
                            out.println(i + 1);
                            pt.addCell(String.valueOf(i + 1));
                        }
                        if (j == 1) {
                            out.println(m.getBookid());
                            pt.addCell(m.getBookid());
                        }
                        if (j == 2) {
                            out.println(m.getTitle());
                            pt.addCell(m.getBookid());
                        }
                        if (j == 3) {
                            out.println(m.getAuthor());
                            pt.addCell(m.getAuthor());
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

        <input type="submit" value="Generate pdf" class="submit" onclick="download('<%=name%>');"/></a>
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
