<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
<head>
<meta charset="utf-8">
<title>Update Quiz</title>
<link rel="stylesheet" type="text/css" href="design.css">
 <script >
    function myFunction() {
    document.getElementById("myForm").reset();
    }
</script>
</head>
<body>
    <ul>
        <li><a href="#">User &#9662;</a>
		 <ul>
                <li><a href="CreateUser.html">Create User</a></li>
                <li><a href="UpdateUser.jsp">Update User</a></li>
                <li><a href="DeleteUser.jsp">Delete User</a></li>
         </ul>
	    </li>
        <li><a href="#">Course &#9662;</a>
		  <ul>
                <li><a href="CreateCourse.html">Create Course</a></li>
                <li><a href="UpdateCourse.jsp">Update Course</a></li>
                <li><a href="DeleteCourse.jsp">Delete Course</a></li>
          </ul>
		</li>
		<li><a href="#">Quiz &#9662;</a>
		 <ul>
                <li><a href="CreateQuiz.jsp">Create Quiz</a></li>
                <li><a href="UpdateQuiz.jsp">Update Quiz</a></li>
                <li><a href="DeleteQuiz.jsp">Delete Quiz</a></li>
            </ul></li>	
		<li><a href="#">Question &#9662;</a>
		 <ul>
                <li><a href="CreateQuestion.html">Create Question</a></li>
                <li><a href="UpdateQuestion.jsp">Update Question</a></li>
                <li><a href="DeleteQuestion.jsp">Delete Question</a></li>
            </ul></li>		
        <li><a href="AboutUs.html">About Us </a>
          
        </li>
        <li><a href="Help.html">Help</a></li>
		<li><a href="index.html">SignOut</a></li>
    </ul>
     <ul><img src="quiz_image.jpg"alt="quiz_logo" width="280" height="30"></ul>
    
<br>
<br>
  <div id="regsection">
  <form ID="myForm" name="index" action="UpdateQuiz"  onsubmit="return validateForm()" method="post">
  <fieldset>
    <legend><p><b><font size="6">Update Quiz</b></font></p></legend>
  <table class="tbl_effect" align= "center">
  <%
  Class.forName("com.mysql.jdbc.Driver");
	 System.out.println("connecting to database..");
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306","root","root");
	 System.out.println("Creating statement...");
	 String s;
	 try
	  {
		  Statement stmt=conn.createStatement();
		  stmt.executeUpdate("use onlinequiz");
		  String quizid=request.getParameter("quizid");
		  System.out.println("quid id in details"+quizid);

		  HttpSession sess=request.getSession(true);
		  sess.setAttribute("quizid", new String (quizid));
		  System.out.println("select * from quiz where quiz_id='"+quizid+"'");
		  ResultSet rs = stmt.executeQuery("select * from quiz where quiz_id='"+quizid+"'");
		  while(rs.next())
		  {
				session.setAttribute("cid", rs.getString(1));
				  System.out.println("cid"+ rs.getString(1));
				session.setAttribute("qid", rs.getString(2));
				  System.out.println("qid"+ rs.getString(2));
				session.setAttribute("qname", rs.getString(3));
				  System.out.println("qname"+ rs.getString(3));
				session.setAttribute("st", rs.getString(4));
				  System.out.println("st"+ rs.getString(4));
				session.setAttribute("et", rs.getString(5));
				  System.out.println("et"+ rs.getString(5));
				session.setAttribute("date", rs.getString(6));
				  System.out.println("date"+ rs.getString(6));
				  
		  }
		  System.out.println("select course_id from course");
			 			 
		  rs = stmt.executeQuery("select course_id from course");
	  %>	
  <tr>
<td>
 <label >Course Id </label>
</td>
<td>
   <select name="cid" value="<%out.println(session.getAttribute("cid"));%>" required >
								<%
									while (rs.next()) {
								%>
								<%if(rs.getString(1).equals(session.getAttribute("cid"))){%>
								<option selected><%=rs.getString(1)%></option>
								<%} else{%>
								<option><%=rs.getString(1)%></option>
								<%
								}}
								%>
						</select>
</td>
 <% }
	  catch(Exception e)
	  {
		  out.println("invalid output"+e);
	  } 
	  %>
</tr>
<tr>
<td>
 <label >Quiz Id </label>
</td>
<td>
 <input type="text" id="qid" name="qid" value="<%out.println(session.getAttribute("qid"));%>" disabled required>
</td>
</tr>
  <tr>
<td>
 <label >Quiz Name </label>
</td>
<td>
 <input type="text" id="quizname" name="qname"
  value="<%out.println(session.getAttribute("qname"));%>"disabled required>
</td>
</tr>

<tr>
<td><label>Start Time</label></td>
<td><input type="text" id="time" name="st" value="<%out.println(session.getAttribute("st"));%>" required></td>
</tr>
<tr>
<td><label>End Time</label></td>
<td><input type="text" id="time" name="et" value="<%out.println(session.getAttribute("et"));%>" required></td>
</tr>
<tr>
<td>
 <label >Date </label>
</td>
<td>
 <input type="text" id="date" name="date" value="<%out.println(session.getAttribute("date"));%>"  required>
</td>
</tr>

<tr>
<td></td>
<td><button type="Submit" >Update</button><input type="BUTTON" onclick="myFunction()" value="Clear"></td>
</tr>

<tr>
<td></td>
<td></td>
</tr>
  </table>
  </fieldset>

  </form>
  </div>
  <div id="footer">
<p>&copy  Copyright  1999-2014 by MSIT. All Rights Reserved.@14031J0035-RUTHMERCY G</p>
</div>
</body>
</html>