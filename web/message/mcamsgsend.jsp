<%-- 
    Document   : mcamsgsend
    Created on : Apr 12, 2013, 7:25:27 PM
    Author     : Shajeer
--%>


<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="library.Mcapatron"%>
<%@page import="library.Mcainbox"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Message Send</title>
    </head>
    <body>
        <%
            String uid = (String) request.getSession().getAttribute("uid");
            String sub = request.getParameter("subject");
            String msg = request.getParameter("msg");
            Date date = new Date();
            DateFormat df = new SimpleDateFormat("dd-MM-yyyy");
            String sysdate = df.format(date);
            SessionFactory sf = new Configuration().configure().buildSessionFactory();
            Session s = sf.openSession();
            Transaction t = s.beginTransaction();
            String hql = "from Mcapatron";
            List list = s.createQuery(hql).list();
            Iterator iterator = list.iterator();
            Mcapatron mca = null;
            try {
                while (iterator.hasNext()) {
                    Mcapatron m = (Mcapatron) iterator.next();
                    if (uid.equals(m.getUid())) {
                        mca = m;
                    }
                }
                Mcainbox mi = new Mcainbox(mca, msg, 0, sysdate, sub);
                s.save(mi);
                t.commit();
                s.close();

            } catch (Exception e) {
                out.println(e.getMessage());
            }
            out.println("<center><b><h3>message successfully send</h3></b></center><br/> press f5 to g oback ! ");
                   %>
    </body>
</html>
