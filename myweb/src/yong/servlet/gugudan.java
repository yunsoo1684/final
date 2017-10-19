package yong.servlet;

import java.io.*;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class gugudan extends HttpServlet
{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
	throws ServletException, IOException
	{
		userProcess(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) //req = 요청 // resp = 응답
	throws ServletException, IOException 
	{
		userProcess(req, resp);
	}
	
	protected void userProcess(HttpServletRequest req, HttpServletResponse resp)
	throws ServletException, IOException 
	{
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter pw = resp.getWriter();
		
		pw.println("<html>");
		pw.println("<head><title>");
		pw.println("이것은 구구단!");
		pw.println("</title></head>");
		pw.println("<body>");
		pw.println("<h2>구구단</h2>");
		pw.println("<table border='1'>");
		
		for(int i = 1; i <= 9; i++)
		{
			pw.println("<tr>");
			
			for(int j = 2; j <= 9; j++)
			{
				pw.println("<td>"+j+"*"+i+"="+i * j+"</td>");
			}
			
			pw.println("</tr>");
		}
		
		pw.println("</table>");
		pw.println("</body></html>");
		pw.close();
	}
}