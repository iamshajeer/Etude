<%-- 
    Document   : mcareservuser
    Created on : May 26, 2013, 11:24:12 PM
    Author     : Shajeer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="styleforreserv.css" rel="stylesheet" type="text/css" media="screen" />
    </head>
    <body onload="se.focus();">
        <%
            String title = (String) request.getSession().getAttribute("title");
            String author = (String) request.getSession().getAttribute("author");
            String bookid = (String) request.getSession().getAttribute("bookid");
        %>
 <center>
        <h1>
            Reservation
        </h1>
    </center>
    <table width="600px" border="0" cellpadding="15" cellspacing="5" class="innertable">
        <form action="../searchbook">
            <tr>
                <th>
                    Book id:
                </th>
                <td>
                    <input type="text"  value="<%if (bookid != null) {
                            out.println(bookid.toString());
                        } else {
                        out.println("");
                    }%>" name="bookid" class="text" id="se"/>
                    <input type="submit" title="Enter book id and press search" id="search" value="&nbsp;" />
                </td>
            </tr>
        </form>
        <form action="../mcabookreserv">
            <input type="hidden" name="bookid" value="<%if (bookid != null) {
                    out.println(bookid.toString());
                } else {
                    out.println("");
                }%>"/>
            <tr>
                <th>
                    Title:
                </th>
                <td>
                    <input type="text"  value="<%if (title != null) {
                            out.println(title.toString());
                        } else {
                            out.println("");
                        }%>" class="text" disabled="disabled"/>
                </td>
            </tr>
            <tr>
                <th>
                    Author:
                </th>
                <td>
                    <input type="text" value="<%if (author != null) {
                            out.println(author.toString());
                        } else {
                            out.println("");
                        }%>" class="text" disabled="disabled"/>
                </td>
            </tr>
            <tr>
                <td>

                </td>
                <td>
                    <%
                    //request.getSession().removeAttribute("title");
                    //request.getSession().removeAttribute("author");
                    //request.getSession().removeAttribute("bookid");
                    %>
                    <input type="submit" class="submit" value="Reserve book"/>


                </td>
            </tr>
        </form>
    </table>
</body>
</html>
