<%-- 
    Document   : mcapatronupd
    Created on : May 21, 2013, 12:25:22 PM
    Author     : Shajeer
--%>

<%@page import="java.math.BigDecimal"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" href="newstyleforfr.css" type="text/css"/>
        <link rel="stylesheet" href="default.css" type="text/css" />
        <script src="../script/validator.js" type="text/javascript"></script>
    </head>

    <body onload="b_id.focus()"> 
     <%
            String bookid=(String)request.getSession().getAttribute("bid");
            String isbn=(String)request.getSession().getAttribute("isbn");
            String callnum=(String)request.getSession().getAttribute("callnum");
            String title=(String)request.getSession().getAttribute("title");
            String author=(String)request.getSession().getAttribute("author");
            String edition=(String)request.getSession().getAttribute("edition");
            String pob=(String)request.getSession().getAttribute("pob");
            String nob=(String)request.getSession().getAttribute("nob");
            String yob=(String)request.getSession().getAttribute("yob");
            String pagenum=(String)request.getSession().getAttribute("pagenum");
            String series=(String)request.getSession().getAttribute("series");
            String type=(String)request.getSession().getAttribute("type");
            String doa=(String)request.getSession().getAttribute("doa");
            String source=(String)request.getSession().getAttribute("source");
            BigDecimal cost=(BigDecimal)request.getSession().getAttribute("cost");
            String status=(String)request.getSession().getAttribute("status");
        %>
        <div id="front">
            <table width="600" border="0" align="center" cellpadding="10" cellspacing="3" class="outertable">
                <tr>
                    <td id="tabhead">
                        <center>
                            BOOK UPDATION 
                        </center>
                    </td>
                </tr>
                <tr>
                    <td><table width="100%" border="0" cellpadding="15" cellspacing="5" class="innertable">
                            <form id="searchbookkid" action="../mbasearchbookid">
                                <tr>
                                    <td> Book Id : </td>
                                    <td>
                                        <input name="b_id" type="text" class="textbox" id="b_id"  value="<%if (bookid != null) {
                                            out.print(bookid.toString());
                                        } else {
                                            out.println("");
                                        }%>"/>
                                        <input type="submit" id="serchbutton"  value="&nbsp;"title="search"/>                                        

                                    </td>
                                </tr>
                            </form>
                            <form id="myform" action="../mbabkupd" method="post">
                                <input type="hidden" name="b_id" value="<%=request.getSession().getAttribute("bid")%>"/>
                                <tr>
                                    <td> Isbn : </td>
                                    <td> 
                                        <input name="isbn" type="text" class="textbox"  value="<%if (isbn != null) {
                                            out.println(isbn.toString());
                                        } else {
                                            out.println("");
                                        }%>"  id="isbn" />
                                    </td>
                                </tr>
                                <tr>
                                    <td> Full Call Number<a href="#" class="nil" title="Dewy Decimal Code number."> [?]</a> : </td>
                                    <td> 
                                        <input name="ddc" type="text" class="textbox"  value="<%if (callnum != null) {
                                            out.println(callnum.toString());
                                        } else {
                                            out.println("");
                                        }%>" id="ddc" />
                                    </td>
                                </tr><tr>
                                    <td> Title : </td>
                                    <td> 
                                        <input name="title" type="text" class="textbox"  value="<%if (title != null) {
                                            out.println(title.toString());
                                        } else {
                                            out.println("");
                                        }%>" id="title" />
                                    </td>
                                </tr>
                                <tr>
                                    <td> Author : </td>
                                    <td> 
                                        <input name="author" type="text" class="textbox" id="author"  value="<%if (author != null) {
                                            out.println(author.toString());
                                        } else {
                                            out.println("");
                                        }%>" />
                                    </td>
                                </tr>
                                <tr>
                                    <td> Edition : </td>
                                    <td> 
                                        <input name="edition" type="text" class="textbox" id="edition" value="<%if (edition != null) {
                                            out.println(edition.toString());
                                        } else {
                                            out.println("");
                                                                                   }%>"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td> Place Of Publication : </td>
                                    <td> 
                                        <input name="pob" type="text" class="textbox" id="pob" value="<%if (pob != null) {
                                            out.println(pob.toString());
                                        } else {
                                            out.println("");
                                                                                                                             }%>"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td> Name Of Publication : </td>
                                    <td> 
                                        <input name="nob" type="text" class="textbox" id="nop"   value="<%if (nob != null) {
                                            out.println(nob.toString());
                                        } else {
                                            out.println("");
                                        }%>" />
                                    </td>
                                </tr>
                                <tr>
                                    <td> Year Of Publication : </td>
                                    <td> 
                                        <input name="yob" type="text" class="textbox" id="yop"  value="<%if (yob != null) {
                                            out.println(yob.toString());
                                        } else {
                                            out.println("");
                                        }%>"  />
                                    </td>
                                </tr>
                                <tr>
                                    <td> Page Number : </td>
                                    <td> 
                                        <input name="page" type="text" class="textbox" id="pages"  value="<%if (pagenum != null) {
                                            out.println(pagenum.toString());
                                        } else {
                                            out.println("");
                                        }%>" />
                                    </td>
                                </tr>
                                <tr>
                                    <td> Series : </td>
                                    <td> 
                                        <input name="series" type="text" class="textbox" id="series"  value="<%if (series != null) {
                                            out.println(series.toString());
                                        } else {
                                            out.println("");
                                        }%>"  />
                                    </td>
                                </tr>
                                <tr>
                                    <td> Type : </td>
                                    <td> 
                                        <input name="type" type="text" class="textbox" id="b_id2"  value="<%if (type != null) {
                                            out.println(type.toString());
                                        } else {
                                            out.println("");
                                        }%>" />
                                    </td>
                                </tr>
                                <tr>
                                    <td> Date Of Book Acquired : </td>
                                    <td> 
                                        <input name="doa" type="text" class="textbox" id="doa"   value="<%if (doa != null) {
                                            out.println(doa.toString());
                                        } else {
                                            out.println("");
                                        }%>"  />
                                    </td>
                                </tr>
                                <tr>
                                    <td> Source : </td>
                                    <td> 
                                        <input name="source" type="text" class="textbox" id="soa"   value="<%if (source != null) {
                                            out.println(source.toString());
                                        } else {
                                            out.println("");
                                        }%>" />
                                    </td>
                                </tr>
                                <tr>
                                    <td> Cost : </td>
                                    <td> 
                                        <input name="cost" type="text" class="textbox" id="cost"   value="<%if (cost != null) {
                                            out.println(cost.toString());
                                        } else {
                                            out.println("");
                                        }%>" />
                                    </td>
                                </tr>
                                <tr>
                                    <td> Status : </td>
                                    <td> 
                                        <input name="status" type="text" class="textbox" id="status"   value="<%if (status != null) {
                                            out.println(status.toString());
                                        } else {
                                            out.println("");
                                        }%>" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td> 
                                        <input name="submit" type="submit" class="submit" id="submit" value="Update" />
                                    </td>
                                </tr>
                            </form>
                        </table>
                    </td>
                </tr>
                                
            </table>
<script  type="text/javascript">
            var frmvalidator = new Validator("myform");
            frmvalidator.addValidation("title","req");
            frmvalidator.addValidation("author","req","Author name must be Entered !");
            frmvalidator.addValidation("edition","req","Edition must be Entered !");
            frmvalidator.addValidation("series","req","Series must be Entered !");
            frmvalidator.addValidation("cost","num","Cost should be number !");
        </script>
    </body>
</html>
