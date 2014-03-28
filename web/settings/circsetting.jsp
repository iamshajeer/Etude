<%-- 
    Document   : circsetting
    Created on : Apr 16, 2013, 11:51:26 AM
    Author     : Shajeer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="settingstyle.css" type="text/css"/>
    </head>
    <body>
        <br/>
        <br/>
        <form action="../settingsformca" method="get">
            <center><h2>CIRCULATION SETTINGS</h2></center>
            <table  width="600" border="0" align="center" cellpadding="10" cellspacing="3" class="outertable">
                <tr>
                    <td title="Must enter an integer value">
                        Renewal Period(Days):
                    </td>
                    <td><input type="text" name="renperi" id="renewalperiod" class="text" title="Must enter an integer value"></td>

                </tr>
                <tr>
                    <td title="Must enter an integer value">
                        No of books to issue
                    </td>
                    <td>
                        <input type="text" name="nobooks" id="nobooks" class="text" title="Must enter an integer value">
                    </td>

                </tr>
                <tr>
                    <td title="Must enter an integer value">
                       Reservation Cancellation Period
                    </td>
                    <td>
                        <input type="text" name="resperiod" id="resperiod" class="text" title="Must enter an integer value">
                    </td>

                </tr>
                <tr>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        <input type="submit" value="update" class="submit" />
                    </td>
                </tr>

            </table>
        </form>
    </body>
</html>
