<%-- 
    Document   : biotechnology
    Created on : Apr 4, 2013, 7:22:49 PM
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
<body onload="textsearch.focus();">
<div id="content">
<!-- header begins -->
<div id="menu">
		<ul>
			<li id="button1"><a href="biotechnology.html" title="">Home</a></li>
			<li id="button2"><a href="#" title="">Stock</a></li>
			<li id="button3"><a href="#" title="">e-book</a></li>
			<li id="button4"><a href="#" title="">Settings</a></li>
			<li id="button5"><a href="http://www.kvmce.in/" title="">About kvm ce&it</a></li>
            <li id="signout"><a href="index.jsp" title="">Sign Out</a></li>
		</ul>
	</div>
<div id="header">
  </div> 
	<div id="biotechnology_logo"></div>
	
</div>

<!-- header ends -->
<!-- content begins -->
<div id="main"> 
  <div id="right">
<div id="righttop">

<!--code for iframe begin-->



<iframe align="middle" scrolling="no" id="myframe" frameborder="0" ><h>
Your not supports iframe please upgrade</h> 
            </iframe>



<!--code for iframe end-->
	</div>
  </div>
	<div id="left">
		<div id="lefttop">
			
			<h3>Circulation</h3>
			<form  action="userforadminbiotech.jsp">
                    <div>
                        <input type="text" class="" id="textsearch"/>
                    </div>
                    </form>
           <br />
         <br />
         <br />
          <h3>Registration</h3>
			<div id="partners">
            <ul>
			<li id="regform/btpatronreg" onclick="changeFrame(this.id)"><a href="#">Patrons Registration</a></li>
				<li id="regform/btbookreg" onclick="changeFrame(this.id)"><a href="#">Books Registraion</a></li>
              <li><a href="#">Journals Registration</a></li>		
				</ul>
			</div>
             <br />
         <br />
         <br />
			<h3>Updation</h3>
			<div id="partners">
				<ul>
				<li><a href="#">Patrons Details</a></li>
					<li><a href="#">Books Details</a></li>
                    <li><a href="#">Journals Details</a></li>
                    <li><a href="#">Non Liability Certificate Isuue </a></li>			
				</ul>
			</div>
         <br />
         <br />
         <br />
            	<h3>Fine</h3>
			<div id="partners">
				<ul>
				<li><a href="#">Fine Details</a></li>
					<li><a href="#">Fine Generation</a></li>
                    <li><a href="#">User Alert</a></li>		
				</ul>
			</div>
             <br />
         <br />
         <br />
			<h3>Reports</h3>
			<div id="partners">
				<ul>
					<li><a href="#">Stock Details</a></li>
					<li><a href="#">Transaction Details</a></li>
					<li><a href="#">Patrons Details</a></li>
                    <li><a href="#">Books Details</a></li>
                    <li><a href="#">Fine Details</a></li>
					
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
	  document.getElementById('myframe').src = a+".jsp";
	  
      }
</script>
</html>

