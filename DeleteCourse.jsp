<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
<head>
<meta charset="utf-8">
<title>Delete Course</title>
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
        <li><a href="Help.html">Help</a></li><li><a href="index.html">SignOut</a></li>
    </ul>
     <ul><img src="quiz_image.jpg"alt="quiz_logo" width="280" height="30"></ul>
    
<br>
<br>
  <div id="regsection">
  <form ID="myForm" name="index" action="DeleteCourse"  onsubmit="return validateForm()" method="post">
  <fieldset>
    <legend><p><b><font size="6" color="#2C4762">Delete Course</b></font></p></legend>
  <table class="tbl_effect" align= "center">
    <%
  Class.forName("com.mysql.jdbc.Driver");
	 System.out.println("connecting to database..");
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306","root","root");
	 System.out.println("Creating statement...");
	 try{
	Statement stmt=conn.createStatement();
	stmt.executeUpdate("Use onlinequiz ");
	ResultSet rs= stmt.executeQuery("select course_id from course");
  %>
  <tr>
<td>
 <label >Course Id</label>
</td>
<td>

 <select name="course">
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
<td><button type="Submit" >Delete</button><input type="BUTTON" onclick="myFunction()" value="Clear"></td>
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