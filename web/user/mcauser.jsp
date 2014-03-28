<%-- 
    Document   : user
    Created on : Apr 12, 2013, 7:55:46 PM
    Author     : Shajeer
--%>

<%@page import="java.io.OutputStream"%>
<%@page import="library.Mcapatron"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <title>etude-Centralized library management system</title>
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
    <body>
        <div id="content">
            <!-- header begins -->
            <div id="menu">
                <ul>
                    <li id="button1"><a href="../mca.jsp" title="">Home</a></li>
                    <li id="button5"><a href="http://www.kvmce.in/" title="">about Kvm ce&it </a></li>
                    <li id="signout"><a href="../index.jsp" title="">Sign out</a></li>
                </ul>
            </div>
            <div id="header">
            </div> 
            <div id="kvm_logo"></div>

            
        </div>

        <!-- header ends -->
        <!-- content begins -->
        <div id="main"> 
            <div id="userright">
                <div id="righttop">
                    <!--code for iframe begin-->
                    <iframe align="middle" scrolling="yes" id="myframe" src="../usermain.jsp" frameborder="0" class="useriframe">
                        <h> Please upgrade your browser for better view... !</h> 
                    </iframe>
                    <!--code for iframe end-->
                </div>
            </div>
           
            <div id="left">
                <div id="lefttop">
                    <h3> </h3>
                    <div id="categories">
                        <ul>
                            <form id="form1" method="post" action="">
                                <p>
                                    <!input type="image" name="photo" id="photo" src="../images/head.jpg" />
                                </p>
                            </form>
                            </li>					
                        </ul>
                    </div>
                    <h3>WELCOME</h3>
                    <div id="partners">
                        <ul>
                            <li id="../message/mcainbox" onclick="changeFrame(this.id);"><a href="#">Inbox</a></li>
                            <li><a href="#">Book Renew Date</a></li>
                            <li><a href="#">Fine Details</a></li> 
                            <li><a href="#">Book Reservation</a></li> 			
                        </ul>
                    </div>						
                </div>	
            </div><div style="clear:both;"></div><div id="mainbot"></div>
        </div>

        </div>
        <!--content ends -->
        <!--footer begins -->


        <div id="footer">
            <p>Copyright  2013</p>
            <p>Design by Rashi nellimunda & Shajeer kp ahamed</a>
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
