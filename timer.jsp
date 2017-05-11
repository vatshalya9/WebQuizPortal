<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="design.css">
<%
String mins = request.getParameter( "mins" );
if( mins == null ) mins = "10";
  
String secs = request.getParameter( "secs" );
if( secs == null ) secs = "0";
%>
<script>
<!--
var mins = <%=mins%>; // write mins to javascript
var secs = <%=secs%>
	; // write secs to javascript
	function timer() {
		// tic tac
		if (--secs == -1) {
			secs = 59;
			--mins;
		}

		// leading zero? formatting
		if (secs < 10)
			secs = "0" + secs;
		if (mins < 10)
			mins = "0" + parseInt(mins, 10);

		// display
		
		document.forma.mins.value = mins;
		document.forma.secs.value = secs;

		// continue?
		if (secs == 0 && mins == 0) // time over
		{
			window.location="DeleteQuiz.jsp";
			document.forma.ok.disabled = true;
			document.formb.results.style.display = "block";
		} else // call timer() recursively every 1000 ms == 1 sec
		{
			window.setTimeout("timer()", 1000);
		}
	}
//-->
</script>
</head>
<body>
	<form action="" name="forma">
		Time remaining: <input type="text" name="mins" size="1"
			style="border: 0px solid black; text-align: right">:<input
			type="text" name="secs" size="1" style="border: 0px solid black">
		
	</form>
	
	<script>
	<!--
		timer(); // call timer() after page is loaded
	//-->
	</script>
</body>
</html>