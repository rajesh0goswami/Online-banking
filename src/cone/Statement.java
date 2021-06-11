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
 * Servlet implementation class Statement
 */
@WebServlet("/Statement")
public class Statement extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Statement() {
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
	    	System.out.println("User statement");
   Connection conn = null;
   PreparedStatement stmt = null;
   java.sql.Statement statement = null;
   ResultSet resultSet = null;
   
   String user = request.getParameter("id");
   String accno = null;
  
      //STEP 2: Register JDBC driver
      Class.forName(JDBC_DRIVER);
   
      //STEP 3: Open a connection
      System.out.println("Connecting to a selected database...");
      conn = DriverManager.getConnection(DB_URL, USER, PASS);
      System.out.println("Connected database successfully...");
      
      //Get account number for the user
      statement=conn.createStatement();
      String sql1 ="select accno from users where uname="+'\''+user+'\'';
      resultSet = statement.executeQuery(sql1);

      if(resultSet.next()){

    	  accno = resultSet.getString(1);

      }
      
      //STEP 4: Execute a query
      System.out.println("get records into the table...");
      stmt = conn.prepareStatement("select * from transaction where account1=? order by TransactionId");
      stmt.setString(1, accno);
     
      out.print("<table width=25% border=1>");

      out.print("<center><h1>Statement:</h1></center>");

      ResultSet rs=stmt.executeQuery();                

      /* Printing column names */

      ResultSetMetaData rsmd=rs.getMetaData();
      out.print("<tr>");

      out.print("<td>"+rsmd.getColumnName(1)+"</td>");
      out.print("<td>"+rsmd.getColumnName(2)+"</td>");
      out.print("<td>"+rsmd.getColumnName(3)+"</td>");
      out.print("<td>"+"Your account no"+"</td>");
      out.print("<td>"+"Receiver"+"</td>");
      out.print("<td>"+rsmd.getColumnName(6)+"</td>");
      out.print("<td>"+rsmd.getColumnName(7)+"</td>");

         out.print("<td>"+rsmd.getColumnName(8)+"</td></tr>");

      while(rs.next())

         {

         out.print("<tr><td>"+rs.getInt(1)+"</td>");
         out.print("<td>"+rs.getDate(2)+"</td>");
         out.print("<td>"+rs.getTime(3)+"</td>");
         out.print("<td>"+rs.getString(4)+"</td>");
         out.print("<td>"+rs.getString(5)+"</td>");
         out.print("<td>"+rs.getInt(6)+"</td>");
         out.print("<td>"+rs.getInt(7)+"</td>");
         out.print("<td>"+rs.getInt(8)+"</td></tr>");
               
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
