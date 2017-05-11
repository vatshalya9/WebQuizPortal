<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>Preview of Quiz</title>
<link rel="stylesheet" type="text/css" href="design.css">
</head>
<body>
<div id="regsection3">
 <form ID="myForm" name="index" action="Home.html"  method="post">
   <fieldset>
    <legend><p><b><font size="3" color="#2C4762"></font>Displaying Questions of Quiz</b></p></legend>
  <table class="tbl_effect1" align= "center" width=800px">
  <tr> <td><input type="Submit" name="Close" value="Close" ></td></tr>
   <%
   HttpSession sess =request.getSession(true);
	//out.print("hi");

  Class.forName("com.mysql.jdbc.Driver");
	 System.out.println("connecting to database..");
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306","root","root");
	 System.out.println("Creating statement...");
	 try{
	Statement stmt=conn.createStatement();
	stmt.executeUpdate("Use onlinequiz ");
	String quiz_name=(String) sess.getAttribute("quizname");
	System.out.println("select question_id  from "+quiz_name);
	ResultSet rs= stmt.executeQuery("select question,options,answer from question where question_id in (select question_id  from "+quiz_name+")");
	int count=0;
	while(rs.next())
	{
		
	count++;	
  %>
    <tr>
	<td>
	 <p><b>Question:<%out.print(count); %> </b><%=rs.getString(1) %></p>
	  <p><b>Options: </b><%=rs.getString(2) %></p>
	   <p><b>Answer </b><%=rs.getString(3) %></p><br>
	</td>
	</tr>
	
	<%
	}
	%>
<tr> <td><input type="Submit" name="Close" value="Close" ></td></tr>
<%

	} catch (Exception e) {
	out.println("invalid entry" + e);
	}
	%>




</table>

  </fieldset>
</form>

  </div>
 
  <div id="footer">
<p>&copy  Copyright  1999-2014 by MSIT. All Rights Reserved.@14031J0035-RUTHMERCY G</p>
</div>
</body>
</html>