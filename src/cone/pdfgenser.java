package cone;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lowagie.text.Document;
import com.lowagie.text.Paragraph;
import com.lowagie.text.pdf.PdfWriter;
import cone.DBConnector;

/**
 * Servlet implementation class pdfgenser
 */
@WebServlet("/pdfgenser")
public class pdfgenser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public pdfgenser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String str="pdf";

		Connection conn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		try
		{
		    Document document=new Document();
		    if(str.equals("pdf"))
		    {
		        response.setContentType("application/pdf");
		        PdfWriter.getInstance(document,response.getOutputStream());
		    }
		    conn= DBConnector.getConnection();
		    String query = "select * from users";          //Fetching data from table
		       ps=conn.prepareStatement(query);                // executing query
		       rs=ps.executeQuery();
		      
		    document.open();

		    /* new paragraph instance initialized and add function write in pdf file*/
		    document.add(new Paragraph("--------------------------------------------------*******REPORT*******--------------------------------------------------\n\n"));
		    document.add(new Paragraph("                                                     ONLINE BANKING PORTAL\n\n"));
		    document.add(new Paragraph("---------------------------------------------------------------------------------------------------------------------------------"));
		    document.addCreationDate();
		   
		    while(rs.next())
		    {
		          // fetch & writing records in pdf files
		        document.add(new Paragraph("USER NAME ::"+rs.getString(1)+"\n\n"+"Account number ::"+rs.getString(2)+"\n\n"+"Account balance ::"+rs.getInt(4)+"\n\n\n\n\n"+"---------------------------------------------------------------------------------------------------------------------------------"));
		    }
		    document.add(new Paragraph("---------------------------------------------------------PAGE NO::"+document.getPageNumber()+"------------------------------------------------------"));
		   
		    document.close(); //document instance closed
		    conn.close();  //db connection close
		}
		catch(Exception de)
		{
		        de.printStackTrace();
		            System.err.println("document: " + de.getMessage());
		           
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
