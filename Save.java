

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
 * Servlet implementation class Save
 */
@WebServlet("/Save")
public class Save extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Save() {
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
		response.setContentType("text/html");
		PrintWriter out =response.getWriter();
		Connection conn =null;
		wp db=new wp();		
		conn=db.creation();	
		try
		{
			HttpSession sess =request.getSession(true);
			out.print("hi");
			Statement stmt=conn.createStatement();
		String[] quizquestion=request.getParameterValues("ques");
		String quiz_name=(String) sess.getAttribute("quizname");
		out.print("the quiz name is "+quiz_name);
		for(int i=0;i<quizquestion.length;i++)
		{
		System.out.println("The questions are:"+quizquestion[i]);
		out.println("Insert into "+quiz_name+" values('"+quizquestion[i]+"')");
		stmt.executeUpdate("Insert into "+quiz_name+" 	values('"+quizquestion[i]+"')");
		}
		out.println("executed");
		response.sendRedirect("Preview.jsp");
	
		
		
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		
		// TODO Auto-generated method stub
	}

}
