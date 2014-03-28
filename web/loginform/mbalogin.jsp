<%-- 
    Document   : mcalogin
    Created on : Apr 6, 2013, 11:40:49 AM
    Author     : Shajeer
--%>



<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <title>etude-Centralized library management system</title>
        <meta name="keywords" content="" />
        <meta name="description" content="" />
        <link rel="stylesheet" href="styleforlogin.css" type="text/css" /> 
        <link href="styles.css" rel="stylesheet" type="text/css" media="screen" />
        <style type="text/css">
            #apDiv1 {
                position:absolute;
                width:200px;
                height:115px;
                z-index:1;
            }
        </style>
    </head>
    <body id="default_pages/kvm" onload="t1.focus();" >
        <%! int i = 0;%>
        <div id="content">
            <!-- header begins -->
            <div id="menu">
                <ul>
                    <li><a href="../index.jsp" title="">Home</a></li>
                    <li id="button5"><a href="http://www.kvmce.in/" title="">About Kvm ce&it</a></li>
                </ul>
            </div>
            <div id="header">
            </div> 	
            <div id="kvm_logo"></div>	
        </div>

        <!-- header ends -->
        <!-- content begins -->
        <div id="main">
            <div id="indexright">
                <div id="righttop">
                    <!--code for iframe begin-->
                    <center>
                        <form action="../chkmbalog" method="post">
                            <table width="483" border="0"cellpadding="20" cellspacing="13" id="logintable">
                                <tr><td></td><th align="left">

                                        LOGIN FOR MBA
                                    </th>
                                </tr>
                                <tr>
                                    <td width="140">
                                        User ID:
                                    </td>
                                    <td width="294">
                                        <input type="text" id="t1" name="uid" class="text" autocomplete="off"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Password:</td>
                                    <td>
                                        <input type="password" id="password" name="password" class="text"/>
                                    </td>
                                </tr>
                                <%
                                    String flg = (String) request.getSession().getAttribute("flg");
                                    if (flg != null)
                                        if (flg.equals("invalid")) {%>
                                %>
                                <tr style="color:red">
                                    <td>&nbsp;</td>
                                    <td>
                                        Invalid information given
                                    </td>
                                </tr>
                                <%                                        }

                                    request.getSession().removeAttribute("flg");
                                %>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td> 

                                        <input name="submit" type="submit" onclick="change()" class="submit" id="submit" value="Submit" />

                                    </td>
                                </tr>
                            </table>
                        </form>
                    </center>

                    <!--code for iframe end-->
                </div>
            </div>
            <div id="left">
                <div id="lefttop">
                    <h3>Our Courses</h3>
                    <div id="partners">
                        <ul>
                            <li><a href="http://www.kvmce.in/index.php/mca">MCA</a></li>
                            <li><a href="http://www.kvmce.in/index.php/management">MBA</a></li>
                            <li><a href="http://www.kvmce.in/index.php/msc_biotech">MSC BIOTECHNOLOGY</a></li>
                            <li><a href="http://www.kvmce.in/index.php/courses">B.TECH</a></li> 
                        </ul>
                    </div>
                    <div id="categories">
                        <ul id="quotes">
                            Librarian can manage all transaction in the library. They can manage users and books information of their own respective library.
                        </ul>
                    </div>

                </div><div style="clear:both;"></div><div id="mainbot"></div>
            </div>

        </div>
        <!--content ends -->
        <!--footer begins -->


        <div id="footer">
            <p>Copyright  2013</p>
            <p>Design by Rashi nellimunda & Shajeer ahmed</a>
            </p>

        </div>
        <!-- footer ends-->

    </body>

</html>
