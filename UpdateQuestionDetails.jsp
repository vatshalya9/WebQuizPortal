<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="utf-8">
<title>Update Question</title>
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
  <form ID="myForm" name="index" action="UpdateQuestion"  onsubmit="return validateForm()" method="post">
  <fieldset>
    <legend><p><b><font size="6">Update Question</b></font></p></legend>
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
		  String quesid=request.getParameter("quesid");
		  HttpSession sess=request.getSession(true);
		  sess.setAttribute("quesid", new String (quesid));
		  ResultSet rs = stmt.executeQuery("select * from question where question_id='"+quesid+"'");
		  
		  //System.out.println("select * from question where question_id='"+quesid+"'");
		  while(rs.next())
		  {
			  
				session.setAttribute("quesid", rs.getString(1));
				//System.out.println("############"+rs.getString(1)+"############");
				session.setAttribute("sub", rs.getString(2));
				session.setAttribute("question", rs.getString(3));
				//System.out.println("############"+rs.getString(2)+"############");
				session.setAttribute("options", rs.getString(4));
				//System.out.println("############"+	rs.getString(3)+"############");
				session.setAttribute("ans", rs.getString(5));
				//System.out.println("############"+rs.getString(4)+"############"); 
			
							  
		  }
		  
		 }
	  catch(Exception e)
	  {
		  out.println("invalid output"+e);
	  } 
	  %>
  <tr>
<td>
 <label >Question Id </label>
</td>
<td>
 <input type="text" id="quesid" name="quesid" 
value="<%out.println(session.getAttribute("quesid"));%>" disabled required>
</td>
</tr>
  <tr>
<td>
 <label >Subject</label>
</td>
<td>
 <input type="text" id="sub" name="sub" 
value="<%out.println(session.getAttribute("sub"));%>"  required>
</td>
</tr>
  <tr>
<td>
 <label >Question</label>
</td>

<td><textarea rows="4" cols="50" name="question"value="" required><%out.println(session.getAttribute("question"));%>
</textarea></td>

</tr>
<tr>
<td>
<font color="red">Please end ever option with'~'</font>
</td>
</tr>
<tr>
<td><label>Options</label></td>

<td><textarea rows="4" cols="50" name="options" value="options">
<%
out.println(session.getAttribute("options"));
%>
</textarea></td>
</tr>
<tr>
<td>
<font color="red">Please enter only the option 'a' or 'b' or 'c' or 'd'</font>
</td>
</tr>
<tr>
<td> <label >Answer  </label></td>
<td> <input type="text" id="answer" name="ans" value="<%out.println(session.getAttribute("ans"));%>" required></td>
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
</div></body>
</html>