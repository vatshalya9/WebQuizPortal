<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
<head>
<meta charset="utf-8">
<title>Update User</title>
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
  <div id="regsection1">
  <form ID="myForm" name="index" action="UpdateUser"  onsubmit="return validateForm()" method="post">
  <fieldset>
    <legend><p><b><font size="6">Update User</b></font></p></legend>
  <table class="tbl_effect" align= "center">
  <%
  Class.forName("com.mysql.jdbc.Driver");
  Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306", "root", "root");
  response.setContentType("text/html");
  try
  {
	  Statement stmt=conn.createStatement();
	  stmt.executeUpdate("use onlinequiz");
	  String username=request.getParameter("user");
	  HttpSession sess=request.getSession(true);
	  sess.setAttribute("user", new String (username));
	  ResultSet rs = stmt.executeQuery("select * from user where uname='"+username+"'");
	  while(rs.next())
	  {
			session.setAttribute("fname", rs.getString(1));
			session.setAttribute("lname", rs.getString(2));
			session.setAttribute("uname", rs.getString(3));
			session.setAttribute("pswd", rs.getString(4));
			session.setAttribute("confmpswd", rs.getString(5));			
			session.setAttribute("email", rs.getString(6));
			session.setAttribute("DOB", rs.getString(7));
			session.setAttribute("number", rs.getString(8));
			session.setAttribute("gender", rs.getString(9));
			session.setAttribute("address", rs.getString(10));  
	  }
  }
  catch(Exception e)
  {
	  out.println("invalid output"+e);
  }
  %>
  <tr>
<td>
 <label >FirstName</label>
</td>
<td>
 <input type="text" id="firstname" name="fname" 
 value="<%
 out.println(session.getAttribute("fname"));
 %>
 "required>
</td>
</tr>
<tr>
<td>
 <label >LastName</label>
</td>
<td>
 <input type="text" id="lastname" name="lname" 
 value="<%
 out.println(session.getAttribute("lname"));
 %>"
 required>
</td>
</tr>
<tr>
<td>
 <label for="Username">Username</label>
</td>
<td>
 <input type="text" id="username" name="uname" 
 value="<%
 out.println(session.getAttribute("uname"));
 %>"
 disabled required>
</td>
</tr>

<tr>
<td>
<label for="Password">Password</label>
</td>
<td>
<input type="text" id="password" name="pswd" pattern=".{3,8}"
value="<%
 out.println(session.getAttribute("pswd"));
 %>"
required><br>
</td>
</tr>

<tr>
<td>
<label for="Password">Confirm Password</label>
</td>
<td>
<input type="text" id="confmpassword" name="confmpswd" pattern=".{3,8}"
value="<%
 out.println(session.getAttribute("confmpswd"));
 %>"
 required><br>
</td>
</tr>

<tr>
<td>
<label>Email Id </label>
</td>
<td>
<input type="email" id="email" name="email" 

value="<%
 out.println(session.getAttribute("email"));
 %>"
 required>
</td>
</tr>

<tr>
<td><label>DOB</label></td>
<td><input type="text" id="DOB" name="DOB" 
value="<%
 out.println(session.getAttribute("DOB"));
 %>"
required></td>
</tr>
<tr>
<td><label>Phone number</label></td>
<td><input type="text" id="number" name="number" 
value="<%
 out.println(session.getAttribute("number"));
 %>"
required></td>
</tr>
<tr>
<td><label>Gender</label></td>
<td><input type="text" name="gender" 
value="<%
 out.println(session.getAttribute("gender"));
 %>"
></td>
</tr>
<tr>
<td><label>Address</label></td>
<td><textarea rows="4" cols="50" name="address" value="address">
<%
 out.println(session.getAttribute("address"));
 %>

</textarea></td>
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