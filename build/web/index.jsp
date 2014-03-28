<%-- 
    Document   : newindex
    Created on : Apr 2, 2013, 7:49:00 PM
    Author     : Shajeer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <title>etude-Centralized library management system</title>
        <meta name="keywords" content="" />
        <meta name="description" content="" />
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
    <body id="default_pages/kvm" onload="changeFrame("default_pages/kvm")" >
          <div id="content">
            <!-- header begins -->
            <div id="menu">
                <ul>
                    <li id="default_pages/kvm" onclick="changeFrame(this.id)"><a href="#" title="">Home</a></li>
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

                    <iframe align="middle" scrolling="no" id="myframe" src="default_pages/kvm.jsp" frameborder="0" ><h>
                            Your not supports iframe please upgrade</h> 
                    </iframe>
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
                    <h3>User Details</h3>
                    <div id="categories">
                        <ul id="quotes">
                            User can directly interact with their own account. They can view information about currently holding books details and fine details.Also the inbox facility allows to read messages from the librarian.
                        </ul>
                        <ul>
                            <li><a href="loginform/userlogin.jsp">User Login</a></li>
                        </ul>
                    </div>

                    <h3>
                        Librarian
                    </h3>
                    <div id="categories">
                        <ul id="quotes">
                            Librarian can manage all transaction in the library. They can manage users and books information of their own respective library.
                        </ul>
                        <ul>
                            <a href="loginform/btlog.jsp">click</a>
                            <li>
                                <a href="loginform/mcalogin.jsp">MCA- login</a>
                            </li>
                            <li>
                                <a href="loginform/mbalogin.jsp">MBA- login</a>
                            </li>
                            <li>
                                <a href="loginform/biologin.jsp">BIOTECHNOLOGY- login</a>
                            </li>
                            <li>
                                <a href="loginform/btechlogin.jsp">B.Tech- login</a>
                            </li>
                        </ul>
                    </div>
                </div>	
            </div>
            <div style="clear:both;"></div><div id="mainbot">
            </div>
        </div>

        </div>
        <!--content ends -->
        <!--footer begins -->


        <div id="footer">
            <p>Copyright &copy;  2013</p>
            <p>Designed by Rashi nellimunda & Shajeer ahmed</a>
            </p>

        </div>
        <!-- footer ends-->
    </body>
    <script type="text/javascript" language="javascript">
        function changeFrame(a){
            document.getElementById('myframe').src = a+".jsp";
        }
    </script>
</html>
