<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.MyBean.TicketDisplay"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Cache-Control" content="no-store" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cancel Information</title>
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
	
	function setTid(x)
	{
		var val=x.value;
		if(x.checked==true)
		{
			document.getElementById("tid_"+val).value=val;
		}
		else
		{
			document.getElementById("tid_"+val).value="";
		}
	}
	
	function checkBox()
	{		
		var chx = document.getElementsByTagName('input');
		for (var i=0; i<chx.length; i++)
		{
			if (chx[i].type == 'checkbox' && chx[i].checked)
		    {
				return true;
		    } 
		}
		alert("Select atleast one ticket!");
		return false;
	}
	
	function confirmBox()
	{	
		var r=confirm("Are you sure you want to cancel the selected tickets?");
		
		if(r==true)
		{
			return true;
		}
		return false;
	}
</script>

<style>
#customers1,#customers2
{
font-family:"Trebuchet MS", Arial, Helvetica, sans-serif;
width:50%;
border-collapse:collapse;
}
#customers1 td, #customers1 th, #customers2 td, #customers2 th 
{
font-size:1em;
border:1px solid #0060CD;
padding:3px 7px 2px 7px;
}
#customers1 th,#customers2 th 
{
font-size:1.1em;
text-align:left;
padding-top:5px;
padding-bottom:4px;
background-color:#0060CD;
color:#ffffff;
}
#customers1 tr.alt td,#customers2 tr.alt td 
{
color:#000000;
background-color:#EAF2D3;
}
tr:nth-child(odd)		{ background-color:#6DABF2; }
</style>
		<link rel="stylesheet" type="text/css" href="css/default.css" />
		<link rel="stylesheet" type="text/css" href="css/component1.css" />
		<script src="js/modernizr.custom.js"></script>
</head>
<body onload="load()">

<%
if(session==null || session.isNew())
{
	response.sendRedirect("Home.jsp");
}
%>

<%
String ffid=(String)session.getAttribute("fid");
String bbid=(String)session.getAttribute("bid");
String deptime=(String)session.getAttribute("deptime");
String arrtime=(String)session.getAttribute("arrtime");
String seat=(String)session.getAttribute("seatcl");
String dat=(String)session.getAttribute("jdate");
String arra=(String)session.getAttribute("arrap");
String depa=(String)session.getAttribute("depap");
%>

<h2 align="center"><font face="Trebuchet MS" color="blue">E-Ticket</font></h2>
<br>
<form action="RemoveServlet" onsubmit="return checkBox() && confirmBox()">

<table border="1" id="customers1" align="center">
	<tr>
		<th>Fid</th>
		<th>Bid</th>
		<th>Departure</th>
		<th>Arrival</th>
		<th>Date</th>
		<th>DepTime</th>
		<th>ArrTime</th>
		<th>Class</th>
	</tr>
	<tr>
		<td><%=ffid %></td>
		<td><%=bbid %></td>
		<td><%=depa %></td>
		<td><%=arra %></td>
		<td><%=dat %></td>
		<td><%=deptime %></td>
		<td><%=arrtime %></td>
		<td><%=seat %></td>
	</tr>
</table>
<br>
<table border="1" id="customers2" align="center">

	<tr>
		<th>CB</th>
		<th>Tid</th>
		<th>FName</th>
		<th>LName</th>
		<th>Age</th>
		<th>SeatNo</th>
		<th>Selected Tid</th>
	</tr>

	<c:forEach var="Cancels" items="${Can}">
	<tr>
		<td><input type="checkbox" value="${Cancels.tid}" name="tidd" onchange="setTid(this)"></td>
		<td>${Cancels.tid}</td>  
		<td>${Cancels.fname}</td>
		<td>${Cancels.lname}</td>
		<td>${Cancels.age}</td>
		<td>${Cancels.seatno}</td>
		<td><input type="text" name="tid_<c:out value="${Cancels.tid}"/>" id="tid_<c:out value="${Cancels.tid}"/>" value="" readonly /></td>
	</tr>
	</c:forEach>
</table>
<br>
<!-- <input type="submit" name="submit" id="submit" value="Cancel Tickets" />-->
<div class="container">
  <!-- Top Navigation 
			<div class="codrops-top clearfix"></div> -->
<!-- <section class="color-4">--></p>
 <br><br> <p>
					<button type="submit" align="right" class="btn btn-4 btn-4a icon-arrow-right">Cancel</button>
				</p>
			  <!--  </section>-->
			
	</div><!-- /container -->
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
<input type="hidden" id="session" name="session" readonly />
<input type="hidden" id="refreshed" value="no" readonly />
</form>
</body>
</html>