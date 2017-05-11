

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.*;
import java.sql.*;
import java.util.Enumeration;

/**
 * Servlet implementation class UpdateCourse
 */
@WebServlet("/UpdateCourse")
public class UpdateCourse extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateCourse() {
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
		PrintWriter out= response.getWriter(); 
		wp db=new wp();
		Connection conn=db.creation();
		String courseid="";
		try
		{
			HttpSession sess=request.getSession(true);
		     Enumeration<String> e =sess.getAttributeNames();
		     while(e.hasMoreElements())
			{
				 String s1
			=(String)e.nextElement();
				 if(s1.equals("course"))
				 {
					 courseid=(String)sess.getAttribute(s1);
				 }
				 out.println(s1+"::element");
				 out.println(courseid+"::entered</br>");
			}
		     sess.invalidate();
		     //out.println("hello:"+request.getParameter("cname"));
				String cname=request.getParameter("cname");
				Statement stmt=conn.createStatement();
				stmt.executeUpdate("use onlinequiz");
				out.println("UPDATE course set course_name='"+cname+"';");
				stmt.executeUpdate("UPDATE course set course_name='"+cname+"' where course_id='"+courseid+"';");
				response.sendRedirect("UpdateCourse.jsp");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
