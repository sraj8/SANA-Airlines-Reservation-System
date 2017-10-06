<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Cache-Control" content="no-store" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Book Ticket</title>
<link href="jquery-ui_themes_smoothness.css" rel="stylesheet" type="text/css" />
<!--<link rel="stylesheet" href="bookform.css" type="text/css" />-->
	<script type="text/javascript" src="engine/jquery-1.9.1.js"></script>
	<script type="text/javascript" src="engine/jquery-1.10.3.js"></script>
		<link rel="stylesheet" type="text/css" href="css/default.css" />
		<link rel="stylesheet" type="text/css" href="css/component.css" />
		<script src="js/modernizr.custom.js"></script>
	<script type="text/javascript">

	function gDay()
	{
		var str=document.getElementById("datepicker").value;

		var date=parseInt(str.substring(0,2),10);

		var month=parseInt(str.substring(3,5),10);

		var year=parseInt(str.substring(6),10);

		var mkeys=new Array(1, 4, 4, 0, 2, 5, 0, 3, 6, 1, 4, 6);

		var dnames=new Array("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday");

		var ans=(year-1900)+parseInt((year-1900)/4,10)+mkeys[month-1]+date-1;

		if((year>1900) && (year%4==0) && (month<3))
		      ans--;
		ans %= 7;

		document.getElementById("day").value=dnames[ans];
	}

	function check()
	{
		var y=document.getElementById("source").value;
		var z=document.getElementById("dest").value;
		if(y=="Select" || y.length==0 || z=="Select" || z.length==0 || y==z)
		{
			alert("Select valid Source/Destination!");
			return false;
		}
		
		var t=document.getElementById("datepicker").value;
		
		if(t.length==0 || t.length!=10)
		{
			alert("Enter the date!");
			return false;
		}
		
		var x=document.getElementById("adult").value;
		if(isNaN(x) || parseInt(x,10)==0 || x.length==0 || x==" ")
		{
			alert("Enter valid number of tickets!");
			return false;
		}
		
		var che=document.getElementById("bus");
		var chec=document.getElementById("eco");
		if(che.checked==false && chec.checked==false)
		{
			alert("Select Business/Economy class");
			return false;
		}
	}

	function setField()
	{
		document.getElementById("source").value=document.frm.src.value;
	}

	function setF()
	{
		document.getElementById("dest").value=document.frm.des.value;
	}
	
	function radio(x)
	{
		document.getElementById("sclass").value=document.getElementById(x).value;
	}
	
	function load()
	{
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

	</script>

	<script type="text/javascript">
		$(document).ready(function() {
		$( "#datepicker" ).datepicker({ minDate: +9, maxDate: "0Y+1M+13D",
		changeMonth: true, changeYear: false,
		numberOfMonths:2,
		dayNamesMin: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'],
		dateFormat:"dd/mm/yy",
		showAnim:"slide" });
		});
	</script>
</head>
<body onload="load()">

<%
if(session==null || session.isNew())
{
	response.sendRedirect("Home.jsp");
}
%>

<form name="frm" onsubmit="return check()" action="FlightServlet" class="FlightServlet">
	<table align="center">
		<tr>
			<td>Source:</td>
			<td><select name="src" onchange="setField()">
				<option value="Select" selected>select</option>
				<option value="Chennai">Chennai</option>
				<option value="Delhi">Delhi</option>
				<option value="Kolkata">Kolkata</option>
				<option value="Mumbai">Mumbai</option>
				</select>
			</td>
		</tr>
		
		<tr>
			<td>Destination:</td>
			<td><select name="des" onchange="setF()">
				<option value="Select" selected>select</option>
				<option value="Chennai">Chennai</option>
				<option value="Delhi">Delhi</option>
				<option value="Kolkata">Kolkata</option>
				<option value="Mumbai">Mumbai</option>
				</select>
			</td>
		</tr>
		
		<tr>
			<td>Date:</td>
			<td><input type="text" name="datepicker" id="datepicker" value="" onchange="gDay()" /></td>
		</tr>
		
		<tr>
			<td><input type="hidden" name="day" id="day" readonly /></td>
			<td></td>
		</tr>
		
		<tr>
			<td>Tickets:</td>
			<td><input type="text" name="adult" id="adult" maxlength="1" /></td>
		</tr>
		
		<tr>
				<td>Class:</td>
				<td><input type="radio" id="bus" name="fclass" value="Business" onchange="radio('bus')" />Business
				    <input type="radio" id="eco" name="fclass" value="Economy" onchange="radio('eco')" />Economy</td>
		</tr>
		
		<tr>
			<td><input type="text" name="source" id="source" readonly /></td>
			<td><input type="text" name="dest" id="dest" readonly /></td>
		</tr>
		
		<tr>
			<td><input type="text" name="sclass" id="sclass" readonly /></td>
			<td></td>
		</tr>
		
		<tr>
			<td>
			<div class="container">
  <!-- Top Navigation 
			<div class="codrops-top clearfix"></div> -->
<!-- <section class="color-4">--></p>
  <p>
					<button type="submit" class="btn btn-4 btn-4a icon-arrow-right">Search Flights</button>
				</p>
			  <!--  </section>-->
			
	</div><!-- /container --></td>
		</tr>
	</table>
	<input type="hidden" id="refreshed" value="no" />
</form>
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
</body>
</html>