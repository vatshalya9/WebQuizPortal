<%@page import="java.util.StringTokenizer"%>
<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <meta charset="utf-8">
<title>TakeQuiz</title>
<link rel="stylesheet" type="text/css" href="design.css">

<%
String mins=null,secs=null;
if(session.getAttribute("stu")!=null)
{

Class.forName("com.mysql.jdbc.Driver");
System.out.println("connecting to database..");
Connection conn1=DriverManager.getConnection("jdbc:mysql://localhost:3306","root","root");
System.out.println("Creating statement...");
String qname=request.getParameter("qname");	
System.out.println("quiz_name"+qname);
int smin=0;
int emin=0;
System.out.println("Creating statement...");
System.out.println("select start_time,end_time from quiz where  quiz_name='"+qname+"'");
Statement stmt1=conn1.createStatement();
stmt1.executeUpdate("Use onlinequiz ");
ResultSet rs1= stmt1.executeQuery("select start_time,end_time from quiz where  quiz_name='"+qname+"'");


rs1.next();
System.out.println(rs1.getString(1));
System.out.println(rs1.getString(2));
String stime=rs1.getString(1);
String etime=rs1.getString(2);
//int min=convert(stime,etime);
StringTokenizer tok=new StringTokenizer(stime,":");
String nn=tok.nextToken();
System.out.println(nn+"$$$$$$$$$$$");
int x=Integer.parseInt(nn);
System.out.println(x);
smin=x*60;



nn=tok.nextToken();
System.out.println(nn+"$$$$$$$$$$$");
 x=Integer.parseInt(nn);
System.out.println(x);
smin=smin+x;


//smin=smin+Integer.parseInt(tok.nextToken());
StringTokenizer tok1=new StringTokenizer(etime,":");
nn=tok1.nextToken();
x=Integer.parseInt(nn);

emin=x*60;
x=0;
nn=tok1.nextToken();
x=Integer.parseInt(nn);
emin=emin+x;

int min=Math.abs(smin-emin);
System.out.println("finally s time"+smin);
System.out.println("finally s time"+emin);
System.out.println("Total time in min"+min);
 mins = min+"";
System.out.println(mins+"&&&&&&&&&&&&&&&&&&&&&");
if( mins == null ) 
	mins = "10";

  
secs = request.getParameter( "secs" );
if( secs == null ) 
	secs = "0";
}

%>
<script>

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
	
		<%
		if(session.getAttribute("stu")!=null)
		{
		%>
<div id="regsection3">
 <form ID="myForm" name="index" action="Result.jsp"  method="post">
   <fieldset>
    <legend><p><b><font size="3" color="#2C4762"></font>Displaying Questions of Quiz</b></p></legend>
  <table class="tbl_effect1" align= "center" width=800px">
  <tr> <td><input type="Submit" name="Close" value="Close" ></td></tr>
   <%
  

  Class.forName("com.mysql.jdbc.Driver");
	 System.out.println("connecting to database..");
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306","root","root");
	 System.out.println("Creating statement...");
	 try{
		 HttpSession sess =request.getSession(true);
			//out.print("hi");
	Statement stmt=conn.createStatement();
	

	stmt.executeUpdate("Use onlinequiz ");
	String quiz_name=request.getParameter("qname");	
	System.out.println("quiz_name"+quiz_name);
	sess.setAttribute("quizname", quiz_name); 
	System.out.println("select question_id  from "+quiz_name);
	ResultSet rs= stmt.executeQuery("select question_id,question,options from question where question_id in (select question_id  from "+quiz_name+")");
	int count=0;
	
	while(rs.next())
	{
		int count1=0;	
	count++;
	
	String qid=rs.getString(1);
	System.out.println("The quid is: "+qid);
	 
	
  %>
    <tr>
	<td>
	 <p><b>Question:<%out.print(count); %> </b><%=rs.getString(2) %></p>
	  <!-- <p><b>Options: </b> -->
	  <%
	  String Options=rs.getString(3);
	  System.out.println("The options as a string is: "+Options);
	  StringTokenizer st= new StringTokenizer(Options,"~");
	  while(st.hasMoreTokens())
	  {
		 
		  String opt=st.nextToken();
		  count1++;
		  if(count1 <5)
		  {
		  %>
		  <input type="radio" name=<%=qid %> value=<%=opt%> ><%=opt %>
				  <br>
				  
				  <%
		  }
	  }
	  
	  %></p>
	   <br>
	</td>
	</tr>
	
	<%
	}
	%>
<tr> <td><input type="Submit" name="Submit" value="Submit" ></td></tr>
<%
}

	 catch (Exception e) {
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