<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.MyBean.TicketDisplay"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Ticket Info</title>
<style type="text/css">
<!--
#source {
	width: 120px;
	border-top: 5px solid #FFF;
	margin-top: 15px;
	}
#destination {
width: 120px;	
}
#getdir {
	margin-bottom: 15px;
	border-bottom: 5px solid #FFF;
}

body {
	font: 100%/1.4 Verdana, Arial, Helvetica, sans-serif;
	background-color: #ffffff;
	margin: 0;
	padding: 0;
	color: #000;
	/*background-image: url(../tp/images/tail-middle.jpg);*	background-repeat: no-repeat;
*/}

/* ~~ Element/tag selectors ~~ */
ul, ol, dl { /* Due to variations between browsers, it's best practices to zero padding and margin on lists. For consistency, you can either specify the amounts you want here, or on the list items (LI, DT, DD) they contain. Remember that what you do here will cascade to the .nav list unless you write a more specific selector. */
	padding: 0;
	margin: 0;
}
h1, h2, h3, h4, h5, h6, p {
	margin-top: 0;	 /* removing the top margin gets around an issue where margins can escape from their containing div. The remaining bottom margin will hold it away from any elements that follow. */
	padding-right: 15px;
	padding-left: 15px; /* adding the padding to the sides of the elements within the divs, instead of the divs themselves, gets rid of any box model math. A nested div with side padding can also be used as an alternate method. */
}
a img { /* this selector removes the default blue border displayed in some browsers around an image when it is surrounded by a link */
	border: none;
}

/* ~~ Styling for your site's links must remain in this order - including the group of selectors that create the hover effect. ~~ */
a:link {
	color: #000;
	text-decoration: none; /* unless you style your links to look extremely unique, it's best to provide underlines for quick visual identification */
}
a:visited {
	color: #ffffff;
	text-decoration: none;
}
a:hover, a:active, a:focus { /* this group of selectors will give a keyboard navigator the same hover experience as the person using a mouse. */
	text-decoration: none;
	background-color: #fff;
	color: #0180a0; 
	font-weight: bold;
	font-style:italic;
}

/* ~~this fixed width container surrounds the other divs~~ */
.container {
	width: 85%;
	background-color: #FFF;
	margin: 0 auto; /* the auto value on the sides, coupled with the width, centers the layout */
}
/* ~~ the header is not given a width. It will extend the full width of your layout. It contains an image placeholder that should be replaced with your own linked logo ~~ */
.header {
	background-color: white;
}

/* ~~ These are the columns for the layout. ~~ 

1) Padding is only placed on the top and/or bottom of the divs. The elements within these divs have padding on their sides. This saves you from any "box model math". Keep in mind, if you add any side padding or border to the div itself, it will be added to the width you define to create the *total* width. You may also choose to remove the padding on the element in the div and place a second div within it with no width and the padding necessary for your design. You may also choose to remove the padding on the element in the div and place a second div within it with no width and the padding necessary for your design.

2) No margin has been given to the columns since they are all floated. If you must add margin, avoid placing it on the side you're floating toward (for example: a right margin on a div set to float right). Many times, padding can be used instead. For divs where this rule must be broken, you should add a "display:inline" declaration to the div's rule to tame a bug where some versions of Internet Explorer double the margin.

3) Since classes can be used multiple times in a document (and an element can also have multiple classes applied), the columns have been assigned class names instead of IDs. For example, two sidebar divs could be stacked if necessary. These can very easily be changed to IDs if that's your preference, as long as you'll only be using them once per document.

4) If you prefer your nav on the right instead of the left, simply float these columns the opposite direction (all right instead of all left) and they'll render in reverse order. There's no need to move the divs around in the HTML source.

*/
.sidebar1 {
	float: left;
	width: 180px;
	background-color: #0180a0;
	padding-bottom: 10px;
}
.content {

	padding: 10px 0;
	width: 780px;
	float: left;
}

/* ~~ This grouped selector gives the lists in the .content area space ~~ */
.content ul, .content ol { 
	padding: 0 15px 15px 40px; /* this padding mirrors the right padding in the headings and paragraph rule above. Padding was placed on the bottom for space between other elements on the lists and on the left to create the indention. These may be adjusted as you wish. */
}

/* ~~ The navigation list styles (can be removed if you choose to use a premade flyout menu like Spry) ~~ */
ul.nav {
	list-style: none; /* this removes the list marker */
	border-top: 1px solid #fff; /* this creates the top border for the links - all others are placed using a bottom border on the LI */
	margin-bottom: 15px; /* this creates the space between the navigation on the content below */
}
ul.nav li {
	border-bottom: 5px solid #FFF;
	height:30px;
	padding-top:7px;
	padding-left:-3px; /* this creates the button separation */
	}
