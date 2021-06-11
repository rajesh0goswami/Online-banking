package cone;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class insda
 */
@WebServlet("/insda")
public class insda extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public insda() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
	    	// JDBC driver name and database URL
	    	    final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";  
	    	    final String DB_URL = "jdbc:mysql://localhost/bank";

	    	   //  Database credentials
	    	   final String USER = "root";
	    	   final String PASS = "root";
	    	System.out.println("hi");
			   Connection conn = null;
			   PreparedStatement stmt = null;
		  
		      //STEP 2: Register JDBC driver
		      Class.forName(JDBC_DRIVER);
		   
		      //STEP 3: Open a connection
		      System.out.println("Connecting to a selected database...");
		      conn = DriverManager.getConnection(DB_URL, USER, PASS);
		      System.out.println("Connected database successfully...");
		      
		      //STEP 4: Execute a query
		      System.out.println("Inserting records into the table...");
		      stmt = conn.prepareStatement("insert into users values(?,?,?,?)");
		     
		      
		      stmt.setString(1, request.getParameter("n1"));
		      stmt.setString(2, request.getParameter("un1"));
		      stmt.setString(3, request.getParameter("pass"));
		      stmt.setInt(4, Integer.valueOf(request.getParameter("bal")));
			     
		      stmt.executeUpdate();
		      System.out.println("Inserted records into the table...");

	    	
	   }
	    catch(Exception e)
	    {
	  	  System.out.println("wrong");
	  	  e.printStackTrace();
	    }
		PrintWriter out = response.getWriter();
		out.println("<html><body>");
		out.println("<h1>Account created successfully</h1>");
		out.println("</body></html>");

		doGet(request, response);
	}
	

}
