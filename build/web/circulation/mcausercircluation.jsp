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
        <script src="../script/validator.js" type="text/javascript"></script>
    </head>

    <body onload="searching.focus();">
        <%
            String sid;
            String[] title = new String[25];
            String[] author = new String[25];
            String[] issuedate = new String[25];
            String[] renewdate = new String[25];
            String[] bookid = new String[25];
            int count = (Integer) (request.getSession().getAttribute("count"));
            author = (String[]) request.getSession().getAttribute("author");
            bookid = (String[]) request.getSession().getAttribute("bookid");
            issuedate = (String[]) request.getSession().getAttribute("issuedate");
            renewdate = (String[]) request.getSession().getAttribute("renewdate");
            title = (String[]) request.getSession().getAttribute("title");
            sid = (String) request.getSession().getAttribute("sid");
            int temp = count;
            int i = 0;

        %>

        <br/>
        <form action="../bookissue" method="get" id="myform" onsubmit="windows.location.reload()">
            <input type="text" id="searching"  value="Enter book id here" onfocus="if(this.value == 'Enter book id here') {this.value=''}" onblur="if(this.value == ''){this.value ='Enter book id here'}" name="searchid" style="width: 515px; height: 30px;"/>
            <!a href="#" onclick="top.window.location.href='biotechusercirculation.jsp'">
            <input type="submit" value="Issue Book"  style="width:140px ; height:40px" onselect="top.window.location.href='../userforadminmca.jsp'" class="submit"/>
            <%
                request.getSession().setAttribute("sid", sid);
            %>
        </form>
        <br/>
        <br/>
        <div id="tables">
            <%
                if (temp == 0) {%>
            <br/><br/>
            <%
                out.println("<center><b>No Books Issued to this user</b></center>");
            } else {
            %>
            <form action="../mcabookreutrn" method="get">
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
                        <th width="15px">
                            Check in
                        </th>


                    </tr>


                    <%

                        for (i = 0; i < temp; i++) {

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
                                    }
                                    if (j == 1 && count != 0) {
                                        out.println(bookid[count - 1]);
                                    }

                                    if (j == 2 && count != 0) {
                                        out.println(title[count - 1]);

                                    }

                                    if (j == 3 && count != 0) {
                                        out.println(author[count - 1]);

                                    }

                                    if (j == 4 && count != 0) {
                                        out.println(issuedate[count - 1]);

                                    }
                                    if (j == 5 && count != 0) {
                                        out.println(renewdate[count - 1]);

                                    }
                                    if (j == 6) {%>
                                <input type="checkbox" align="center" name="<%=i%>" value="checked"/>

                                <% }
                                        request.getSession().setAttribute("count", temp);
                                        request.getSession().setAttribute("bookid", bookid);


                                    }
                                %>
                            </td> 

                        </tr>


                        <%
                                count--;
                            }

                        %>
                </table>
                <%
                    }
                %>

                <br/>
                <br/>
                <div id="returnbt">
                    <input type="submit" value="return"  name="button" class="submit" title="return checked books"/>
                </div>
                <div id="renewbt">
                    <input type="submit" value="renew" name="button" class="submit" title="renew checked books"/>
                </div>
            </form>
            <script  type="text/javascript">
                var frmvalidator = new Validator("myform");
                frmvalidator.addValidation("searching","req","Book id must enter !");
            </script>
    </body>
</html>