ul.nav a, ul.nav a:visited { /* grouping these selectors makes sure that your links retain their button look even after being visited */
	padding: 5px 5px 5px 15px;
	display: block; /* this gives the link block properties causing it to fill the whole LI containing it. This causes the entire area to react to a mouse click. */
	width: 160px;  /*this width makes the entire button clickable for IE6. If you don't need to support IE6, it can be removed. Calculate the proper width by subtracting the padding on this link from the width of your sidebar container. */
	text-decoration: none;
}
round-color: #C6D580;
}
ul.nav a:hover, ul.nav a:active, ul.nav a:focus { /* this changes the background and text color for both mouse and keyboard navigators */
	background-color: white;
	color: #09c;
}
/* ~~ The footer ~~ */
.footer {
	padding: 20px ;
	background-color: #CCC49F;
	position: relative;/* this gives IE6 hasLayout to properly clear */
	width:50%;
	clear: both; /* this clear property forces the .container to understand where the columns end and contain them */
}
#boo
{
	background:#fff;
	color:#09c;
}
/* ~~ miscellaneous float/clear classes ~~ */
.fltrt {  /* this class can be used to float an element right in your page. The floated element must precede the element it should be next to on the page. */
	float: right;
	margin-left: 8px;
}
.fltlft { /* this class can be used to float an element left in your page. The floated element must precede the element it should be next to on the page. */
	float: left;
	margin-right: 8px;
}
.clearfloat { /* this class can be placed on a <br /> or empty div as the final element following the last floated div (within the #container) if the #footer is removed or taken out of the #container */
	clear:both;
	height:0;
	font-size: 1px;
	line-height: 0px;
}

-->
</style>
        <link rel="stylesheet" type="text/css" href="css/demo.css" />
        <link rel="stylesheet" type="text/css" href="css/style.css" />
        <link href='http://fonts.googleapis.com/css?family=Alfa+Slab+One' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Boogaloo' rel='stylesheet' type='text/css'>
        <style type="text/css">
        body,td,th {
	font-size: 100%;
	color: #333333;
	font-family: Verdana, Geneva, sans-serif;
}
        </style>
<script type="text/javascript">

	function load()
	{
		var sessid="<%=session.getAttribute("sessid")%>";
		document.getElementById("session").value=sessid;
		
		if(sessid=="null")
		{
			window.location.replace("http://localhost:8087/Sana/Home1.jsp");
		}
		
		var e=document.getElementById("refreshed");
		if(e.value=="no")
		{
			//alert("yes");
			e.value="yes";
		}
		else
		{
			//alert("no");
			e.value="no";
			location.reload();
		}
	}
	
	function setFid(x)
	{
		var val=x.value;
		document.getElementById("bookform").value=val;
	}
	
	function checkRad()
	{	
		var chx = document.getElementsByTagName('input');
		for (var i=0; i<chx.length; i++)
		{
			if (chx[i].type == 'radio' && chx[i].checked)
		    {
				return true;
		    } 
		}
		alert("Select a flight!");
		return false;
	}
</script>
<style>
#customers
{
font-family:"Trebuchet MS", Arial, Helvetica, sans-serif;
width:90%;
border-collapse:collapse;
}
#customers td, #customers th 
{
font-size:1em;
border:1px solid #0060CD;
padding:3px 7px 2px 7px;
}
#customers th 
{
font-size:1.1em;
text-align:left;
padding-top:5px;
padding-bottom:4px;
background-color:#0060CD;
color:#ffffff;
}
#customers tr.alt td 
{
color:#000000;
background-color:#EAF2D3;
}
</style>
</head>
<link rel="stylesheet" type="text/css" href="css/default.css" />
		<link rel="stylesheet" type="text/css" href="css/component.css" />
		<script src="js/modernizr.custom.js"></script>
<body onload="load()">
<%
if(session==null || session.isNew())
{
	response.sendRedirect("Home1.jsp");
}
%>

<div class="container">
<div class="header"><a href="#"><img src="images/final3.jpg" width="100%" height="180" alt="logo" /></a> 
    <!-- end .header --></div>
    <div class="sidebar1">
    <ul class="nav">
      <li><font color="#ffffff"><center><i>Book Ticket</i></center></font></li>
      <li id="boo"><center><i><b>View Ticket</b></i></center></li>
      <li><font color="#ffffff"><center><i>Cancel Ticket</i></center></font></li>

    </ul>
    <div class="social">
    <center>
      
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p><a href="http://www.facebook.com"><img src="images/facebook_icon.png" alt="facebook" name="fb" width="87" height="90" id="fb" align="absmiddle" /><br />
      </a></p>
    </center>
    <center><h5>&nbsp;</h5>
      <h5><font color="#FFFFFF"><i><strong>Stay connected</strong></i></font></h5>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
    </center>
    <center>
      <p>&nbsp;</p>
      <p><a href="http://www.twitter.com"><img src="images/twitter_icon_by_x_1337_x-d5ikws4_zpsddbdb943.png" alt="twitter" name="tw" width="80" height="81" id="tw" /><br />
      </a></p>
    </center>
    <center><h5>&nbsp;</h5>
      <h5><font color="#FFFFFF"><i><strong>Follow us at</strong></i></font></h5>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
    </center>
    </div>
    <!-- end .sidebar1 --></div>
