<%-- 
    Document   : usercircluation
    Created on : Apr 4, 2013, 12:28:55 PM
    Author     : Shajeer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>user data</title>
        <link rel="stylesheet" href="styleforuser.css" type="text/css" />
           </head>

    <body>
        <br/>
        <br/>
        <br/>
        <div id="tables">
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
                    <th width="15px">&nbsp</th>

                </tr>


                <%
                    for (int i = 0; i < 5; i++) {

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
                            <% if (j == 0) {
                                    out.print(i + 1);
                                }%>
                            <%
                            if (j == 6) {%>

                            <input type="checkbox"/>

                            <%                            }
                            %>
                        </td> 
                        <%
                            }
                        %>
                    </tr>


                    <%
                        }


                    %>

            </table>
                    <div id="returnbt">
                    <form action="">
                        <input type="submit" value="Return" class="submit" title="return checked books"/>
                    </form>
                    </div>
                    <div id="renewbt">
                    <form action="">
                        <input type="submit" value="Renew" class="submit" title="renew checked books"/>                        
                    </form>                  
        </div>

    </body>
</html>