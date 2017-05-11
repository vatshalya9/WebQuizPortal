

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.jdbc.Statement;
import com.sun.corba.se.spi.orbutil.fsm.State;

/**
 * Servlet implementation class Log
 */
@WebServlet("/Log")
public class Log extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Log() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("ghfdty");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("szgdfxgchj,bk.");
		HttpSession session=request.getSession(true);
		
		String username=request.getParameter("uname");
		String password=request.getParameter("pswd");
		System.out.println(username);System.out.println(password);
		wp db=new wp();
		
		Connection con=db.creation();
		Connection con1=db.creation();
		
		try {
			Statement st=(Statement) con.createStatement();
			Statement st1=(Statement) con1.createStatement();
			ResultSet rs=st.executeQuery("select * from logindetails where uname='"+username+"' and password='"+password+"'");
			ResultSet rs1=st1.executeQuery("select * from user where uname='"+username+"' and password='"+password+"'");
			System.out.println(rs.isBeforeFirst());
			if(rs.isBeforeFirst())
			{	System.out.println("#########################################################");
			
				response.sendRedirect("Home.html");
			}
			else if(rs1.isBeforeFirst())
			{
				session.setAttribute("stu", username);
				response.sendRedirect("StudentHome.jsp");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}