<div class="content">
<h1 align="center"><b><font color="#09c" size="10px">Available Flights</font></b></h1>
<br>

<form>
<table border="1" id="customers" align="center">

	<tr>
		<th>Select</th>
		<th>Fid</th>
		<th>Dep</th>
		<th>Arr</th>
		<th>DepTime</th>
		<th>ArrTime</th>
		<th>Price</th>
		<th>AvailSeats</th>
	</tr>

	<c:forEach var="Flights" items="${Fli}">
	<tr>
		<td><input type="radio" value="${Flights.fid}" name="fidd" onchange="setFid(this)"></td>
		<td>${Flights.fid}</td>  
		<td>${Flights.dep}</td>
		<td>${Flights.arr}</td>
		<td>${Flights.depTime}</td>
		<td>${Flights.arrTime}</td>
		<td>${Flights.price}</td>
		<td>${Flights.availSeats}</td>
	</tr>
 
	</c:forEach>
</table>
</form>
<br>
<form name="booking" action="CheckIdServlet" onsubmit="return checkRad()">
	<p>&nbsp;</p>
	<p>&nbsp;</p>
	<p><font color="#09c" size="5px"><b>Selected flight id:</b></font>
	  <input type="text" id="bookform" name="bookform" readonly />
	  </p>
	<p>
	  <button type="submit" class="btn btn-4 btn-4a icon-arrow-right">Proceed</button>
</p>
  <p>&nbsp;</p>
  <p>&nbsp; </p>
			
	<input type="hidden" id="refreshed" value="no" readonly />
	<input type="hidden" id="session" name="session" readonly />
	<script src="js/classie.js"></script>
		<script>
			var buttons7Click = Array.prototype.slice.call( document.querySelectorAll( '#btn-click button' ) ),
				buttons9Click = Array.prototype.slice.call( document.querySelectorAll( 'button.btn-8g' ) ),
				totalButtons7Click = buttons7Click.length,
				totalButtons9Click = buttons9Click.length;

			buttons7Click.forEach( function( el, i ) { el.addEventListener( 'click', activate, false ); } );
			buttons9Click.forEach( function( el, i ) { el.addEventListener( 'click', activate, false ); } );

			function activate() {
				var self = this, activatedClass = 'btn-activated';

				if( classie.has( this, 'btn-7h' ) ) {
					// if it is the first of the two btn-7h then activatedClass = 'btn-error';
					// if it is the second then activatedClass = 'btn-success'
					activatedClass = buttons7Click.indexOf( this ) === totalButtons7Click-2 ? 'btn-error' : 'btn-success';
				}
				else if( classie.has( this, 'btn-8g' ) ) {
					// if it is the first of the two btn-8g then activatedClass = 'btn-success3d';
					// if it is the second then activatedClass = 'btn-error3d'
					activatedClass = buttons9Click.indexOf( this ) === totalButtons9Click-2 ? 'btn-success3d' : 'btn-error3d';
				}

				if( !classie.has( this, activatedClass ) ) {
					classie.add( this, activatedClass );
					setTimeout( function() { classie.remove( self, activatedClass ) }, 1000 );
				}
			}

			document.querySelector( '.btn-7i' ).addEventListener( 'click', function() {
				classie.add( document.querySelector( '#trash-effect' ), 'trash-effect-active' );
			}, false );
		</script>
</form>
</div>
<div class="sidebar2">
    <section class="wrapper">
				<div id="ad-2">
					<h2>Lost<br />at<br />sea?</h2>
					<ul id="boat">
						<li>
							<div id="question-mark"></div>
						</li>
					</ul>
					<ul id="water">
						<li id="water-back"></li>
						<li id="water-front"></li>
					</ul>
					<div id="content">
						<h3>Relax.<br />We've got better ways.</h3>
						<a href="http://localhost:8087/Sana/Book1.jsp">Book!</a>
					</div>
				</div>
            </section></div>
  <!--<div class="footer">-->
  <br><br />
  <br />
  <br />
  <table width="100%" bgcolor="#999999">
    <tr>
    <th width="278"><center>
      <a href="terms.html">Terms and Conditions</a>
    </center>
    <th width="278"><center>
      <a href="passenger.html">Passenger Rights</a>
    </center>
    <th width="208"><center>
      <a href="imprint.html">Imprint</a>
    </center>
    </tr>
    <tr>
    <td colspan="3"> <center><h5>Thank-you for using our service</h5></center>
    </tr>
    </table>
    <!-- end .footer --><!--</div>-->
  <!-- end .container --></div>
</body>
</html>