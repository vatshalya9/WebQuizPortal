<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>Displaying Questions</title>
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
</script>
</head>
<body>
 <form ID="myForm" name="index" action="Save"  onsubmit="return validateForm()" method="post">
<table class="tbl_effect1" align= "left">
   <%
  Class.forName("com.mysql.jdbc.Driver");
	 System.out.println("connecting to database..");
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306","root","root");
	 System.out.println("Creating statement...");
	 response.setContentType("text/html"); // informing the client that which format of data/response will be send
	String s;
	 try{
	Statement stmt=conn.createStatement();
	stmt.executeUpdate("Use onlinequiz ");
	String subject = request.getParameter("q");
	System.out.println("The subject is"+subject);
	System.out.println("select * from question where subject='"+subject+"'");
	ResultSet rs= stmt.executeQuery("select * from question where subject='"+subject+"'");
  %>
  <h3>Questions:</h3>
  <br>

  <%
  while(rs.next())
	  {
	  
	  %>
	  <input type="checkbox" name="ques" value="<%=rs.getString(1) %>"><%=rs.getString(3) %><br>
	<%
		}
	%>

     <tr>
	<td>
	 <input type="Submit" name="save" value="Save" >
	
	 </td>
	</tr>
	 <%--
	<td>
	
<select name="sub" onclick="displayQues(this.value)">
 <%
 	while(rs.next()){
 %>
 <option><%=rs.getString(1)%></option>
 <%
 	}
 %> 
 </select>
 </td>
 </tr>
--%>
<%

	} catch (Exception e) {
	out.println("invalid entry" + e);
	}
	%>

</table>
 <div id="footer">
<p>&copy  Copyright  1999-2014 by MSIT. All Rights Reserved.@14031J0035-RUTHMERCY G</p>
</div>
</form>
</body>
</html>