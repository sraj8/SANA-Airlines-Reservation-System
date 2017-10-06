<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
form{
margin:auto;
position:relative;
width:500px;
height:365px;
font-family: Tahoma, Geneva, sans-serif;
font-size:20px;
font-style: italic;
line-height: 24px;
font-weight: bold;
color: #09C;
text-decoration: none;
padding:5px;
border: 5px solid #09c;
}
#uid{
display:block;
border: 1px solid #999;
height: 30px;
width: 250px;

}
#passid{
display:block;
border: 1px solid #999;
height: 30px;
width: 250px;

}
</style>
<meta http-equiv="Cache-Control" content="no-store">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<link rel="stylesheet" type="text/css" href="css/default.css" />
		<link rel="stylesheet" type="text/css" href="css/component.css" />
		<script src="js/modernizr.custom.js"></script>
<title>View Ticket</title>

<script type="text/javascript">
	function checkData()
	{
		var u=document.getElementById("uid").value;
		var p=document.getElementById("passid").value;
		
		if(u.length==0)
		{
			alert("Enter bookingID!");
			return false;
		}
		
		if(p.length==0)
		{
			alert("Enter password!");
			return false;
		}
	}
</script>

</head>
<body>
<center>
<form action="CancelServletOne" method="post" onsubmit="return checkData()">
<p>Enter booking id:</p>
<p>
  <input type="text" name="uid" id="uid" maxlength="5" />
</p>
<br>
<p>
  Enter password:</p>
<p>
  <input type="password" name="passid" id="passid" maxlength="5" />
</p>
<p><br>
<div class="container">
  <!-- Top Navigation 
			<div class="codrops-top clearfix"></div> -->
<!-- <section class="color-4">--></p>
  <p>
					<button type="submit" class="btn btn-4 btn-4a icon-arrow-right">Login</button>
				</p>
			  <!--  </section>-->
			
	</div><!-- /container -->
<!-- <input type="submit" name="submit" id="submit" value="Submit" /> -->
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
</center>
</body>
</html>