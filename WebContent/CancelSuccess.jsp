<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="Cache-Control" content="no-store" />
<title>Cancel Success</title>

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
</script>
		<link rel="stylesheet" type="text/css" href="css/default.css" />
		<link rel="stylesheet" type="text/css" href="css/component.css" />
		<script src="js/modernizr.custom.js"></script>
</head>
<body onload="load()">

<%
if(session==null || session.isNew())
{
	response.sendRedirect("Home.jsp");
}
%>

<center><font color="#000000"><h2>Thank You</h2>
You have successfully cancelled your ticket!</font></center>
<br>
<form action="LogoutServlet">
	<div class="container">
  <!-- Top Navigation 
			<div class="codrops-top clearfix"></div> -->
<!-- <section class="color-4">--></p>
  <p>
					<button type="submit" class="btn btn-4 btn-4a icon-arrow-right">Logout</button>
				</p>
			  <!--  </section>-->
			
	</div><!-- /container -->
	<input type="hidden" id="refreshed" value="no" readonly />
	<input type="hidden" id="session" name="session" readonly />
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