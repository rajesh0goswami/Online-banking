package cone;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnector {
      public static String url = "jdbc:mysql://localhost:3306/bank";
     
      public static String userName = "root";
      public static String password = "root";
            @SuppressWarnings("deprecation")
			public static Connection getConnection() {
            Connection connection = null;
            if (connection != null)
            {
                  return connection;
            }
            try {
                       
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        connection = DriverManager.getConnection(url,userName,password);
            } catch (Exception e) {
                  e.printStackTrace();
            }
            return connection;
      }
}

