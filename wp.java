
import java.sql.*;//importing
import java.util.Scanner;
public class wp {
 public Connection creation()
 {
	 Connection conn=null;
	 Scanner sc=new Scanner(System.in);
	 try
	 {
		 Class.forName("com.mysql.jdbc.Driver");
		 System.out.println("connecting to database..");
		 conn=DriverManager.getConnection("jdbc:mysql://localhost:3306","root","root");
		 System.out.println("Creating statement...");
		Statement stmt=conn.createStatement();
		stmt.executeUpdate("Use onlinequiz ");		 
	 }
	 catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
	 catch (ClassNotFoundException e)
	 {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	 
	return conn;
	 
 }
}
