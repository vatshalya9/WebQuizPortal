

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.*;
import java.sql.*;


/**
 * Servlet implementation class CreateQuestion
 */
@WebServlet("/CreateQuestion")
public class CreateQuestion extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateQuestion() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out =response.getWriter();
		Connection conn =null;
		wp db=new wp();
		
		conn=db.creation();
		response.setContentType("text/html");
		try
		{
			Statement stmt=conn.createStatement();
			String question_id=request.getParameter("quesid");
			String sub=request.getParameter("sub");
			String question=request.getParameter("question");
			String options=request.getParameter("options");
			String answer=request.getParameter("ans");			
			stmt.executeUpdate("use onlinequiz");
			out.println("select question_id from question where quiz_id='"+question_id+"'");
			ResultSet rs=stmt.executeQuery("select question_id from question where question_id='"+question_id+"'");
			if(rs.next())
			{
				out.println("<h1>Question id already exists</h1>");
			}
			else
			{
				System.out.println("in qu else");
			stmt.executeUpdate("Insert into question values('"+question_id+"','"+sub+"','"+question+"','"+options+"','"+answer+"')");
			out.println("executed");
			response.sendRedirect("Home.html");
			}
		}
		 catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
		 }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
