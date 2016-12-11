package tradia;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class TestJdbc 
{
	public static void main(String[] args) {
	      try {
	         Connection conn = null;
	         conn = DriverManager.getConnection("jdbc:mysql://182.224.57.93:3306", "tradia", "tradia");
	         Statement st = null;
	         ResultSet rs = null;
	         st = conn.createStatement();
	         rs = st.executeQuery("select * from tradia.BOARD");

	         if (st.execute("select * from tradia.BOARD")) {
	            rs = st.getResultSet();
	         }

	         while (rs.next()) {
	            String str1 = rs.getString(1);
	            String str2 = rs.getString(2);
	            String str3 = rs.getString(3);
	            String str4 = rs.getString(4);
	            System.out.print(str1);
	            System.out.print(str2);
	            System.out.print(str3);
	            System.out.print(str4);
	         }
	      } catch (SQLException sqex) {
	         // TODO: handle exception
	         System.out.println("SQLExecption: " + sqex.getMessage());
	         System.out.println("SQLState: " + sqex.getSQLState());
	      }
	   }
	
}