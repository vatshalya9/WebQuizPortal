<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>Adding Questions</title>
<link rel="stylesheet" type="text/css" href="design.css">
<script>
function loadXMLDoc()
{
var xmlhttp;
if (window.XMLHttpRequest)
  {// code for IE7+, Firefox, Chrome, Opera, Safari
  xmlhttp=new XMLHttpRequest();
  }
else
  {// code for IE6, IE5
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
xmlhttp.onreadystatechange=function()
  {
  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
    document.getElementById("regsection2").innerHTML=xmlhttp.responseText;
    }
  }
xmlhttp.open("GET","index.html",true);
xmlhttp.send();
}

function displayQues(str) {
	  if (str=="") {
	    document.getElementById("addque").innerHTML="";
	    return;
	  }
	  if (window.XMLHttpRequest) {
	    // code for IE7+, Firefox, Chrome, Opera, Safari
	    xmlhttp=new XMLHttpRequest();
	  } else { // code for IE6, IE5
	    xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	  }
	  xmlhttp.onreadystatechange=function() {
	    if (xmlhttp.readyState==4 && xmlhttp.status==200) {
	      document.getElementById("addshowques").innerHTML=xmlhttp.responseText;
	    }
	  }
	  xmlhttp.open("GET","DisplayQuestions.jsp?q="+str,true);
	  xmlhttp.send();
	}
</script>
</head>
<body>
  <div id="regsection2">
 <form ID="myForm" name="index"  onsubmit="return validateForm()" method="post">
 
    <legend><p><b><font size="3" color="#2C4762">Adding Question to Quiz</b></font></p></legend>
  <table class="tbl_effect1" align= "center">
   <%
  Class.forName("com.mysql.jdbc.Driver");
	 System.out.println("connecting to database..");
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306","root","root");
	 System.out.println("Creating statement...");
	 try{
	Statement stmt=conn.createStatement();
	stmt.executeUpdate("Use onlinequiz ");
	ResultSet rs= stmt.executeQuery("select distinct subject  from question");
  %>
    <tr>
	<td>
	 <label >Subject</label> 
	</td>
	<td>
<select name="sub" onclick="displayQues(this.value)">
 <%
 	while(rs.next()){
 %>
 <option><%=rs.getString(1)%></option>
 <%
 	}
 %>
 </select></td>

<%

	} catch (Exception e) {
	out.println("invalid entry" + e);
	}
	%>
</td>


</tr>
</table>
</form>

  </div>
  <div class="displayque" id="addshowques"><b>Questions will be listed here.</b></div>
  <div id="footer">
<p>&copy  Copyright  1999-2014 by MSIT. All Rights Reserved.@14031J0035-RUTHMERCY G</p>
</div>
</body>
</html>