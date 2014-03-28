<%-- 
    Document   : mcapatronreport
    Created on : Apr 9, 2013, 11:23:19 PM
    Author     : Shajeer
--%>
<%@page import="com.lowagie.text.pdf.PdfPTable"%>
<%@page import="com.lowagie.text.pdf.PdfWriter"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="com.lowagie.text.Document"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.LinkedHashSet"%>
<%@page import="library.Mcapatron"%>
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
            
            String name = "User_Report.pdf";
            String pdfname = "C:/Users/Shajeer/Documents/NetBeansProjects/etude22/web/report/generated_reports/" + name;
            Document doc = new Document();
            PdfWriter.getInstance(doc, new FileOutputStream(pdfname));
            doc.open();
            PdfPTable pt = new PdfPTable(12);
            doc.addAuthor("etude");
            doc.newPage();
            pt.setWidthPercentage(95);       
            pt.addCell("Sl Num");
            pt.addCell("USER ID");
            pt.addCell("USER NAME");
            pt.addCell("ADDRESS");
            pt.addCell("PLACE");
            pt.addCell("D.O.B");
            pt.addCell("PINCODE");
            pt.addCell("PHONE");
            pt.addCell("E-MAIL");
            pt.addCell("Date Of Join");
            pt.addCell("BATCH");
            pt.addCell("ROLL  NUM");
        %>

        <%!     static int select = 0;
        %>
        <div id="repheader" align="center">
            REGISTERED USERS REPORT           
        </div>
        <form action="#" method="post">
            <div id="selction">
                <select>
                    <option value="#">Show All</option>

                    <%
                        int i = 0;
                        String hql = "from Mcapatron order by uname asc";;
                        SessionFactory sf = new Configuration().configure().buildSessionFactory();
                        Session s = sf.openSession();
                        Transaction t = s.beginTransaction();
                        String hql1 = "from Mcapatron";
                        //                HashSet lis = (HashSet) s.createQuery(hql1);
                        List li = s.createQuery(hql1).list();
                        Iterator it = li.iterator();
                        Mcapatron mi = null;
                        while (it.hasNext()) {
                            mi = (Mcapatron) it.next();
                    %>

                    <option value="<%= mi.getBatch()%>"><%= mi.getBatch()%> </option>                

                    <%
                        }
                        s.save(mi);
                        t.commit();
                        s.close();
                    %>
                </select>
                <select onchange="changeSelection();">
                    <option value="#" >Sort by</option>
                    <option value="<%=select + 1%>">Batch</option>
                    <option value="<%=select + 2%>">Name</option>
                    <option value="3<%=select + 3%>">D.O.B</option>
                    <option value="4">Roll Number</option>
                    <option value="5">User id</option>
                </select>
                &nbsp;&nbsp;
                &nbsp;&nbsp;
                <input type="submit" value="Go !" class="submit" />
            </div>
        </form>
                    <form action="#" id="mainform">
        <table id="reporttab" align="center" width="95%" height="100%" cellpadding="12" cellspacing="0" id="outer" border="1px">
            <tr>
                <th title="serial number">
                    Sl Num.
                </th>
                <th>
                    User ID
                </th>
                <th>
                    Name
                </th>
                <th>
                    Adress
                </th>
                <th>
                    Place
                </th>
                <th title="date of birth">
                    D.O.B
                </th>
                <th>
                    Pincode
                </th>
                <th>
                    Phone
                </th>
                <th>
                    E-mail
                </th>
                <th title="Date Of Joining">
                    D.O.J
                </th>
                <th title="Batch">
                    Batch
                </th>
                <th title="Roll Number">
                    Rol Num.
                </th>          
            </tr>
                <%
                    Session ses = sf.openSession();
                    Transaction tr = ses.beginTransaction();
                    switch (select) {
                        case 1: {
                            hql = "from Mcapatron order by batch asc";
                            break;

                        }
                        case 2: {
                            hql = "from Mcapatron order by dob asc";
                            break;
                        }
                        case 3: {
                            hql = "from Mcapatron order by rollnumber asc";
                            break;
                        }
                        case 4: {
                            hql = "from Mcapatron order by uid asc";
                            break;
                        }
                        default:
                            hql = "from Mcapatron order by uname asc";
                            break;

                    }
                    List list = ses.createQuery(hql).list();
                    Iterator iterator = list.iterator();
                    Mcapatron m = null;
                    while (iterator.hasNext()) {
                        m = (Mcapatron) iterator.next();
                        if ((i % 2) == 0) {

                %>
            <tr id="col1">                  
                <%    } else {
                %>
            <tr id="col2">



                <%                    }
                    for (int j = 0; j < 12; j++) {


                %>
                <td>
                    <%  if (j == 0) {
                            out.println(i+1);
                            pt.addCell(String.valueOf(i+1));
                        }
                        if (j == 1) {
                            out.println(m.getUid());
                            pt.addCell(m.getUid());
                        }
                        if (j == 2) {
                            out.println(m.getUname());
                            pt.addCell(m.getUname());
                        }
                        if (j == 3) {
                            out.println(m.getAddress());
                            pt.addCell(m.getAddress());
                        }
                        if (j == 4) {
                            out.println(m.getPlace());
                            pt.addCell(m.getPlace());
                        }
                        if (j == 5) {
                            out.println(m.getDob());
                            pt.addCell(m.getDob());
                        }
                        if (j == 6) {
                            out.println(m.getPincode());
                            pt.addCell(String.valueOf(m.getPincode())) ;
                        }
                        if (j == 7) {
                            out.println(m.getPhone());
                            pt.addCell(String.valueOf(m.getPhone()));

                        }
                        if (j == 8) {
                            out.println(m.getEmail());
                            pt.addCell(m.getEmail());

                        }
                        if (j == 9) {
                            out.println(m.getDoj());
                            pt.addCell(m.getDoj());
                        }
                        if (j == 10) {

                            out.println(m.getBatch());
                            pt.addCell(m.getBatch());
                        }
                        if (j == 11) {
                            out.println(m.getRollnumber());
                            pt.addCell(String.valueOf(m.getRollnumber()));
                        }

                    %>


                </td><%

                        }
                        i++;
                    }
                    out.println(select);
                    ses.save(m);
                    tr.commit();
                    ses.close();
                    doc.add(pt);
                    doc.close();
                %>
        </table>
    <br/><center>
        <input type="submit" value="Generate pdf" class="submit"  onclick="download('<%=name%>')" />
    </center>
                    </form>
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
    function changeSelection(){
        location.reload.element(form[1]);
    }
    function download(name){
        window.open("generated_reports/"+name);
    } 
</script>
</html>
