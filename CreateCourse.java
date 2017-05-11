

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.sql.*;

/**
 * Servlet implementation class CreateCourse
 */
@WebServlet("/CreateCourse")
public class CreateCourse extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateCourse() {
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
			String course_id=request.getParameter("cid");
			String course_name=request.getParameter("cname");
			
			stmt.executeUpdate("use onlinequiz");
			stmt.executeUpdate("Insert into course values('"+course_id+"','"+course_name+"')");
			//out.println("executed");
			response.sendRedirect("Home.html");
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
