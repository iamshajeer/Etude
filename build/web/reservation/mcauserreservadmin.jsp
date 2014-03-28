<%-- 
    Document   : mcauserreservadmin
    Created on : May 31, 2013, 8:04:57 PM
    Author     : Shajeer
--%>

<%@page import="library.Mcareserv"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="styleforreserv.css" rel="stylesheet" type="text/css" media="screen" />
    </head>
    <body onload="searching.focus();">
        <form action="../mcaissuereservdbook">
            <br/>
       &nbsp;&nbsp;<input type="text" value="Enter book id here" onfocus="if(this.value == 'Enter book id here') {this.value=''}" onblur="if(this.value == ''){this.value ='Enter book id here'}" name="searchid" id="searching" style="width: 520px; height: 30px;"/>
            <input type="submit" value="Issue Book"  style="width:140px ; height:40px" class="submit"/>
        </form>
            <table width="600px" border="1" cellpadding="15" cellspacing="0" id="reservtab">
                <tr>
                    <th>
                        Sl No.
                    </th>
                    <th width="100px">
                        Book id
                    </th>
                    <th id="msgth">
                        Title
                    </th>
                    <th>
                        Date
                    </th>
                </tr>
                <% String uid = (String) request.getSession().getAttribute("uid");
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
                        out.println(mi.getMcabookreg().getTitle());
                                         }      }
                %>
               
               
    </table>
</body>
</html>
