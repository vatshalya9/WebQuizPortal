

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Statement;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class UpdateQuiz
 */
@WebServlet("/UpdateQuiz")
public class UpdateQuiz extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateQuiz() {
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
		String quizid="";
		try
		{
			HttpSession sess=request.getSession(true);
			HttpSession session=request.getSession(true);
		     Enumeration<String> e =sess.getAttributeNames();
		     while(e.hasMoreElements())
			{
				 String s1=(String)e.nextElement();
				 if(s1.equals("quizid"))
				 {
					 quizid=(String)sess.getAttribute(s1);
				 }
				 out.println(s1+"::element");
				 out.println(quizid+"::entered</br>");
			}
		    // sess.invalidate();
	     System.out.println("@#$%^&*(in update java page!@#$%^");
				String cid=request.getParameter("cid");
				String qid=(String) session.getAttribute("qid");
				String qname=(String) session.getAttribute("qname");				
				String st=request.getParameter("st");
				String et=request.getParameter("et");
				String date=request.getParameter("date");
				Statement stmt=conn.createStatement();
				stmt.executeUpdate("use onlinequiz");
				System.out.println("UPDATE quiz set course_id='"+cid+"',quiz_name='"+qname+"',start_time='"+st+"',end_time='"+et+"',date='"+date+"' where quiz_id='"+qid+"'");
				out.println("UPDATE quiz set course_id='"+cid+"',quiz_name='"+qname+"',start_time='"+st+"',end_time='"+et+"',date='"+date+"' where quiz_id='"+qid+"'");
				stmt.executeUpdate("UPDATE quiz set course_id='"+cid+"',quiz_name='"+qname+"',start_time='"+st+"',end_time='"+et+"',date='"+date+"' where quiz_id='"+qid+"'");
				
				response.sendRedirect("UpdateQuiz.jsp");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
