<%-- 
    Document   : mcabookreg
    Created on : Apr 3, 2013, 10:25:28 PM
    Author     : Shajeer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="newstyleforfr.css" type="text/css"/>
<link rel="stylesheet" href="default.css" type="text/css" />
</head>

<body onload="b_id.focus()">
<form id="bk_reg_form" action="../btechbookreg" method="post">

  <div id="front">
    <table width="600" border="0" align="center" cellpadding="10" cellspacing="3" class="outertable">
      <tr>
        <td id="tabhead"><center>
           BOOK REGISTRATION 
        </center></td>
      </tr>
      
      <tr>
        <td><table width="100%" border="0" cellpadding="15" cellspacing="5" class="innertable">
                  
          <tr>
            <td> Book Id : </td>
            <td> 
              <input name="b_id" type="text" class="textbox" id="b_id" />
             </td>
            </tr>
          <tr>
            <td> Isbn : </td>
            <td> 
              <input name="isbn" type="text" class="textbox" id="isbn" />
             </td>
            </tr>
          <tr>
            <td> Full Call Number<a href="#" class="nil" title="Dewy Decimal Code number."> [?]</a> : </td>
            <td> 
              <input name="ddc" type="text" class="textbox" id="ddc" />
             </td>
            </tr>
          <tr>
            <td> Title : </td>
            <td> 
              <input name="title" type="text" class="textbox" id="title" />
             </td>
            </tr>
          <tr>
            <td> Author : </td>
            <td> 
              <input name="author" type="text" class="textbox" id="author" />
             </td>
            </tr>
          <tr>
            <td> Edition : </td>
            <td> 
              <input name="edition" type="text" class="textbox" id="author" />
             </td>
            </tr>
          <tr>
            <td> Place Of Publication : </td>
            <td> 
              <input name="pob" type="text" class="textbox" id="pob" />
             </td>
            </tr>
          <tr>
            <td> Name Of Publication : </td>
            <td> 
              <input name="nop" type="text" class="textbox" id="nop" />
             </td>
            </tr>
          <tr>
            <td> Year Of Publication : </td>
            <td> 
              <input name="yop" type="text" class="textbox" id="yop" />
             </td>
            </tr>
          <tr>
            <td> Page Number : </td>
            <td> 
              <input name="page" type="text" class="textbox" id="pages" />
             </td>
            </tr>
          <tr>
            <td> Series : </td>
            <td> 
              <input name="series" type="text" class="textbox" id="series" />
             </td>
            </tr>
          <tr>
            <td> Type : </td>
            <td> 
              <input name="type" type="text" class="textbox" id="b_id2" />
             </td>
            </tr>
          <tr>
            <td> Date Of Book Acquired : </td>
            <td> 
              <input name="doa" type="text" class="textbox" id="doa" />
             </td>
            </tr>
          <tr>
            <td> Source : </td>
            <td> 
              <input name="soa" type="text" class="textbox" id="soa" />
             </td>
            </tr>
          <tr>
            <td> Cost : </td>
            <td> 
              <input name="cost" type="text" class="textbox" id="b_id3" />
             </td>
            </tr>
          <tr>
            <td> Status : </td>
            <td> 
              <input name="status" type="text" class="textbox" id="status" />
             </td>
            </tr>
          <tr>
            <td>&nbsp;</td>
            <td> 
              <input name="submit" type="submit" class="submit" id="submit" value="Submit" />
             </td>
            </tr>
        </table></td>
      </tr>
    </table>
  </div>
</form>
</body>
</html>
