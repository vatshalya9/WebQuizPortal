<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="utf-8">
<title>Student Home</title>
<link rel="stylesheet" type="text/css" href="design.css">
</head>
<body>
<div>
		 <p style="width:500px;height:100px;text-align:center"><font size="20" color="#2C4762">Welcome to Quiz Whiz</p></font>
		</div>
		
<ul>
 <li><a href="AboutUs.html">About Us </a>
          
        </li>
        <li><a href="Help.html">Help</a></li>
		<li><a href="index.html">SignOut</a></li>
		</ul>
		
		
		<%
		if(session.getAttribute("stu")!=null)
		{
		%>
		
<div id="regsection">
  <form ID="myForm" name="index" action="ShowQuiz.jsp"  onsubmit="return validateForm()" method="post">
  <fieldset>
    <legend><p><b><font size="6" color="#2C4762">Select Course</b></font></p></legend>
  <table class="tbl_effect" align= "center">
   <%
  Class.forName("com.mysql.jdbc.Driver");
	 System.out.println("connecting to database..");
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306","root","root");
	 System.out.println("Creating statement...");
	 try{
	 HttpSession sess=request.getSession(true);
	Statement stmt=conn.createStatement();
	String course_name=request.getParameter("cname");
	sess.setAttribute("coursename", course_name);
	stmt.executeUpdate("Use onlinequiz ");
	//out.print("select distinct course_name from course");
	ResultSet rs= stmt.executeQuery("select distinct course_name from course");
  %>
    <tr>
    <td>
 <label >Course Name</label>
 
</td>
<td>
<select name="cname">
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
<%

	} catch (Exception e) {
	out.println("invalid entry" + e);
	}
	%>
<tr>
<td></td>
<td><button type="Submit" >Submit</button>
</td>
</tr>

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