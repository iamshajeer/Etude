<%-- 
    Document   : usermain
    Created on : Apr 3, 2013, 11:43:34 AM
    Author     : Shajeer
--%>

<%@page import="org.hibernate.Query"%>
<%@page import="library.Settings"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Locale"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="library.Mcapatron"%>
<%@page import="library.Mcaissue"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>user data</title>
        <link rel="stylesheet" href="styleforuser.css" type="text/css" />
    </head>

    <body>
        <%  boolean flag = false;
            int i = 0;
            String uid = (String) request.getSession().getAttribute("uid");
            SessionFactory sf = new Configuration().configure().buildSessionFactory();
            Session s = sf.openSession();
            Transaction t = s.beginTransaction();
            String hql = "from Mbaissue where rtrndate=null order by issuedate desc ";
            List li = s.createQuery(hql).list();
            Iterator iterator = li.iterator();
            Mcaissue mi;
        %> <center><h1>Books issued to you</h1></center>
        <div id="table">

            <table width="100%" height="100%" cellpadding="7" cellspacing="0" id="outer" border="1px">
                <tr>
                    <th width="15px">
                        Sl Num.
                    </th>
                    <th>
                        Book ID
                    </th>
                    <th>
                        Title
                    </th>
                    <th>
                        Author
                    </th>
                    <th>
                        Issue Date
                    </th>
                    <th>
                        Renewal Date
                    </th>
                </tr>



                <%
                    while (iterator.hasNext()) {
                        Mcaissue m = (Mcaissue) iterator.next();
                        if (m.getUserid().equals(uid)) {
                          //calculating date difference
                            String d = m.getIssuedate();
                            SimpleDateFormat sdf = new SimpleDateFormat("d-MM-yyyy");
                            Date ogdate = sdf.parse(d);
                            Date current = new Date();
                            String curdate = sdf.format(current);
                            int diffInDays = (int) ((current.getTime() - ogdate.getTime()) / (1000 * 60 * 60 * 24));
                          //calculation over
                           //getting renewal period duration from settings
                            SessionFactory sfact = new Configuration().configure().buildSessionFactory();
                            Session ses = sf.openSession();
                            Transaction tr = s.beginTransaction();
                            String hql1 = "from Settings where deptid=:department";

                            Settings set = null;
                            int rendays = 0;
                            Query q = ses.createQuery(hql1).setString("department", "Mba");
                            List list = q.list();
                            Iterator it = list.iterator();
                            while (it.hasNext()) {
                                set = (Settings) it.next();
                                rendays = set.getRendays();
                            }
                            ses.close();
                            tr.commit();
                           //over 

                            if ((i % 2) == 0) {

                %>
                <tr id="col1" <%if(diffInDays>rendays){%>class="renewalover" title="renewal period of this book is over"<%}else if(diffInDays==rendays){%>class="renewalday" title="you have to renew this book today"<%}%>>
                    <%                    } else {

                    %>
                    <tr id="col2" <%if(diffInDays>rendays){%>class="renewalover" title="renewal period of this book is over"<%}else if(diffInDays==rendays){%>class="renewalday"<%}%>>
                        <%      }
                            i++;
                            for (int j = 0; j < 6; j++) {
                        %>
                        <td><%
                            if (j == 0) {
                                out.println(i);
                            }
                            if (j == 1) {
                                out.println(m.getBookid());
                            }
                            if (j == 2) {
                                out.println(m.getTitle());
                            }
                            if (j == 3) {
                                out.println(m.getAuthor());
                            }

                            if (j == 4) {
                                out.println(m.getIssuedate());
                            }
                            if (j == 5) {
                                out.println(m.getRenewaldate());
                            }
                            %>
                        </td>
                        <%
                            }
                        %>


                        <%
                                }

                            }
                        %>
                    </tr>
            </table>

        </div>

        <br/>
        <br/>
        <br/>


    </body>
</html>