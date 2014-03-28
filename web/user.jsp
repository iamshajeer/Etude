<%-- 
    Document   : user
    Created on : Apr 12, 2013, 7:55:46 PM
    Author     : Shajeer
--%>
<%@page import="library.Mcainbox"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="library.Mcapatron"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <title>etude-Centralized library management system</title>
        <meta name="keywords" content="" />
        <meta name="description" content="" />
        <link href="style.css" rel="stylesheet" type="text/css" media="screen" />
        <style type="text/css">
            #apDiv1 {
                position:absolute;
                width:200px;
                height:115px;
                z-index:1;
            }
        </style>
    </head>
    <body onload="changeFrame('usermain');">
        <%
            Mcapatron m = null;
            String sid = (String) request.getSession().getAttribute("sesid");
            if ((session.getId()) == null) {
                response.sendRedirect("index.jsp");
            }
            String uid = (String) request.getSession().getAttribute("uid");
            SessionFactory sf = new Configuration().configure().buildSessionFactory();
            Session ses = sf.openSession();
            String name = null;
            String hql = "from Mcapatron where uid=:uid";
            List list = ses.createQuery(hql).setString("uid", uid).list();

            Iterator it = list.iterator();
            while (it.hasNext()) {
                m = (Mcapatron) it.next();
                name = m.getUname();
                break;
            }

        %>
        <div id="content">
            <!-- header begins -->
            <div id="menu">
                <ul>
                    <li id="button1"><a href="user.jsp" title="">Home</a></li>
                    <li id="button5"><a href="http://www.kvmce.in/" title="">about Kvm ce&it </a></li>
                    <li id="signout"><a href="logout.jsp" title="">Sign out</a></li>
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



                    <iframe align="middle" scrolling="yes" id="myframe" src="images/l4.png" frameborder="0" id="useriframe"><h>
                            Your browser not supports frame please upgrade</h> 
                    </iframe>


                    <!--code for iframe end-->
                </div>
            </div>
            <div id="left">
                <div id="lefttop">

                    <h3 title="<%= m.getUname()%>"><%= m.getUname()%> </h3>
                    <div id="categories">
                        <ul>
                            <form id="form1" method="post" action="">
                                <p>
                                    <input type="image" disabled="disabled" name="photo" title="<%= m.getUname()%>" id="photo" src="imagedisplay/image.jsp" />
                                </p>
                            </form>
                        </ul>
                    </div>
                    <h3 title="Welcome">WELCOME</h3>
                    <div id="partners">
                        <ul><%
                      
                    Session s = sf.openSession();
                    Transaction t = s.beginTransaction();
                    String hqls = "from Mcainbox where uid=:uid";
                    List li = s.createQuery(hqls).setString("uid",uid).list();
                    Iterator iterator = li.iterator();
                    Mcainbox mi = null;
                    int count=0 ;
                    while (iterator.hasNext()) {
                        mi = (Mcainbox) iterator.next();
                         if(mi.getFlag()==0){
                             count++;
                         }
                                 
                         }
                        %>
                            <li id="message/mcainbox" onclick="changeFrame(this.id);"><a href="#">Inbox&nbsp;<%if(count>0){%><span style="color:red;"><%}%>(<%=count%>)</span></a></li>
                            <li><a href="#">Book Renew Date</a></li>
                            <li id="mcafinegen" onclick="change(this.id)"><a href="#">Fine Details</a></li> 
                            <li  id="reservation/mcareservuser" onclick="changeFrame(this.id)"><a href="#">Book Reservation</a></li> 			
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
            <p>Design by Rashi nellimunda & Shajeer ahmed</a>
            </p>

        </div>
        <!-- footer ends-->
    </body>
    <script type="text/javascript" language="javascript">
        function changeFrame(a){
            if(a=="reservation/mcareservuser"){
                document.getElementById("myframe").style="height:350px";
            }
            document.getElementById('myframe').src = a+".jsp";
        }
        function change(b){
            document.getElementById('myframe').src=b;
        }
       
    </script>
</html>
