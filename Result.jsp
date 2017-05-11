<%@page import="java.util.ArrayList"%>
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
	<%
		if(session.getAttribute("stu")!=null)
		{
		%>
<div id="regsection3">
 <form ID="myForm" name="index" action="index.html"  method="post">
   <fieldset>
    <legend><p><b><font size="3" color="#2C4762"></font>Result</b></p></legend>
  <table class="tbl_effect1" align= "center" width=800px">

   <%

  Class.forName("com.mysql.jdbc.Driver");
	 System.out.println("connecting to database..");
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306","root","root");
	 System.out.println("Creating statement...");
	 try{
		 HttpSession sess =request.getSession(true);
			//out.print("hi");
	Statement stmt=conn.createStatement();
	Statement stmt1=conn.createStatement();
	 
	stmt.executeUpdate("Use onlinequiz ");
	String quizname=(String)sess.getAttribute("quizname");	
	System.out.println("select question_id  from "+quizname);
	ArrayList<String> queid=new ArrayList<String>();
	System.out.println(queid);
	System.out.println("select question_id  from "+quizname);
	ResultSet rs= stmt.executeQuery("select question_id  from "+quizname);

	
	while(rs.next())
	{
		 queid.add(rs.getString(1));	 
	
	 
	}
	
	
	
	System.out.println("The quid is: "+queid);
	int Score=0;
	for(int i =0;i<queid.size();i++)
	{	
		System.out.println("select answer from question where question_id='"+queid.get(i)+"'");
		ResultSet rs1= stmt1.executeQuery("select answer from question where question_id='"+queid.get(i)+"'");
		String chkdans=request.getParameter(queid.get(i));
		System.out.println(chkdans.charAt(0)+"$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$");
	
		rs1.next();
		System.out.println(rs1.getString(1)+"#"+"and"+chkdans.charAt(0)+"%");
		if(rs1.getString(1).equals(chkdans.charAt(0)+""))
		{
			Score++;
		}
		
	}
  %>
   
	
	
	<tr> <h3><b>Thank You! for taking the quiz.Your score is<%out.print(Score); %><b></h3></td></tr>
	<%
	session.invalidate();
	%>

	
<tr> <td><input type="Submit" name="Exit" value="Exit" ></td></tr>
<%

	} catch (Exception e) {
	out.println("invalid entry" + e);
	}
	%>




</table>

  </fieldset>
</form>

  </div>
 <%
	}
		else
		{
			response.sendRedirect("index.html");
		}
%>
  <div id="footer">
<p>&copy  Copyright  1999-2014 by MSIT. All Rights Reserved.@14031J0035-RUTHMERCY G</p>
</div>
</body>
</html>