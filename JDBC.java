package emp;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class JDBC {
	public ArrayList<Employee> con(int page) {
		ArrayList<Employee> ae = null;

		try {
			
			Class.forName("org.postgresql.Driver");
			Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5434/postgres","postgres","1234");
			Statement smt = con.createStatement();
			ae = new ArrayList<Employee>();
			int off=(page-1)*5;
			int lim=5;
			PreparedStatement ps = con.prepareStatement("SELECT * FROM employee LIMIT ? OFFSET ?");
		    ps.setInt(1, lim);
		    ps.setInt(2, off);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				//System.out.println(rs.getString(1));
				ae.add(new Employee(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
						rs.getString(5)));
			}
		} catch (Exception e) {
		}
		return ae;
	}
	public int count() {
		int c=0;
		try {
			Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5434/postgres","postgres","1234");
			Statement s=con.createStatement();
			ResultSet rs = s.executeQuery("select count(*) from employee");
			if(rs.next()) {
				c=rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		double bb = c/5;
		return (int)Math.ceil(bb);

	}
}