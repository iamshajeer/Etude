<%-- 
    Document   : mcamsg
    Created on : Apr 12, 2013, 6:40:36 PM
    Author     : Shajeer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>message</title>
        <link rel="stylesheet" href="styleformsgbox.css" type="text/css"/>
    </head>
    <body onload="subject.focus();">
        <form action="mcamsgsend.jsp" method="post">
        <%String uid=(String)request.getSession().getAttribute("sid");
         request.getSession().setAttribute("uid", uid);%>

        

        <table id="msgtab" cellspacing="15" cellpadding="14">
            <tr>
                <th>
                    Subject
                </th>
                <td>
                    <input type="text" name="subject" id="subject"/> 
                </td>
            </tr>
            <tr>
                <th>
                    Message
                </th>
                <td>
                    <textarea name="msg" id="msg"></textarea>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
                <td>
                    <input type="submit" value="Send" class="submit"/>
                </td>
            </tr>
            
        </table>
            </form>
       </body>
</html>
