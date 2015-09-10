package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AddCourse extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public AddCourse() {
		super();
	}
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
	}
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		out.print("    This is ");
		out.print(this.getClass());
		out.println(", using the GET method");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost/test","root","sqrl4101");
			Statement st=con.createStatement();
			Statement st0=con.createStatement();
			//int id=Integer.parseInt(request.getParameter("id"));
			String course=request.getParameter("course");
			String teacher=request.getParameter("teacher");
			String classroom=request.getParameter("classroom");
			String time=request.getParameter("time");
			String day=request.getParameter("day");
			ResultSet current=st.executeQuery("select * from `current_user`");
			while(current.next()){
				int current_stu=current.getInt("stu_id");
				String insert="insert into required_courses (stu_id,course,teacher,classroom,time,day)values("+current_stu+",'"+course+"','"+teacher+"','"+classroom+"','"+time+"','"+day+"')";
				st0.execute(insert);
			}
			//st.executeQuery("insert into required_courses (course,teacher,classroom,time,day) values(\"Math\",\"zhang\",\"1#201\",\"1-2\",\"Wednesday\")");
		}catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		response.sendRedirect("web/MainPage.jsp");
		out.flush();
		out.close();
	}
	public void init() throws ServletException {
	}

}
