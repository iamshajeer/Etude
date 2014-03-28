<%-- 
    Document   : adminlogin
    Created on : Apr 13, 2013, 6:13:02 PM
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
        <link rel="stylesheet" href="newstyleforfr.css" type="text/css" /> 
        <link href="default.css" rel="stylesheet" type="text/css" media="screen" />
       
    </head>
    <body onload="t1.focus();">
                    <form action="../changeadmininfo" method="post">
                        <center>
                        <table border="0" cellpadding="20" cellspacing="13" id="logintable">
                            <tr><td></td><th align="left">

                                   CHANGE CREDENTIALS
                                </th>
                            </tr>
                            <tr>
                                <td>
                                    Current User ID:
                                </td>
                                <td>
                                    <input type="text" id="t1" name="uid" class="textbox"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Current Password:</td>
                                <td>
                                    <input type="password" id="password" name="password"  class="textbox"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    New User ID:
                                </td>
                                <td>
                                    <input type="text" id="t1" name="newuid" class="textbox"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    New Password:</td>
                                <td>
                                    <input type="password" id="password" name="newpassword"  class="textbox"/>
                                </td>
                            </tr>
                                                        <tr>
                                <td>
                                    Confirm Password:</td>
                                <td>
                                    <input type="password" id="password" name="newconfpassword"  class="textbox"/>
                                </td>
                            </tr>

                            <tr>
                                <td>&nbsp;</td>
                                <td> 

                                    <input name="submit" type="submit" onclick="change()" class="submit" id="submit" value="Submit" />

                                </td>
                            </tr>
                        </table>
                    </center>
                    </form>
        <!-- footer ends-->
    </body>
    
</html>
