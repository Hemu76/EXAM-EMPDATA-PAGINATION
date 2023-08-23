package emp;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/EmpServ")
public class EmpServ extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		JDBC J = new JDBC();
		int page=Integer.parseInt(request.getParameter("page"));
		ArrayList<Employee> ae = J.con(page);
		request.setAttribute("emp", ae);
		//System.out.println(ae.size());
		int count=J.count();
		request.setAttribute("count", count);
		response.setContentType("jsp");
		RequestDispatcher rd = request.getRequestDispatcher("self.jsp");
		rd.forward(request, response);
	}

}