<%-- 
    Document   : image
    Created on : May 26, 2013, 6:26:37 PM
    Author     : Shajeer
--%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.nio.charset.MalformedInputException"%>
<%@page import="library.Mcapatron"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>photo</title>
    </head>
    <body>
        <%
            try {
                response.setContentType("image");
                boolean flag = false;
                SessionFactory sf = new Configuration().configure().buildSessionFactory();
                Session s = sf.openSession();
                Transaction t = s.beginTransaction();
                String hql = "from Mcapatron where uid=:uid";
                List l = s.createQuery(hql).setString("uid", (String) request.getSession().getAttribute("sid")).list();
                ServletOutputStream os = response.getOutputStream();
                Iterator it = l.iterator();
                while (it.hasNext()) {
                    Mcapatron m = (Mcapatron) it.next();
                    flag = true;
                    os.write(m.getImage());
                    os.close();
                }
                if (flag) {
                    File f = new File("C:/Users/Shajeer/Documents/NetBeansProjects/etude22/web/images/head.jpg");
                    byte[] head = new byte[(int) f.length()];
                    FileInputStream fs = new FileInputStream(f);
                    fs.read(head);
                    os.write(head);
                    fs.close();
                    os.close();
                }
            } catch (Exception e) {
                out.println(e.getClass());
            }
        %>
    </body>
</html>