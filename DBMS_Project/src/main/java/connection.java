
import java.io.PrintWriter;
import java.sql.*;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;  
public class connection extends HttpServlet{  
public  void service(HttpServletRequest req,HttpServletResponse res){  
	
try{  
Class.forName("com.mysql.cj.jdbc.Driver");  
Connection con=DriverManager.getConnection(  
"jdbc:mysql://localhost:3306/grocery_db","tazeen","kitkat");  
//here sonoo is database name, root is username and password  
Statement stmt=con.createStatement();  
ResultSet rs=stmt.executeQuery("select * from product_details"); 
PrintWriter out1=res.getWriter();
while(rs.next()) {
out1.println(rs.getString(1)+"  "+rs.getString(2)+"  "+rs.getString(3));
}
con.close();  
}catch(Exception e){ System.out.println(e);}  
}  
}  
