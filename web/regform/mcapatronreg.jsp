<%-- 
    Document   : mcapatronreg
    Created on : Apr 3, 2013, 10:23:06 PM
    Author     : Shajeer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" href="newstyleforfr.css" type="text/css"/>
        <link href="default.css" rel="stylesheet" type="text/css" />
    </head>
    <body onload="st_id.focus()">
        <form id="form1" action="../mcapatronreg" method="post" enctype="multipart/form-data">
            <!input type="image"  name="head" id="head" src="../images/head.jpg" />
            <table width="600" border="0" align="center" cellpadding="10" cellspacing="3" class="outertable">
                <tr>
                    <td id="tabhead"><div align="center">PATRON REGISTRATION</div></td>
                </tr>
                <tr>
                    <td><div align="right">
                            <table width="100%" border="0" cellpadding="15" cellspacing="5" class="innertable">
                                <tr>
                                    <td>User Id <span id="mandatory"><a href="#" title="Must entert staff id">*</a></span>:</td>
                                    <td><label for="st_id"></label>
                                        <input name="st_id" tabindex="1" type="text" class="textbox" id="st_id" /></td>
                                </tr>
                                <tr>
                                    <td>User Name <span id="mandatory"><a href="#" title="Must entert user name">*</a></span>:</td>
                                    <td><input name="st_name"  tabindex="2" type="text" class="textbox" id="st_name" /></td>
                                </tr>
                                <tr>
                                    <td>Adress <span id="mandatory"><a href="#" title="Must entert address">*</a></span>:</td>
                                    <td>  <textarea name="address"  tabindex="3" cols="28" rows="5" id="st_address"></textarea></td>
                                </tr>
                                <tr>
                                    <td>Roll Number :</td>
                                    <td><input name="rollnum"  tabindex="4" type="text" class="textbox" id="st_id4" /></td>
                                </tr>
                                <tr>
                                    <td>Place :</td>
                                    <td><input name="place" type="text"   tabindex="5" class="textbox" id="st_id4" /></td>
                                </tr>
                                <tr>
                                    <td>Pincode <span id="mandatory"><a href="#"  title="Must entert pincode">*</a></span>:</td>
                                    <td><input name="pincode" type="text"  tabindex="6" class="textbox" id="st_id5" /></td>
                                </tr>
                                <tr>
                                    <td>D.O.B :</td>
                                    <td><input name="dob" type="date"  tabindex="7" class="textbox" id="st_id6" /></td>
                                </tr>
                                <tr>
                                    <td>Phone Number <span id="mandatory"><a href="#" title="Must entert phone number">*</a></span>:</td>
                                    <td><input name="phone" type="text"  tabindex="8" class="textbox" id="st_id7" /></td>
                                </tr>
                                <tr>
                                    <td>e-mail :</td>
                                    <td><input name="email"  tabindex="9" type="text" class="textbox" id="st_id8" /></td>
                                </tr>
                                <tr>
                                    <td>Date Of Joining <span id="mandatory"><a href="#" title="Must entert date of joining">*</a></span>:</td>
                                    <td><input name="doj" type="text"  tabindex="10" class="textbox" id="st_id9" /></td>
                                </tr>
                                <tr>
                                    <td>Choose Image :</td>
                                    <td><label for="photo"></label>
                                        <input type="file" name="photo"  tabindex="11" id="st_photo" /></td>
                                </tr>
                                <tr>
                                    <td>Batch:<span id="mandatory"><a href="#" title="Must entert type of user, user can be a staff, student">*</a></span> :</td>
                                    <td>
                                        <input type="text" name="batch"  tabindex="12" class="textbox" id="staff_type"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>type of user<span id="mandatory"><a href="#" title="Must entert type of user, user can be a staff, student">*</a></span> :</td>
                                    <td><label for="staff_type"></label>
                                        <select name="staff_type"  tabindex="12" class="textbox" id="staff_type">
                                        </select></td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td><div align="left">
                                            <input name="submit" type="submit"  tabindex="13" class="submit" id="submit"  />
                                        </div></td>
                                </tr>
                            </table>
                        </div></td>
                </tr>
            </table>
        </form>
    </body>
</html>
