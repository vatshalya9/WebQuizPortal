

import java.io.IOException;
//import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DeleteQuiz
 */
@WebServlet("/DeleteQuiz")
public class DeleteQuiz extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteQuiz() {
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
		response.setContentType("text/html"); // informing the client that which format of data/response will be send
		//PrintWriter out= response.getWriter(); 
		wp db=new wp();
		Connection conn=db.creation();
		try
		{
			String qid=request.getParameter("qid");
			
			
			Statement stmt=conn.createStatement();
			stmt.executeUpdate("use onlinequiz");
			ResultSet rs= stmt.executeQuery("select quiz_name from quiz where quiz_id='"+qid+"'");
			rs.next();
			String quiz_name=rs.getString(1);
			
			
			System.out.println("delete from quiz where quiz_id='"+qid+"'");
			stmt.executeUpdate("delete from quiz where quiz_id='"+qid+"'");
			
			
			System.out.println("delete from allquizzes where quiz_name='"+quiz_name+"'");
			stmt.executeUpdate("delete from allquizzes where quiz_name='"+quiz_name+"'");
			System.out.println("drop table "+quiz_name);
			stmt.executeUpdate("drop table "+quiz_name);
			response.sendRedirect("DeleteQuiz.jsp");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
