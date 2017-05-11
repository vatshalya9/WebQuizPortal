

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
 * Servlet implementation class UpdateUser
 */
@WebServlet("/UpdateUser")
public class UpdateUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateUser() {
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
		String username="";
		try
		{
			HttpSession sess=request.getSession(true);
		     Enumeration<String> e =sess.getAttributeNames();
		     while(e.hasMoreElements())
			{
				 String s1
			=(String)e.nextElement();
				 if(s1.equals("user"))
				 {
					 username=(String)sess.getAttribute(s1);
				 }
				 out.println(s1+"::element");
				 out.println(username+"::entered</br>");
			}
		     sess.invalidate();
		     out.println("hello:"+request.getParameter("uname"));
				String firstname=request.getParameter("fname");
				String lastname=request.getParameter("lname");
				String password=request.getParameter("pswd");
				String confirmpassword=request.getParameter("confmpswd");
				String email=request.getParameter("email");
				String dob=request.getParameter("DOB");
				String phonenumber=request.getParameter("number");
				String gender=request.getParameter("gender");
				String address=request.getParameter("address");
				Statement stmt=conn.createStatement();
				stmt.executeUpdate("use onlinequiz");
				out.println("UPDATE user set firstname='"+firstname+"',lastname='"+lastname+"',password='"+password+"',cpassword='"+confirmpassword+"',emailid='"+email+"',dob='"+dob+"',phno='"+phonenumber+"',gender='"+gender+"',address='"+address+"'where uname='"+username+"';");
				stmt.executeUpdate("UPDATE user set firstname='"+firstname+"',lastname='"+lastname+"',password='"+password+"',cpassword='"+confirmpassword+"',emailid='"+email+"',dob='"+dob+"',phno='"+phonenumber+"',gender='"+gender+"',address='"+address+"'where uname='"+username+"';");
				response.sendRedirect("UpdateUser.jsp");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	
	}

}
