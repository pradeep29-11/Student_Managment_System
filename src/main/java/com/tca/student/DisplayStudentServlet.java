package com.tca.student;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.tca.entities.Student;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/display")
public class DisplayStudentServlet extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		final String DB_URL = "jdbc:postgresql://ep-billowing-feather-ad2ycnwl-pooler.c-2.us-east-1.aws.neon.tech/neondb";
		final String DB_USER = "neondb_owner";
		final String DB_PWD = "npg_uEl10HLrMpDj";
		final String DB_DRIVER = "org.postgresql.Driver";
		
		String sql_Query = "";
		
		String srno = request.getParameter("srno");
		String sbtn = request.getParameter("sbtn");
		
		if(sbtn == null || sbtn.equals("Refersh") || srno.isEmpty())
		{
			sql_Query = "select * from student order by rno";
		}
		else if(sbtn.equals("Search"))
		{
			sql_Query = "select * from student where rno="+srno;
		}
		
		try
		{
			Class.forName(DB_DRIVER);
			con =DriverManager.getConnection(DB_URL,DB_USER,DB_PWD);
			ps = con.prepareStatement(sql_Query);
			
			rs = ps.executeQuery();
			
			List<Student> L = new ArrayList<>();
			
			
			while(rs.next())
			{
				//out.println(rs.getInt("rno")+"---"+rs.getString("name")+"---"+rs.getDouble("per"));
				int rno = rs.getInt("rno");
				String name = rs.getString("name");
				double per = rs.getDouble("per");
				Student ob = new Student(rno,name,per);
				
				L.add(ob);
			}
			
			//Redirecting List of Student to View Layer
			
			request.setAttribute("students", L);
			RequestDispatcher rd = request.getRequestDispatcher("DisplayStudent.jsp");
			rd.forward(request, response);
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
