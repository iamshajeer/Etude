<%-- 
    Document   : logout
    Created on : May 16, 2013, 4:50:12 PM
    Author     : Shajeer
--%>

<%@page import="com.sun.org.apache.bcel.internal.generic.AALOAD"%>
<%@page contentType="text/html
        " pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html> 
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        if (session.getAttribute("session") != null) {
                out.println(session.getAttribute("session"));
                session.invalidate();
            }
        session=request.getSession();
           response.sendRedirect("index.jsp");
        %>
    </body>
</html>
