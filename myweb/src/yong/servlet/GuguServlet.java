package yong.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GuguServlet extends HttpServlet 
{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
	throws ServletException, IOException 
	{
		userProcess(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
	throws ServletException, IOException 
	{
		userProcess(req, resp);
	}
	
	protected void userProcess(HttpServletRequest req, HttpServletResponse resp)
	throws ServletException, IOException 
	{
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter pw = resp.getWriter();
		
		pw.println("<html><head><title>");
		pw.println("이것은 구구단");
		pw.println("</title></head><body>");
		pw.println("<table border = '1' width = '700' bordercolor = 'red'>");
		
		for(int i = 1; i <= 9; i++)
		{
			pw.println("<tr>");
			
			for(int j = 2; j <= 9; j++)
			{
				pw.println("<td>");
				pw.println(j + " * " + i + " = " + (j * i));
				pw.println("</td>");
			}
			
			pw.println("</tr>");
		}
		
		pw.println("</body></head>");
		
		pw.close();
	}
}