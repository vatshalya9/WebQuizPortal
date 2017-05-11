

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
 * Servlet implementation class UpdateQuestion
 */
@WebServlet("/UpdateQuestion")
public class UpdateQuestion extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateQuestion() {
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
		String quesid="";
		try
		{
			HttpSession sess=request.getSession(true);
		     Enumeration<String> e =sess.getAttributeNames();
		     while(e.hasMoreElements())
			{
				 String s1=(String)e.nextElement();
				 if(s1.equals("quesid"))
				 {
					 quesid=(String)sess.getAttribute(s1);
				 }
				 out.println(s1+"::element");
				 out.println(quesid+"::entered</br>");
			}
		     sess.invalidate();
		     	String sub=request.getParameter("sub");
				String question=request.getParameter("question");
				//System.out.println(question+"2");
				String options=request.getParameter("options");	
				//System.out.println(options+"3");
				String ans=request.getParameter("ans");
				//System.out.println(ans+"4");
				
				Statement stmt=conn.createStatement();
				stmt.executeUpdate("use onlinequiz");
				//System.out.println("UPDATE question set subject='"+sub+"', question='"+question+"',options='"+options+"',answer='"+ans+"' where question_id='"+quesid+"'");
				stmt.executeUpdate("UPDATE question set subject='"+sub+"', question='"+question+"',options='"+options+"',answer='"+ans+"' where question_id='"+quesid+"'");
				response.sendRedirect("UpdateQuestion.jsp");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
