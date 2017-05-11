

import java.io.IOException;
import java.sql.Connection;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DeleteQuestion
 */
@WebServlet("/DeleteQuestion")
public class DeleteQuestion extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteQuestion() {
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
			String quesid=request.getParameter("quesid");
			Statement stmt=conn.createStatement();
			stmt.executeUpdate("use onlinequiz");
			stmt.executeUpdate("delete from question where question_id='"+quesid+"'");
			response.sendRedirect("DeleteQuestion.jsp");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
