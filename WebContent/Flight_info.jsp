<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.MyBean.FlightDisplay"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Cache-Control" content="no-store" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Flight Information</title>
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
tr:nth-child(odd)		{ background-color:#6DABF2; }
</style>
<link rel="stylesheet" type="text/css" href="css/default.css" />
<link rel="stylesheet" type="text/css" href="css/component.css" />
<script src="js/modernizr.custom.js"></script>
<script type="text/javascript">

	function load()
	{
		var sessid="<%=session.getAttribute("sessid")%>";
		document.getElementById("session").value=sessid;
		
		if(sessid=="null")
		{
			window.location.replace("http://localhost:8087/Sana/Home.jsp");
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

</head>
<body onload="load()">

<%
if(session==null || session.isNew())
{
	response.sendRedirect("Home.jsp");
}
%>

<h2 align="center">Available Flights</h2>
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
	<font color="#09c" size="5px"><b>Selected flight id:</b></font><input type="text" id="bookform" name="bookform" readonly />
	<div class="container">
  <!-- Top Navigation 
			<div class="codrops-top clearfix"></div> -->
<!-- <section class="color-4">-->
  <p>
					<button type="submit" class="btn btn-4 btn-4a icon-arrow-right">Proceed</button>
				</p>
			  <!--  </section>-->
			
	</div><!-- /container -->
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
</body>
</html>