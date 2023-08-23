<%@ page language="java" import="java.sql.*,java.util.*,emp.Employee"
    contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <h1>Employee List</h1>
</head>
<body>
<form onsubmit="self.jsp">
	<input type="text" name="search" placeHolder="search here"> <input
		type="submit" name="name" value="search"><br></br>
</form>
    <table border="1px">
        <tr>
            <th>name</th>
            <th>age</th>
            <th>sal</th>
            <th>job</th>
            <th>dept</th>
        </tr>
        <tbody>
            <%
            if(request.getParameter("name")!=null){
            	int count=(int)request.getAttribute("count");
                ArrayList<Employee> aee = (ArrayList<Employee>) request.getAttribute("emp");
                int itemsPerPage = 5; 
                int currentPage = 1; 
                String pageParam = request.getParameter("page");
                if (pageParam != null) {
                    currentPage = Integer.parseInt(pageParam);
                }
                for (int i = 0; i < 5; i++) {
					Employee e = aee.get(i);
					if(e.getName().equals(request.getParameter("search"))){
			%>
		<tr>
			<td><%=e.getName()%></td>
			<td><%=e.getAge()%></td>
			<td><%=e.getSal()%></td>
			<td><%=e.getJob()%></td>
			<td><%=e.getDept()%></td>
		</tr>
		<%
				}}
			%>
		</tbody>
		</table>
				<%
				for (int i = 1; i <= 1; i++) {
			%>
				<a href="?page=<%=i%>"><button><%=i%></button></a>
				<%
				}
            }
            else{
            	int count=(int)request.getAttribute("count");
                ArrayList<Employee> aee = (ArrayList<Employee>) request.getAttribute("emp");
                int itemsPerPage = 5; 
                int currentPage = 1; 
                String pageParam = request.getParameter("page");
                if (pageParam != null) {
                    currentPage = Integer.parseInt(pageParam);
                }
                for (int i = 0; i < 5; i++) {
                    Employee e = aee.get(i);
                %>
                <tr>
                    <td><%=e.getName()%></td>
                    <td><%=e.getAge()%></td>
                    <td><%=e.getSal()%></td>
                    <td><%=e.getJob()%></td>
                    <td><%=e.getDept()%></td>
                </tr>
                <%
                }
                %>
            </tbody>
        </table><br></br>
                <%
                for (int i = 1; i <= count; i++) {
                %>
                
                    <a href="EmpServ?page=<%=i%>"><button><%=i%></button></a>
                <%
                }
            }
		%>
            
            
</body>
</html>
