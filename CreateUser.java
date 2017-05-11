

import java.io.IOException;
import java.io.*;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CreateUser
 */
@WebServlet("/CreateUser")
public class CreateUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateUser() {
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
			String firstname=request.getParameter("fname");
			String lastname=request.getParameter("lname");
			String username=request.getParameter("uname");
			String password=request.getParameter("pswd");
			String confirm_password=request.getParameter("confmpswd");
			String emailid=request.getParameter("email");
			String dob=request.getParameter("DOB");
			String Ph_no= request.getParameter("number");
			String gender=request.getParameter("gender");
			String Address=request.getParameter("address");
			stmt.executeUpdate("use onlinequiz");
			out.println("Insert into user values('"+firstname+"','"+lastname+"','"+username+"','"+password+"','"+confirm_password+"','"+emailid+"','"+dob+"','"+Ph_no+"','"+gender+"','"+Address+"')");
			stmt.executeUpdate("Insert into user values('"+firstname+"','"+lastname+"','"+username+"','"+password+"','"+confirm_password+"','"+emailid+"','"+dob+"','"+Ph_no+"','"+gender+"','"+Address+"')");
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
