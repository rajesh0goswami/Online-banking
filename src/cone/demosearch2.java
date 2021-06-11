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
 * Servlet implementation class demosearch2
 */
@WebServlet("/demosearch2")
public class demosearch2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public demosearch2() {
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
      System.out.println("get records into the table...");
      stmt = conn.prepareStatement("select * from users where accno=?");
       int id1=Integer.parseInt(request.getParameter("accno"));
       stmt.setInt(1, id1);
      out.print("<table width=25% border=1>");

      out.print("<center><h1>Result:</h1></center>");

      ResultSet rs=stmt.executeQuery();                

      /* Printing column names */

      ResultSetMetaData rsmd=rs.getMetaData();
      out.print("<tr>");

      out.print("<td>"+rsmd.getColumnName(1)+"</td>");
      out.print("<td>"+rsmd.getColumnName(2)+"</td>");
      out.print("<td>"+rsmd.getColumnName(3)+"</td>");

      out.print("<td>"+rsmd.getColumnName(4)+"</td></tr>");

      while(rs.next())

         {

         out.print("<tr><td>"+rs.getString(1)+"</td>");
         out.print("<td>"+rs.getString(2)+"</td>");
         out.print("<td>"+rs.getString(3)+"</td>");

         out.print("<td>"+rs.getInt(4)+"</td></tr>");
               
      }

      out.print("</table>");
      System.out.println("retrive records into the table...");

	    	
	   }
	    catch(Exception e)
	    {
	  	  System.out.println("wrong");
	  	  e.printStackTrace();
	    }

	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
