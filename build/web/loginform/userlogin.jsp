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
        <link href="styles.css" rel="stylesheet" type="text/css"/>
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
      
        <div id="content">
            <!-- header begins -->
            <div id="menu">
                <ul>
                    <li id="default_pages/kvm" onclick="changeFrame(this.id)"><a href="../index.jsp" title="">Home</a></li>
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
                        <form action="../chkusrlog" method="post">
                            <table width="483" border="0"cellpadding="20" cellspacing="13" id="logintable">
                                <tr><td></td><th align="left">
                                        LOGIN FOR USER
                                    </th>
                                </tr>
                                <tr>
                                    <td width="140">
                                        User ID:
                                    </td>
                                    <td width="294">
                                        <input type="text"  name="uid" id="t1" class="text" autocomplete="off"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Department:</td>
                                    <td>
                                        <select class="text" name="dpt">
                                            <option value="Mcapatron">MCA</option>
                                            <option value="Mbapatron">MBA</option>
                                            <option value="Biotechpatron">Biotechnology</option>
                                            <option value="Btechpatron">B-tech</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td  title="Format yyyy-mm-dd">
                                        Date of Birth&nbsp;<a href="#" title="Plese Enter Date Of Birth in the Format YYYY-MM-DD if your browser not supports calendar" >*</a>:</td>
                                    <td title="Format yyyy-mm-dd">
                                        <input type="date" value="YYYY-MM-DD" onfocus="if(this.value == 'YYYY-MM-DD') {this.value=''}" onblur="if(this.value == ''){this.value ='YYYY-MM-DD'}" name="dob" class="text" id="date"/>
                                    </td>
                                </tr>
                                <%
                                     String flg=(String)request.getSession().getAttribute("flg");
                                     if (flg != null)
                                           if (flg.equals("invalid")) {%>
                                %>
                                <tr style="color:red">
                                    <td>&nbsp;</td>
                                    <td>
                                        wrong information given. 
                                    </td>
                                    </tr>
                                  <%}
                                     request.getSession().removeAttribute("flg");     %>
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
                            User can directly interact with their own account. They can view information about currently holding books details and fine details.Also the inbox facility allows to read messages from the librarian.
                        </ul>
                    </div>
     </div><div style="clear:both;"></div><div id="mainbot"></div>
            </div>

        </div>
        <!--content ends -->
        <!--footer begins -->


        <div id="footer">
            <p>Copyright  2013</p>
            <p>Design by Rashi nellimunda & <a href="info4shajeer@gmail.com">Shajeer ahamed</a>
            </p>

        </div>
        <!-- footer ends-->
    </body>

</html>
