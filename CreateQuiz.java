

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.*;
import java.sql.*;


/**
 * Servlet implementation class CreateQuiz
 */
@WebServlet("/CreateQuiz")
public class CreateQuiz extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateQuiz() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter out =response.getWriter();
		Connection conn =null;
		wp db=new wp();		
		conn=db.creation();	
		try
		{
			HttpSession sess=request.getSession(true);
			
			out.print("hi");
			Statement stmt=conn.createStatement();
			String course_id=request.getParameter("cid");
			String quiz_id=request.getParameter("qid");
			String quiz_name=request.getParameter("qname");
			sess.setAttribute("quizname", quiz_name);
			String quiz_name1=(String) sess.getAttribute("quizname");
			System.out.print("the quiz name is "+quiz_name1);
			
			String start_time=request.getParameter("st");
			String end_time=request.getParameter("et");
			String date=request.getParameter("date");
			
			stmt.executeUpdate("use onlinequiz");
			
			out.println("select quiz_id from quiz where quiz_id='"+quiz_id+"'");
			ResultSet rs=stmt.executeQuery("select quiz_id from quiz where quiz_id='"+quiz_id+"'");
			if(rs.next())
			{
				out.println("<h1>quiz id already exists</h1>");
			}
			else
			{

			out.println("Insert into quiz values('"+course_id+"','"+quiz_id+"','"+quiz_name+"','"+start_time+"','"+end_time+"','"+date+"')");
			stmt.executeUpdate("Insert into quiz values('"+course_id+"','"+quiz_id+"','"+quiz_name+"','"+start_time+"','"+end_time+"','"+date+"')");
			out.println("Insert into allquizzes values('"+quiz_name+"')");
			stmt.executeUpdate("Insert into allquizzes values('"+quiz_name+"')");			
			out.println("create table "+quiz_name+" (question_id varchar(10) NOT NULL, PRIMARY KEY(question_id))");			
			stmt.executeUpdate("create table "+quiz_name+" (question_id varchar(10) NOT NULL, PRIMARY KEY(question_id))");
			out.println("executed");
			response.sendRedirect("AddQuestions.jsp");
			}
		}
		 catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
		 }
	}

}
