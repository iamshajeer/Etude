<%-- 
    Document   : admin
    Created on : Apr 13, 2013, 6:02:31 PM
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
<body onload="t1.focus();">
<div id="content">
<!-- header begins -->
<div id="menu">
		<ul>
			<li id="button1"><a href=".html" title="">Home</a></li>
            <li id="button4"><a href="#" title="">Settings</a></li>
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
			
			<h3>etude Master</h3>
			<div id="categories">
				<ul>
                                    <li id="updatereg/changeadmin" onclick="changeFrame(this.id);"><a href="#">Change Master Details</a></li>	
				</ul>
		  </div>
          <h3>Departments</h3>
			<div id="partners">
				<ul>
				    <li><a href="mca.html">MCA-login</a></li>
					<li><a href="mba.html">MBA-login</a></li>
                    <li><a href="biotechnology.html">BIOTECHNOLOGY-login</a></li>
                    <li><a href="b.tech.html">B.Tech-login</a></li> 		
				</ul>
			</div>
			<h3>Librarian Details</h3>
			<div id="partners">
				<ul>
		<li id="regform/libreg" onclick="changeFrame(this.id)"><a href="#">MCA</a></li>
		<li><a href="#">MBA</a></li>
                    <li><a href="#">MSC BIOTECHNOLOGY</a></li>
                    <li><a href="#">B.TECH</a></li> 		
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
        document.getElementById('myframe').style.height="1100px" ;
	  document.getElementById('myframe').src = a+".jsp";
	  
      }
  
</script>
</html>
