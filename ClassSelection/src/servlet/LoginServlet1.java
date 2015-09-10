package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LoginServlet1
 */
@WebServlet("/LoginServlet1")
public class LoginServlet1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public LoginServlet1() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//String s=request.getParameter("student_id");
		int stu_id=Integer.parseInt(request.getParameter("student_id"));
		String upassword=request.getParameter("password");
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost/test","root","sqrl4101");
			Statement st=con.createStatement();
			ResultSet nps=st.executeQuery("select * from users");
			//System.out.println("running1");
			//ResultSet rs_sum=st.executeQuery("SELECT LAST(id) FROM users");
			//int sum=rs_sum.getInt("id");
			//for(int i=0;i<sum;i++){
				//PreparedStatement pst=con.prepareStatement("select name and password from users");
				//pst.setInt(1,i+1);
				//ResultSet course=pst.executeQuery();
				//out.println("<tr><td>"+course+"</tr></td>");			
			//}
			int last_id=0;
			String last_password="";
			while(nps.next()){
				last_id=nps.getInt("student_id");
				//String name=nps.getString("name");
				last_password=nps.getString("password");
				//if(name.equals(username)&&password.equals(upassword)){
				if(last_id==stu_id&&last_password.equals(upassword)){
					Statement st1=con.createStatement();
					st1.execute("truncate table `current_user`");
					st1.execute("insert into `current_user` values("+last_id+")");
					response.sendRedirect("web/MainPage.jsp");
					break;
				}
				else continue;
			}
			if(last_id!=stu_id||!last_password.equals(upassword)){
				response.sendRedirect("web/fail.jsp");
			}
			//System.out.println("running2");
			/*if(!nps.next()){
				out.println("<html><body>");
				out.println("wrong input");
				out.println("</body></html>");
			}*/
			//System.out.println("running3");
	}catch( SQLException e){
		System.out.println(e);
	} catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	}

}
