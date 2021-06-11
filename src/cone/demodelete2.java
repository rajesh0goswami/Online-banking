package cone;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class demodelete2
 */
@WebServlet("/demodelete2")
public class demodelete2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public demodelete2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		try {
	    	// JDBC driver name and database URL
	    	    final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";  
	    	    final String DB_URL = "jdbc:mysql://localhost/bank";

	    	   //  Database credentials
	    	    final String USER = "root";
	    	   final String PASS = "root";
	    	   response.setContentType("text/html");

	              PrintWriter out = response.getWriter(); 
	    	System.out.println("demodelete2");
   Connection conn = null;
   PreparedStatement stmt = null;
  
      //STEP 2: Register JDBC driver
      Class.forName(JDBC_DRIVER);
   
      //STEP 3: Open a connection
      System.out.println("Connecting to a selected database...");
      conn = DriverManager.getConnection(DB_URL, USER, PASS);
      System.out.println("Connected database successfully...");
      
      //STEP 4: Execute a query
      System.out.println("DELETE records into the table...");
      stmt = conn.prepareStatement("DELETE FROM users where accno=?");
    int id=Integer.parseInt(request.getParameter("accno"));
     stmt.setInt(1, id);
     stmt.executeUpdate();
     }
		
		
	 catch(Exception e)
	 {
	  	  System.out.println("wrong");
	  	  e.printStackTrace();
	 }
		PrintWriter out = response.getWriter();
		out.println("<html><body>");
		 out.print("<center>Deleted from dB</center>");
		 	out.println("</body></html>");
		

	}
	 

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
	}

}
