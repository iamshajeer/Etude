<%-- 
    Document   : mcainbox
    Created on : Apr 12, 2013, 10:18:01 PM
    Author     : Shajeer
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="org.hibernate.Query"%>
<%@page import="library.Mcainbox"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="styleformsgbox.css" type="text/css"/>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>inbox</title>
    </head>
    <body>
        <div>
            <center>
                <h1>
                    Inbox
                </h1>
            </center>
            <table border="1" id="inboxtab" width="500px" cellpadding="12" cellspacing="0">
                <tr>
                    <th style="width: 15px">
                        Sl No.
                    </th>
                    <th width="100px">
                        Subject
                    </th>
                    <th id="msgth">
                        Message
                    </th>
                    <th style="width: 20px">
                        Recieved Date
                    </th>


                </tr>
                <% String uid = (String) request.getSession().getAttribute("uid");
                    int i = 0;
                    int[] msgid = new int[50];
                    SessionFactory sf = new Configuration().configure().buildSessionFactory();
                    Session s = sf.openSession();
                    Transaction t = s.beginTransaction();
                    String hql = "from Mcainbox order by recdate desc";
                    List li = s.createQuery(hql).list();
                    Iterator iterator = li.iterator();
                    Mcainbox mi = null;
                    while (iterator.hasNext()) {
                        mi = (Mcainbox) iterator.next();
                        if (uid.equals(mi.getMcapatron().getUid())) {
                            if ((i % 2) == 0) {

                %>
                <tr id="col1">

                    <%                    } else {
                    %>
                <tr id="col2">

                    <%      }
                        i++;
                        for (int j = 0; j < 4; j++) {%>
                    <td id="maintabtd">
                            <div id="popup">
                            <table id="poptab" cellpadding="5px"   height= "200px" width="380px">
                                <tr class="poptr">
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr class="poptr">
                                    <td>&nbsp;</td>
                                    <td>Subject:</td>

                                    <td>
                                        <%= mi.getSubject()%>
                                    </td>
                                </tr>
                                <tr class="poptr">
                                    <td>&nbsp;</td>
                                    <td>
                                        Message:
                                    </td>
                                    <td>
                                        <%= mi.getMessage()%>
                                    </td>
                                </tr>
                                <tr class="poptr">
                                    <td>&nbsp;</td>
                                    <td>
                                        Recieved Date:
                                    </td>
                                    <td>
                                        <%= mi.getRecdate()%>
                                    </td>
                                </tr>
                            </table>
                        </div>
                                    
                        <%
                            msgid[i] = (mi.getEid());
                            if (mi.getFlag() == 0) {//detects unread or read message unread if flag is 0
%>
                        <span id="unread">

                            <%      } else {
                            %>
                            <span id="read">
                                <%                                }

                                            if (j == 0) {
                                                out.println(i);
                                            }
                                            if (j == 1) {
                                                out.println(mi.getSubject());
                                            }
                                            if (j == 2) {
                                                out.println(mi.getMessage());
                                            }
                                            if (j == 3) {
                                                out.println(mi.getRecdate());
                                            }

                                        }
                                    }%>

                            </span>
                        </span>
                    </td>
                    <%

                        }

                        s.save(mi);
                        t.commit();
                        s.close();


                        //marking messages as read by setting flag value=1
                        Session ses = sf.openSession();
                        Transaction tr = ses.beginTransaction();
                        List list = ses.createQuery(hql).list();
                        Iterator it = list.iterator();
                        String hql1 = "update Mcainbox set flag=:flval" + " where flag=0";
                        while (it.hasNext()) {
                            Mcainbox mis = (Mcainbox) it.next();
                            if (uid.equals(mis.getMcapatron().getUid())) {
                                Query q = ses.createQuery(hql1);
                                q.setInteger("flval", 1);
                                ses.save(mis);
                                q.executeUpdate();
                            }
                        }
                        tr.commit();
                        ses.close();

                    %>  

                </tr>

            </table>
            <%
                if (i == 0) {
                    out.print("<br/><br/><center><b>No Messages in your inbox ! !</b></center><br/><br>");
                }
            %>
        </div>
        <form action="../deletemcamsg" method="post">
            <%request.getSession().setAttribute("uid", uid);%>
            <input type="submit" class="submit" value="delete all" id="submitinbx"/>
            <input type="button" class="submit" value="back" onclick="window.location.href='../usermain.jsp'" id="submitinbx"/>
        </form>
    <center>

    </center>
</body>
<!--
<script>
    function position(){
        var x=window.event.screenX;
        var y=window.event.screenY;
        // alert(x+"    "+y);
        var division=document.getElementById("popup");
        if(x>1200){
            division.style.left=x+'px';
            division.style.top=y+'px';     
        }else{
            division.style.left=x+'px';
            division.style.top=y+'px';
        }
    }
<!/script>!
-->
</html>
