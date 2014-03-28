<%-- 
    Document   : mcauserfineviewer
    Created on : May 22, 2013, 10:40:55 AM
    Author     : Shajeer
--%>

<%@page import="library.Mcafine"%>
<%@page import="library.Mcaissue"%>
<%@page import="org.hibernate.Query"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="library.Settings"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="styleforfinetable.css" type="text/css"/>
    </head>
    <body>
    <center><h1>Fine Details</h1></center>
        <form action="#" method="get">
            <table border="1" id="inboxtab"  cellpadding="12" cellspacing="0">
                <tr>
                    <th>
                        Sl No.
                    </th>
                    <th width="100px">
                        Book id
                    </th>
                    <th width="100px">
                        Book name   
                    </th>
                    <th>
                        Issued date
                    </th>
                    <th>
                        Renewed date
                    </th>
                    <th>
                        Pending days
                    </th>
                    <th>
                        Amount
                    </th>
                </tr>
                <%
                    String uid = (String) request.getSession().getAttribute("uid");
                    SessionFactory sf = new Configuration().configure().buildSessionFactory();
                    int i = 0;
                    BigDecimal total = BigDecimal.ZERO;
                    Session session1 = sf.openSession();
                    Transaction t2 = session1.beginTransaction();
                    String hql2 = "From Mcafine where uid=:uid";
                    List list1 = session1.createQuery(hql2).setString("uid", uid).list();
                    Iterator iterator1 = list1.iterator();
                    Mcafine f = null;
                    while (iterator1.hasNext()) {
                        f = (Mcafine) iterator1.next();
                        if ((i % 2) == 0) {
                %>
                <tr id="col1">

                    <%                    } else {
                    %>
                <tr id="col2">

                    <%      }
                        i++;
                        for (int j = 0; j < 7; j++) {
                    %>
                    <td <%if(j==5){%>id="dayscol"<%}%>>
                        <%
                            if (j == 0) {
                                out.println(i);
                            }
                            if (j == 1) {
                                out.println(f.getMcaissue().getBookid());
                            }
                            if (j == 2) {
                                out.println(f.getMcaissue().getTitle());
                            }
                            if (j == 3) {
                                out.println(f.getMcaissue().getIssuedate());
                            }
                            if (j == 4) {
                                out.println(f.getMcaissue().getRenewaldate());
                            }
                            if (j == 5) {
                                out.println(f.getDays());
                            }
                            if (j == 6) {
                                total = total.add(f.getFineamt());
                                out.println(f.getFineamt());
                            }

                        %>
                    </td>
                    <%                            }
                        }
                    %>
            </table> 
            <table  id="totaltab">                <tr id="borderless">
                    <th>Total</th><th><%=total%></th>
                </tr>
            </table>
        </form>
    </body>
</html>
