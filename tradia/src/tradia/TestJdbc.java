package tradia;

import java.sql.Connection;
import java.sql.DriverManager;

public class TestJdbc {

	public static void main(String[] args) {
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
		} catch (Exception e) {
			
		}
		/*try {
			Connection conn = DriverManager.getConnection("jdbc:mysql://119.67.246.194:3306", "tradia", "tradia");
		}*/

	}

}
