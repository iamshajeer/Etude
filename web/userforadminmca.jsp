
<%@page import="library.Mcareserv"%>
<%@page import="org.hibernate.Transaction"%>
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
        <meta name="keywords" content="" />
        <meta name="description" content="" />
        <link href="styles.css" rel="stylesheet" type="text/css" />
        <style type="text/css">
            #apDiv1 {
                position:absolute;
                width:200px;
                height:115px;
                z-index:1;
            }
        </style>
         <script src="./script/validator.js" type="text/javascript"></script>
    </head>
    <body  onload="changeFrame('circulation/mcausercircluation');">
        <div id="content">
            <!-- header begins -->
            <div id="menu">
                <ul>
                    <li id="button1"><a href="mca.jsp" title="">Home</a></li>
                    <li id="button5"><a href="http://www.kvmce.in/" title="">about Kvm ce&it </a></li>
                    <li id="signout"><a href="index.jsp" title="">Sign out</a></li>
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
                    <iframe align="middle" id="myframe" src="images/l4.png" frameborder="0" ><h>
                            Your not supports iframe please upgrade</h>
                    </iframe>
                    <!--code for iframe end-->
                </div>
            </div>
            <div id="left">
                <div id="lefttop">
                    <%
                        String uid = (String) request.getSession().getAttribute("sid");
                        SessionFactory sf = new Configuration().configure().buildSessionFactory();
                        Session ses = sf.openSession();
                        String name = null;
                        String hql = "from Mcapatron where uid=:uid";
                        List list = ses.createQuery(hql).setString("uid", uid).list();
                        Mcapatron m = null;
                        Iterator it = list.iterator();
                        while (it.hasNext()) {
                            m = (Mcapatron) it.next();
                            name = m.getUname();
                            break;
                        }
                        request.getSession().setAttribute("uid", uid);%>

                    <h3><%=name%></h3>
                    <div id="categories">
                        <ul>
                            <form id="form1" method="post" action="">
                                <p>
                                    <input type="image" name="photo" id="photo" src="imagedisplay/image.jsp" alt="no image uploaded" disabled="disabled"/>                                         
                                </p>
                            </form>					
                        </ul>
                    </div>
                    <h3>WELCOME</h3>
                    <div id="partners">
                        <ul>
                            <%
                                int i = 0;
                                int[] msgid = new int[50];
                                
                                Session s = sf.openSession();
                                Transaction tr = s.beginTransaction();
                                String hqls = "from Mcareserv where uid=:uid";
                                List li = s.createQuery(hqls).setString("uid", uid).list();
                                Iterator iterator = li.iterator();
                                int c=0;
                                Mcareserv mi = null;
                                while (iterator.hasNext()) {
                                    mi = (Mcareserv) iterator.next();
                                    c++;
                                }
                            %>
                            <li id="reservation/mcauserreservadmin" onclick="changeFrame(this.id)"><a href="#">Reserved books&nbsp;<%if(c>0){%><span id="count"><%}%>(<%=c%>)</span></a></li>
                            <li id="message/mcamsg" onclick="changeFrame(this.id)"><a href="#">Send Message</a></li>
                            <li id="circulation/mcausercircluation"  onclick="changeFrame(this.id)"><a href="#">Book Renew Date</a></li>
                            <li  id="mcafinegen" onclick="change(this.id)"><a href="#">Fine Details</a></li> 

                        </ul>
                    </div>						
                </div>	
            </div><div style="clear:both;"></div><div id="mainbot"></div>
        </div>

        </div>
        <!--content ends -->
        <!--footer begins -->


        <div id="footer">
            <p>Copyright &copy; 2013</p>
            <p>Designed by Rashi nellimunda & Shajeer ahmed</a>
            </p>

        </div>
        <!-- footer ends-->
    </body>
    <script type="text/javascript" language="javascript">
        function changeFrame(a){
            document.getElementById('myframe').src = a+".jsp";
	  
        }
        function change(b){
            document.getElementById('myframe').src=b;
        }
      
    </script>
</html>
