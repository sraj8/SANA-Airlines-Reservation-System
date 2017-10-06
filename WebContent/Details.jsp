<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Cache-Control" content="no-store" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<link rel="stylesheet" type="text/css" href="css/default.css" />
		<link rel="stylesheet" type="text/css" href="css/component2.css" />
		<script src="js/modernizr.custom.js"></script>
<title>Details Page</title>
<script type="text/javascript"> 
function addRow()
{ 
	var root = document.getElementById("blah");//the root 
	var allRows = root.getElementsByTagName('tr');//the rows' collection 
	var cRow = allRows[1].cloneNode(true);//the clone of the 2nd row 
	var cInp = cRow.getElementsByTagName('input');//the inputs' collection of the 1st row 
	for(var i=0;i<cInp.length;i++)//changes the inputs' names (indexes the names)
	{ 
		cInp[i].setAttribute('id',cInp[i].getAttribute('id')+'_'+(allRows.length)); 
		cInp[i].setAttribute('name',cInp[i].getAttribute('name')+'_'+(allRows.length));
	} 
	root.appendChild(cRow);//appends the cloned row as a new row 
} 

function check()
{	
	var tics="<%=session.getAttribute("ticks")%>";
	
	//check no. of forms
	var oRows = document.getElementById("blah").getElementsByTagName('tr');
	var iRowCount = oRows.length-1;
	var tic=parseInt(tics,10);
	if(iRowCount!=tic)
	{
		alert("Please fill the required amount of forms!");
		location.reload();
		return false;
	}
	
	//validate first name
	var inputtxt=document.getElementById("fname").value;
	var letters = /^[A-Za-z]+$/;  
	if(!inputtxt.match(letters))  
	{  
		alert("Enter valid first name for form 1");
		return false;
	}
	
	//validate last name
	var inputtxtl=document.getElementById("lname").value;
	var lettersl = /^[A-Za-z]+$/;  
	if(!inputtxtl.match(lettersl))  
	{  
		alert("Enter valid last name for form 1");
		return false;
	}
	
	//validate address
	var addrr=document.getElementById("addr").value;
	if(addrr.length==0)  
	{  
		alert("Enter valid address for form 1");
		return false;
	}
	
	//validate email
	var x=document.getElementById("email").value;
	var atpos=x.indexOf("@");
	var dotpos=x.lastIndexOf(".");
	if (atpos<1 || dotpos<atpos+2 || dotpos+2>=x.length)
	{
	  	alert("Enter valid e-mail address for form 1");
	  	return false;
	}
	
	//validate mobile number
	var mobi=document.getElementById("mob").value;
	if(isNaN(mobi) || mobi.length!=10 || mobi=="          ")
	{
		alert("Enter valid mobile number for form 1");
		return false;
	}
	
	//validate age
	var ag=document.getElementById("age").value;
	if(isNaN(ag) || ag.length==0 || ag==" " || ag=="  ")
	{
		alert("Enter valid age for form 1");
		return false;
	}
	
	var ti=parseInt(tics,10);
	for(var i=2;i<ti+1;i++)
	{
		var fnameing=document.getElementById("fname_"+i).value;
		var letters = /^[A-Za-z]+$/;  
		if(!fnameing.match(letters))  
		{  
			alert("Enter valid first name for form "+i);
			return false;
		}

		var lnameing=document.getElementById("lname_"+i).value;
		var lettersl = /^[A-Za-z]+$/;  
		if(!lnameing.match(lettersl))  
		{  
			alert("Enter valid last name for form "+i);
			return false;
		}
		
		var addrring=document.getElementById("addr_"+i).value;
		if(addrring.length==0)  
		{  
			alert("Enter valid address for form "+i);
			return false;
		}
		
		var xing=document.getElementById("email_"+i).value;
		var atposing=xing.indexOf("@");
		var dotposing=xing.lastIndexOf(".");
		if (atposing<1 || dotposing<atposing+2 || dotposing+2>=xing.length)
		{
		  	alert("Not a valid e-mail address for form "+i);
		  	return false;
		}
		
		var mobing=document.getElementById("mob_"+i).value;
		if(isNaN(mobing) || mobing.length!=10 || mobing=="          ")
		{
			alert("Enter valid mobile number for form "+i);
			return false;
		}
		
		var aging=document.getElementById("age_"+i).value;
		if(isNaN(aging) || aging.length==0 || aging==" " || aging=="  ")
		{
			alert("Enter valid age for form "+i);
			return false;
		}
	}
	
	var biding=document.getElementById("bookid").value;
	if(biding.length==0)
	{
		document.getElementById("para1").innerHTML="*Enter the booking id!";
		return false;
	}
	
	var pwding=document.getElementById("passwd").value;
	if(pwding.length==0)
	{
		document.getElementById("para1").innerHTML="";
		document.getElementById("para2").innerHTML="*Enter the password!";
		return false;
	}
	
	var cpwd=document.getElementById("cpass").value;
	if(cpwd!=pwding || cpwd.length==0)
	{
		document.getElementById("para1").innerHTML="";
		document.getElementById("para2").innerHTML="";
		document.getElementById("para3").innerHTML="*Enter the correct confirmation password!";
		return false;
	}
}

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
<style>
	#para1,#para2,#para3
	{
		color:#ff0000;
	}
</style>
</head>
<body onload="load()">

<%
if(session==null || session.isNew())
{
	response.sendRedirect("Home.jsp");
}
%>

<form action="DetailsServletOne" method="post" onsubmit="return check()"> 
<table width="100%"  border="0" cellspacing="0" cellpadding="0" id="blah">
	<tr>
	<th>First Name</th>
	<th>Last Name</th>
	<th>Address</th>
	<th>Email Id</th>
	<th>Mobile</th>
	<th>Age</th>
	</tr>
	<tr> 
	<td><input type="text" name="fname" id="fname" maxlength="15" /></td> 
	<td><input type="text" name="lname" id="lname" maxlength="15" /></td> 
	<td><input type="text" name="addr" id="addr" maxlength="50" /></td> 
	<td><input type="text" name="email" id="email" maxlength="30"/></td>
	<td><input type="text" name="mob" id="mob" maxlength="10" /></td> 
	<td><input type="text" name="age" id="age" maxlength="2" /></td>
	</tr> 
</table><br><br> 
<input name="button" type="button" value="Add row" onclick="addRow()">
<br>

<br>
<table>
<tr>
<td>Enter booking id:<input type="text" name="bookid" id="bookid" maxlength="5" /></td>
<td><p id="para1"></p></td>
</tr>
<tr>
<td>Enter password:<input type="password" name="passwd" id="passwd" maxlength="5" /></td>
<td><p id="para2"></p></td>
</tr>
<tr>
<td>Confirm password:<input type="password" name="cpass" id="cpass" maxlength="5" /></td>
<td><p id="para3"></p></td>
</tr>
</table>
<br>
<!-- Top Navigation 
			<div class="codrops-top clearfix"></div> -->
<!-- <section class="color-4">--></p>
  <p>
					<button type="submit" class="btn btn-4 btn-4a icon-arrow-right">Proceed</button>
				</p>
			  <!--  </section>-->
<br> 

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